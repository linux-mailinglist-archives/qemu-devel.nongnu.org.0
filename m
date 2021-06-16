Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB263A9D79
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:22:48 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWRH-0001Jp-Nr
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWOj-0007wc-Tu
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:20:06 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWOi-0005mk-2N
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:20:05 -0400
Received: by mail-pg1-x534.google.com with SMTP id i34so2074416pgl.9
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CLgoTQjTEu9r2Va39XZDmzzV8ekTpjJ8uOAVSoIFiyI=;
 b=V2/9GJlPTxVLT3XnZNWcH9NCULcwauzTGMChEWJVFUxVk+/KAWRpxsAkQwF2uX+bFe
 D5MfCi+sAaSzVc2TvV0kT3RqhBw8DA30d7QcbbScS/jIAeCX0Qb4Y0KS3V6KE9SGwLhc
 wUvFS1l0cL6/OImIi6yPPdaXdNCFd8HCGr+9+45bc9frW9w0WQu/jNRXtkYYJlmdTRKG
 K3KJuK+9tCX0xCHX3tXHQW1B86HGSQ4eE3iG8cxzlRBZ/erey0WBXEEAuUC9x9rVVXG0
 YGKbmNxYsd/9m58PiPzVSTUd9CFMrXkFJv4NMWRtMDJDn9hfLBVBgsMZgBucoOfenQCs
 9JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CLgoTQjTEu9r2Va39XZDmzzV8ekTpjJ8uOAVSoIFiyI=;
 b=eh4ANtCuenCjY3+Yh9BZg6nAkWMJOtvEXL1Qpq9Zv3gos3T33KLYdt9JE4YDk/VAwR
 yDDHNQWDXOF94F1Ax+uqqRlO6vAlJpN4g7lrtszXN3LNXhktrVrS67QY7IuTMMB07/QF
 oYbqXMTC72sENnhnA/Z9G1wRqpaGwsXZimIloLzRDmUI8CaHQM1l7SFKjsxkOhB8ox+a
 mEZBMa5vqKz+5sYyqAk4YcKCODSQgmzx3JEpZRGUDyN0ocap6s2rOc0/fd6b6nLYBpV7
 PZKJ9LGQL0Aa1kdk0BCEtVwVyKAWInx/LI4/sH/h4CSp3eAuymu1aKlEr/f7i4IUOC39
 dA8Q==
X-Gm-Message-State: AOAM533OY5K07kyyS1t6zKEUdnNJxNMB8qNbad0yVCYDutb1AHPn5SSG
 ieEDf+fJK5cVyvS1q4HJmHVPs1U7RlK/QQ==
X-Google-Smtp-Source: ABdhPJw6QLZvhWOiPzUa/2qcm946UBogQzj8gufSLaOAGkJI0qBgFCYSEXgnPe3/LidmuOGSUS47Ow==
X-Received: by 2002:a05:6a00:228c:b029:2f9:e608:e110 with SMTP id
 f12-20020a056a00228cb02902f9e608e110mr9807985pfe.23.1623853202517; 
 Wed, 16 Jun 2021 07:20:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id v21sm2508295pfu.77.2021.06.16.07.19.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:20:02 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Add clipboard support
Date: Wed, 16 Jun 2021 23:19:54 +0900
Message-Id: <20210616141954.54291-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x534.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/ui/clipboard.h |   2 +-
 ui/clipboard.c         |   2 +-
 ui/cocoa.m             | 109 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index e5bcb365ed6..b45b984c9fe 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -187,7 +187,7 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
                              QemuClipboardInfo *info,
                              QemuClipboardType type,
                              uint32_t size,
-                             void *data,
+                             const void *data,
                              bool update);
 
 #endif /* QEMU_CLIPBOARD_H */
diff --git a/ui/clipboard.c b/ui/clipboard.c
index abf2b98f1f8..3525b30178b 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -73,7 +73,7 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
                              QemuClipboardInfo *info,
                              QemuClipboardType type,
                              uint32_t size,
-                             void *data,
+                             const void *data,
                              bool update)
 {
     if (!info ||
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 995301502be..1efd70ea789 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -28,6 +28,7 @@
 #include <crt_externs.h>
 
 #include "qemu-common.h"
+#include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
 #include "ui/kbd-state.h"
@@ -106,6 +107,10 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static QemuSemaphore app_started_sem;
 static bool allow_events;
 
+static NSInteger cbchangecount = -1;
+static QemuClipboardInfo *cbinfo;
+static QemuEvent cbevent;
+
 // Utility functions to run specified code block with iothread lock held
 typedef void (^CodeBlock)(void);
 typedef bool (^BoolCodeBlock)(void);
@@ -1811,6 +1816,93 @@ static void addRemovableDevicesMenuItems(void)
     qapi_free_BlockInfoList(pointerToFree);
 }
 
+@interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
+@end
+
+@implementation QemuCocoaPasteboardTypeOwner
+
+- (void)pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)type
+{
+    if (type != NSPasteboardTypeString) {
+        return;
+    }
+
+    with_iothread_lock(^{
+        QemuClipboardInfo *info = qemu_clipboard_info_ref(cbinfo);
+        qemu_event_reset(&cbevent);
+        qemu_clipboard_request(info, QEMU_CLIPBOARD_TYPE_TEXT);
+
+        while (info == cbinfo &&
+               info->types[QEMU_CLIPBOARD_TYPE_TEXT].available &&
+               info->types[QEMU_CLIPBOARD_TYPE_TEXT].data == NULL) {
+            qemu_mutex_unlock_iothread();
+            qemu_event_wait(&cbevent);
+            qemu_mutex_lock_iothread();
+        }
+
+        if (info == cbinfo) {
+            NSData *data = [[NSData alloc] initWithBytes:info->types[QEMU_CLIPBOARD_TYPE_TEXT].data
+                                           length:info->types[QEMU_CLIPBOARD_TYPE_TEXT].size];
+            [sender setData:data forType:NSPasteboardTypeString];
+            [data release];
+        }
+
+        qemu_clipboard_info_unref(info);
+    });
+}
+
+@end
+
+static QemuCocoaPasteboardTypeOwner *cbowner;
+
+static void cocoa_clipboard_notify(Notifier *notifier, void *data);
+static void cocoa_clipboard_request(QemuClipboardInfo *info,
+                                    QemuClipboardType type);
+
+static QemuClipboardPeer cbpeer = {
+    .name = "cocoa",
+    .update = { .notify = cocoa_clipboard_notify },
+    .request = cocoa_clipboard_request
+};
+
+static void cocoa_clipboard_notify(Notifier *notifier, void *data)
+{
+    QemuClipboardInfo *info = data;
+
+    if (info->owner == &cbpeer || info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
+        return;
+    }
+
+    if (info != cbinfo) {
+        NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
+        qemu_clipboard_info_unref(cbinfo);
+        cbinfo = qemu_clipboard_info_ref(info);
+        cbchangecount = [[NSPasteboard generalPasteboard] declareTypes:@[NSPasteboardTypeString] owner:cbowner];
+        [pool release];
+    }
+
+    qemu_event_set(&cbevent);
+}
+
+static void cocoa_clipboard_request(QemuClipboardInfo *info,
+                                    QemuClipboardType type)
+{
+    NSData *text;
+
+    switch (type) {
+    case QEMU_CLIPBOARD_TYPE_TEXT:
+        text = [[NSPasteboard generalPasteboard] dataForType:NSPasteboardTypeString];
+        if (text) {
+            qemu_clipboard_set_data(&cbpeer, info, type,
+                                    [text length], [text bytes], true);
+            [text release];
+        }
+        break;
+    default:
+        break;
+    }
+}
+
 /*
  * The startup process for the OSX/Cocoa UI is complicated, because
  * OSX insists that the UI runs on the initial main thread, and so we
@@ -1845,6 +1937,7 @@ static void addRemovableDevicesMenuItems(void)
     COCOA_DEBUG("Second thread: calling qemu_main()\n");
     status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
     COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
+    [cbowner release];
     exit(status);
 }
 
@@ -1965,6 +2058,18 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
             [cocoaView setAbsoluteEnabled:YES];
         });
     }
+
+    if (cbchangecount != [[NSPasteboard generalPasteboard] changeCount]) {
+        qemu_clipboard_info_unref(cbinfo);
+        cbinfo = qemu_clipboard_info_new(&cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
+        if ([[NSPasteboard generalPasteboard] availableTypeFromArray:@[NSPasteboardTypeString]]) {
+            cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
+        }
+        qemu_clipboard_update(cbinfo);
+        cbchangecount = [[NSPasteboard generalPasteboard] changeCount];
+        qemu_event_set(&cbevent);
+    }
+
     [pool release];
 }
 
@@ -2001,6 +2106,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 
     // register vga output callbacks
     register_displaychangelistener(&dcl);
+
+    qemu_event_init(&cbevent, false);
+    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
+    qemu_clipboard_peer_register(&cbpeer);
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.30.1 (Apple Git-130)


