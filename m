Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D650940CC8B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:28:58 +0200 (CEST)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZeS-0004aK-PC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ77-0007pI-Np
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ75-0007HM-T4
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZQPTEYCOY/RoJosPIYDTQ+iWISPbSjxflDa2pjzPDU=;
 b=Ra0DHcBolgCVJitOLqd9a6TOzypW6fM9HYKfzkUz4VHgBp127poURescIK1H2BgMCCdRGt
 B+Pi5CKq0s3xg/aioWJfqsTJ02OpNH9B5DhZvLUVPzsvi7Spw/FV0T5DN6V/BlTF+kktI9
 W41EVnqcU5Bi6d6En+iTyMPYojKweu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-bEWG2NzAOqqA6cJg5DKalA-1; Wed, 15 Sep 2021 13:54:23 -0400
X-MC-Unique: bEWG2NzAOqqA6cJg5DKalA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962BD8064A5;
 Wed, 15 Sep 2021 17:54:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AC9110074FD;
 Wed, 15 Sep 2021 17:54:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/32] qcow2-refcount: improve style of check_refcounts_l1()
Date: Wed, 15 Sep 2021 19:53:15 +0200
Message-Id: <20210915175318.853225-30-hreitz@redhat.com>
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

 - use g_autofree for l1_table
 - better name for size in bytes variable
 - reduce code blocks nesting
 - whitespaces, braces, newlines

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-9-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 98 +++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 48 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index bdac7b1780..3c89e09599 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1862,71 +1862,73 @@ static int check_refcounts_l1(BlockDriverState *bs,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l1_table = NULL, l2_offset, l1_size2;
+    size_t l1_size_bytes = l1_size * L1E_SIZE;
+    g_autofree uint64_t *l1_table = NULL;
+    uint64_t l2_offset;
     int i, ret;
 
-    l1_size2 = l1_size * L1E_SIZE;
+    if (!l1_size) {
+        return 0;
+    }
 
     /* Mark L1 table as used */
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, refcount_table_size,
-                                   l1_table_offset, l1_size2);
+                                   l1_table_offset, l1_size_bytes);
     if (ret < 0) {
-        goto fail;
+        return ret;
+    }
+
+    l1_table = g_try_malloc(l1_size_bytes);
+    if (l1_table == NULL) {
+        res->check_errors++;
+        return -ENOMEM;
     }
 
     /* Read L1 table entries from disk */
-    if (l1_size2 > 0) {
-        l1_table = g_try_malloc(l1_size2);
-        if (l1_table == NULL) {
-            ret = -ENOMEM;
-            res->check_errors++;
-            goto fail;
-        }
-        ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
-        if (ret < 0) {
-            fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
-            res->check_errors++;
-            goto fail;
-        }
-        for(i = 0;i < l1_size; i++)
-            be64_to_cpus(&l1_table[i]);
+    ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size_bytes);
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+        res->check_errors++;
+        return ret;
+    }
+
+    for (i = 0; i < l1_size; i++) {
+        be64_to_cpus(&l1_table[i]);
     }
 
     /* Do the actual checks */
-    for(i = 0; i < l1_size; i++) {
-        l2_offset = l1_table[i];
-        if (l2_offset) {
-            /* Mark L2 table as used */
-            l2_offset &= L1E_OFFSET_MASK;
-            ret = qcow2_inc_refcounts_imrt(bs, res,
-                                           refcount_table, refcount_table_size,
-                                           l2_offset, s->cluster_size);
-            if (ret < 0) {
-                goto fail;
-            }
+    for (i = 0; i < l1_size; i++) {
+        if (!l1_table[i]) {
+            continue;
+        }
 
-            /* L2 tables are cluster aligned */
-            if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
-                res->corruptions++;
-            }
+        l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
-            /* Process and check L2 entries */
-            ret = check_refcounts_l2(bs, res, refcount_table,
-                                     refcount_table_size, l2_offset, flags,
-                                     fix, active);
-            if (ret < 0) {
-                goto fail;
-            }
+        /* Mark L2 table as used */
+        ret = qcow2_inc_refcounts_imrt(bs, res,
+                                       refcount_table, refcount_table_size,
+                                       l2_offset, s->cluster_size);
+        if (ret < 0) {
+            return ret;
+        }
+
+        /* L2 tables are cluster aligned */
+        if (offset_into_cluster(s, l2_offset)) {
+            fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
+                "cluster aligned; L1 entry corrupted\n", l2_offset);
+            res->corruptions++;
+        }
+
+        /* Process and check L2 entries */
+        ret = check_refcounts_l2(bs, res, refcount_table,
+                                 refcount_table_size, l2_offset, flags,
+                                 fix, active);
+        if (ret < 0) {
+            return ret;
         }
     }
-    g_free(l1_table);
-    return 0;
 
-fail:
-    g_free(l1_table);
-    return ret;
+    return 0;
 }
 
 /*
-- 
2.31.1


