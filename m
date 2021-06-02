Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDDD398B21
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:54:40 +0200 (CEST)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRKR-0004eW-6F
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCN-0001Pl-St
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCM-0007JB-9x
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiJowF4miaokVojnqvQE1qycemMNmA5ngJhIeWf6azo=;
 b=ge7YSrtPJuAq4SVqXk489RfaJv1+IC0T3Qrr/QPFQeaa8vgKEvr/wJPDzsZnqUlI90Eb6f
 Rv+VA1PPP1o2H5EE2dg43zTim5sgKUKQ2K57CYlwr6uy00gyww0CsSJMBB5ma0aX4LjELo
 cNQpek/kcYyh216UzrDWFYRs7VcKLmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-0DUAZCI8O9KsgFp6nKLRLg-1; Wed, 02 Jun 2021 09:46:14 -0400
X-MC-Unique: 0DUAZCI8O9KsgFp6nKLRLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436C881F03C;
 Wed,  2 Jun 2021 13:45:47 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5465D60BD9;
 Wed,  2 Jun 2021 13:45:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/20] block: document child argument of
 bdrv_attach_child_common()
Date: Wed,  2 Jun 2021 15:45:19 +0200
Message-Id: <20210602134529.231756-11-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The logic around **child is not obvious: this reference is used not
only to return resulting child, but also to rollback NULL value on
transaction abort.

So, let's add documentation and some assertions.

While being here, drop extra declaration of bdrv_attach_child_noperm().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210601075218.79249-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 84cb7212f7..c0fd363605 100644
--- a/block.c
+++ b/block.c
@@ -84,14 +84,6 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
-                                    BlockDriverState *child_bs,
-                                    const char *child_name,
-                                    const BdrvChildClass *child_class,
-                                    BdrvChildRole child_role,
-                                    BdrvChild **child,
-                                    Transaction *tran,
-                                    Error **errp);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -2759,6 +2751,12 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
+ *
+ * Resulting new child is returned through @child.
+ * At start *@child must be NULL.
+ * @child is saved to a new entry of @tran, so that *@child could be reverted to
+ * NULL on abort(). So referenced variable must live at least until transaction
+ * end.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2833,6 +2831,10 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+/*
+ * Variable referenced by @child must live at least until transaction end.
+ * (see bdrv_attach_child_common() doc for details)
+ */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2915,7 +2917,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
     if (ret < 0) {
-        assert(child == NULL);
         goto out;
     }
 
@@ -2923,6 +2924,9 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
 out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
+
     bdrv_unref(child_bs);
     return child;
 }
@@ -2962,6 +2966,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-- 
2.30.2


