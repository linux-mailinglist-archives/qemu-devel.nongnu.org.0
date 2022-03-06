Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152864CEE7C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:28:11 +0100 (CET)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0IM-0003XT-4u
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:28:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0AF-0001tc-8D; Sun, 06 Mar 2022 18:19:47 -0500
Received: from [2a00:1450:4864:20::429] (port=42870
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0AD-0007WM-Bm; Sun, 06 Mar 2022 18:19:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id u10so19029947wra.9;
 Sun, 06 Mar 2022 15:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u+lyBbriO7k8JBjMdjeIbWvTvUw8GNP0/ldfmZ4fVhY=;
 b=loyI9jgtnhTNLWIY0PA2O2RRcJNwgQ6wRhnHQpS2BVqqYbzM4rA4TGIzREyRqAvUR1
 +smBFZhp16kVif3URnYBOhb8R5sxqxm8DfDloqG0xXtmk8fBkT9LXarLuJrW/wMvsmTN
 8jIp35QZr1nxq0RBqyunYVBeSahtLAzN5obmrG88DYAlYVdbQvlhcnEleklPwnmS2/C5
 Gu5EkQX+xfpHBbdkKnrpxbM29CN5Jl49JMHXR07H7RfFsf/ZZMoTEt9F1zt8q3a8fvBz
 KfQFGHQYVL3Sdkd202z4Wk8LTl3aNIiEkxUvHpsLuPeax97IPK3WuG+5FcVL1gltypwv
 OL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u+lyBbriO7k8JBjMdjeIbWvTvUw8GNP0/ldfmZ4fVhY=;
 b=vLFdvp3j5FFH74WX5ATq7dHMxXV1I9xeLqihe/j8epa/KMm78WUXt/4zMYqem9aZxd
 TKV8I42QT0jVrE1jPsjKuE+FSajXyq/JP+0/XUpf0JShg4C5QF13t4Av+s5jiqNqnGry
 RfKAqz4M2YN6N/00fgZgzpAXaaK1plcMKoMTJJpQ4hSWR9s/2RZzxb218NVYq1d3IRU2
 HsuK75wWSdScM5QoHYw0epq86k4wm7lhnJULYrN6ZEOU4dqAUs6Otz3/bYMXGdSkjLZz
 +7Va0zv0T3gEUO+INde19cQZVXPrFLn+cG2JEsCx8ES1hTmo1s7aWJqMcpiOdn9hcfTs
 1nSg==
X-Gm-Message-State: AOAM530OtK9J1GSiW9p0c0oj1nnc490zdFLleSP3CWSVVt6JaW6lNqFi
 6awRGehgKy9iePneZ0vvv1fWDzCCkR0=
X-Google-Smtp-Source: ABdhPJyeMtFmCqzcYHcGRHj1A0yMzKuDqyhmeYXo/HL9dcKe17uuC/Okr7Kp/OrEeJ9ixTh81U76VQ==
X-Received: by 2002:adf:fbcf:0:b0:1ef:d5f2:23a5 with SMTP id
 d15-20020adffbcf000000b001efd5f223a5mr6337375wrs.567.1646608782319; 
 Sun, 06 Mar 2022 15:19:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a5d62cc000000b001f048bc25dfsm9620977wrv.67.2022.03.06.15.19.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/22] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Mon,  7 Mar 2022 00:17:51 +0100
Message-Id: <20220306231753.50277-21-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
Message-Id: <20210713213200.2547-2-gustavo@noronha.dev.br>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220306121119.45631-2-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/ui.json    |  8 +++++-
 qemu-options.hx |  3 +++
 ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 4dea35a819..1d60d5fc78 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1270,11 +1270,17 @@
 #                    host without sending this key to the guest when
 #                    "off". Defaults to "on"
 #
+# @full-grab: Capture all key presses, including system combos. This
+#             requires accessibility permissions, since it performs
+#             a global grab on key events. (default: off)
+#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+#
 # Since: 7.0
 ##
 { 'struct': 'DisplayCocoa',
   'data': {
-      '*left-command-key': 'bool'
+      '*left-command-key': 'bool',
+      '*full-grab': 'bool'
   } }
 
 ##
diff --git a/qemu-options.hx b/qemu-options.hx
index ffaeab61ed..2e6d54db4f 100644
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
index 31f0846c30..ca1cab1ae6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -309,11 +309,13 @@ static void handleAnyDeviceErrors(Error * err)
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
@@ -336,6 +338,19 @@ static void handleAnyDeviceErrors(Error * err)
 
 QemuCocoaView *cocoaView;
 
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView = userInfo;
+    NSEvent *event = [NSEvent eventWithCGEvent:cgEvent];
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
@@ -361,6 +376,11 @@ QemuCocoaView *cocoaView;
     }
 
     qkbd_state_free(kbd);
+
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+
     [super dealloc];
 }
 
@@ -655,6 +675,36 @@ QemuCocoaView *cocoaView;
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
@@ -1284,6 +1334,13 @@ QemuCocoaView *cocoaView;
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
@@ -2060,11 +2117,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_sem_wait(&app_started_sem);
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
+    QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
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
 
-- 
2.34.1


