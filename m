Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8603D0ABF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:54:36 +0200 (CEST)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67zv-0004Nv-83
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67rp-0008Hf-8t
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67rn-00084s-QV
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626857171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THZGEmL1ON3sOCgaZq2CNcN8xwiiSAihcDMZ4EzEkSY=;
 b=cGOMshOrrq6ipchGznp0cPQq736syefRqGqsvFaIGGZumTLz9kbrI38lKcHmvOOhhC1VYx
 4/HmkwetwncKGB8TLgdpLzl/voX7roK6wvpk1yIpFvDiHa4cRvWbX3rvVDYnZc6TxmWj3Q
 mm7TbBoAGD9MN0aYUMNIBP9NLTexCbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-FFzeuJS7NdSLcT_Hqrioog-1; Wed, 21 Jul 2021 04:42:32 -0400
X-MC-Unique: FFzeuJS7NdSLcT_Hqrioog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5816800D62
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:42:31 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7A8E84A16;
 Wed, 21 Jul 2021 08:42:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/13] ui/vdagent: disconnect handlers and reset state on
 finalize
Date: Wed, 21 Jul 2021 12:41:33 +0400
Message-Id: <20210721084139.1124779-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
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

Avoid handlers being called with dangling pointers when the object is
freed.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 5ae5734c81..1a29016e07 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -721,22 +721,26 @@ static void vdagent_chr_accept_input(Chardev *chr)
     vdagent_send_buf(vd);
 }
 
+static void vdagent_disconnect(VDAgentChardev *vd)
+{
+    vdagent_reset_bufs(vd);
+    vd->caps = 0;
+    if (vd->mouse_hs) {
+        qemu_input_handler_deactivate(vd->mouse_hs);
+    }
+    if (vd->cbpeer.update.notify) {
+        qemu_clipboard_peer_unregister(&vd->cbpeer);
+        memset(&vd->cbpeer, 0, sizeof(vd->cbpeer));
+    }
+}
+
 static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
 
     if (!fe_open) {
         trace_vdagent_close();
-        /* reset state */
-        vdagent_reset_bufs(vd);
-        vd->caps = 0;
-        if (vd->mouse_hs) {
-            qemu_input_handler_deactivate(vd->mouse_hs);
-        }
-        if (vd->cbpeer.update.notify) {
-            qemu_clipboard_peer_unregister(&vd->cbpeer);
-            memset(&vd->cbpeer, 0, sizeof(vd->cbpeer));
-        }
+        vdagent_disconnect(vd);
         return;
     }
 
@@ -781,6 +785,7 @@ static void vdagent_chr_fini(Object *obj)
 {
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(obj);
 
+    vdagent_disconnect(vd);
     buffer_free(&vd->outbuf);
 }
 
-- 
2.32.0.264.g75ae10bc75


