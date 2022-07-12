Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A15722AB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:32:34 +0200 (CEST)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKgT-00074c-Qq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI0-0003i8-CD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHv-0006in-DQ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ezzb39C2cZeibVQC5eCDOFjHJYc7iLh6FwM60W+F3ak=;
 b=fE6Rj6nelNFMXDI2wzORZa8N63/N6Pqh+c6baUNWno61XKE05B8Ns2N98OcES3yXX4euWw
 WNNyjio5u2mKXbV9GkShFftl4qQ4NMNTigQ1SBr7iH6JfU89ucFqjy5top1Gfx8wbKsA2c
 6ZkVCzT2lkoORySx4Htlc1yunQRhl+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-gFGx9M5qNpSyJNNlGydNhQ-1; Tue, 12 Jul 2022 14:07:06 -0400
X-MC-Unique: gFGx9M5qNpSyJNNlGydNhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0334D1019DE2;
 Tue, 12 Jul 2022 18:07:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B573040CFD0A;
 Tue, 12 Jul 2022 18:07:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 27/35] block: Add blk_co_ioctl()
Date: Tue, 12 Jul 2022 20:06:09 +0200
Message-Id: <20220712180617.1362407-28-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Also convert blk_ioctl() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-16-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h                | 6 ------
 include/sysemu/block-backend-io.h | 5 ++++-
 block/block-backend.c             | 7 ++++---
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 7e94b9fa83..d66551a277 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -68,9 +68,6 @@ blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags);
 
-int coroutine_fn
-blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-
 int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
@@ -107,7 +104,4 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6954c3bb8c..21f3a1b4f2 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -167,7 +167,10 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
 
-int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
+                                   void *buf);
+int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
+                              void *buf);
 
 int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
                                                int64_t offset, int64_t bytes,
diff --git a/block/block-backend.c b/block/block-backend.c
index 783a77cf6d..a31b9f1205 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1620,7 +1620,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     IO_CODE();
@@ -1634,13 +1634,14 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     return bdrv_co_ioctl(blk_bs(blk), req, buf);
 }
 
-int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
+int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
+                              void *buf)
 {
     int ret;
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    ret = blk_do_ioctl(blk, req, buf);
+    ret = blk_co_do_ioctl(blk, req, buf);
     blk_dec_in_flight(blk);
 
     return ret;
-- 
2.35.3


