#import <objc/runtime.h>
#import <CoreFoundation/CoreFoundation.h>

void handle_safarirefresh() {
	id browserController = [objc_getClass("BrowserController") sharedBrowserController];
	id activeTabDocument = [[browserController tabController] activeTabDocument];
	[activeTabDocument reload];
}

static __attribute__((constructor)) void SafariRefreshInitialize() {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)handle_safarirefresh, CFSTR("me.haunold.safarirefresh"), NULL, 0);
}

