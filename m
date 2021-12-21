Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63247BB04
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:25:04 +0100 (CET)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZWB-0005bQ-UZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ9S-0003Hp-Mq
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ9O-0001qZ-Q7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BH0xbodMY0GS97ELdCoaOxwLcuU/2uZZIpjpdJ/PM/U=;
 b=WUpawU686LArtP2M4rqm7oS88a853XNw2oPcjO+rCaQ5cDwB7Rny1TTx0dFk2gwju+nloS
 +V9+P6NrnHzYRtsacMhrJbGCJhrn4SHGup3+IZ1yMQApLxnjCb1w/muZON67yd8+xdiJmH
 X/g4vSHYK3Ewd1RVek5Gn5oA8mKsWNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-An3jrUifPSy7K9XctAoAtQ-1; Tue, 21 Dec 2021 02:01:24 -0500
X-MC-Unique: An3jrUifPSy7K9XctAoAtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1051023F4E;
 Tue, 21 Dec 2021 07:01:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ABC47EFC0;
 Tue, 21 Dec 2021 07:00:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/36] ui/clipboard: add a clipboard reset serial event
Date: Tue, 21 Dec 2021 10:58:25 +0400
Message-Id: <20211221065855.142578-7-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h |  9 +++++++++
 ui/clipboard.c         |  7 +++++++
 ui/gtk-clipboard.c     |  3 +++
 ui/vdagent.c           | 12 ++++++++++++
 ui/vnc-clipboard.c     |  3 +++
 ui/cocoa.m             |  3 +++
 6 files changed, 37 insertions(+)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index 2c6488c1eec8..ce76aa451f64 100644
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
index ffbd80e5c60e..82572ea1169b 100644
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
index 44ff810234ff..e0b8b283fef8 100644
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
index b4fdae69177f..7ea4bc5d9a26 100644
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
index 6a0b1058840e..d48f75eb1ab4 100644
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
index 6640a2e80ebb..7ca429fa8078 100644
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
2.34.1.8.g35151cf07204


