Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0F638B54
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYs0-0006kE-T8; Fri, 25 Nov 2022 08:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrc-0006Rj-BR
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrX-0005Bm-J9
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669383324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MegTA9Glc87FAKqb9YJl0uFOzu0+Mn/9y75BuZRgzc=;
 b=HI9n98Wo+F7kfhmWQ5aOk3Y8mVSi6hVbsGxlnVs5+PuuZyo6opHV1lIqgfsv61b/BxKm8Y
 +eKSQwHi9Q2zPvW1Q8efMLrXUq32fs9/Y94LrJuI+PdnBWo09OJfisrs8D+4bqwtwrMPy6
 90ljV6KwnsvWuVrtUpyWa98yS2apkQU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-g1wcu9-PPqONAE-_G0YOkw-1; Fri, 25 Nov 2022 08:35:22 -0500
X-MC-Unique: g1wcu9-PPqONAE-_G0YOkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE667101A528;
 Fri, 25 Nov 2022 13:35:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D9772166B46;
 Fri, 25 Nov 2022 13:35:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v6 01/14] block-io: introduce coroutine_fn duplicates for
 bdrv_common_block_status_above callers
Date: Fri, 25 Nov 2022 08:35:05 -0500
Message-Id: <20221125133518.418328-2-eesposit@redhat.com>
In-Reply-To: <20221125133518.418328-1-eesposit@redhat.com>
References: <20221125133518.418328-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

bdrv_common_block_status_above() is a g_c_w, and it is being called by
many "wrapper" functions like bdrv_is_allocated(),
bdrv_is_allocated_above() and bdrv_block_status_above().

Because we want to eventually split the coroutine from non-coroutine
case in g_c_w, create duplicate wrappers that take care of directly
calling the same coroutine functions called in the g_c_w.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c               | 58 +++++++++++++++++++++++++++++++++++++---
 include/block/block-io.h | 15 +++++++++++
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index 38e57d1f67..f4444b7777 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2533,6 +2533,17 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     return ret;
 }
 
+int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
+                                            BlockDriverState *base,
+                                            int64_t offset, int64_t bytes,
+                                            int64_t *pnum, int64_t *map,
+                                            BlockDriverState **file)
+{
+    IO_CODE();
+    return bdrv_co_common_block_status_above(bs, base, false, true, offset,
+                                             bytes, pnum, map, file, NULL);
+}
+
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file)
@@ -2578,6 +2589,22 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
     return (pnum == bytes) && (ret & BDRV_BLOCK_ZERO);
 }
 
+int coroutine_fn bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, int64_t *pnum)
+{
+    int ret;
+    int64_t dummy;
+    IO_CODE();
+
+    ret = bdrv_co_common_block_status_above(bs, bs, true, false, offset,
+                                            bytes, pnum ? pnum : &dummy, NULL,
+                                            NULL, NULL);
+    if (ret < 0) {
+        return ret;
+    }
+    return !!(ret & BDRV_BLOCK_ALLOCATED);
+}
+
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum)
 {
@@ -2594,6 +2621,29 @@ int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return !!(ret & BDRV_BLOCK_ALLOCATED);
 }
 
+/* See bdrv_is_allocated_above for documentation */
+int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
+                                            BlockDriverState *base,
+                                            bool include_base, int64_t offset,
+                                            int64_t bytes, int64_t *pnum)
+{
+    int depth;
+    int ret;
+    IO_CODE();
+
+    ret = bdrv_co_common_block_status_above(top, base, include_base, false,
+                                            offset, bytes, pnum, NULL, NULL,
+                                            &depth);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (ret & BDRV_BLOCK_ALLOCATED) {
+        return depth;
+    }
+    return 0;
+}
+
 /*
  * Given an image chain: ... -> [BASE] -> [INTER1] -> [INTER2] -> [TOP]
  *
@@ -2617,10 +2667,12 @@ int bdrv_is_allocated_above(BlockDriverState *top,
                             int64_t bytes, int64_t *pnum)
 {
     int depth;
-    int ret = bdrv_common_block_status_above(top, base, include_base, false,
-                                             offset, bytes, pnum, NULL, NULL,
-                                             &depth);
+    int ret;
     IO_CODE();
+
+    ret = bdrv_common_block_status_above(top, base, include_base, false,
+                                         offset, bytes, pnum, NULL, NULL,
+                                         &depth);
     if (ret < 0) {
         return ret;
     }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 92aaa7c1e9..72919254cd 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -94,14 +94,29 @@ bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
                       int64_t bytes, int64_t *pnum, int64_t *map,
                       BlockDriverState **file);
+
+int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
+                                            BlockDriverState *base,
+                                            int64_t offset, int64_t bytes,
+                                            int64_t *pnum, int64_t *map,
+                                            BlockDriverState **file);
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file);
+
+int coroutine_fn bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, int64_t *pnum);
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum);
+
+int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
+                                            BlockDriverState *base,
+                                            bool include_base, int64_t offset,
+                                            int64_t bytes, int64_t *pnum);
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                             bool include_base, int64_t offset, int64_t bytes,
                             int64_t *pnum);
+
 int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
                                       int64_t bytes);
 
-- 
2.31.1


