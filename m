Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374E6100A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:51:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hQ-0003Zo-BL; Thu, 27 Oct 2022 14:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gN-0001rB-62
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gE-0002TR-BV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLpIcLnFj5ZTKERfnqCNXZFPD94KaYdW9E3/f2Qx06c=;
 b=FLLUn8havj0JayzWB4I882XK76JFCO6ITVFjn13NFNW7BxCrAb/BaKdprYGzkGK+69mKBz
 JgdOSpOCBdBfHyN5NPrMvvLBVx/x7xAENSDRmZnhj4XIHMbqDbQqO75b+ghP+Epm7V0sMP
 LzrZbg9Z2MCEbTgr3dwdOUblQjcaIsI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-onJMj2e8ON-QLTiO8NCk5Q-1; Thu, 27 Oct 2022 14:32:34 -0400
X-MC-Unique: onJMj2e8ON-QLTiO8NCk5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2F7C3C0F66E;
 Thu, 27 Oct 2022 18:32:33 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ABC11121320;
 Thu, 27 Oct 2022 18:32:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 23/58] block.c: assert bs->aio_context is written under BQL and
 drains
Date: Thu, 27 Oct 2022 20:31:11 +0200
Message-Id: <20221027183146.463129-24-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Also here ->aio_context is read by I/O threads and written
under BQL.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221025084952.2139888-2-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block.c b/block.c
index 2d74bfe665..4d727aa38c 100644
--- a/block.c
+++ b/block.c
@@ -7153,6 +7153,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     if (bs->quiesce_counter) {
         aio_enable_external(bs->aio_context);
     }
+    assert_bdrv_graph_writable(bs);
     bs->aio_context = NULL;
 }
 
@@ -7166,6 +7167,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
         aio_disable_external(new_context);
     }
 
+    assert_bdrv_graph_writable(bs);
     bs->aio_context = new_context;
 
     if (bs->drv && bs->drv->bdrv_attach_aio_context) {
-- 
2.37.3


