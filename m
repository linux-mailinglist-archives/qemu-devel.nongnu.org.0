Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47947BA97
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:18:23 +0100 (CET)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZPi-0007an-QC
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:18:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ85-00025U-B2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:00:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ83-0001hn-3w
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiN9BUutgkzLtBp/GAyVU25mmPg2j5ZZqIuXUaGx4/4=;
 b=NqEbJCJTg55RSbedWoI01MajEelMRVo8p4gSGJM04gKLPZ7Y6blUSqH5cSbbBTyDe1yzod
 SINxw5OYkNkKwS3vojkGtYLk/l9SfkDrOr5n6ynU4l/ClO7KkoHkL+QkfLxyKrpolse5pI
 Py+FErDZqdMrZV6YFVpGMrLa9Ruhxzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-nav0vnlmOQCRQXMN_zZPew-1; Tue, 21 Dec 2021 01:59:58 -0500
X-MC-Unique: nav0vnlmOQCRQXMN_zZPew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664E0802C91;
 Tue, 21 Dec 2021 06:59:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 708BD838DF;
 Tue, 21 Dec 2021 06:59:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/36] ui: generalize clipboard notifier
Date: Tue, 21 Dec 2021 10:58:22 +0400
Message-Id: <20211221065855.142578-4-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
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

Use a QemuClipboardNotify union type for extendable clipboard events.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h | 32 ++++++++++++++++++++++++++++++--
 ui/clipboard.c         | 12 ++++++++----
 ui/gtk-clipboard.c     | 20 ++++++++++++++++----
 ui/vdagent.c           | 27 ++++++++++++++++++---------
 ui/vnc-clipboard.c     | 20 +++++++++++++++-----
 ui/vnc.c               |  2 +-
 ui/cocoa.m             | 17 +++++++++++++----
 7 files changed, 101 insertions(+), 29 deletions(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index 6298986b15c3..d82cf314811c 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -20,8 +20,10 @@
  */
 
 typedef enum QemuClipboardType QemuClipboardType;
+typedef enum QemuClipboardNotifyType QemuClipboardNotifyType;
 typedef enum QemuClipboardSelection QemuClipboardSelection;
 typedef struct QemuClipboardPeer QemuClipboardPeer;
+typedef struct QemuClipboardNotify QemuClipboardNotify;
 typedef struct QemuClipboardInfo QemuClipboardInfo;
 
 /**
@@ -55,18 +57,44 @@ enum QemuClipboardSelection {
  * struct QemuClipboardPeer
  *
  * @name: peer name.
- * @update: notifier for clipboard updates.
+ * @notifier: notifier for clipboard updates.
  * @request: callback for clipboard data requests.
  *
  * Clipboard peer description.
  */
 struct QemuClipboardPeer {
     const char *name;
-    Notifier update;
+    Notifier notifier;
     void (*request)(QemuClipboardInfo *info,
                     QemuClipboardType type);
 };
 
+/**
+ * enum QemuClipboardNotifyType
+ *
+ * @QEMU_CLIPBOARD_UPDATE_INFO: clipboard info update
+ *
+ * Clipboard notify type.
+ */
+enum QemuClipboardNotifyType {
+    QEMU_CLIPBOARD_UPDATE_INFO,
+};
+
+/**
+ * struct QemuClipboardNotify
+ *
+ * @type: the type of event.
+ * @info: a QemuClipboardInfo event.
+ *
+ * Clipboard notify data.
+ */
+struct QemuClipboardNotify {
+    QemuClipboardNotifyType type;
+    union {
+        QemuClipboardInfo *info;
+    };
+};
+
 /**
  * struct QemuClipboardInfo
  *
diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a07..743b39edf424 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -8,7 +8,7 @@ static QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
 
 void qemu_clipboard_peer_register(QemuClipboardPeer *peer)
 {
-    notifier_list_add(&clipboard_notifiers, &peer->update);
+    notifier_list_add(&clipboard_notifiers, &peer->notifier);
 }
 
 void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
@@ -18,8 +18,7 @@ void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
     for (i = 0; i < QEMU_CLIPBOARD_SELECTION__COUNT; i++) {
         qemu_clipboard_peer_release(peer, i);
     }
-
-    notifier_remove(&peer->update);
+    notifier_remove(&peer->notifier);
 }
 
 bool qemu_clipboard_peer_owns(QemuClipboardPeer *peer,
@@ -44,10 +43,15 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
 
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
+    QemuClipboardNotify notify = {
+        .type = QEMU_CLIPBOARD_UPDATE_INFO,
+        .info = info,
+    };
     g_autoptr(QemuClipboardInfo) old = NULL;
+
     assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
 
-    notifier_list_notify(&clipboard_notifiers, info);
+    notifier_list_notify(&clipboard_notifiers, &notify);
 
     old = cbinfo[info->selection];
     cbinfo[info->selection] = qemu_clipboard_info_ref(info);
diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 35b7a2c22838..44ff810234ff 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -74,10 +74,9 @@ static void gd_clipboard_clear(GtkClipboard *clipboard,
     gd->cbowner[s] = false;
 }
 
-static void gd_clipboard_notify(Notifier *notifier, void *data)
+static void gd_clipboard_update_info(GtkDisplayState *gd,
+                                     QemuClipboardInfo *info)
 {
-    GtkDisplayState *gd = container_of(notifier, GtkDisplayState, cbpeer.update);
-    QemuClipboardInfo *info = data;
     QemuClipboardSelection s = info->selection;
     bool self_update = info->owner == &gd->cbpeer;
 
@@ -118,6 +117,19 @@ static void gd_clipboard_notify(Notifier *notifier, void *data)
      */
 }
 
+static void gd_clipboard_notify(Notifier *notifier, void *data)
+{
+    GtkDisplayState *gd =
+        container_of(notifier, GtkDisplayState, cbpeer.notifier);
+    QemuClipboardNotify *notify = data;
+
+    switch (notify->type) {
+    case QEMU_CLIPBOARD_UPDATE_INFO:
+        gd_clipboard_update_info(gd, notify->info);
+        return;
+    }
+}
+
 static void gd_clipboard_request(QemuClipboardInfo *info,
                                  QemuClipboardType type)
 {
@@ -172,7 +184,7 @@ static void gd_owner_change(GtkClipboard *clipboard,
 void gd_clipboard_init(GtkDisplayState *gd)
 {
     gd->cbpeer.name = "gtk";
-    gd->cbpeer.update.notify = gd_clipboard_notify;
+    gd->cbpeer.notifier.notify = gd_clipboard_notify;
     gd->cbpeer.request = gd_clipboard_request;
     qemu_clipboard_peer_register(&gd->cbpeer);
 
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 64e00170017f..de827aad27ab 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -417,10 +417,9 @@ static void vdagent_send_empty_clipboard_data(VDAgentChardev *vd,
     vdagent_send_clipboard_data(vd, info, type);
 }
 
-static void vdagent_clipboard_notify(Notifier *notifier, void *data)
+static void vdagent_clipboard_update_info(VDAgentChardev *vd,
+                                          QemuClipboardInfo *info)
 {
-    VDAgentChardev *vd = container_of(notifier, VDAgentChardev, cbpeer.update);
-    QemuClipboardInfo *info = data;
     QemuClipboardSelection s = info->selection;
     QemuClipboardType type;
     bool self_update = info->owner == &vd->cbpeer;
@@ -449,6 +448,19 @@ static void vdagent_clipboard_notify(Notifier *notifier, void *data)
     }
 }
 
+static void vdagent_clipboard_notify(Notifier *notifier, void *data)
+{
+    VDAgentChardev *vd =
+        container_of(notifier, VDAgentChardev, cbpeer.notifier);
+    QemuClipboardNotify *notify = data;
+
+    switch (notify->type) {
+    case QEMU_CLIPBOARD_UPDATE_INFO:
+        vdagent_clipboard_update_info(vd, notify->info);
+        return;
+    }
+}
+
 static void vdagent_clipboard_request(QemuClipboardInfo *info,
                                       QemuClipboardType qtype)
 {
@@ -658,9 +670,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
     if (have_mouse(vd) && vd->mouse_hs) {
         qemu_input_handler_activate(vd->mouse_hs);
     }
-    if (have_clipboard(vd) && vd->cbpeer.update.notify == NULL) {
+    if (have_clipboard(vd) && vd->cbpeer.notifier.notify == NULL) {
         vd->cbpeer.name = "vdagent";
-        vd->cbpeer.update.notify = vdagent_clipboard_notify;
+        vd->cbpeer.notifier.notify = vdagent_clipboard_notify;
         vd->cbpeer.request = vdagent_clipboard_request;
         qemu_clipboard_peer_register(&vd->cbpeer);
     }
@@ -799,7 +811,7 @@ static void vdagent_disconnect(VDAgentChardev *vd)
     if (vd->mouse_hs) {
         qemu_input_handler_deactivate(vd->mouse_hs);
     }
-    if (vd->cbpeer.update.notify) {
+    if (vd->cbpeer.notifier.notify) {
         qemu_clipboard_peer_unregister(&vd->cbpeer);
         memset(&vd->cbpeer, 0, sizeof(vd->cbpeer));
     }
@@ -807,11 +819,8 @@ static void vdagent_disconnect(VDAgentChardev *vd)
 
 static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
-    VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
-
     if (!fe_open) {
         trace_vdagent_close();
-        vdagent_disconnect(vd);
         return;
     }
 
diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
index 67284b556cd8..6a0b1058840e 100644
--- a/ui/vnc-clipboard.c
+++ b/ui/vnc-clipboard.c
@@ -189,10 +189,8 @@ static void vnc_clipboard_provide(VncState *vs,
     vnc_flush(vs);
 }
 
-static void vnc_clipboard_notify(Notifier *notifier, void *data)
+static void vnc_clipboard_update_info(VncState *vs, QemuClipboardInfo *info)
 {
-    VncState *vs = container_of(notifier, VncState, cbpeer.update);
-    QemuClipboardInfo *info = data;
     QemuClipboardType type;
     bool self_update = info->owner == &vs->cbpeer;
     uint32_t flags = 0;
@@ -223,6 +221,18 @@ static void vnc_clipboard_notify(Notifier *notifier, void *data)
     }
 }
 
+static void vnc_clipboard_notify(Notifier *notifier, void *data)
+{
+    VncState *vs = container_of(notifier, VncState, cbpeer.notifier);
+    QemuClipboardNotify *notify = data;
+
+    switch (notify->type) {
+    case QEMU_CLIPBOARD_UPDATE_INFO:
+        vnc_clipboard_update_info(vs, notify->info);
+        return;
+    }
+}
+
 static void vnc_clipboard_request(QemuClipboardInfo *info,
                                   QemuClipboardType type)
 {
@@ -316,9 +326,9 @@ void vnc_server_cut_text_caps(VncState *vs)
     caps[1] = 0;
     vnc_clipboard_send(vs, 2, caps);
 
-    if (!vs->cbpeer.update.notify) {
+    if (!vs->cbpeer.notifier.notify) {
         vs->cbpeer.name = "vnc";
-        vs->cbpeer.update.notify = vnc_clipboard_notify;
+        vs->cbpeer.notifier.notify = vnc_clipboard_notify;
         vs->cbpeer.request = vnc_clipboard_request;
         qemu_clipboard_peer_register(&vs->cbpeer);
     }
diff --git a/ui/vnc.c b/ui/vnc.c
index af02522e8416..9b603382e75e 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1354,7 +1354,7 @@ void vnc_disconnect_finish(VncState *vs)
         /* last client gone */
         vnc_update_server_surface(vs->vd);
     }
-    if (vs->cbpeer.update.notify) {
+    if (vs->cbpeer.notifier.notify) {
         qemu_clipboard_peer_unregister(&vs->cbpeer);
     }
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 68a6302184ab..6640a2e80ebb 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1808,14 +1808,12 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
 
 static QemuClipboardPeer cbpeer = {
     .name = "cocoa",
-    .update = { .notify = cocoa_clipboard_notify },
+    .notifier = { .notify = cocoa_clipboard_notify },
     .request = cocoa_clipboard_request
 };
 
-static void cocoa_clipboard_notify(Notifier *notifier, void *data)
+static void cocoa_clipboard_update_info(QemuClipboardInfo *info)
 {
-    QemuClipboardInfo *info = data;
-
     if (info->owner == &cbpeer || info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
         return;
     }
@@ -1831,6 +1829,17 @@ static void cocoa_clipboard_notify(Notifier *notifier, void *data)
     qemu_event_set(&cbevent);
 }
 
+static void cocoa_clipboard_notify(Notifier *notifier, void *data)
+{
+    QemuClipboardNotify *notify = data;
+
+    switch (notify->type) {
+    case QEMU_CLIPBOARD_UPDATE_INFO:
+        cocoa_clipboard_update_info(notify->info);
+        return;
+    }
+}
+
 static void cocoa_clipboard_request(QemuClipboardInfo *info,
                                     QemuClipboardType type)
 {
-- 
2.34.1.8.g35151cf07204


