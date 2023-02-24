Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE36A1E68
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:22:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZsd-00055y-9L; Fri, 24 Feb 2023 10:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVZsS-00052W-0V
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:20:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVZsI-0003v6-Sy
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:20:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so14098151wrh.9
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8d0SFcNhtxl/ExpbpwL3RiAZ9N41Raeh4dHdzqhW0Y=;
 b=gHrp2EQJeYScsceCE2PMWaG7JIPNMhVHRR+kj8pizBcPJg/oyhGm2m1Wf/jmNBb3g+
 jHD5R5o6F4ZJZPoV4vTIcchqy+aq8ChYJC0pKJr84X9IVjnt8e5YeiaoIHWqXqchPxSF
 gFg/hg38aLJJWKwMeVxUjHJ1iShM32EmmAvpEoK28QMMLILN+QrLggWdPj02ooH8ThEi
 HSEMM/mgkImYodLDb3Ubafvn+eFEIP+62tqUY7nkT/PoPzGJhT4XOZDENep0rqHG6Bl+
 nOa59iDLJTvLNxXyumkN0j2Xm26Y+0Ie1x5i3Pp3vyy1j2qGCTRzXbgThTJidrZRDQu4
 CiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8d0SFcNhtxl/ExpbpwL3RiAZ9N41Raeh4dHdzqhW0Y=;
 b=HnRTQmSRG3XQnW0R0EznfYx9GTgsdzeO/QYaBYIqIBKSrY3Rzsk/8JP2FKcNjRHYzU
 a8vLdxcd8+yeANAHgIKFUEAUfXX+NGu8A0SkE0JDjnlKfr6YB7JkA1FutSbvejdsNgtT
 95DHC1IL8KnTuqK2/7Rr3VMififjha70MHqiKRGcI1srXW4Sw7Y9CdFsR+DE/1hrA2B5
 1xa6RjL3xTrGu3qmW+iGKQl4CYxWXNSbrKY68+fee4FzC+mCpEe8vyM2uzs4wgMsmcYR
 pvUj8jTStvUYfHj7Nx/H8rIIuvlwb0HHFP/su3HbbV3snvwRy8uLMfydC/TAPxg+b5TV
 ZWig==
X-Gm-Message-State: AO0yUKUvpW1U5cy27rygWyV2i8NuVt8WNgMB5rTRCTuHGv/sWRY9sCGw
 /AXgphmJ5yjQz9nMbcIUBjH+h2y+419GF+Iw
X-Google-Smtp-Source: AK7set/9F/20SQiv9L1RW+KKwuQP0a3Po9n47OgTOxiHTDIU3Z90AHbZLj76CaYlM9Mn7yvsp0XfsQ==
X-Received: by 2002:a5d:56cf:0:b0:2c7:107d:d2ee with SMTP id
 m15-20020a5d56cf000000b002c7107dd2eemr5681702wrw.56.1677252027100; 
 Fri, 24 Feb 2023 07:20:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6405000000b002c5534db60bsm12738984wru.71.2023.02.24.07.20.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:20:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] block/qcow2: Rename QCOW2_DISCARD_TYPE enum definitions
Date: Fri, 24 Feb 2023 16:20:18 +0100
Message-Id: <20230224152019.19278-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224152019.19278-1-philmd@linaro.org>
References: <20230224152019.19278-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

In order to QAPI'fy Qcow2DiscardType in the next commit,
rename its definitions to a QAPI-ready format.

Mechanical change doing:

  $ sed -i -e 's/QCOW2_DISCARD_/QCOW2_DISCARD_TYPE_/g' \
        $(git grep -l QCOW2_DISCARD_)
  $ sed -i -e 's/QCOW2_DISCARD_TYPE_MAX/QCOW2_DISCARD_TYPE__MAX/g' \
        $(git grep -l QCOW2_DISCARD_TYPE_MAX)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/qcow2-bitmap.c   | 12 ++++++------
 block/qcow2-cluster.c  | 28 ++++++++++++++--------------
 block/qcow2-refcount.c | 26 +++++++++++++-------------
 block/qcow2-snapshot.c |  8 ++++----
 block/qcow2.c          | 26 +++++++++++++-------------
 block/qcow2.h          | 14 +++++++-------
 6 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 5f456a2785..67be9a0b0f 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -216,7 +216,7 @@ static void clear_bitmap_table(BlockDriverState *bs, uint64_t *bitmap_table,
             continue;
         }
 
-        qcow2_free_clusters(bs, addr, s->cluster_size, QCOW2_DISCARD_ALWAYS);
+        qcow2_free_clusters(bs, addr, s->cluster_size, QCOW2_DISCARD_TYPE_ALWAYS);
         bitmap_table[i] = 0;
     }
 }
@@ -271,7 +271,7 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
 
     clear_bitmap_table(bs, bitmap_table, tb->size);
     qcow2_free_clusters(bs, tb->offset, tb->size * BME_TABLE_ENTRY_SIZE,
-                        QCOW2_DISCARD_OTHER);
+                        QCOW2_DISCARD_TYPE_OTHER);
     g_free(bitmap_table);
 
     tb->offset = 0;
@@ -818,7 +818,7 @@ fail:
     g_free(dir);
 
     if (!in_place && dir_offset > 0) {
-        qcow2_free_clusters(bs, dir_offset, dir_size, QCOW2_DISCARD_OTHER);
+        qcow2_free_clusters(bs, dir_offset, dir_size, QCOW2_DISCARD_TYPE_OTHER);
     }
 
     return ret;
@@ -921,14 +921,14 @@ static int update_ext_header_and_dir(BlockDriverState *bs,
     }
 
     if (old_size > 0) {
-        qcow2_free_clusters(bs, old_offset, old_size, QCOW2_DISCARD_OTHER);
+        qcow2_free_clusters(bs, old_offset, old_size, QCOW2_DISCARD_TYPE_OTHER);
     }
 
     return 0;
 
 fail:
     if (new_offset > 0) {
-        qcow2_free_clusters(bs, new_offset, new_size, QCOW2_DISCARD_OTHER);
+        qcow2_free_clusters(bs, new_offset, new_size, QCOW2_DISCARD_TYPE_OTHER);
     }
 
     s->bitmap_directory_offset = old_offset;
@@ -1424,7 +1424,7 @@ fail:
 
     if (tb_offset > 0) {
         qcow2_free_clusters(bs, tb_offset, tb_size * sizeof(tb[0]),
-                            QCOW2_DISCARD_OTHER);
+                            QCOW2_DISCARD_TYPE_OTHER);
     }
 
     g_free(tb);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 870be106b6..a525afc7c3 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -67,7 +67,7 @@ int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs,
             continue;
         }
         qcow2_free_clusters(bs, s->l1_table[i] & L1E_OFFSET_MASK,
-                            s->cluster_size, QCOW2_DISCARD_ALWAYS);
+                            s->cluster_size, QCOW2_DISCARD_TYPE_ALWAYS);
         s->l1_table[i] = 0;
     }
     return 0;
@@ -184,12 +184,12 @@ int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
     old_l1_size = s->l1_size;
     s->l1_size = new_l1_size;
     qcow2_free_clusters(bs, old_l1_table_offset, old_l1_size * L1E_SIZE,
-                        QCOW2_DISCARD_OTHER);
+                        QCOW2_DISCARD_TYPE_OTHER);
     return 0;
  fail:
     qemu_vfree(new_l1_table);
     qcow2_free_clusters(bs, new_l1_table_offset, new_l1_size2,
-                        QCOW2_DISCARD_OTHER);
+                        QCOW2_DISCARD_TYPE_OTHER);
     return ret;
 }
 
@@ -373,7 +373,7 @@ fail:
     s->l1_table[l1_index] = old_l2_offset;
     if (l2_offset > 0) {
         qcow2_free_clusters(bs, l2_offset, s->l2_size * l2_entry_size(s),
-                            QCOW2_DISCARD_ALWAYS);
+                            QCOW2_DISCARD_TYPE_ALWAYS);
     }
     return ret;
 }
@@ -792,7 +792,7 @@ static int get_cluster_table(BlockDriverState *bs, uint64_t offset,
         /* Then decrease the refcount of the old table */
         if (l2_offset) {
             qcow2_free_clusters(bs, l2_offset, s->l2_size * l2_entry_size(s),
-                                QCOW2_DISCARD_OTHER);
+                                QCOW2_DISCARD_TYPE_OTHER);
         }
 
         /* Get the offset of the newly-allocated l2 table */
@@ -1113,7 +1113,7 @@ int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs,
      */
     if (!m->keep_old_clusters && j != 0) {
         for (i = 0; i < j; i++) {
-            qcow2_free_any_cluster(bs, old_cluster[i], QCOW2_DISCARD_NEVER);
+            qcow2_free_any_cluster(bs, old_cluster[i], QCOW2_DISCARD_TYPE_NEVER);
         }
     }
 
@@ -1133,7 +1133,7 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
     if (!has_data_file(bs) && !m->keep_old_clusters) {
         qcow2_free_clusters(bs, m->alloc_offset,
                             m->nb_clusters << s->cluster_bits,
-                            QCOW2_DISCARD_NEVER);
+                            QCOW2_DISCARD_TYPE_NEVER);
     }
 }
 
@@ -2057,7 +2057,7 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 
         /* Then decrease the refcount */
         if (unmap) {
-            qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
+            qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_TYPE_REQUEST);
         }
     }
 
@@ -2144,7 +2144,7 @@ int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
     if (s->qcow_version < 3) {
         if (!bs->backing) {
             return qcow2_cluster_discard(bs, offset, bytes,
-                                         QCOW2_DISCARD_REQUEST, false);
+                                         QCOW2_DISCARD_TYPE_REQUEST, false);
         }
         return -ENOTSUP;
     }
@@ -2312,10 +2312,10 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         ret = qcow2_update_cluster_refcount(
                             bs, offset >> s->cluster_bits,
                             refcount_diff(1, l2_refcount), false,
-                            QCOW2_DISCARD_OTHER);
+                            QCOW2_DISCARD_TYPE_OTHER);
                         if (ret < 0) {
                             qcow2_free_clusters(bs, offset, s->cluster_size,
-                                                QCOW2_DISCARD_OTHER);
+                                                QCOW2_DISCARD_TYPE_OTHER);
                             goto fail;
                         }
                     }
@@ -2331,7 +2331,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         l2_offset, l2_index);
                     if (cluster_type == QCOW2_CLUSTER_ZERO_PLAIN) {
                         qcow2_free_clusters(bs, offset, s->cluster_size,
-                                            QCOW2_DISCARD_ALWAYS);
+                                            QCOW2_DISCARD_TYPE_ALWAYS);
                     }
                     ret = -EIO;
                     goto fail;
@@ -2342,7 +2342,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                 if (ret < 0) {
                     if (cluster_type == QCOW2_CLUSTER_ZERO_PLAIN) {
                         qcow2_free_clusters(bs, offset, s->cluster_size,
-                                            QCOW2_DISCARD_ALWAYS);
+                                            QCOW2_DISCARD_TYPE_ALWAYS);
                     }
                     goto fail;
                 }
@@ -2352,7 +2352,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                 if (ret < 0) {
                     if (cluster_type == QCOW2_CLUSTER_ZERO_PLAIN) {
                         qcow2_free_clusters(bs, offset, s->cluster_size,
-                                            QCOW2_DISCARD_ALWAYS);
+                                            QCOW2_DISCARD_TYPE_ALWAYS);
                     }
                     goto fail;
                 }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b092f89da9..94f7bf9a57 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -405,7 +405,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
         /* Described somewhere else. This can recurse at most twice before we
          * arrive at a block that describes itself. */
         ret = update_refcount(bs, new_block, s->cluster_size, 1, false,
-                              QCOW2_DISCARD_NEVER);
+                              QCOW2_DISCARD_TYPE_NEVER);
         if (ret < 0) {
             goto fail;
         }
@@ -723,7 +723,7 @@ int64_t qcow2_refcount_area(BlockDriverState *bs, uint64_t start_offset,
     /* Free old table. */
     qcow2_free_clusters(bs, old_table_offset,
                         old_table_size * REFTABLE_ENTRY_SIZE,
-                        QCOW2_DISCARD_OTHER);
+                        QCOW2_DISCARD_TYPE_OTHER);
 
     return end_offset;
 
@@ -927,7 +927,7 @@ fail:
     if (ret < 0) {
         int dummy;
         dummy = update_refcount(bs, offset, cluster_offset - offset, addend,
-                                !decrease, QCOW2_DISCARD_NEVER);
+                                !decrease, QCOW2_DISCARD_TYPE_NEVER);
         (void)dummy;
     }
 
@@ -1020,7 +1020,7 @@ int64_t qcow2_alloc_clusters(BlockDriverState *bs, uint64_t size)
             return offset;
         }
 
-        ret = update_refcount(bs, offset, size, 1, false, QCOW2_DISCARD_NEVER);
+        ret = update_refcount(bs, offset, size, 1, false, QCOW2_DISCARD_TYPE_NEVER);
     } while (ret == -EAGAIN);
 
     if (ret < 0) {
@@ -1057,7 +1057,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
 
         /* And then allocate them */
         ret = update_refcount(bs, offset, i << s->cluster_bits, 1, false,
-                              QCOW2_DISCARD_NEVER);
+                              QCOW2_DISCARD_TYPE_NEVER);
     } while (ret == -EAGAIN);
 
     if (ret < 0) {
@@ -1122,7 +1122,7 @@ int64_t qcow2_alloc_bytes(BlockDriverState *bs, int size)
         }
 
         assert(offset);
-        ret = update_refcount(bs, offset, size, 1, false, QCOW2_DISCARD_NEVER);
+        ret = update_refcount(bs, offset, size, 1, false, QCOW2_DISCARD_TYPE_NEVER);
         if (ret < 0) {
             offset = 0;
         }
@@ -1331,7 +1331,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                             ret = update_refcount(
                                 bs, coffset, csize,
                                 abs(addend), addend < 0,
-                                QCOW2_DISCARD_SNAPSHOT);
+                                QCOW2_DISCARD_TYPE_SNAPSHOT);
                             if (ret < 0) {
                                 goto fail;
                             }
@@ -1360,7 +1360,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                         if (addend != 0) {
                             ret = qcow2_update_cluster_refcount(
                                 bs, cluster_index, abs(addend), addend < 0,
-                                QCOW2_DISCARD_SNAPSHOT);
+                                QCOW2_DISCARD_TYPE_SNAPSHOT);
                             if (ret < 0) {
                                 goto fail;
                             }
@@ -1402,7 +1402,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                 ret = qcow2_update_cluster_refcount(bs, l2_offset >>
                                                         s->cluster_bits,
                                                     abs(addend), addend < 0,
-                                                    QCOW2_DISCARD_SNAPSHOT);
+                                                    QCOW2_DISCARD_TYPE_SNAPSHOT);
                 if (ret < 0) {
                     goto fail;
                 }
@@ -2346,7 +2346,7 @@ static void compare_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                 ret = update_refcount(bs, i << s->cluster_bits, 1,
                                       refcount_diff(refcount1, refcount2),
                                       refcount1 > refcount2,
-                                      QCOW2_DISCARD_ALWAYS);
+                                      QCOW2_DISCARD_TYPE_ALWAYS);
                 if (ret >= 0) {
                     (*num_fixed)++;
                     continue;
@@ -3412,7 +3412,7 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                 qcow2_free_clusters(
                     bs, new_reftable_offset,
                     allocated_reftable_size * REFTABLE_ENTRY_SIZE,
-                    QCOW2_DISCARD_NEVER);
+                    QCOW2_DISCARD_TYPE_NEVER);
             }
 
             new_reftable_offset = qcow2_alloc_clusters(bs, new_reftable_size *
@@ -3525,7 +3525,7 @@ done:
             uint64_t offset = new_reftable[i] & REFT_OFFSET_MASK;
             if (offset) {
                 qcow2_free_clusters(bs, offset, s->cluster_size,
-                                    QCOW2_DISCARD_OTHER);
+                                    QCOW2_DISCARD_TYPE_OTHER);
             }
         }
         g_free(new_reftable);
@@ -3533,7 +3533,7 @@ done:
         if (new_reftable_offset > 0) {
             qcow2_free_clusters(bs, new_reftable_offset,
                                 new_reftable_size * REFTABLE_ENTRY_SIZE,
-                                QCOW2_DISCARD_OTHER);
+                                QCOW2_DISCARD_TYPE_OTHER);
         }
     }
 
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 62e8a0335d..2fe43ac7bc 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -413,7 +413,7 @@ int qcow2_write_snapshots(BlockDriverState *bs)
 
     /* free the old snapshot table */
     qcow2_free_clusters(bs, s->snapshots_offset, s->snapshots_size,
-                        QCOW2_DISCARD_SNAPSHOT);
+                        QCOW2_DISCARD_TYPE_SNAPSHOT);
     s->snapshots_offset = snapshots_offset;
     s->snapshots_size = snapshots_size;
     return 0;
@@ -421,7 +421,7 @@ int qcow2_write_snapshots(BlockDriverState *bs)
 fail:
     if (snapshots_offset > 0) {
         qcow2_free_clusters(bs, snapshots_offset, snapshots_size,
-                            QCOW2_DISCARD_ALWAYS);
+                            QCOW2_DISCARD_TYPE_ALWAYS);
     }
     return ret;
 }
@@ -737,7 +737,7 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
      * hurts by causing expensive COW for the next snapshot. */
     qcow2_cluster_discard(bs, qcow2_vm_state_offset(s),
                           ROUND_UP(sn->vm_state_size, s->cluster_size),
-                          QCOW2_DISCARD_NEVER, false);
+                          QCOW2_DISCARD_TYPE_NEVER, false);
 
 #ifdef DEBUG_ALLOC
     {
@@ -964,7 +964,7 @@ int qcow2_snapshot_delete(BlockDriverState *bs,
         return ret;
     }
     qcow2_free_clusters(bs, sn.l1_table_offset, sn.l1_size * L1E_SIZE,
-                        QCOW2_DISCARD_SNAPSHOT);
+                        QCOW2_DISCARD_TYPE_SNAPSHOT);
 
     /* must update the copied flag on the current cluster offsets */
     ret = qcow2_update_snapshot_refcount(bs, s->l1_table_offset, s->l1_size, 0);
diff --git a/block/qcow2.c b/block/qcow2.c
index ee0e5b45cc..6ffe1ba803 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -967,7 +967,7 @@ typedef struct Qcow2ReopenState {
     int l2_slice_size; /* Number of entries in a slice of the L2 table */
     bool use_lazy_refcounts;
     int overlap_check;
-    bool discard_passthrough[QCOW2_DISCARD_MAX];
+    bool discard_passthrough[QCOW2_DISCARD_TYPE__MAX];
     uint64_t cache_clean_interval;
     QCryptoBlockOpenOptions *crypto_opts; /* Disk encryption runtime options */
 } Qcow2ReopenState;
@@ -1129,14 +1129,14 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
                               overlap_check_template & (1 << i)) << i;
     }
 
-    r->discard_passthrough[QCOW2_DISCARD_NEVER] = false;
-    r->discard_passthrough[QCOW2_DISCARD_ALWAYS] = true;
-    r->discard_passthrough[QCOW2_DISCARD_REQUEST] =
+    r->discard_passthrough[QCOW2_DISCARD_TYPE_NEVER] = false;
+    r->discard_passthrough[QCOW2_DISCARD_TYPE_ALWAYS] = true;
+    r->discard_passthrough[QCOW2_DISCARD_TYPE_REQUEST] =
         qemu_opt_get_bool(opts, QCOW2_OPT_DISCARD_REQUEST,
                           flags & BDRV_O_UNMAP);
-    r->discard_passthrough[QCOW2_DISCARD_SNAPSHOT] =
+    r->discard_passthrough[QCOW2_DISCARD_TYPE_SNAPSHOT] =
         qemu_opt_get_bool(opts, QCOW2_OPT_DISCARD_SNAPSHOT, true);
-    r->discard_passthrough[QCOW2_DISCARD_OTHER] =
+    r->discard_passthrough[QCOW2_DISCARD_TYPE_OTHER] =
         qemu_opt_get_bool(opts, QCOW2_OPT_DISCARD_OTHER, false);
 
     switch (s->crypt_method_header) {
@@ -1215,7 +1215,7 @@ static void qcow2_update_options_commit(BlockDriverState *bs,
     s->overlap_check = r->overlap_check;
     s->use_lazy_refcounts = r->use_lazy_refcounts;
 
-    for (i = 0; i < QCOW2_DISCARD_MAX; i++) {
+    for (i = 0; i < QCOW2_DISCARD_TYPE__MAX; i++) {
         s->discard_passthrough[i] = r->discard_passthrough[i];
     }
 
@@ -4052,7 +4052,7 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    ret = qcow2_cluster_discard(bs, offset, bytes, QCOW2_DISCARD_REQUEST,
+    ret = qcow2_cluster_discard(bs, offset, bytes, QCOW2_DISCARD_TYPE_REQUEST,
                                 false);
     qemu_co_mutex_unlock(&s->lock);
     return ret;
@@ -4266,7 +4266,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
         ret = qcow2_cluster_discard(bs, ROUND_UP(offset, s->cluster_size),
                                     old_length - ROUND_UP(offset,
                                                           s->cluster_size),
-                                    QCOW2_DISCARD_ALWAYS, true);
+                                    QCOW2_DISCARD_TYPE_ALWAYS, true);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to discard cropped clusters");
             goto fail;
@@ -4463,7 +4463,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
             error_prepend(errp, "Failed to resize underlying file: ");
             qcow2_free_clusters(bs, allocation_start,
                                 nb_new_data_clusters * s->cluster_size,
-                                QCOW2_DISCARD_OTHER);
+                                QCOW2_DISCARD_TYPE_OTHER);
             goto fail;
         }
 
@@ -4498,7 +4498,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
                 error_setg_errno(errp, -ret, "Failed to update L2 tables");
                 qcow2_free_clusters(bs, host_offset,
                                     nb_new_data_clusters * s->cluster_size,
-                                    QCOW2_DISCARD_OTHER);
+                                    QCOW2_DISCARD_TYPE_OTHER);
                 goto fail;
             }
 
@@ -4950,12 +4950,12 @@ static int qcow2_make_empty(BlockDriverState *bs)
     end_offset = bs->total_sectors * BDRV_SECTOR_SIZE;
     for (offset = 0; offset < end_offset; offset += step) {
         /* As this function is generally used after committing an external
-         * snapshot, QCOW2_DISCARD_SNAPSHOT seems appropriate. Also, the
+         * snapshot, QCOW2_DISCARD_TYPE_SNAPSHOT seems appropriate. Also, the
          * default action for this kind of discard is to pass the discard,
          * which will ideally result in an actually smaller image file, as
          * is probably desired. */
         ret = qcow2_cluster_discard(bs, offset, MIN(step, end_offset - offset),
-                                    QCOW2_DISCARD_SNAPSHOT, true);
+                                    QCOW2_DISCARD_TYPE_SNAPSHOT, true);
         if (ret < 0) {
             break;
         }
diff --git a/block/qcow2.h b/block/qcow2.h
index 2285f18a73..d6ce7fce32 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -288,12 +288,12 @@ enum {
 };
 
 enum qcow2_discard_type {
-    QCOW2_DISCARD_NEVER = 0,
-    QCOW2_DISCARD_ALWAYS,
-    QCOW2_DISCARD_REQUEST,
-    QCOW2_DISCARD_SNAPSHOT,
-    QCOW2_DISCARD_OTHER,
-    QCOW2_DISCARD_MAX
+    QCOW2_DISCARD_TYPE_NEVER = 0,
+    QCOW2_DISCARD_TYPE_ALWAYS,
+    QCOW2_DISCARD_TYPE_REQUEST,
+    QCOW2_DISCARD_TYPE_SNAPSHOT,
+    QCOW2_DISCARD_TYPE_OTHER,
+    QCOW2_DISCARD_TYPE__MAX
 };
 
 typedef struct Qcow2Feature {
@@ -383,7 +383,7 @@ typedef struct BDRVQcow2State {
     Qcow2GetRefcountFunc *get_refcount;
     Qcow2SetRefcountFunc *set_refcount;
 
-    bool discard_passthrough[QCOW2_DISCARD_MAX];
+    bool discard_passthrough[QCOW2_DISCARD_TYPE__MAX];
 
     int overlap_check; /* bitmask of Qcow2MetadataOverlap values */
     bool signaled_corruption;
-- 
2.38.1


