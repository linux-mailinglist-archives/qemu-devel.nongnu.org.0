Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94F572366
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:48:24 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKvn-0003I4-AW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHt-0003bn-Qc
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHl-0006f6-N0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQxumGBKDm6obRJBMI/sAXcBWT2aFoZCHS/b3aiurDg=;
 b=On6uOahx9dIlKoYJMAoqhuD83nCpjScW0OjB3l0j350Y5XOqSgbm4wOS2rX8Zfgoszb2Kc
 /pd89hF95uuADUz+gbgapF/NPYCvcGQnHml6EGmJbzRzy9FtwK9GdAFF80zUT7Fo+zFN6L
 KGYSyQF0yHGyspS8LkKflQdJrWMtGAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-0t6mqZThMn6dkDChKpk3uQ-1; Tue, 12 Jul 2022 14:06:51 -0400
X-MC-Unique: 0t6mqZThMn6dkDChKpk3uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C9168037AF;
 Tue, 12 Jul 2022 18:06:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB7F1121314;
 Tue, 12 Jul 2022 18:06:50 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 18/35] block: Implement blk_{pread,
 pwrite}() using generated_co_wrapper
Date: Tue, 12 Jul 2022 20:06:00 +0200
Message-Id: <20220712180617.1362407-19-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Faria <afaria@redhat.com>

We need to add include/sysemu/block-backend-io.h to the inputs of the
block-gen.c target defined in block/meson.build.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-7-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h                |  4 ----
 include/sysemu/block-backend-io.h | 10 ++++++----
 block/block-backend.c             | 23 -----------------------
 block/meson.build                 |  1 +
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 3f41238b33..443ef2f2e6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -112,10 +112,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-              QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index b048476a47..750089fc9b 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -101,10 +101,12 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
+                                   int64_t bytes, void *buf,
+                                   BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, const void *buf,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index 3203b25695..4d6c18bc39 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1563,29 +1563,6 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags)
-{
-    int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
-}
-
 int64_t blk_getlength(BlockBackend *blk)
 {
     IO_CODE();
diff --git a/block/meson.build b/block/meson.build
index 0b2a60c99b..60bc305597 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -136,6 +136,7 @@ block_gen_c = custom_target('block-gen.c',
                             input: files(
                                       '../include/block/block-io.h',
                                       '../include/block/block-global-state.h',
+                                      '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
                                       ),
                             command: [wrapper_py, '@OUTPUT@', '@INPUT@'])
-- 
2.35.3


