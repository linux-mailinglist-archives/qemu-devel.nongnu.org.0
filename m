Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E8502B1A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:39:24 +0200 (CEST)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMAV-0003yI-FA
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLru-0007FV-Ak; Fri, 15 Apr 2022 09:20:31 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrs-0008Fv-2x; Fri, 15 Apr 2022 09:20:09 -0400
Received: by mail-ej1-x62b.google.com with SMTP id l7so15389003ejn.2;
 Fri, 15 Apr 2022 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6OUlIhw+Phlbrj8zmiBGLbzAZ/41yV+ixhKmOGR0js=;
 b=i87JjXFev+z/uqBZ2gjWkZseq1/K5mYWo0I8kDWeypvlDRz6oIWP+liBe9FmYIpa5q
 8+mJQ2aNw0dTFn7AHxibdFh18LbKKd0R7Z6QrPICU/zMUAX2DmqLd/Ch59riX4AqDeIO
 5dwN4Vsp8tK26cS1olnjpNnvpA7CJE4eNagiE9eLyBT0lPDsZ8uhAi88zYPGmQ7mi1eB
 cjtsJ4MtjpTjhbA9qYdhGABAc/bczoQ8l6hsrnNdJ+RlRn38M+xCBRwVRGJKrnGYanGs
 4xswLXkhbBDGpw4PimAoRTH1D8aNNBuD7F9mQyuEjiopTCpiDDRPqG4q66ukFlOvY0rH
 1e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W6OUlIhw+Phlbrj8zmiBGLbzAZ/41yV+ixhKmOGR0js=;
 b=GmKu13HWWC/0Z7/YIrJOJHJU4f0wfFj/ONKN8Nkn5pkRYH2RY9jSDXQaWpBVDGq7g+
 M9B9Dtwwl8hjv9wCBli8AAiljXR1Yd2mUZP53RavnMwoi/IeWnGQQNm4XihRZ17tCmZ0
 a9Km40hqRmQ8CjsVjcu4X/luViaRc4Q9Ed4hdCPxuW+rUaMZqNMueRSwJQ629/tEgD/s
 8ha4lN7wO09ZpkSiom80HP+Jwzli1/9Pl7obEsvF+dIw7sXsSpj0I/iEVcm0jbSdCIE3
 dXYGYmEo2KBxZD/JR9xM9bGwcuI23e113S6aiqiD3s9DRu/lmt7SS3xq7qFXrSnpoGXl
 gHNA==
X-Gm-Message-State: AOAM533m06SjkDmR1y9RBA4qKCshKQUv1HV3JirHClWWcEcjFVqJrAoj
 ENbvBeli3PrAmBt/KHCwNXfIecI1RNiinQ==
X-Google-Smtp-Source: ABdhPJxft95Db4duSZnkqZRvIvIGWRS28fe7vPwCWhin+joCx0ghLFFqA8z/4UZV3SbFq9h9T9LlEA==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id
 nd4-20020a170907628400b006e0f895015amr6314594ejc.713.1650028806507; 
 Fri, 15 Apr 2022 06:20:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/26] qcow2: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:48 +0200
Message-Id: <20220415131900.793161-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-cluster.c  | 18 +++++++++---------
 block/qcow2-refcount.c |  2 +-
 block/qcow2.c          |  4 ++--
 block/qcow2.h          | 14 +++++++-------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 20a16ba6ee..37fc7b905a 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -884,7 +884,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     return 0;
 }
 
-static int perform_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn perform_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2COWRegion *start = &m->cow_start;
@@ -1024,7 +1024,7 @@ fail:
     return ret;
 }
 
-int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
+int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     int i, j = 0, l2_index, ret;
@@ -1397,8 +1397,8 @@ static int count_single_write_clusters(BlockDriverState *bs, int nb_clusters,
  *           information on cluster allocation may be invalid now. The caller
  *           must start over anyway, so consider *cur_bytes undefined.
  */
-static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
-    uint64_t *cur_bytes, QCowL2Meta **m)
+static int coroutine_fn handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
+                                            uint64_t *cur_bytes, QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *old_alloc;
@@ -1772,9 +1772,9 @@ out:
  *
  * Return 0 on success and -errno in error cases
  */
-int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
-                            unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m)
+int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
+                                         unsigned int *bytes, uint64_t *host_offset,
+                                         QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t start, remaining;
@@ -2105,8 +2105,8 @@ out:
     return ret;
 }
 
-int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, int flags)
+int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                                          uint64_t bytes, int flags)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t end_offset = offset + bytes;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b6f90b2702..ef4cbaedf2 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3561,7 +3561,7 @@ int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size)
     return -EIO;
 }
 
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs)
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t i, end_cluster, cluster_count = 0, threshold;
diff --git a/block/qcow2.c b/block/qcow2.c
index b5c47931ef..d1c35cd290 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2434,7 +2434,7 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
  * Return 1 if the COW regions read as zeroes, 0 if not, < 0 on error.
  * Note that returning 0 does not guarantee non-zero data.
  */
-static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     /*
      * This check is designed for optimization shortcut so it must be
@@ -2452,7 +2452,7 @@ static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
                                 m->cow_end.nb_bytes);
 }
 
-static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
+static int coroutine_fn handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *m;
diff --git a/block/qcow2.h b/block/qcow2.h
index c8d9e8ea79..36495d9051 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -895,7 +895,7 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 void *cb_opaque, Error **errp);
 int qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
@@ -908,9 +908,9 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
                           QCow2SubclusterType *subcluster_type);
-int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
-                            unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m);
+int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
+                                         unsigned int *bytes, uint64_t *host_offset,
+                                         QCowL2Meta **m);
 int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
@@ -918,13 +918,13 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
                                      uint64_t *coffset, int *csize);
 
-int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
+int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
                           bool full_discard);
-int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, int flags);
+int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                                          uint64_t bytes, int flags);
 
 int qcow2_expand_zero_clusters(BlockDriverState *bs,
                                BlockDriverAmendStatusCB *status_cb,
-- 
2.35.1



