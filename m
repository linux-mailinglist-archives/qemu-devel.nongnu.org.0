Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD34362C02E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIrL-0007gO-5N; Wed, 16 Nov 2022 08:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrH-0007YB-Q9
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrF-0002j1-7d
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRNlHc5dNco8sL82R2DreaesGOuYlSclpQ+GSk1CEkU=;
 b=Xm+0RCJwNJ2LIyA1/R8YeIGyLMiKdpvCKmV6deay7vVB2tRTUg1Xoj0GDFY5B75rDKM7p4
 aUNLxfVH2PG1L2L89Xn91+fYpA+vD2qvZut/qmrsq91acL1lSMnjf60qhBbfXqT5APfSTR
 eKRJ4eTHip7utS0smCVLjkBDEjnNLas=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-owxhRB9nNuy7SGfRHTV4GA-1; Wed, 16 Nov 2022 08:53:37 -0500
X-MC-Unique: owxhRB9nNuy7SGfRHTV4GA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06955185A7A9;
 Wed, 16 Nov 2022 13:53:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF5C940E80E3;
 Wed, 16 Nov 2022 13:53:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 6/6] block: assert that BlockDriver->bdrv_co_delete_file is
 always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:53:31 -0500
Message-Id: <20221116135331.3052923-7-eesposit@redhat.com>
In-Reply-To: <20221116135331.3052923-1-eesposit@redhat.com>
References: <20221116135331.3052923-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

The only callers are other callback functions that already run with the graph
rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          | 1 +
 include/block/block_int-common.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index e54ed300d7..1a6ae08879 100644
--- a/block.c
+++ b/block.c
@@ -747,6 +747,7 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
 
     IO_CODE();
     assert(bs != NULL);
+    assert_bdrv_graph_readable();
 
     if (!bs->drv) {
         error_setg(errp, "Block node '%s' is not opened", bs->filename);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 03bd28e3c9..20308376c6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -681,7 +681,7 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_flush)(BlockDriverState *bs);
 
-    /* Delete a created file. */
+    /* Delete a created file. Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_delete_file)(BlockDriverState *bs,
                                             Error **errp);
 
-- 
2.31.1


