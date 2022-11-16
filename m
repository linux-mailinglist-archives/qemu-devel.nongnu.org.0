Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB562B5A8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovE9C-0002xu-Nq; Wed, 16 Nov 2022 03:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovE8Z-0002Zm-9D
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovE8V-0003pY-HG
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668588666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtrAb69emIyJfaZ1jFBfok1HzANk2Q6v3g6UNTDkSMM=;
 b=J2Yx0BPNuSB4z1AHBA8dCe59IM+AIHsGIIGneZ3PwvYzETxFGpXUPN3jllYSHG2tfSa/uL
 gL3fuEd1wKmR7lHO/JX0EPfV1tPeoDCQbDI/sIr4Zas+e5syESsqkZwTpwHq3OBRpTwNv7
 YYbLjUfSQ8i9j2iZ2CoUyvqWUGnbR/g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-b47YrAj8MpmuDCKdJOeHQw-1; Wed, 16 Nov 2022 03:51:01 -0500
X-MC-Unique: b47YrAj8MpmuDCKdJOeHQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F377A2A5956F;
 Wed, 16 Nov 2022 08:51:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91012028E94;
 Wed, 16 Nov 2022 08:51:00 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 1/8] block-copy: add missing coroutine_fn annotations
Date: Wed, 16 Nov 2022 03:50:43 -0500
Message-Id: <20221116085050.2295179-2-eesposit@redhat.com>
In-Reply-To: <20221116085050.2295179-1-eesposit@redhat.com>
References: <20221116085050.2295179-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

block_copy_reset_unallocated and block_copy_is_cluster_allocated are
only called by backup_run, a corotuine_fn itself.

Same applies to block_copy_block_status, called by
block_copy_dirty_clusters.

Therefore mark them as coroutine too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index bb947afdda..f33ab1d0b6 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -577,8 +577,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     return ret;
 }
 
-static int block_copy_block_status(BlockCopyState *s, int64_t offset,
-                                   int64_t bytes, int64_t *pnum)
+static coroutine_fn int block_copy_block_status(BlockCopyState *s,
+                                                int64_t offset,
+                                                int64_t bytes, int64_t *pnum)
 {
     int64_t num;
     BlockDriverState *base;
@@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
  * Check if the cluster starting at offset is allocated or not.
  * return via pnum the number of contiguous clusters sharing this allocation.
  */
-static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
-                                           int64_t *pnum)
+static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
+                                                        int64_t offset,
+                                                        int64_t *pnum)
 {
     BlockDriverState *bs = s->source->bs;
     int64_t count, total_count = 0;
@@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
  * @return 0 when the cluster at @offset was unallocated,
  *         1 otherwise, and -ret on error.
  */
-int64_t block_copy_reset_unallocated(BlockCopyState *s,
-                                     int64_t offset, int64_t *count)
+int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
+                                                  int64_t offset,
+                                                  int64_t *count)
 {
     int ret;
     int64_t clusters, bytes;
-- 
2.31.1


