Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B233C79F0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 01:03:35 +0200 (CEST)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3RR8-0002ZB-6z
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 19:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.dev.br>)
 id 1m3Q0u-0001AN-UG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:32:25 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.dev.br>)
 id 1m3Q0p-0007W0-7i
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:32:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 85B5432003F4;
 Tue, 13 Jul 2021 17:32:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Jul 2021 17:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.dev.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=naaBrd+2qLINT
 K+xuVpCpntXavXHYDURD0Oy4NYVtRM=; b=sc+n45twM8efMdnFfX0c5d2vwFwkF
 AWgOQtXjYgGjIsnmXtZ0R1adU/qttvFgscVwphfCrQC0PSR9YQO3EX7m+HOsHWSf
 4y3VRmtKzpS9TewFOHrfVlfhvbXd9ARyejPnKrosVrfKIf7g13WTyGypxgaEHDVG
 N7VKKx6KyMVmcStrojNZ8QiOamsV1E+eHaeMnnY5tAKppPvCrE6FD7x2ZmvoIBOV
 dOnCdzO7lTOmRGdKmXWKaiQn5uykQOJQWY4V8uXHJWa7wDuc2OqmVgE4FYKJSgOu
 d36qyRF9ddZGdKCRxYgyTxPiVUJaTnGYRr1BjEP1NOcfK71heJuI65WtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=naaBrd+2qLINTK+xuVpCpntXavXHYDURD0Oy4NYVtRM=; b=RIfCSbm8
 zOiy6dqiDCHK+42oNr/1d2DsZoj0XHGuHzJyS98oiBp6OmzEU3M+ae5Xye9leBXs
 qBfg/bdmxnG6NnE+6YQFqj7ibxbLO72Kym69/Qt3kLfTIalaQAp2AlDCCAmx4cDy
 yg5J3RZL2dUPPBfJ3vOG38tB/XRwDnHtvtHf9oBFj73oVR4tNItUPRY+xnHiN4Gq
 BFwN/U/p+34xcbcsJvcXwKGvN8rHJUmWSl8eyvuBdBf1q+1M9IEl9u42I+8XyMSx
 ZavuKS8i3/R1CVP6ubvUNWXPfCNT7NKsBBAtJeSsezjsDKfBGflPl4l4skpFb6WW
 Nma9vPDEicw/LA==
X-ME-Sender: <xms:XgbuYD5WVksSW9XurDPwlwvV8LjfZ8dBxJI-uFrdsgx3rO4nXk1pHw>
 <xme:XgbuYI6IXDIdbyJgRJcAHUDImD1ht3PCa6kGU-_0a4T_XuUi5YrE0YSs-8Izut3Fn
 IyKAwp8cy7tSUgFDA>
X-ME-Received: <xmr:XgbuYKcQXpJYHXBcZXIpOfjrdQHg_ggoVwfEGbpoFS37t55Xu5Nqx8Oh4DJVF2RQ5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepghhushhtrghv
 ohesnhhorhhonhhhrgdruggvvhdrsghrnecuggftrfgrthhtvghrnhepheeigfeigfejje
 ekiedtgfehieetheeikeetudffveeifefgtefhveehvdfhgeehnecuffhomhgrihhnpegr
 phhplhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepghhushhtrghvohesnhhorhhonhhhrgdruggvvhdrsghr
X-ME-Proxy: <xmx:XgbuYEKN2kVOemhpRJxt8Y5boHWE8BQG3n6sU-bzbRVB0GyUwURThA>
 <xmx:XgbuYHI1E8q-Yc4RHKaG7fvpVd9zMSj3UNb80kFCRNIWpKkIFnto2A>
 <xmx:XgbuYNzJMO7xPR34BTsoffBLr3-ZKKTYZR565aSrx4ULOD1PfRFiiw>
 <xmx:YAbuYP_GHc1aFHQoFHWwsjSA_w1i2SnsQnvjUnMxC8rzGRRCf3KA9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 17:32:13 -0400 (EDT)
From: gustavo@noronha.dev.br
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Tue, 13 Jul 2021 18:31:59 -0300
Message-Id: <20210713213200.2547-2-gustavo@noronha.dev.br>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210713213200.2547-1-gustavo@noronha.dev.br>
References: <20210713213200.2547-1-gustavo@noronha.dev.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=gustavo@noronha.dev.br; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Jul 2021 19:00:59 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>, 'Eric Blake ' <eblake@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.dev.br>

Applications such as Gnome may use Alt-Tab and Super-Tab for different
purposes, some use Ctrl-arrows so we want to allow qemu to handle
everything when it captures the mouse/keyboard.

However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
at an earlier part of the event handling chain, not letting qemu see it.

We add a global Event Tap that allows qemu to see all events when the
mouse is grabbed. Note that this requires additional permissions.

See:

https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
https://support.apple.com/en-in/guide/mac-help/mh32356/mac

Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
---
 qapi/ui.json    | 16 ++++++++++++
 qemu-options.hx |  3 +++
 ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index fd9677d48e..b2d27ce167 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1092,6 +1092,21 @@
 { 'struct'  : 'DisplayCurses',
   'data'    : { '*charset'       : 'str' } }
 
+##
+# @DisplayCocoa:
+#
+# Cocoa display options.
+#
+# @full-grab: Capture all key presses, including system combos. This
+#             requires accessibility permissions, since it performs
+#             a global grab on key events. (default: off)
+#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+#
+# Since: 6.1
+##
+{ 'struct'  : 'DisplayCocoa',
+  'data'    : { '*full-grab'     : 'bool' } }
+
 ##
 # @DisplayType:
 #
@@ -1165,6 +1180,7 @@
   'discriminator' : 'type',
   'data'    : {
       'gtk': { 'type': 'DisplayGTK', 'if': 'defined(CONFIG_GTK)' },
+      'cocoa': { 'type': 'DisplayCocoa', 'if': 'defined(CONFIG_COCOA)' },
       'curses': { 'type': 'DisplayCurses', 'if': 'defined(CONFIG_CURSES)' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' }
diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83..8308d28d1f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1796,6 +1796,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_CURSES)
     "-display curses[,charset=<encoding>]\n"
 #endif
+#if defined(CONFIG_COCOA)
+    "-display cocoa[,full_grab=on|off]\n"
+#endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
 #endif
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b07..d9d98aa9de 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -309,11 +309,13 @@ @interface QemuCocoaView : NSView
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
+    CFMachPortRef eventsTap;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
 - (void) ungrabMouse;
 - (void) toggleFullScreen:(id)sender;
+- (void) setFullGrab:(id)sender;
 - (void) handleMonitorInput:(NSEvent *)event;
 - (bool) handleEvent:(NSEvent *)event;
 - (bool) handleEventLocked:(NSEvent *)event;
@@ -336,6 +338,19 @@ - (void) raiseAllKeys;
 
 QemuCocoaView *cocoaView;
 
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView = (QemuCocoaView*) userInfo;
+    NSEvent* event = [NSEvent eventWithCGEvent:cgEvent];
+    if ([cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
+        COCOA_DEBUG("Global events tap: qemu handled the event, capturing!\n");
+        return NULL;
+    }
+    COCOA_DEBUG("Global events tap: qemu did not handle the event, letting it through...\n");
+
+    return cgEvent;
+}
+
 @implementation QemuCocoaView
 - (id)initWithFrame:(NSRect)frameRect
 {
@@ -361,6 +376,11 @@ - (void) dealloc
     }
 
     qkbd_state_free(kbd);
+
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+
     [super dealloc];
 }
 
@@ -635,6 +655,36 @@ - (void) toggleFullScreen:(id)sender
     }
 }
 
+- (void) setFullGrab:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
+
+    CGEventMask mask = CGEventMaskBit(kCGEventKeyDown) | CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
+    eventsTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault,
+                                 mask, handleTapEvent, self);
+    if (!eventsTap) {
+        warn_report("Could not create event tap, system key combos will not be captured.\n");
+        return;
+    } else {
+        COCOA_DEBUG("Global events tap created! Will capture system key combos.\n");
+    }
+
+    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
+    if (!runLoop) {
+        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
+        return;
+    }
+
+    CFRunLoopSourceRef tapEventsSrc = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
+    if (!tapEventsSrc ) {
+        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
+        return;
+    }
+
+    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
+    CFRelease(tapEventsSrc);
+}
+
 - (void) toggleKey: (int)keycode {
     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
 }
@@ -1260,6 +1310,13 @@ - (void)toggleFullScreen:(id)sender
     [cocoaView toggleFullScreen:sender];
 }
 
+- (void) setFullGrab:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaAppController: setFullGrab\n");
+
+    [cocoaView setFullGrab:sender];
+}
+
 /* Tries to find then open the specified filename */
 - (void) openDocumentation: (NSString *) filename
 {
@@ -2031,11 +2088,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_sem_wait(&app_started_sem);
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
+    QemuCocoaAppController* controller = (QemuCocoaAppController*)[[NSApplication sharedApplication] delegate];
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
         dispatch_async(dispatch_get_main_queue(), ^{
             [NSApp activateIgnoringOtherApps: YES];
-            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
+            [controller toggleFullScreen: nil];
+        });
+    }
+    if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
+        dispatch_async(dispatch_get_main_queue(), ^{
+            [controller setFullGrab: nil];
         });
     }
     if (opts->has_show_cursor && opts->show_cursor) {
-- 
2.30.1 (Apple Git-130)


