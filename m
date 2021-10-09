Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DBD427D89
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:13:46 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJf7-0003UQ-DJ
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJbB-0006UT-T6
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJb9-0008Ii-Qr
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXwzRpHiwwHViYexpW+i8Nl9ZynVj0FoKExsyPWFCBQ=;
 b=LMQGb/sNCjkbrBBbgXTuNAawS4nGzoa5Bmpi9WtKP5RupVWRHbF+zbv4x1EcA5TPpKYLcy
 oSxo5KXXunYyMSBUn9qeev7ngoGbdj5CWk4/560rrGccviPhwFv+nTH2HnbgVOlPRfdlLD
 Gcdn9G5ky6ZTVVpfnf3nLw06KflPjQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-J-WpAb8mOeWBNWavExTzFQ-1; Sat, 09 Oct 2021 17:09:37 -0400
X-MC-Unique: J-WpAb8mOeWBNWavExTzFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A2A48042EF
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:09:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88D80179B3;
 Sat,  9 Oct 2021 21:09:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/37] ui: generalize clipboard notifier
Date: Sun, 10 Oct 2021 01:08:05 +0400
Message-Id: <20211009210838.2219430-5-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Use a QemuClipboardNotify union type for extendable clipboard events.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/clipboard.h | 32 ++++++++++++++++++++++++++++++--
 ui/clipboard.c         | 12 ++++++++----
 ui/gtk-clipboard.c     | 20 ++++++++++++++++----
 ui/vdagent.c           | 27 ++++++++++++++++++---------
 ui/vnc-clipboard.c     | 18 ++++++++++++++----
 ui/vnc.c               |  2 +-
 ui/cocoa.m             | 17 +++++++++++++----
 7 files changed, 100 insertions(+), 28 deletions(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index 6298986b15..d82cf31481 100644
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
index d7b008d62a..743b39edf4 100644
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
index 35b7a2c228..44ff810234 100644
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
index 64e0017001..de827aad27 100644
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
index 9f077965d0..41aeff1085 100644
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
@@ -317,7 +327,7 @@ void vnc_server_cut_text_caps(VncState *vs)
     vnc_clipboard_send(vs, 2, caps);
 
     vs->cbpeer.name = "vnc";
-    vs->cbpeer.update.notify = vnc_clipboard_notify;
+    vs->cbpeer.notifier.notify = vnc_clipboard_notify;
     vs->cbpeer.request = vnc_clipboard_request;
     qemu_clipboard_peer_register(&vs->cbpeer);
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index af02522e84..9b603382e7 100644
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
index 68a6302184..6745e3fc8c 100644
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
+    switch (notify->event) {
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
2.33.0.721.g106298f7f9


