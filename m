Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC040CC83
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:23:56 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZZb-00066i-OW
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6y-0007Rg-ME
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6v-00078b-Eo
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p10qoiSK5/pk5iPahEiY2qK+VuyB0VLu/CcUgo2jSOc=;
 b=dn4x69+NW0ZUWPlMJcLYLRbzZcvyxyRBdJ2pCHkQLa+9Pus6T7+nq3S+rNT4yyC38XghEO
 McpPSZmy1wLbJtLRIg5zIXfz1vHRmHmtQAZJ890/KSwkH5CmCwCychPRY8w23GN/kfXZUc
 kvs0qKPfI1BlOyg41VcJix3ffGYYH/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-C3KZvZg1OsSCFqCu5tqXsw-1; Wed, 15 Sep 2021 13:54:15 -0400
X-MC-Unique: C3KZvZg1OsSCFqCu5tqXsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 269141084685;
 Wed, 15 Sep 2021 17:54:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC0B610016FB;
 Wed, 15 Sep 2021 17:54:13 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/32] qcow2-refcount: introduce fix_l2_entry_by_zero()
Date: Wed, 15 Sep 2021 19:53:11 +0200
Message-Id: <20210915175318.853225-26-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Split fix_l2_entry_by_zero() out of check_refcounts_l2() to be
reused in further patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-5-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 66cbb94ef9..184b96ad63 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1587,6 +1587,54 @@ enum {
     CHECK_FRAG_INFO = 0x2,      /* update BlockFragInfo counters */
 };
 
+/*
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ *
+ * This function decrements res->corruptions on success, so the caller is
+ * responsible to increment res->corruptions prior to the call.
+ *
+ * On failure in-memory @l2_table may be modified.
+ */
+static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
+                                uint64_t l2_offset,
+                                uint64_t *l2_table, int l2_index, bool active,
+                                bool *metadata_overlap)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int ret;
+    int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
+    uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
+    int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
+    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
+
+    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
+                                        false);
+    if (metadata_overlap) {
+        *metadata_overlap = ret < 0;
+    }
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Overlap check failed\n");
+        goto fail;
+    }
+
+    ret = bdrv_pwrite_sync(bs->file, l2e_offset, &l2_table[idx],
+                           l2_entry_size(s));
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Failed to overwrite L2 "
+                "table entry: %s\n", strerror(-ret));
+        goto fail;
+    }
+
+    res->corruptions--;
+    res->corruptions_fixed++;
+    return 0;
+
+fail:
+    res->check_errors++;
+    return ret;
+}
+
 /*
  * Increases the refcount in the given refcount table for the all clusters
  * referenced in the L2 table. While doing so, performs some checks on L2
@@ -1606,6 +1654,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
+    bool metadata_overlap;
 
     /* Read L2 table from disk */
     ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
@@ -1685,19 +1734,10 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
                             offset);
                     if (fix & BDRV_FIX_ERRORS) {
-                        int idx = i * (l2_entry_size(s) / sizeof(uint64_t));
-                        uint64_t l2e_offset =
-                            l2_offset + (uint64_t)i * l2_entry_size(s);
-                        int ign = active ? QCOW2_OL_ACTIVE_L2 :
-                                           QCOW2_OL_INACTIVE_L2;
-
-                        l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
-                        set_l2_entry(s, l2_table, i, l2_entry);
-                        ret = qcow2_pre_write_overlap_check(bs, ign,
-                                l2e_offset, l2_entry_size(s), false);
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Overlap check failed\n");
-                            res->check_errors++;
+                        ret = fix_l2_entry_by_zero(bs, res, l2_offset,
+                                                   l2_table, i, active,
+                                                   &metadata_overlap);
+                        if (metadata_overlap) {
                             /*
                              * Something is seriously wrong, so abort checking
                              * this L2 table.
@@ -1705,26 +1745,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             return ret;
                         }
 
-                        ret = bdrv_pwrite_sync(bs->file, l2e_offset,
-                                               &l2_table[idx],
-                                               l2_entry_size(s));
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Failed to overwrite L2 "
-                                    "table entry: %s\n", strerror(-ret));
-                            res->check_errors++;
-                            /*
-                             * Do not abort, continue checking the rest of this
-                             * L2 table's entries.
-                             */
-                        } else {
-                            res->corruptions--;
-                            res->corruptions_fixed++;
+                        if (ret == 0) {
                             /*
                              * Skip marking the cluster as used
                              * (it is unused now).
                              */
                             continue;
                         }
+
+                        /*
+                         * Failed to fix.
+                         * Do not abort, continue checking the rest of this
+                         * L2 table's entries.
+                         */
                     }
                 } else {
                     fprintf(stderr, "ERROR offset=%" PRIx64 ": Data cluster is "
-- 
2.31.1


