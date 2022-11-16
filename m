Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2EA62C02C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:54:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImx-0000lj-VL; Wed, 16 Nov 2022 08:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImr-0000gR-Tc
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-0007yp-F6
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2+GJnkrBcVYy0m4pv+5qDBSIXbZhzgA3Sjaa/O5BJY=;
 b=Kc5qxzOu65nPeoWVS05MofTF19z5nXQo+VS+PxgLXpuWctNhg9Dz1MCPec0yxj+nwaou9z
 wjmRNaTrS/XKfi/3ppNfREAAUumALSLcCKPombYps2VptdiCOM0TESTh26PPDHxfxi6eqC
 1YUvvZfbYaol5X9kgDUAtnn9uA714FU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16--PatpK5XOoqoxuZxSP6Tdw-1; Wed, 16 Nov 2022 08:48:53 -0500
X-MC-Unique: -PatpK5XOoqoxuZxSP6Tdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B110811E67;
 Wed, 16 Nov 2022 13:48:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DF894A9265;
 Wed, 16 Nov 2022 13:48:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 04/20] block.c: wrlock in bdrv_replace_child_noperm
Date: Wed, 16 Nov 2022 08:48:34 -0500
Message-Id: <20221116134850.3051419-5-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Protect the main function where graph is modified.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          | 6 ++++--
 include/block/block_int-common.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index d3e168408a..4ef537a9f2 100644
--- a/block.c
+++ b/block.c
@@ -1416,6 +1416,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 
     assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
+
     if (bs->drv->is_filter || (child->role & BDRV_CHILD_FILTERED)) {
         /*
          * Here we handle filters and block/raw-format.c when it behave like
@@ -2829,24 +2830,25 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
+    bdrv_graph_wrlock();
     if (old_bs) {
         if (child->klass->detach) {
             child->klass->detach(child);
         }
-        assert_bdrv_graph_writable(old_bs);
+
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
      * If the old child node was drained but the new one is not, allow
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 791dddfd7d..fd9f40a815 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -71,6 +71,7 @@ enum BdrvTrackedRequestType {
     BDRV_TRACKED_TRUNCATE,
 };
 
+
 /*
  * That is not quite good that BdrvTrackedRequest structure is public,
  * as block/io.c is very careful about incoming offset/bytes being
-- 
2.31.1


