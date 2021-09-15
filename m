Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646740CC74
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:17:50 +0200 (CEST)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZTh-0004pb-G9
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ72-0007c7-K2
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ70-0007DF-Qh
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlZ6RTQTKYnjfEbjtw6/W5ZOlmU2l9EmeF+xWRIr0vk=;
 b=IL+75nto3Ti+mbjwZBepStNFyPFrpp7ogfulfxksWOUjnn8ABH3eBg4/vVwq1EInE0TI+P
 fNx2hCy9DR8DPw2LcrdEw+plXPL+n4zOc65PCkJ4KprYpGiYYKv1PBTMmtEC9NPvFIQv7W
 u30nQ0kSVtISZuepHQkLHt0MIIHmTFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-_xPs65RHPWasscFsiU8BlQ-1; Wed, 15 Sep 2021 13:54:19 -0400
X-MC-Unique: _xPs65RHPWasscFsiU8BlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D40801B3D;
 Wed, 15 Sep 2021 17:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE3C37A8CA;
 Wed, 15 Sep 2021 17:54:17 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/32] qcow2-refcount: check_refcounts_l2(): check l2_bitmap
Date: Wed, 15 Sep 2021 19:53:13 +0200
Message-Id: <20210915175318.853225-28-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Check subcluster bitmap of the l2 entry for different types of
clusters:

 - for compressed it must be zero
 - for allocated check consistency of two parts of the bitmap
 - for unallocated all subclusters should be unallocated
   (or zero-plain)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-Id: <20210914122454.141075-7-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f48c5e1b5d..9a5ae3cac4 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1661,7 +1661,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t l2_entry;
+    uint64_t l2_entry, l2_bitmap;
     uint64_t next_contiguous_offset = 0;
     int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
@@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         uint64_t coffset;
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
+        l2_bitmap = get_l2_bitmap(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
         case QCOW2_CLUSTER_COMPRESSED:
@@ -1700,6 +1701,14 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 break;
             }
 
+            if (l2_bitmap) {
+                fprintf(stderr, "ERROR compressed cluster %d with non-zero "
+                        "subcluster allocation bitmap, entry=0x%" PRIx64 "\n",
+                        i, l2_entry);
+                res->corruptions++;
+                break;
+            }
+
             /* Mark cluster as used */
             qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
@@ -1727,13 +1736,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         {
             uint64_t offset = l2_entry & L2E_OFFSET_MASK;
 
+            if ((l2_bitmap >> 32) & l2_bitmap) {
+                res->corruptions++;
+                fprintf(stderr, "ERROR offset=%" PRIx64 ": Allocated "
+                        "cluster has corrupted subcluster allocation bitmap\n",
+                        offset);
+            }
+
             /* Correct offsets are cluster aligned */
             if (offset_into_cluster(s, offset)) {
                 bool contains_data;
                 res->corruptions++;
 
                 if (has_subclusters(s)) {
-                    uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
                     contains_data = (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC);
                 } else {
                     contains_data = !(l2_entry & QCOW_OFLAG_ZERO);
@@ -1799,7 +1814,16 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
 
         case QCOW2_CLUSTER_ZERO_PLAIN:
+            /* Impossible when image has subclusters */
+            assert(!l2_bitmap);
+            break;
+
         case QCOW2_CLUSTER_UNALLOCATED:
+            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
+                res->corruptions++;
+                fprintf(stderr, "ERROR: Unallocated "
+                        "cluster has non-zero subcluster allocation map\n");
+            }
             break;
 
         default:
-- 
2.31.1


