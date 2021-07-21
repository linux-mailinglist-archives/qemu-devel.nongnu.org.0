Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E83D0AB4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:46:44 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67sJ-0007Qq-Bc
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67og-0000jF-Qk
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67of-0005ZU-1W
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXHbR8nJJ0NV3kvnIW/1qe5jkVQkig7Pf2ODI1q+N9o=;
 b=gGxpVzT98EdvFezPjcBVIBrzPYlTBCcG9yl8kQv7ulmF7015/OLzWrF6UXH34oVy3rQmbW
 Q6UENyHOwyNswQAEdrBS0RmNpfmZg83YEKGdI6eMvNUJNlPK5p674kKGbkIY/R8UOu03Yj
 JiVcO2JLiYfTb1WyPpmRXrXNA80+sik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-XhPJw0WnNGqcwbppEGF5WA-1; Wed, 21 Jul 2021 04:42:54 -0400
X-MC-Unique: XhPJw0WnNGqcwbppEGF5WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD1A1853028
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:42:54 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0946660BF1;
 Wed, 21 Jul 2021 08:42:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] ui/vdagent: use qemu_clipboard_info helper
Date: Wed, 21 Jul 2021 12:41:36 +0400
Message-Id: <20210721084139.1124779-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 ui/vdagent.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 362064213c..bc8347f995 100644
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
@@ -489,6 +488,7 @@ static void vdagent_clipboard_recv_request(VDAgentChardev *vd, uint8_t s, uint32
 static void vdagent_clipboard_recv_data(VDAgentChardev *vd, uint8_t s, uint32_t size, void *data)
 {
     QemuClipboardType type;
+    QemuClipboardInfo *info;
 
     if (size < sizeof(uint32_t)) {
         return;
@@ -502,14 +502,20 @@ static void vdagent_clipboard_recv_data(VDAgentChardev *vd, uint8_t s, uint32_t
     }
     data += 4;
     size -= 4;
-    qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type, size, data, true);
+
+    info = qemu_clipboard_info(s);
+    if (info->owner == &vd->cbpeer) {
+        qemu_clipboard_set_data(&vd->cbpeer, info, type, size, data, true);
+    }
 }
 
 static void vdagent_clipboard_recv_release(VDAgentChardev *vd, uint8_t s)
 {
+    QemuClipboardInfo *cur;
     g_autoptr(QemuClipboardInfo) info = NULL;
 
-    if (vd->cbinfo[s] && vd->cbinfo[s]->owner == &vd->cbpeer) {
+    cur = qemu_clipboard_info(s);
+    if (cur && cur->owner == &vd->cbpeer) {
         /* set empty clipboard info */
         info = qemu_clipboard_info_new(NULL, s);
         qemu_clipboard_update(info);
-- 
2.32.0.264.g75ae10bc75


