Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E53D0AB3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:46:35 +0200 (CEST)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67sA-0006qm-1e
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67op-0001Hk-My
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67oo-0005fv-3l
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWkh/wtLFRZY9CylXtq3NuAaKqDyien2TpzZuEmEdaU=;
 b=R7bDOphfpg5f8zTQrH1uKOoiMD6na/eyWhlOtGh9l4b16I2rOaVCBla80Q5vbBX0qzMzYL
 nkxTi1hnb891//1vktf5vCxcnDpCksMLGCKH57wtGRxSok7y34GygjQAb2lOuJMEmoT71I
 pZdJrX0qJFyYpC1dKDH2dUhOYoWDXVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-TshFtXTjMMyU3y70zdBb7A-1; Wed, 21 Jul 2021 04:43:04 -0400
X-MC-Unique: TshFtXTjMMyU3y70zdBb7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A2A801F97
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:43:03 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D67560CCC;
 Wed, 21 Jul 2021 08:43:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/13] ui/vdagent: send release when no clipboard owner
Date: Wed, 21 Jul 2021 12:41:38 +0400
Message-Id: <20210721084139.1124779-13-marcandre.lureau@redhat.com>
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
 ui/vdagent.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index bc8347f995..efb4546045 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -345,6 +345,24 @@ static void vdagent_send_clipboard_grab(VDAgentChardev *vd,
     vdagent_send_msg(vd, msg);
 }
 
+static void vdagent_send_clipboard_release(VDAgentChardev *vd,
+                                           QemuClipboardInfo *info)
+{
+    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                               sizeof(uint32_t));
+
+    if (have_selection(vd)) {
+        uint8_t *s = msg->data;
+        *s = info->selection;
+        msg->size += sizeof(uint32_t);
+    } else if (info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
+        return;
+    }
+
+    msg->type = VD_AGENT_CLIPBOARD_RELEASE;
+    vdagent_send_msg(vd, msg);
+}
+
 static void vdagent_send_clipboard_data(VDAgentChardev *vd,
                                         QemuClipboardInfo *info,
                                         QemuClipboardType type)
@@ -386,7 +404,11 @@ static void vdagent_clipboard_notify(Notifier *notifier, void *data)
     if (info != qemu_clipboard_info(s)) {
         vd->cbpending[s] = 0;
         if (!self_update) {
-            vdagent_send_clipboard_grab(vd, info);
+            if (info->owner) {
+                vdagent_send_clipboard_grab(vd, info);
+            } else {
+                vdagent_send_clipboard_release(vd, info);
+            }
         }
         return;
     }
-- 
2.32.0.264.g75ae10bc75


