Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BCA61014F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:15:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7kT-0001Rg-RH; Thu, 27 Oct 2022 14:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gj-00023z-Pi
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gf-0002e2-OB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MHO/KOit381TXv5/LPp0fZlFdDvT2VyOX29FXYdACs=;
 b=NOGz3oqlhxQJVKI1JHIOsiigsyatE9v3wkSznjC04klQh9rN7+RNgGG2QWBnLVCoN5jY6j
 hFa64Z+kqiQoFmBU0DSAqMstnp6E2bKOimPE8L+MKm1t9nPAVS034YwZxYjQVXgl6FsmcP
 95XhvR0BlVFwc0jR+fgsi/jOaN7vQLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-47ufYuZDMk-4AhYrg4cNIA-1; Thu, 27 Oct 2022 14:33:03 -0400
X-MC-Unique: 47ufYuZDMk-4AhYrg4cNIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40EBF101A56D;
 Thu, 27 Oct 2022 18:33:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8141D1121320;
 Thu, 27 Oct 2022 18:33:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 53/58] qed: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:41 +0200
Message-Id: <20221027183146.463129-54-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-21-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qed-table.c |  2 +-
 block/qed.c       | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/qed-table.c b/block/qed-table.c
index 1cc844b1a5..aa203f2627 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -100,7 +100,7 @@ static int coroutine_fn qed_write_table(BDRVQEDState *s, uint64_t offset,
     }
 
     if (flush) {
-        ret = bdrv_flush(s->bs);
+        ret = bdrv_co_flush(s->bs);
         if (ret < 0) {
             goto out;
         }
diff --git a/block/qed.c b/block/qed.c
index 4627169348..d7f2c6fc7c 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -387,7 +387,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
     int64_t file_size;
     int ret;
 
-    ret = bdrv_pread(bs->file, 0, sizeof(le_header), &le_header, 0);
+    ret = bdrv_co_pread(bs->file, 0, sizeof(le_header), &le_header, 0);
     if (ret < 0) {
         error_setg(errp, "Failed to read QED header");
         return ret;
@@ -492,7 +492,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
         }
 
         /* From here on only known autoclear feature bits are valid */
-        bdrv_flush(bs->file->bs);
+        bdrv_co_flush(bs->file->bs);
     }
 
     s->l1_table = qed_alloc_table(s);
@@ -693,7 +693,7 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
      * The QED format associates file length with allocation status,
      * so a new file (which is empty) must have a length of 0.
      */
-    ret = blk_truncate(blk, 0, true, PREALLOC_MODE_OFF, 0, errp);
+    ret = blk_co_truncate(blk, 0, true, PREALLOC_MODE_OFF, 0, errp);
     if (ret < 0) {
         goto out;
     }
@@ -712,18 +712,18 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
     }
 
     qed_header_cpu_to_le(&header, &le_header);
-    ret = blk_pwrite(blk, 0, sizeof(le_header), &le_header, 0);
+    ret = blk_co_pwrite(blk, 0, sizeof(le_header), &le_header, 0);
     if (ret < 0) {
         goto out;
     }
-    ret = blk_pwrite(blk, sizeof(le_header), header.backing_filename_size,
+    ret = blk_co_pwrite(blk, sizeof(le_header), header.backing_filename_size,
                      qed_opts->backing_file, 0);
     if (ret < 0) {
         goto out;
     }
 
     l1_table = g_malloc0(l1_size);
-    ret = blk_pwrite(blk, header.l1_table_offset, l1_size, l1_table, 0);
+    ret = blk_co_pwrite(blk, header.l1_table_offset, l1_size, l1_table, 0);
     if (ret < 0) {
         goto out;
     }
-- 
2.37.3


