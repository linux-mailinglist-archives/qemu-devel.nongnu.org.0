Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DBE427D8C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:14:24 +0200 (CEST)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJfk-0004iS-01
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJbO-00076i-Ly
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:09:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJbM-0008JN-OZ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4W21a76+QGMmZ2mVT1kSjr31Jy71dJE0yk7DKdWUwM=;
 b=BYIotTEQj7blOTwmLWWFTQaYZdAj8SBotA1gF/wfgj0e8a550+sWmzwUNKfUHBhiXPX665
 gmToO68M3OP5lppUmyOdnM7FZ3N5KncCypF9xfqj4p0l0L+lyVIYC9bzo11DmZECIMQggy
 qDRC+z2ssjNLHylUocJe6fDVxhITX6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-0_jxM0dkMcm9Ev5FiGMu6Q-1; Sat, 09 Oct 2021 17:09:48 -0400
X-MC-Unique: 0_jxM0dkMcm9Ev5FiGMu6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A112180830F
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:09:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6BC5C1B4;
 Sat,  9 Oct 2021 21:09:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/37] ui/vdagent: add serial capability support
Date: Sun, 10 Oct 2021 01:08:06 +0400
Message-Id: <20211009210838.2219430-6-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
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

The Spice agent implements a simple serial mechanism to avoid clipboard
races between client & guest. See:
https://gitlab.freedesktop.org/spice/spice-protocol/-/commit/045a6978d6dbbf7046affc5c321fa8177c8cce56

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/clipboard.h |  4 ++++
 ui/vdagent.c           | 39 ++++++++++++++++++++++++++++++++++++++-
 ui/trace-events        |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index d82cf31481..e590b453c8 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -102,6 +102,8 @@ struct QemuClipboardNotify {
  * @owner: clipboard owner.
  * @selection: clipboard selection.
  * @types: clipboard data array (one entry per type).
+ * @has_serial: whether @serial is available.
+ * @serial: the grab serial counter.
  *
  * Clipboard content data and metadata.
  */
@@ -109,6 +111,8 @@ struct QemuClipboardInfo {
     uint32_t refcount;
     QemuClipboardPeer *owner;
     QemuClipboardSelection selection;
+    bool has_serial;
+    uint32_t serial;
     struct {
         bool available;
         bool requested;
diff --git a/ui/vdagent.c b/ui/vdagent.c
index de827aad27..b4fdae6917 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -59,6 +59,7 @@ struct VDAgentChardev {
 
     /* clipboard */
     QemuClipboardPeer cbpeer;
+    uint32_t last_serial[QEMU_CLIPBOARD_SELECTION__COUNT];
     uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
 };
 typedef struct VDAgentChardev VDAgentChardev;
@@ -203,6 +204,9 @@ static void vdagent_send_caps(VDAgentChardev *vd)
     if (vd->clipboard) {
         caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND);
         caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 1)
+        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL);
+#endif
     }
 
     vdagent_send_msg(vd, msg);
@@ -333,7 +337,8 @@ static void vdagent_send_clipboard_grab(VDAgentChardev *vd,
 {
     g_autofree VDAgentMessage *msg =
         g_malloc0(sizeof(VDAgentMessage) +
-                  sizeof(uint32_t) * (QEMU_CLIPBOARD_TYPE__COUNT + 1));
+                  sizeof(uint32_t) * (QEMU_CLIPBOARD_TYPE__COUNT + 1) +
+                  sizeof(uint32_t));
     uint8_t *s = msg->data;
     uint32_t *data = (uint32_t *)msg->data;
     uint32_t q, type;
@@ -346,6 +351,19 @@ static void vdagent_send_clipboard_grab(VDAgentChardev *vd,
         return;
     }
 
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 1)
+    if (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL)) {
+        if (!info->has_serial) {
+            /* client should win */
+            info->serial = vd->last_serial[info->selection]++;
+            info->has_serial = true;
+        }
+        *data = info->serial;
+        data++;
+        msg->size += sizeof(uint32_t);
+    }
+#endif
+
     for (q = 0; q < QEMU_CLIPBOARD_TYPE__COUNT; q++) {
         type = type_qemu_to_vdagent(q);
         if (type != VD_AGENT_CLIPBOARD_NONE && info->types[q].available) {
@@ -494,6 +512,24 @@ static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t
 
     trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
     info = qemu_clipboard_info_new(&vd->cbpeer, s);
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 1)
+    if (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL)) {
+        if (size < sizeof(uint32_t)) {
+            /* this shouldn't happen! */
+            return;
+        }
+
+        info->has_serial = true;
+        info->serial = *(uint32_t *)data;
+        if (info->serial < vd->last_serial[s]) {
+            /* discard lower-ordering guest grab */
+            return;
+        }
+        vd->last_serial[s] = info->serial;
+        data += sizeof(uint32_t);
+        size -= sizeof(uint32_t);
+    }
+#endif
     if (size > sizeof(uint32_t) * 10) {
         /*
          * spice has 6 types as of 2021. Limiting to 10 entries
@@ -671,6 +707,7 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
         qemu_input_handler_activate(vd->mouse_hs);
     }
     if (have_clipboard(vd) && vd->cbpeer.notifier.notify == NULL) {
+        memset(vd->last_serial, 0, sizeof(vd->last_serial));
         vd->cbpeer.name = "vdagent";
         vd->cbpeer.notifier.notify = vdagent_clipboard_notify;
         vd->cbpeer.request = vdagent_clipboard_request;
diff --git a/ui/trace-events b/ui/trace-events
index b9c0dd0fa1..e832c3e365 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -135,3 +135,4 @@ vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
 vdagent_peer_cap(const char *name) "cap %s"
 vdagent_cb_grab_selection(const char *name) "selection %s"
 vdagent_cb_grab_type(const char *name) "type %s"
+vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=%u, received=%u"
-- 
2.33.0.721.g106298f7f9


