Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496663CCE87
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:32:51 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Nli-0008SI-Aa
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NiG-0002Hp-PW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NiF-0002ej-6g
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHmi4GFcpQ09u8onnRU4rz8jtX9N+S3HdWepdqiUBWc=;
 b=V4MOGxP7G+xpEZ70jj5mBUtKRX0WBHxWWiPlQpQ1mnR1c5c7yQxyeBSrKgGOwOhP4ZvcKH
 g511/5sNk6R1CeBnSixbB4/gIf1QFNFzkOjbgs1AQ2/JiZFL4rlDRtFiRZqLzpNU12qvKD
 pnhgRBB7kshScWIAbAsUczEsbN/RCKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-_KVNI_H7NM2ZWa0tUI1diQ-1; Mon, 19 Jul 2021 03:29:12 -0400
X-MC-Unique: _KVNI_H7NM2ZWa0tUI1diQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F00B9CC622
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:29:11 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF3F210016F5;
 Mon, 19 Jul 2021 07:29:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] ui/vdagent: send release when no clipboard owner
Date: Mon, 19 Jul 2021 11:26:53 +0400
Message-Id: <20210719072654.845901-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210719072654.845901-1-marcandre.lureau@redhat.com>
References: <20210719072654.845901-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 65c9663e0d..34e1c332ee 100644
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
2.32.0.93.g670b81a890


