Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0D3E1628
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:58:56 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdtf-0006EE-9Q
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdsO-0004gR-7v
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdsM-00008c-Mw
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLQ60TpbJE+zchmjajoumonlNRDrN6jigUuEHNUzb9c=;
 b=djN1FreXB1/Ccm/3gLyfdT6icjlZJy/hLUQIAS1ELcSlYAelvGEb1zlkQQ7F70+3MVMDfs
 fdJXQjdShAuNpOb5VE/yHJOQg5o3N08i2Mt2bJXZysk56tTP0EpoYkR8oKCEK732Z4Z7t1
 /49czvdovpQrd87xk4BxuUmY4QuOoHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-IlYdH8fMONGiZFlSc8MjoQ-1; Thu, 05 Aug 2021 09:57:32 -0400
X-MC-Unique: IlYdH8fMONGiZFlSc8MjoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83782801AC0
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:57:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CDB05C1A1;
 Thu,  5 Aug 2021 13:57:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/18] ui/vdagent: fix leak on error path
Date: Thu,  5 Aug 2021 17:56:58 +0400
Message-Id: <20210805135715.857938-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

"info" was leaked when more than 10 entries.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/clipboard.h | 2 ++
 ui/vdagent.c           | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index b45b984c9f..eb789a285a 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -190,4 +190,6 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
                              const void *data,
                              bool update);
 
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuClipboardInfo, qemu_clipboard_info_unref)
+
 #endif /* QEMU_CLIPBOARD_H */
diff --git a/ui/vdagent.c b/ui/vdagent.c
index a253a8fe63..f6ef8d1993 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -438,7 +438,7 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
     uint8_t s = VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD;
     uint32_t size = msg->size;
     void *data = msg->data;
-    QemuClipboardInfo *info;
+    g_autoptr(QemuClipboardInfo) info = NULL;
     QemuClipboardType type;
 
     if (have_selection(vd)) {
@@ -477,7 +477,6 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
             size -= sizeof(uint32_t);
         }
         qemu_clipboard_update(info);
-        qemu_clipboard_info_unref(info);
         break;
     case VD_AGENT_CLIPBOARD_REQUEST:
         if (size < sizeof(uint32_t)) {
@@ -523,7 +522,6 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
             /* set empty clipboard info */
             info = qemu_clipboard_info_new(NULL, s);
             qemu_clipboard_update(info);
-            qemu_clipboard_info_unref(info);
         }
         break;
     }
-- 
2.32.0.264.g75ae10bc75


