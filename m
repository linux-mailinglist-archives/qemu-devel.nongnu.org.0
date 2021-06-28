Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300E3B5E88
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:57:10 +0200 (CEST)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqp1-0008DR-7G
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxqgM-0005Km-7L
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:48:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxqgI-00009V-4p
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:48:08 -0400
Received: by mail-pl1-x62b.google.com with SMTP id y13so8865479plc.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQCXqyIu1AP1eT9WqrHfFAc9wv9ZzcMn1cb6OGeJN8k=;
 b=sK5PRelYZfxUm8b4lHVGS9MANFju5aWwscFWMOjpCbmYXwGFVnvn5BXhdM1V1vUQab
 FQNu2npr7YjR/oT5yOyAe0Ln1FFMUdORrSwqq74GRrHbfnI9+7r14PgR3MnAG9Tq/br8
 Jrj+3P/IjPra/zO0e0Y75DIOWBahJVc6H2/w8NtC2fZOF5vWliZJnRwhjgzqlt1ITzug
 OU/s2JrcynsczJUvU6KjgQqh0A8PJ2/qK7EDeD9uPRfdhhm45y3exbT47bcAV5JksmEn
 6DaXPLF4g5AxDQYRY3qz/fJLkKztWuFCNFM84Wh8t2k6AxH/CdwVkdSYpQG6JHU4pU/j
 Kauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQCXqyIu1AP1eT9WqrHfFAc9wv9ZzcMn1cb6OGeJN8k=;
 b=sEQYcWNY4tmVlsvhZPGS+jRBEOvX/sbD9BkGB/c60BmMmgYS4C0PNLBQ09hyfK5tlT
 Gy2I+NEmfTp+q4jP60TZLAHXSuJVP7jp89ifiRD0elN07BPKcsPabJnSdNa7oqQ1qfC9
 yFmrtefPhsgz25xFUDtbLdztdXF1OGPx+vHnXWuuHH99/pWotfGYEVVhwskRaOrMGH+l
 VpCTCOyblOTvijqEw/odbjl7wLHygJMC07dT51P6quxMwCaSgwl/MAZFXmMDmEBKZWrF
 UW//vXVZqZUGrPmuRalZmSSLr6Dh86g/qEVhpz4cfLck8+y6F5gXnDCEnFFyF/M42m9c
 Ee2w==
X-Gm-Message-State: AOAM532syjenjAXraYqkXXnHYu53mOVVXzYeexy0ezkcqTAT+nA8qCBV
 LgCgTD5hXbUtBjxLLUDCByD9GRZ85GaWeA==
X-Google-Smtp-Source: ABdhPJxbupVftClPIdbOo4QMnZR68PBsbqB/JJ5+RyNFvDPmPVpdiX9e73Exaq39kNf1IKejnumjsw==
X-Received: by 2002:a17:90b:380a:: with SMTP id
 mq10mr36746854pjb.79.1624884484513; 
 Mon, 28 Jun 2021 05:48:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:196f:aeac:cb2e:6936])
 by smtp.gmail.com with ESMTPSA id i2sm19724561pjj.25.2021.06.28.05.48.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Jun 2021 05:48:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Update the state if absolute gets disabled
Date: Mon, 28 Jun 2021 21:47:54 +0900
Message-Id: <20210628124754.19487-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/cocoa used to update the internal state corresponding to
qemu_input_is_absolute only when it becomes true.
Use qemu_add_mouse_mode_change_notifier to get notified also when it
becomes false.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b079..37b3d57326c 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -320,8 +320,7 @@ - (bool) handleEventLocked:(NSEvent *)event;
 - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
 /* The state surrounding mouse grabbing is potentially confusing.
  * isAbsoluteEnabled tracks qemu_input_is_absolute() [ie "is the emulated
- *   pointing device an absolute-position one?"], but is only updated on
- *   next refresh.
+ *   pointing device an absolute-position one?"].
  * isMouseGrabbed tracks whether GUI events are directed to the guest;
  *   it controls whether special keys like Cmd get sent to the guest,
  *   and whether we capture the mouse when in non-absolute mode.
@@ -1850,6 +1849,20 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     }
 }
 
+static void cocoa_notify_mouse_mode_change(Notifier *notify, void *data)
+{
+    dispatch_async(dispatch_get_main_queue(), ^{
+        bool is_absolute = qemu_input_is_absolute();
+        if (is_absolute && [cocoaView isMouseGrabbed]) {
+            [cocoaView ungrabMouse];
+        }
+        [cocoaView setAbsoluteEnabled:is_absolute];
+    });
+}
+
+static Notifier mouse_mode_notifier =
+    { .notify = cocoa_notify_mouse_mode_change };
+
 /*
  * The startup process for the OSX/Cocoa UI is complicated, because
  * OSX insists that the UI runs on the initial main thread, and so we
@@ -1997,17 +2010,6 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
     COCOA_DEBUG("qemu_cocoa: cocoa_refresh\n");
     graphic_hw_update(NULL);
 
-    if (qemu_input_is_absolute()) {
-        dispatch_async(dispatch_get_main_queue(), ^{
-            if (![cocoaView isAbsoluteEnabled]) {
-                if ([cocoaView isMouseGrabbed]) {
-                    [cocoaView ungrabMouse];
-                }
-            }
-            [cocoaView setAbsoluteEnabled:YES];
-        });
-    }
-
     if (cbchangecount != [[NSPasteboard generalPasteboard] changeCount]) {
         qemu_clipboard_info_unref(cbinfo);
         cbinfo = qemu_clipboard_info_new(&cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
@@ -2048,6 +2050,9 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_event_init(&cbevent, false);
     cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
     qemu_clipboard_peer_register(&cbpeer);
+
+    cocoa_notify_mouse_mode_change(NULL, NULL);
+    qemu_add_mouse_mode_change_notifier(&mouse_mode_notifier);
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.30.1 (Apple Git-130)


