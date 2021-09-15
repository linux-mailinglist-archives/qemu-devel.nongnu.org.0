Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B851640CC7B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:21:03 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZWo-0000Fm-KM
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6s-0007BS-Vj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6r-00074n-4e
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8Kv6b2MENRFnYss7QQVqjazj1kPqRZEvFM3G/HIyuE=;
 b=H9d+559tc1QUwwTlFim1R37oYP3fObdJm/x7c4+ItF99oksibIuEQzSo3IoYqzTbwh1bdR
 f2bXeFfJy1Ez6V05B8XgBAO0bmUKqq5EylifqO9g5we9xSLi9yc6Q2Wic4n/ehPl8BibDP
 c6uUhk86oMbBMcYd++Ic6kc2PzwuubU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-XM04Ge3YPYWpSNelKHttOw-1; Wed, 15 Sep 2021 13:54:11 -0400
X-MC-Unique: XM04Ge3YPYWpSNelKHttOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6D784A5E4;
 Wed, 15 Sep 2021 17:54:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 576D319736;
 Wed, 15 Sep 2021 17:54:09 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/32] qcow2: compressed read: simplify cluster descriptor
 passing
Date: Wed, 15 Sep 2021 19:53:09 +0200
Message-Id: <20210915175318.853225-24-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Let's pass the whole L2 entry and not bother with
L2E_COMPRESSED_OFFSET_SIZE_MASK.

It also helps further refactoring that adds generic
qcow2_parse_compressed_l2_entry() helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-3-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h         |  1 -
 block/qcow2-cluster.c |  5 ++---
 block/qcow2.c         | 12 +++++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0fe5f74ed3..42a0058ab7 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -588,7 +588,6 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
-#define L2E_COMPRESSED_OFFSET_SIZE_MASK 0x3fffffffffffffffULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index c1c43a891b..3d53657c26 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -556,8 +556,7 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  * offset needs to be aligned to a cluster boundary.
  *
  * If the cluster is unallocated then *host_offset will be 0.
- * If the cluster is compressed then *host_offset will contain the
- * complete compressed cluster descriptor.
+ * If the cluster is compressed then *host_offset will contain the l2 entry.
  *
  * On entry, *bytes is the maximum number of contiguous bytes starting at
  * offset that we are interested in.
@@ -660,7 +659,7 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
             ret = -EIO;
             goto fail;
         }
-        *host_offset = l2_entry & L2E_COMPRESSED_OFFSET_SIZE_MASK;
+        *host_offset = l2_entry;
         break;
     case QCOW2_SUBCLUSTER_ZERO_PLAIN:
     case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
diff --git a/block/qcow2.c b/block/qcow2.c
index 9f1b6461c8..e5d8ab679e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -74,7 +74,7 @@ typedef struct {
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t cluster_descriptor,
+                           uint64_t l2_entry,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -2205,7 +2205,7 @@ typedef struct Qcow2AioTask {
 
     BlockDriverState *bs;
     QCow2SubclusterType subcluster_type; /* only for read */
-    uint64_t host_offset; /* or full descriptor in compressed clusters */
+    uint64_t host_offset; /* or l2_entry for compressed read */
     uint64_t offset;
     uint64_t bytes;
     QEMUIOVector *qiov;
@@ -4693,7 +4693,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t cluster_descriptor,
+                           uint64_t l2_entry,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -4705,8 +4705,10 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    coffset = cluster_descriptor & s->cluster_offset_mask;
-    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
+    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
+
+    coffset = l2_entry & s->cluster_offset_mask;
+    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
     csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
         (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
 
-- 
2.31.1


