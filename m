Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10047BA69
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:04:54 +0100 (CET)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZCf-0004wt-Ja
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ8T-0002To-UC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:00:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ8R-0001kG-SN
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdzU92WGn1A58ygWK4ITnPJIjSHful7PtBJGOw21P0U=;
 b=So5P9TedgbDfjFOsKmvk2MMd4VVbgM8WkCvbA24hV7xESUTqYSFlpEKNrrg63+UOlFGBpc
 Y3EJ+av8kmec5kMnBvBi7rB5GL+jbnNGIZqWkU9bj3NtZsFS3ZFeDgZ1by0rxojWoWSWX/
 FSazkGP7PQjNLOk5mobNNfwvjWmLyw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-suZsMAncMyqYMzNHyb2DCw-1; Tue, 21 Dec 2021 02:00:26 -0500
X-MC-Unique: suZsMAncMyqYMzNHyb2DCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 947161853020;
 Tue, 21 Dec 2021 07:00:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E91077451;
 Tue, 21 Dec 2021 07:00:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/36] ui/vdagent: add serial capability support
Date: Tue, 21 Dec 2021 10:58:23 +0400
Message-Id: <20211221065855.142578-5-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

The Spice agent implements a simple serial mechanism to avoid clipboard
races between client & guest. See:
https://gitlab.freedesktop.org/spice/spice-protocol/-/commit/045a6978d6dbbf7046affc5c321fa8177c8cce56

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h |  4 ++++
 ui/vdagent.c           | 39 ++++++++++++++++++++++++++++++++++++++-
 ui/trace-events        |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index d82cf314811c..e590b453c8b7 100644
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
index de827aad27ab..b4fdae69177f 100644
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
index b9c0dd0fa11d..e832c3e3659d 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -135,3 +135,4 @@ vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
 vdagent_peer_cap(const char *name) "cap %s"
 vdagent_cb_grab_selection(const char *name) "selection %s"
 vdagent_cb_grab_type(const char *name) "type %s"
+vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=%u, received=%u"
-- 
2.34.1.8.g35151cf07204


