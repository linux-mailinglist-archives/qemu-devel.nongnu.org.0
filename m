Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B33B2A7C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:37:28 +0200 (CEST)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKrX-0003ay-IZ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnH-00047N-Q7
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnF-0001Dt-RL
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFnIudBqtuhCjVtmuICg7Agkt3bKFWxFI7qCjvAK1jg=;
 b=B/5bJMwWQX0WNNHtwNVngZTMBXXkQt42htI0LIlv/wzC8qgrjqhR/aDqdUPhCpKQx/7ZCL
 V5R5qY0IrXzLhiQe8QFx4JyXC9ah7EIHewkK/uBNZIcYMZ/aeLN3m+4IKAWBCufjjYj39P
 CjNRGDMoMe6sJY2Hm4FWrip4akhjWLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-dR8F4RCZPwKOU5d58KmFlA-1; Thu, 24 Jun 2021 04:32:59 -0400
X-MC-Unique: dR8F4RCZPwKOU5d58KmFlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F0D7100A44B;
 Thu, 24 Jun 2021 08:32:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8605C1BB;
 Thu, 24 Jun 2021 08:32:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 13D9318007A1; Thu, 24 Jun 2021 10:32:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] ui/cocoa: Add clipboard support
Date: Thu, 24 Jun 2021 10:32:43 +0200
Message-Id: <20210624083246.2297440-3-kraxel@redhat.com>
In-Reply-To: <20210624083246.2297440-1-kraxel@redhat.com>
References: <20210624083246.2297440-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210616141954.54291-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h |   2 +-
 ui/clipboard.c         |   2 +-
 ui/cocoa.m             | 109 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index e5bcb365ed62..b45b984c9fe8 100644
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
index abf2b98f1f89..3525b30178b9 100644
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
index 530c506489b2..9f72844b0793 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -28,6 +28,7 @@
 #include <crt_externs.h>
 
 #include "qemu-common.h"
+#include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
 #include "ui/kbd-state.h"
@@ -105,6 +106,10 @@ static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
 static bool allow_events;
 
+static NSInteger cbchangecount = -1;
+static QemuClipboardInfo *cbinfo;
+static QemuEvent cbevent;
+
 // Utility functions to run specified code block with iothread lock held
 typedef void (^CodeBlock)(void);
 typedef bool (^BoolCodeBlock)(void);
@@ -1758,6 +1763,93 @@ static void addRemovableDevicesMenuItems(void)
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
@@ -1792,6 +1884,7 @@ static void *call_qemu_main(void *opaque)
     COCOA_DEBUG("Second thread: calling qemu_main()\n");
     status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
     COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
+    [cbowner release];
     exit(status);
 }
 
@@ -1914,6 +2007,18 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
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
 
@@ -1939,6 +2044,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 
     // register vga output callbacks
     register_displaychangelistener(&dcl);
+
+    qemu_event_init(&cbevent, false);
+    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
+    qemu_clipboard_peer_register(&cbpeer);
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.31.1


