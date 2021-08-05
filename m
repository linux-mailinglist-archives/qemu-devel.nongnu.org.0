Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8279C3E168F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:10:45 +0200 (CEST)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe55-0001zq-DO
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdu5-0000Le-Fe
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdu3-0001Gj-O1
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMVDg75DWKVnjKZIFpMUjBxoinJz9SFq0ycXf1oBTLM=;
 b=ThteJx2xj2YwOhdZDlgDNk6zeVwXJPkvPlVjt0nMuxl6ZE4uA0pQufH/TSy+VaW1oSMoBI
 RBq5gMmfiAx9mFIDz/RThRVEXDV9uUVRffcaDnv9AgkgmADbJB+i/hm3Igrnc4BhivVqmV
 V2+JH0zXbVu887QvWjmFEkU59E0O7o0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-fhTlB75dMSqKDxlJjk_vyg-1; Thu, 05 Aug 2021 09:59:17 -0400
X-MC-Unique: fhTlB75dMSqKDxlJjk_vyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B647107ACF5
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:59:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8E275FC23;
 Thu,  5 Aug 2021 13:59:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/18] ui/vdagent: use qemu_clipboard_peer_release helper
Date: Thu,  5 Aug 2021 17:57:09 +0400
Message-Id: <20210805135715.857938-13-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 362064213c..99ba34646f 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -507,13 +507,7 @@ static void vdagent_clipboard_recv_data(VDAgentChardev *vd, uint8_t s, uint32_t
 
 static void vdagent_clipboard_recv_release(VDAgentChardev *vd, uint8_t s)
 {
-    g_autoptr(QemuClipboardInfo) info = NULL;
-
-    if (vd->cbinfo[s] && vd->cbinfo[s]->owner == &vd->cbpeer) {
-        /* set empty clipboard info */
-        info = qemu_clipboard_info_new(NULL, s);
-        qemu_clipboard_update(info);
-    }
+    qemu_clipboard_peer_release(&vd->cbpeer, s);
 }
 
 static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
-- 
2.32.0.264.g75ae10bc75


