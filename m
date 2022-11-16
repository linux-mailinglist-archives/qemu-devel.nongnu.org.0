Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF462C064
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIrK-0007dc-Bq; Wed, 16 Nov 2022 08:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrH-0007YG-QJ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrF-0002j5-CV
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ro20h428+MmQ1aHxt24h1z4UYKTh74mpEKt522DW974=;
 b=VK0jKvRoNZHhzKL6wrEJJtVtf3o0kza3BLZVtUuA5moN52sip63+TFlBEjlAzSO0USNPU5
 pg6jcdGsDAASo7ULfoW355QbBrjTwL6pgPKcyrk3UvQ2YB9fd0NlZu/gA8vkR4SPNCOxKa
 V6k4GTSIbVK1WD7IwPRtM6XNiCw94bY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-nseocApXNtKdLI62IGyCBg-1; Wed, 16 Nov 2022 08:53:36 -0500
X-MC-Unique: nseocApXNtKdLI62IGyCBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F142B3801F5A;
 Wed, 16 Nov 2022 13:53:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A69B140E80E3;
 Wed, 16 Nov 2022 13:53:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 3/6] block: assert that
 BlockDriver->bdrv_co_copy_range_{from/to} is always called with graph rdlock
 taken
Date: Wed, 16 Nov 2022 08:53:28 -0500
Message-Id: <20221116135331.3052923-4-eesposit@redhat.com>
In-Reply-To: <20221116135331.3052923-1-eesposit@redhat.com>
References: <20221116135331.3052923-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

The only non-protected caller is convert_co_copy_range(), all other
callers are BlockDriver callbacks that already take the rdlock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 2 ++
 block/io.c                       | 5 +++++
 include/block/block_int-common.h | 4 ++++
 qemu-img.c                       | 4 +++-
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 9e1c689e84..6f0dd15808 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2631,6 +2631,8 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
     if (r) {
         return r;
     }
+
+    GRAPH_RDLOCK_GUARD();
     return bdrv_co_copy_range(blk_in->root, off_in,
                               blk_out->root, off_out,
                               bytes, read_flags, write_flags);
diff --git a/block/io.c b/block/io.c
index 831f277e85..62c0b3a390 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3165,6 +3165,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
 {
     BdrvTrackedRequest req;
     int ret;
+    assert_bdrv_graph_readable();
 
     /* TODO We can support BDRV_REQ_NO_FALLBACK here */
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
@@ -3246,6 +3247,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
                                          BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3263,6 +3265,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3275,6 +3278,8 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     return bdrv_co_copy_range_from(src, src_offset,
                                    dst, dst_offset,
                                    bytes, read_flags, write_flags);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 1e9bb91c98..9e441cb93b 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -574,6 +574,8 @@ struct BlockDriver {
      *
      * See the comment of bdrv_co_copy_range for the parameter and return value
      * semantics.
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_copy_range_from)(BlockDriverState *bs,
                                                 BdrvChild *src,
@@ -592,6 +594,8 @@ struct BlockDriver {
      *
      * See the comment of bdrv_co_copy_range for the parameter and return value
      * semantics.
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_copy_range_to)(BlockDriverState *bs,
                                               BdrvChild *src,
diff --git a/qemu-img.c b/qemu-img.c
index 33703a6d92..2086cf6eed 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2027,7 +2027,9 @@ retry:
 
         if (s->ret == -EINPROGRESS) {
             if (copy_range) {
-                ret = convert_co_copy_range(s, sector_num, n);
+                WITH_GRAPH_RDLOCK_GUARD() {
+                    ret = convert_co_copy_range(s, sector_num, n);
+                }
                 if (ret) {
                     s->copy_range = false;
                     goto retry;
-- 
2.31.1


