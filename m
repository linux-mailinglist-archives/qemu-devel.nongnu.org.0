Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC54CEAF0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:15:50 +0100 (CET)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQord-0004wJ-9e
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:15:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQonU-00081n-4V
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:11:32 -0500
Received: from [2607:f8b0:4864:20::431] (port=42796
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQonS-000834-4Q
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:11:31 -0500
Received: by mail-pf1-x431.google.com with SMTP id a5so11381756pfv.9
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryTqyL8Coww9hJV/VylBgr6RRqY/GYgR4f84WkX/8yA=;
 b=MXxEEaa1U5Au8lF0TsZR3l+P1aCZZqYfwsLAGFN5veu6SyofZHXQqHQk80ngIbikjJ
 Be1jkwTaDLRp8zZopRCVbAXMeiAwn6pLZ9U0PmxzZz0YIl6BygKBz9frgPDpN9IZdmeA
 +7b/7+tn1d0UhFToDhA0hlBSQE/IQod9asbg5iVvMASlZXwx8tyeSHPWIBG8X2++fb/L
 +lmUpm/OKy6ciwAE06SX7HqSpAvIU4BV3WGn0koKncFpqqTOVfDsy5gTIPROKzuc6eJz
 uBUgaAPpm8Uyyv2bztsfL5MaovzSd7NCKRahp1V/I/mj/GyjD51YHW7bwiV076sovgGe
 8ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryTqyL8Coww9hJV/VylBgr6RRqY/GYgR4f84WkX/8yA=;
 b=qbGAtESf33rvxOvVMlj2Aajpg7P4fieOlJ5EMN11/n3lgHpRkUb3sLxnvhsRdUnKuM
 yqlk6p91eSeUzxkNBvKn4/lpEW0AiyO1TKBjU0U655HV4imNSiehyHEM1LtTX04i/USA
 YsVRzoldYCxNMeVAnihYbEOhs16+XneIWScOOdfASZrkQBB2MlBucsc43Yj3UAU5hABf
 kHlxVFJuyZ/UIneJVhG+iuhUCDY2o4mBpJzK/aq19yDhUzJciQ6p4u2xVZ+G0PSSZdHA
 pLrvDDkROgL2riq8u1ySAOWJQpkhYAOaBDqTruCHQLrhFtIGdX/5nv3GxUVweCBLPqQu
 oVPQ==
X-Gm-Message-State: AOAM531yRITTPzYaERUG8qt/1txuQSJh+qdujC9a0r8uYyZ/FHamtw/r
 ChNfLwLnSHYSj9159iLhXDifzhJ/6OY=
X-Google-Smtp-Source: ABdhPJz8ZhADfMA1LBGtbSgfBfY92JdDIawDONdWTkk57ednJoUCiZYolOJlBqu3hY+84kC36+pV6w==
X-Received: by 2002:a05:6a00:852:b0:4f6:feac:9c3e with SMTP id
 q18-20020a056a00085200b004f6feac9c3emr299080pfk.1.1646565088341; 
 Sun, 06 Mar 2022 03:11:28 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9574:a172:f92a:5d0f])
 by smtp.gmail.com with ESMTPSA id
 o185-20020a6341c2000000b0036fb987b25fsm9132662pga.38.2022.03.06.03.11.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 03:11:27 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Sun,  6 Mar 2022 20:11:13 +0900
Message-Id: <20220306111114.18285-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220306111114.18285-1-akihiko.odaki@gmail.com>
References: <20220306111114.18285-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eric Blake <eblake@redhat.com>, Gustavo Noronha Silva <gustavo@noronha.dev.br>
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
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
Message-Id: <20210713213200.2547-2-gustavo@noronha.dev.br>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 qapi/ui.json    | 16 ++++++++++++
 qemu-options.hx |  3 +++
 ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 4a13f883a30..1e9893419fe 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1260,6 +1260,21 @@
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
@@ -1338,6 +1353,7 @@
   'discriminator' : 'type',
   'data'    : {
       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
+      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
diff --git a/qemu-options.hx b/qemu-options.hx
index 094a6c1d7c2..4df9ccc3446 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1916,6 +1916,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
index 8ab9ab5e84d..c41bc615d33 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -308,11 +308,13 @@ @interface QemuCocoaView : NSView
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
@@ -335,6 +337,19 @@ - (void) raiseAllKeys;
 
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
@@ -360,6 +375,11 @@ - (void) dealloc
     }
 
     qkbd_state_free(kbd);
+
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+
     [super dealloc];
 }
 
@@ -654,6 +674,36 @@ - (void) toggleFullScreen:(id)sender
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
@@ -1281,6 +1331,13 @@ - (void)toggleFullScreen:(id)sender
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
@@ -2057,11 +2114,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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
2.32.0 (Apple Git-132)


