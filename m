Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFB3D0AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:49:11 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67ug-0003vE-VS
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67oU-0008MD-JL
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67oS-0005PJ-OZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiiLtG9jTgAfsEsTqsGDvXGbSys/7B0mP5opXs/AAH4=;
 b=PVZZ9rP8y2j8ywl50WvZPub/hTd19iJe8ANcgyryFHr4oAJK+w1x5sV6ggscGGtBC2Q9vd
 zvVXqeH5UyUsWsBkI1Z/Vj5z5ip+SJpVZyNyBOnq8qUtPMmszEllUi2T0X9BSgCcIsmg6c
 TUuuhlFB85mrPTBzsSlsU6c6rdttvqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-JEnbNlscNTapQgcyZUM20Q-1; Wed, 21 Jul 2021 04:42:42 -0400
X-MC-Unique: JEnbNlscNTapQgcyZUM20Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1112410150A0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:42:42 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4BEF19C79;
 Wed, 21 Jul 2021 08:42:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/13] ui/vdagent: split clipboard recv message handling
Date: Wed, 21 Jul 2021 12:41:35 +0400
Message-Id: <20210721084139.1124779-10-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 157 +++++++++++++++++++++++++++++----------------------
 1 file changed, 89 insertions(+), 68 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 3770c58b6c..362064213c 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -433,13 +433,94 @@ static void vdagent_clipboard_request(QemuClipboardInfo *info,
     vdagent_send_msg(vd, msg);
 }
 
+static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t size, void *data)
+{
+    g_autoptr(QemuClipboardInfo) info = NULL;
+
+    trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
+    info = qemu_clipboard_info_new(&vd->cbpeer, s);
+    if (size > sizeof(uint32_t) * 10) {
+        /*
+         * spice has 6 types as of 2021. Limiting to 10 entries
+         * so we we have some wiggle room.
+         */
+        return;
+    }
+    while (size >= sizeof(uint32_t)) {
+        trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
+        switch (*(uint32_t *)data) {
+        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
+            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
+            break;
+        default:
+            break;
+        }
+        data += sizeof(uint32_t);
+        size -= sizeof(uint32_t);
+    }
+    qemu_clipboard_update(info);
+}
+
+static void vdagent_clipboard_recv_request(VDAgentChardev *vd, uint8_t s, uint32_t size, void *data)
+{
+    QemuClipboardType type;
+
+    if (size < sizeof(uint32_t)) {
+        return;
+    }
+    switch (*(uint32_t *)data) {
+    case VD_AGENT_CLIPBOARD_UTF8_TEXT:
+        type = QEMU_CLIPBOARD_TYPE_TEXT;
+        break;
+    default:
+        return;
+    }
+    if (vd->cbinfo[s] && vd->cbinfo[s]->types[type].available &&
+        vd->cbinfo[s]->owner != &vd->cbpeer) {
+        if (vd->cbinfo[s]->types[type].data) {
+            vdagent_send_clipboard_data(vd, vd->cbinfo[s], type);
+        } else {
+            vd->cbpending[s] |= (1 << type);
+            qemu_clipboard_request(vd->cbinfo[s], type);
+        }
+    }
+}
+
+static void vdagent_clipboard_recv_data(VDAgentChardev *vd, uint8_t s, uint32_t size, void *data)
+{
+    QemuClipboardType type;
+
+    if (size < sizeof(uint32_t)) {
+        return;
+    }
+    switch (*(uint32_t *)data) {
+    case VD_AGENT_CLIPBOARD_UTF8_TEXT:
+        type = QEMU_CLIPBOARD_TYPE_TEXT;
+        break;
+    default:
+        return;
+    }
+    data += 4;
+    size -= 4;
+    qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type, size, data, true);
+}
+
+static void vdagent_clipboard_recv_release(VDAgentChardev *vd, uint8_t s)
+{
+    g_autoptr(QemuClipboardInfo) info = NULL;
+
+    if (vd->cbinfo[s] && vd->cbinfo[s]->owner == &vd->cbpeer) {
+        /* set empty clipboard info */
+        info = qemu_clipboard_info_new(NULL, s);
+        qemu_clipboard_update(info);
+    }
+}
+
 static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
 {
     uint8_t s = VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD;
     uint32_t size = msg->size;
     void *data = msg->data;
-    g_autoptr(QemuClipboardInfo) info = NULL;
-    QemuClipboardType type;
 
     if (have_selection(vd)) {
         if (size < 4) {
@@ -455,75 +536,15 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
 
     switch (msg->type) {
     case VD_AGENT_CLIPBOARD_GRAB:
-        trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
-        info = qemu_clipboard_info_new(&vd->cbpeer, s);
-        if (size > sizeof(uint32_t) * 10) {
-            /*
-             * spice has 6 types as of 2021. Limiting to 10 entries
-             * so we we have some wiggle room.
-             */
-            return;
-        }
-        while (size >= sizeof(uint32_t)) {
-            trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
-            switch (*(uint32_t *)data) {
-            case VD_AGENT_CLIPBOARD_UTF8_TEXT:
-                info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
-                break;
-            default:
-                break;
-            }
-            data += sizeof(uint32_t);
-            size -= sizeof(uint32_t);
-        }
-        qemu_clipboard_update(info);
-        break;
+        return vdagent_clipboard_recv_grab(vd, s, size, data);
     case VD_AGENT_CLIPBOARD_REQUEST:
-        if (size < sizeof(uint32_t)) {
-            return;
-        }
-        switch (*(uint32_t *)data) {
-        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
-            type = QEMU_CLIPBOARD_TYPE_TEXT;
-            break;
-        default:
-            return;
-        }
-        if (vd->cbinfo[s] &&
-            vd->cbinfo[s]->types[type].available &&
-            vd->cbinfo[s]->owner != &vd->cbpeer) {
-            if (vd->cbinfo[s]->types[type].data) {
-                vdagent_send_clipboard_data(vd, vd->cbinfo[s], type);
-            } else {
-                vd->cbpending[s] |= (1 << type);
-                qemu_clipboard_request(vd->cbinfo[s], type);
-            }
-        }
-        break;
+        return vdagent_clipboard_recv_request(vd, s, size, data);
     case VD_AGENT_CLIPBOARD: /* data */
-        if (size < sizeof(uint32_t)) {
-            return;
-        }
-        switch (*(uint32_t *)data) {
-        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
-            type = QEMU_CLIPBOARD_TYPE_TEXT;
-            break;
-        default:
-            return;
-        }
-        data += 4;
-        size -= 4;
-        qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type,
-                                size, data, true);
-        break;
+        return vdagent_clipboard_recv_data(vd, s, size, data);
     case VD_AGENT_CLIPBOARD_RELEASE:
-        if (vd->cbinfo[s] &&
-            vd->cbinfo[s]->owner == &vd->cbpeer) {
-            /* set empty clipboard info */
-            info = qemu_clipboard_info_new(NULL, s);
-            qemu_clipboard_update(info);
-        }
-        break;
+        return vdagent_clipboard_recv_release(vd, s);
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.32.0.264.g75ae10bc75


