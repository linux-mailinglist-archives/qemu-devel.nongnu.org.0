Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3363CFD52
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:21:43 +0200 (CEST)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rZ0-0006tA-Mg
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPR-0003oO-B9
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPO-0001IM-LG
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixiPKl7U5xNKm6fyoVggt1BNKNjXiHCgMw5tbUPwXc0=;
 b=NQPl6Ferwe2J7OyvfNzyBjbsARXbID18e4vrnGaRLhd6dI/7rsUEo0vEI737miuGJhJ2uk
 98sNlDTZAXc71yI4zsqhs/7i3Fq/NM/U2s4cY2ghtkY8ljJygXiZoy/gkOMrb3ix5i4D29
 UPqVgU1REL84nrIrlJFx4XYcWFopGFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-GBgDZDZkMkGvlrw959wZig-1; Tue, 20 Jul 2021 11:11:43 -0400
X-MC-Unique: GBgDZDZkMkGvlrw959wZig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C30DF8C45D7;
 Tue, 20 Jul 2021 15:11:10 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C09E360877;
 Tue, 20 Jul 2021 15:11:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/11] replication: Properly attach children
Date: Tue, 20 Jul 2021 17:10:49 +0200
Message-Id: <20210720151053.226144-8-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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

From: Lukas Straub <lukasstraub2@web.de>

The replication driver needs access to the children block-nodes of
it's child so it can issue bdrv_make_empty() and bdrv_co_pwritev()
to manage the replication. However, it does this by directly copying
the BdrvChilds, which is wrong.

Fix this by properly attaching the block-nodes with
bdrv_attach_child() and requesting the required permissions.

This ultimatively fixes a potential crash in replication_co_writev(),
because it may write to s->secondary_disk if it is in state
BLOCK_REPLICATION_FAILOVER_FAILED, without requesting write
permissions first. And now the workaround in
secondary_do_checkpoint() can be removed.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <5d0539d729afb8072d0d7cde977c5066285591b4.1626619393.git.lukasstraub2@web.de>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 25bbdf5d4b..b74192f795 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -165,7 +165,12 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
                                    uint64_t perm, uint64_t shared,
                                    uint64_t *nperm, uint64_t *nshared)
 {
-    *nperm = BLK_PERM_CONSISTENT_READ;
+    if (role & BDRV_CHILD_PRIMARY) {
+        *nperm = BLK_PERM_CONSISTENT_READ;
+    } else {
+        *nperm = 0;
+    }
+
     if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) == BDRV_O_RDWR) {
         *nperm |= BLK_PERM_WRITE;
     }
@@ -557,8 +562,25 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             return;
         }
 
-        s->hidden_disk = hidden_disk;
-        s->secondary_disk = secondary_disk;
+        bdrv_ref(hidden_disk->bs);
+        s->hidden_disk = bdrv_attach_child(bs, hidden_disk->bs, "hidden disk",
+                                           &child_of_bds, BDRV_CHILD_DATA,
+                                           &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }
+
+        bdrv_ref(secondary_disk->bs);
+        s->secondary_disk = bdrv_attach_child(bs, secondary_disk->bs,
+                                              "secondary disk", &child_of_bds,
+                                              BDRV_CHILD_DATA, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }
 
         /* start backup job now */
         error_setg(&s->blocker,
@@ -664,7 +686,9 @@ static void replication_done(void *opaque, int ret)
     if (ret == 0) {
         s->stage = BLOCK_REPLICATION_DONE;
 
+        bdrv_unref_child(bs, s->secondary_disk);
         s->secondary_disk = NULL;
+        bdrv_unref_child(bs, s->hidden_disk);
         s->hidden_disk = NULL;
         s->error = 0;
     } else {
-- 
2.31.1


