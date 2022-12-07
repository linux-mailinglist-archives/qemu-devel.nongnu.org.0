Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0B645AAC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uL7-0007ki-4v; Wed, 07 Dec 2022 08:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKu-0007if-Si
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKs-0006Tv-P4
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6p3VDVcJEfJaXD0xUQqxwuecFgWnHWqCtTxZHtfmto=;
 b=MsGQAhXp+xl8G3jACLovMOrePpE8oXe1/EG2JKrVE4WxUrMRqnOfVl/Jlvlm3GyeEqF+GX
 mdgxoHrjTUQiFwMb56NQn+nknAtcDudj0/wfieWBaimQmTXVIeB4QCATwiswCm/wCgrPd8
 JCgkVytLKwsqCvBM51aDgtzIazZo6uo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-lUdFPkEfOlScLdoXoDHpOg-1; Wed, 07 Dec 2022 08:19:38 -0500
X-MC-Unique: lUdFPkEfOlScLdoXoDHpOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93A3E3814955;
 Wed,  7 Dec 2022 13:19:38 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77E781121314;
 Wed,  7 Dec 2022 13:19:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 12/18] block: remove unnecessary assert_bdrv_graph_writable()
Date: Wed,  7 Dec 2022 14:18:32 +0100
Message-Id: <20221207131838.239125-13-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

We don't protect bdrv->aio_context with the graph rwlock,
so these assertions are not needed

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block.c b/block.c
index df52c6b012..bdffadcdaa 100644
--- a/block.c
+++ b/block.c
@@ -7214,7 +7214,6 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     if (bs->quiesce_counter) {
         aio_enable_external(bs->aio_context);
     }
-    assert_bdrv_graph_writable(bs);
     bs->aio_context = NULL;
 }
 
@@ -7228,7 +7227,6 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
         aio_disable_external(new_context);
     }
 
-    assert_bdrv_graph_writable(bs);
     bs->aio_context = new_context;
 
     if (bs->drv && bs->drv->bdrv_attach_aio_context) {
@@ -7309,7 +7307,6 @@ static void bdrv_set_aio_context_commit(void *opaque)
     BlockDriverState *bs = (BlockDriverState *) state->bs;
     AioContext *new_context = state->new_ctx;
     AioContext *old_context = bdrv_get_aio_context(bs);
-    assert_bdrv_graph_writable(bs);
 
     /*
      * Take the old AioContex when detaching it from bs.
-- 
2.38.1


