Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE43CCE83
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:32:05 +0200 (CEST)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Nky-0006WU-1g
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NgT-0007pP-CY
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NgP-0001AK-Mf
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYrfKnai1QVuD5mXiMbty+Pcn7ah5CGPp3cBp/runuo=;
 b=S6XUV4wmvjH4O1c9FPKpZqPkGeb8Zy/uudwVtPRTmonqnyA73NlAQ8pvJZ2GUkas2e3FSA
 9rB4qc3kGzU1INwG8hy/t1Y9hA/ZMs4JN8Z2Wmpn4O5aEhKQJD3Ngm1Ts7vGZoFroYJs68
 jS3ddtS0nAWbkiCdxVaQinF6C029Z7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-M-5iqq4JMZOI7gYWhlnhbw-1; Mon, 19 Jul 2021 03:27:18 -0400
X-MC-Unique: M-5iqq4JMZOI7gYWhlnhbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 365D0804300
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:27:18 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADE3F10016F5;
 Mon, 19 Jul 2021 07:27:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] ui/vdagent: fix leak on error path
Date: Mon, 19 Jul 2021 11:26:43 +0400
Message-Id: <20210719072654.845901-2-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
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

info is leaked if more than 10 entries

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
2.32.0.93.g670b81a890


