Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9F75723A9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:52:38 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKzt-0006iQ-QU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI0-0003i9-EM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHt-0006hd-Be
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Rg+cl6rqpqkq7m3jN9FF4UQnlXUHMzsZGj7nk+iz84=;
 b=O3J+PiYZ4CZIsuzgVAOPWZSU6NKnxDgzpW2wUt2qBwhgJkusFL31oVv5CK9n+lfkpC/rQT
 3eSBTymCFgyHoy6sTmmQq1FILlV2beja6eANx9QmpPwm7SeyZBugCwu9jqxHXbDE3Ve457
 0j3fnw7I9fNqGdbPq+Osos/Mg+DNl50=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-Oxc1i_g-OBm7MlWIdhRzcQ-1; Tue, 12 Jul 2022 14:07:03 -0400
X-MC-Unique: Oxc1i_g-OBm7MlWIdhRzcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B981729ABA26;
 Tue, 12 Jul 2022 18:07:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71B572026D64;
 Tue, 12 Jul 2022 18:07:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 25/35] block: Implement blk_pdiscard() using
 generated_co_wrapper
Date: Tue, 12 Jul 2022 20:06:07 +0200
Message-Id: <20220712180617.1362407-26-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-14-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h                |  3 ---
 include/sysemu/block-backend-io.h |  3 ++-
 block/block-backend.c             | 12 ------------
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 94fd283f62..2693ecabfb 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -110,9 +110,6 @@ nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int generated_co_wrapper
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
 
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 346ca47fed..5a12a1f74f 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -159,6 +159,8 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
 }
 
+int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
@@ -172,7 +174,6 @@ int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
                                                const void *buf);
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                            int64_t bytes,
                                            BdrvRequestFlags flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index 85661d1823..71585c0c0a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1711,18 +1711,6 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
-{
-    int ret;
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_pdiscard(blk, offset, bytes);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
-- 
2.35.3


