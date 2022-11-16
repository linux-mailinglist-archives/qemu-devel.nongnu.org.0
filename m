Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF462C011
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIn9-0000vo-Mn; Wed, 16 Nov 2022 08:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImw-0000kz-MZ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-0007zT-7t
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3vxFP81L43n1Rb+FCskSOc4CHmuTpdM1qdLBdInqJM=;
 b=XNi3FornLvDjlicwRf5D9QFyJdKa7/MbbggoS65IL+H+HqFk8UUgJHqzDlWFeFgY25x/N0
 9MbuITnCiVrLfZcCc/RILLHwOARuo3Um6b7pUFizM7DRb+vY2fqzUN6OSQ0AiXsSQWQKuM
 Q6Qcxkdo46tKLfV16DyAWs551m2oJ+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-Na_HCIuiMK-uEqEwWJ3Owg-1; Wed, 16 Nov 2022 08:48:54 -0500
X-MC-Unique: Na_HCIuiMK-uEqEwWJ3Owg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E00F3833A09;
 Wed, 16 Nov 2022 13:48:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9396E4A9265;
 Wed, 16 Nov 2022 13:48:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 05/20] block: remove unnecessary assert_bdrv_graph_writable()
Date: Wed, 16 Nov 2022 08:48:35 -0500
Message-Id: <20221116134850.3051419-6-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't protect bdrv->aio_context with the graph rwlock,
so these assertions are not needed

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block.c b/block.c
index 4ef537a9f2..afab74d4da 100644
--- a/block.c
+++ b/block.c
@@ -7183,7 +7183,6 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     if (bs->quiesce_counter) {
         aio_enable_external(bs->aio_context);
     }
-    assert_bdrv_graph_writable(bs);
     bs->aio_context = NULL;
 }
 
@@ -7197,7 +7196,6 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
         aio_disable_external(new_context);
     }
 
-    assert_bdrv_graph_writable(bs);
     bs->aio_context = new_context;
 
     if (bs->drv && bs->drv->bdrv_attach_aio_context) {
@@ -7278,7 +7276,6 @@ static void bdrv_set_aio_context_commit(void *opaque)
     BlockDriverState *bs = (BlockDriverState *) state->bs;
     AioContext *new_context = state->new_ctx;
     AioContext *old_context = bdrv_get_aio_context(bs);
-    assert_bdrv_graph_writable(bs);
 
     /*
      * Take the old AioContex when detaching it from bs.
-- 
2.31.1


