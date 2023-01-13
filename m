Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0166A445
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQt0-00005f-Uh; Fri, 13 Jan 2023 15:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsz-00004z-1h
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsx-0006CC-GD
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbcgUqHjO8wSWqgg1IeQSX7j5Xvk//AwBrcRYThdscQ=;
 b=NeXc4k1XCTODNz6U/AYMpCXmCmqVQ7SJutV1MOzmMVcPuVWb/L9tOech8eu/R2WroSpVtG
 hgB3uHV/5xAP4RfG+TWinNt/rLkwys3866bSGLAYXwfh6Wyb0gD3cVSJmt+NelR7o3f7pu
 IKX/xG0GgG3dt474hFwXc1tBvMQPwZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-n3MI1v2EPSeq-ir5CrO1JA-1; Fri, 13 Jan 2023 15:42:43 -0500
X-MC-Unique: n3MI1v2EPSeq-ir5CrO1JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAD55101A52E;
 Fri, 13 Jan 2023 20:42:42 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5E62026D68;
 Fri, 13 Jan 2023 20:42:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 08/14] block: use bdrv_co_refresh_total_sectors when
 possible
Date: Fri, 13 Jan 2023 21:42:06 +0100
Message-Id: <20230113204212.359076-9-kwolf@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
References: <20230113204212.359076-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

In some places we are sure we are always running in a
coroutine, therefore it's useless to call the generated_co_wrapper,
instead call directly the _co_ function.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 6 +++---
 block/io.c            | 4 ++--
 block/preallocate.c   | 6 +++---
 block/qed.c           | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 37b51f409f..fc08400544 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1235,8 +1235,8 @@ void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
     blk->disable_request_queuing = disable;
 }
 
-static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
-                                  int64_t bytes)
+static coroutine_fn int blk_check_byte_request(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes)
 {
     int64_t len;
 
@@ -1253,7 +1253,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
     }
 
     if (!blk->allow_write_beyond_eof) {
-        len = bdrv_getlength(blk_bs(blk));
+        len = bdrv_co_getlength(blk_bs(blk));
         if (len < 0) {
             return len;
         }
diff --git a/block/io.c b/block/io.c
index e5e51563a5..fdc5ba9fb6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3443,7 +3443,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes && backing) {
         int64_t backing_len;
 
-        backing_len = bdrv_getlength(backing->bs);
+        backing_len = bdrv_co_getlength(backing->bs);
         if (backing_len < 0) {
             ret = backing_len;
             error_setg_errno(errp, -ret, "Could not get backing file size");
@@ -3473,7 +3473,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         goto out;
     }
 
-    ret = bdrv_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
+    ret = bdrv_co_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
     } else {
diff --git a/block/preallocate.c b/block/preallocate.c
index 94aa824e09..5815d7a78b 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -286,7 +286,7 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
     }
 
     if (s->data_end < 0) {
-        s->data_end = bdrv_getlength(bs->file->bs);
+        s->data_end = bdrv_co_getlength(bs->file->bs);
         if (s->data_end < 0) {
             return false;
         }
@@ -308,7 +308,7 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
     }
 
     if (s->file_end < 0) {
-        s->file_end = bdrv_getlength(bs->file->bs);
+        s->file_end = bdrv_co_getlength(bs->file->bs);
         if (s->file_end < 0) {
             return false;
         }
@@ -380,7 +380,7 @@ preallocate_co_truncate(BlockDriverState *bs, int64_t offset,
 
     if (s->data_end >= 0 && offset > s->data_end) {
         if (s->file_end < 0) {
-            s->file_end = bdrv_getlength(bs->file->bs);
+            s->file_end = bdrv_co_getlength(bs->file->bs);
             if (s->file_end < 0) {
                 error_setg(errp, "failed to get file length");
                 return s->file_end;
diff --git a/block/qed.c b/block/qed.c
index c8f9045b72..16bf0cb080 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -424,7 +424,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
     }
 
     /* Round down file size to the last cluster */
-    file_size = bdrv_getlength(bs->file->bs);
+    file_size = bdrv_co_getlength(bs->file->bs);
     if (file_size < 0) {
         error_setg(errp, "Failed to get file length");
         return file_size;
-- 
2.38.1


