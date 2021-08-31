Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD13FC861
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:38:28 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3xw-000881-Hs
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3tt-0008Go-FP
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3tr-0000YK-J1
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XH2EqmNh7Un1m+28ixxdjXpfmYB07W/pjYIcJtkzdcA=;
 b=NrR2VlUn+hBz/BDqiepNH/OCk1pjJlbfpBgc27IuszPapcSQJNDIEJCfRkBaxEbTXyZcls
 WxSj+uWOCMMAwYdNQi6HDHLrnGGxjLcoIg4K5YPjJqcym5/0mMijGFEuwR11/MfKw9WeWA
 wIfRgeuf4AktmSuPTjm1YycXiPdxN6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-1POO2-osNJSy6N5hBE6sPg-1; Tue, 31 Aug 2021 09:34:00 -0400
X-MC-Unique: 1POO2-osNJSy6N5hBE6sPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C661008066;
 Tue, 31 Aug 2021 13:33:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 138525C22B;
 Tue, 31 Aug 2021 13:33:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] ui/vdagent: split clipboard recv message handling
Date: Tue, 31 Aug 2021 17:31:25 +0400
Message-Id: <20210831133132.1697228-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210805135715.857938-12-marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.33.0.rc2


