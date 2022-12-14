Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D342464CB8A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:47:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5N-0004vy-RR; Wed, 14 Dec 2022 08:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S56-0004id-Sr
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S54-0003hK-G2
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9Nqllu56/fqg0y90UGnWYXLiaH+dckmBAGoe4Y/0OQ=;
 b=SxVwQSYGIhQXH0FdNBWC9ik4Hk12exAh6q/XxXhqF+Uo6hUnFmt/yEXMSafSXJ9EV4Xgen
 WEKf5nyzHpzEWGH5PYvYeoZUkhnghxS4iKAPV/CET9ICekpWYz//qYYtiaOnoUfYPhV4yT
 qHjTXa1UAu5l4SfkIM5nBgs9GjHVpxY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-YiDJSmR4NuOvJO3aT40rQQ-1; Wed, 14 Dec 2022 08:45:52 -0500
X-MC-Unique: YiDJSmR4NuOvJO3aT40rQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FCA6185A78B;
 Wed, 14 Dec 2022 13:45:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CE4814171BE;
 Wed, 14 Dec 2022 13:45:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 44/51] block: wrlock in bdrv_replace_child_noperm
Date: Wed, 14 Dec 2022 14:44:46 +0100
Message-Id: <20221214134453.31665-45-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Protect the main function where graph is modified.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-12-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 44d59362d6..df52c6b012 100644
--- a/block.c
+++ b/block.c
@@ -2836,8 +2836,6 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
  *
  * If @new_bs is non-NULL, the parent of @child must already be drained through
  * @child.
- *
- * This function does not poll.
  */
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
@@ -2875,23 +2873,24 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
+    /* TODO Pull this up into the callers to avoid polling here */
+    bdrv_graph_wrlock();
     if (old_bs) {
         if (child->klass->detach) {
             child->klass->detach(child);
         }
-        assert_bdrv_graph_writable(old_bs);
         QLIST_REMOVE(child, next_parent);
     }
 
     child->bs = new_bs;
 
     if (new_bs) {
-        assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
         if (child->klass->attach) {
             child->klass->attach(child);
         }
     }
+    bdrv_graph_wrunlock();
 
     /*
      * If the parent was drained through this BdrvChild previously, but new_bs
-- 
2.38.1


