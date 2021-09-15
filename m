Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A8E40CC7C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:21:34 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZXJ-00020S-3q
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6s-0007A2-In
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6q-00074R-RS
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KlHe7tGu//cdJNIfMj1TR4njO/RkTY1YGV0mEbgXyc=;
 b=WEEJFY+pq0mr0SrtBM1xgYtzVuyUo61wgAQs+c7K8Hu2Fkd8lCWrAC7VdikEGCEt3kGx1t
 1HSTBTR8bvln+5q5MdjtAWM37kOpHkqBxUG9XvlCP16GE1acm14Ti8tofgO0/24yxpxfSV
 jAD1Cx4dCFBHNoJTQ9y96hKKSGbix30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-KD41pAWWPOG8t8X8lRjwQg-1; Wed, 15 Sep 2021 13:54:08 -0400
X-MC-Unique: KD41pAWWPOG8t8X8lRjwQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97704802B9F;
 Wed, 15 Sep 2021 17:54:07 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D5FE604CC;
 Wed, 15 Sep 2021 17:54:07 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/32] qcow2-refcount: improve style of check_refcounts_l2()
Date: Wed, 15 Sep 2021 19:53:08 +0200
Message-Id: <20210915175318.853225-23-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

 - don't use same name for size in bytes and in entries
 - use g_autofree for l2_table
 - add whitespace
 - fix block comment style

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-2-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..2734338625 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1601,23 +1601,22 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l2_table, l2_entry;
+    uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, l2_size, nb_csectors, ret;
+    int i, nb_csectors, ret;
+    size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
+    g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
     /* Read L2 table from disk */
-    l2_size = s->l2_size * l2_entry_size(s);
-    l2_table = g_malloc(l2_size);
-
-    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size);
+    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
         res->check_errors++;
-        goto fail;
+        return ret;
     }
 
     /* Do the actual checks */
-    for(i = 0; i < s->l2_size; i++) {
+    for (i = 0; i < s->l2_size; i++) {
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1647,14 +1646,15 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
                 nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
             if (ret < 0) {
-                goto fail;
+                return ret;
             }
 
             if (flags & CHECK_FRAG_INFO) {
                 res->bfi.allocated_clusters++;
                 res->bfi.compressed_clusters++;
 
-                /* Compressed clusters are fragmented by nature.  Since they
+                /*
+                 * Compressed clusters are fragmented by nature.  Since they
                  * take up sub-sector space but we only have sector granularity
                  * I/O we need to re-read the same sectors even for adjacent
                  * compressed clusters.
@@ -1700,9 +1700,11 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                         if (ret < 0) {
                             fprintf(stderr, "ERROR: Overlap check failed\n");
                             res->check_errors++;
-                            /* Something is seriously wrong, so abort checking
-                             * this L2 table */
-                            goto fail;
+                            /*
+                             * Something is seriously wrong, so abort checking
+                             * this L2 table.
+                             */
+                            return ret;
                         }
 
                         ret = bdrv_pwrite_sync(bs->file, l2e_offset,
@@ -1712,13 +1714,17 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fprintf(stderr, "ERROR: Failed to overwrite L2 "
                                     "table entry: %s\n", strerror(-ret));
                             res->check_errors++;
-                            /* Do not abort, continue checking the rest of this
-                             * L2 table's entries */
+                            /*
+                             * Do not abort, continue checking the rest of this
+                             * L2 table's entries.
+                             */
                         } else {
                             res->corruptions--;
                             res->corruptions_fixed++;
-                            /* Skip marking the cluster as used
-                             * (it is unused now) */
+                            /*
+                             * Skip marking the cluster as used
+                             * (it is unused now).
+                             */
                             continue;
                         }
                     }
@@ -1743,7 +1749,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                                                refcount_table_size,
                                                offset, s->cluster_size);
                 if (ret < 0) {
-                    goto fail;
+                    return ret;
                 }
             }
             break;
@@ -1758,12 +1764,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
     }
 
-    g_free(l2_table);
     return 0;
-
-fail:
-    g_free(l2_table);
-    return ret;
 }
 
 /*
-- 
2.31.1


