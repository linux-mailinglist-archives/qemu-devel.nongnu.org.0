Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075F3FC8B6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:49:34 +0200 (CEST)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL48r-000146-7Z
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3uJ-000163-BG
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3uG-0000sn-L0
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXdK0f5Hx2rvOtBsEs5SyXcUnzlJGZ046jfsHbQFRfU=;
 b=YEV0+jMf2bviZdkDjy7efcTW8om7MaDR6WTH+ZFR8GUq2v8DlZphVI6c3vApSpGHEqUp0n
 Nn+OHfw1qcByvs+0ysvNKfn2RiQ0szVp+RkIwKK9sXl+FDA+mZqjvzgN1jhHiR+JUGR5//
 OBYzZiTk2cSSk4i+OxDjIBTCRgnBL9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-86KaMqHsO_6O9y8e51EILQ-1; Tue, 31 Aug 2021 09:34:26 -0400
X-MC-Unique: 86KaMqHsO_6O9y8e51EILQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510F180198A;
 Tue, 31 Aug 2021 13:34:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30675188E4;
 Tue, 31 Aug 2021 13:34:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] ui/vdagent: use qemu_clipboard_info helper
Date: Tue, 31 Aug 2021 17:31:27 +0400
Message-Id: <20210831133132.1697228-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

The clipboard unit now tracks the current clipboard grab, no need to
duplicate this work.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210805135715.857938-14-marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 99ba34646f..cd07937a4b 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -47,7 +47,6 @@ struct VDAgentChardev {
 
     /* clipboard */
     QemuClipboardPeer cbpeer;
-    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
     uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
 };
 typedef struct VDAgentChardev VDAgentChardev;
@@ -384,9 +383,7 @@ static void vdagent_clipboard_notify(Notifier *notifier, void *data)
     QemuClipboardType type;
     bool self_update = info->owner == &vd->cbpeer;
 
-    if (info != vd->cbinfo[s]) {
-        qemu_clipboard_info_unref(vd->cbinfo[s]);
-        vd->cbinfo[s] = qemu_clipboard_info_ref(info);
+    if (info != qemu_clipboard_info(s)) {
         vd->cbpending[s] = 0;
         if (!self_update) {
             vdagent_send_clipboard_grab(vd, info);
@@ -464,6 +461,7 @@ static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t
 static void vdagent_clipboard_recv_request(VDAgentChardev *vd, uint8_t s, uint32_t size, void *data)
 {
     QemuClipboardType type;
+    QemuClipboardInfo *info;
 
     if (size < sizeof(uint32_t)) {
         return;
@@ -475,13 +473,14 @@ static void vdagent_clipboard_recv_request(VDAgentChardev *vd, uint8_t s, uint32
     default:
         return;
     }
-    if (vd->cbinfo[s] && vd->cbinfo[s]->types[type].available &&
-        vd->cbinfo[s]->owner != &vd->cbpeer) {
-        if (vd->cbinfo[s]->types[type].data) {
-            vdagent_send_clipboard_data(vd, vd->cbinfo[s], type);
+
+    info = qemu_clipboard_info(s);
+    if (info && info->types[type].available && info->owner != &vd->cbpeer) {
+        if (info->types[type].data) {
+            vdagent_send_clipboard_data(vd, info, type);
         } else {
             vd->cbpending[s] |= (1 << type);
-            qemu_clipboard_request(vd->cbinfo[s], type);
+            qemu_clipboard_request(info, type);
         }
     }
 }
@@ -502,7 +501,11 @@ static void vdagent_clipboard_recv_data(VDAgentChardev *vd, uint8_t s, uint32_t
     }
     data += 4;
     size -= 4;
-    qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type, size, data, true);
+
+    if (qemu_clipboard_peer_owns(&vd->cbpeer, s)) {
+        qemu_clipboard_set_data(&vd->cbpeer, qemu_clipboard_info(s),
+                                type, size, data, true);
+    }
 }
 
 static void vdagent_clipboard_recv_release(VDAgentChardev *vd, uint8_t s)
-- 
2.33.0.rc2


