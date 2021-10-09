Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724C427D95
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:18:17 +0200 (CEST)
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJjU-00024J-Cu
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJc5-00082H-DV
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJc3-0008Rw-Q7
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+AYzqe2rNkXZs4KLxV4tHf+k26nue+SEs9kxjMMhnk=;
 b=fIfxLgYL2bpt9anSfQzYTs/Bcny76rTttTpsOlLI80iVLCSu30W62ebojTJoRnvHdl4NYT
 qK99tbWmoPPtUAPq/RZX1iL5NpIKUhg7t1IWvwbGRPyh2zOolXD7bNGoOFYtB/+IwaNYS3
 EAl0HIpJ8pQH1iEeYWFnqEfHviUZ18g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-C5wJ5g0UO-Wo5yGcHO9aXQ-1; Sat, 09 Oct 2021 17:10:32 -0400
X-MC-Unique: C5wJ5g0UO-Wo5yGcHO9aXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C23801AA7
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:10:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2BDF5C23A;
 Sat,  9 Oct 2021 21:10:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/37] ui/clipboard: add a clipboard reset serial event
Date: Sun, 10 Oct 2021 01:08:08 +0400
Message-Id: <20211009210838.2219430-8-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/clipboard.h |  9 +++++++++
 ui/clipboard.c         |  7 +++++++
 ui/gtk-clipboard.c     |  3 +++
 ui/vdagent.c           | 12 ++++++++++++
 ui/vnc-clipboard.c     |  3 +++
 ui/cocoa.m             |  3 +++
 6 files changed, 37 insertions(+)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index 2c6488c1ee..ce76aa451f 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -73,11 +73,13 @@ struct QemuClipboardPeer {
  * enum QemuClipboardNotifyType
  *
  * @QEMU_CLIPBOARD_UPDATE_INFO: clipboard info update
+ * @QEMU_CLIPBOARD_RESET_SERIAL: reset clipboard serial
  *
  * Clipboard notify type.
  */
 enum QemuClipboardNotifyType {
     QEMU_CLIPBOARD_UPDATE_INFO,
+    QEMU_CLIPBOARD_RESET_SERIAL,
 };
 
 /**
@@ -230,6 +232,13 @@ void qemu_clipboard_info_unref(QemuClipboardInfo *info);
  */
 void qemu_clipboard_update(QemuClipboardInfo *info);
 
+/**
+ * qemu_clipboard_reset_serial
+ *
+ * Reset the clipboard serial.
+ */
+void qemu_clipboard_reset_serial(void);
+
 /**
  * qemu_clipboard_request
  *
diff --git a/ui/clipboard.c b/ui/clipboard.c
index ffbd80e5c6..82572ea116 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -129,6 +129,13 @@ void qemu_clipboard_request(QemuClipboardInfo *info,
     info->owner->request(info, type);
 }
 
+void qemu_clipboard_reset_serial(void)
+{
+    QemuClipboardNotify notify = { .type = QEMU_CLIPBOARD_RESET_SERIAL };
+
+    notifier_list_notify(&clipboard_notifiers, &notify);
+}
+
 void qemu_clipboard_set_data(QemuClipboardPeer *peer,
                              QemuClipboardInfo *info,
                              QemuClipboardType type,
diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 44ff810234..e0b8b283fe 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -127,6 +127,9 @@ static void gd_clipboard_notify(Notifier *notifier, void *data)
     case QEMU_CLIPBOARD_UPDATE_INFO:
         gd_clipboard_update_info(gd, notify->info);
         return;
+    case QEMU_CLIPBOARD_RESET_SERIAL:
+        /* ignore */
+        return;
     }
 }
 
diff --git a/ui/vdagent.c b/ui/vdagent.c
index b4fdae6917..7ea4bc5d9a 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -466,6 +466,15 @@ static void vdagent_clipboard_update_info(VDAgentChardev *vd,
     }
 }
 
+static void vdagent_clipboard_reset_serial(VDAgentChardev *vd)
+{
+    Chardev *chr = CHARDEV(vd);
+
+    /* reopen the agent connection to reset the serial state */
+    qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
+}
+
 static void vdagent_clipboard_notify(Notifier *notifier, void *data)
 {
     VDAgentChardev *vd =
@@ -476,6 +485,9 @@ static void vdagent_clipboard_notify(Notifier *notifier, void *data)
     case QEMU_CLIPBOARD_UPDATE_INFO:
         vdagent_clipboard_update_info(vd, notify->info);
         return;
+    case QEMU_CLIPBOARD_RESET_SERIAL:
+        vdagent_clipboard_reset_serial(vd);
+        return;
     }
 }
 
diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
index 41aeff1085..8b2dd0a64a 100644
--- a/ui/vnc-clipboard.c
+++ b/ui/vnc-clipboard.c
@@ -230,6 +230,9 @@ static void vnc_clipboard_notify(Notifier *notifier, void *data)
     case QEMU_CLIPBOARD_UPDATE_INFO:
         vnc_clipboard_update_info(vs, notify->info);
         return;
+    case QEMU_CLIPBOARD_RESET_SERIAL:
+        /* ignore */
+        return;
     }
 }
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6745e3fc8c..69b6c07d53 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1837,6 +1837,9 @@ static void cocoa_clipboard_notify(Notifier *notifier, void *data)
     case QEMU_CLIPBOARD_UPDATE_INFO:
         cocoa_clipboard_update_info(notify->info);
         return;
+    case QEMU_CLIPBOARD_RESET_SERIAL:
+        /* ignore */
+        return;
     }
 }
 
-- 
2.33.0.721.g106298f7f9


