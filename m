Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD2572332
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:44:40 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKsB-0007Gr-Bj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHt-0003be-QP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHl-0006ev-K4
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KQ1rzbvBPQBovImT3xNSaW1I8vfmtu1zrubIVV01u0=;
 b=gNul7SCquUKqvjsSO+XsKN/LlP7XF0bSEhnTClNiCgNUoxArbjQoiGn4dinnrPY7ig8U/N
 Gc7+lPENq4vjbUP+PCtrGvwqAwXZDOK81d8BKzm3NRWuIOKgvEF2XuN5G9gJPmCWgSuMRn
 24Y5IqeoD1UCES8tEoI/L+OZ+5aQ8Q4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-d0xDP-hqNqqgj2v1UruDxw-1; Tue, 12 Jul 2022 14:06:58 -0400
X-MC-Unique: d0xDP-hqNqqgj2v1UruDxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DED4D3C02B6F;
 Tue, 12 Jul 2022 18:06:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 980F740CF8E4;
 Tue, 12 Jul 2022 18:06:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 22/35] block: Change blk_pwrite_compressed() param order
Date: Tue, 12 Jul 2022 20:06:04 +0200
Message-Id: <20220712180617.1362407-23-hreitz@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Swap 'buf' and 'bytes' around for consistency with other I/O functions.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-11-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h | 4 ++--
 block/block-backend.c             | 4 ++--
 qemu-img.c                        | 2 +-
 qemu-io-cmds.c                    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 93a15071c4..695b793a72 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -167,8 +167,8 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes);
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
+                          const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index c75942b773..60fb7eb3f2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2314,8 +2314,8 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes)
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
+                          const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
diff --git a/qemu-img.c b/qemu-img.c
index df607a2a2e..7d4b33b3da 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2114,7 +2114,7 @@ static int convert_do_copy(ImgConvertState *s)
 
     if (s->compressed && !s->ret) {
         /* signal EOF to align */
-        ret = blk_pwrite_compressed(s->target, 0, NULL, 0);
+        ret = blk_pwrite_compressed(s->target, 0, 0, NULL);
         if (ret < 0) {
             return ret;
         }
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index c8cbaed0cd..952dc940f1 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -631,7 +631,7 @@ static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pwrite_compressed(blk, offset, buf, bytes);
+    ret = blk_pwrite_compressed(blk, offset, bytes, buf);
     if (ret < 0) {
         return ret;
     }
-- 
2.35.3


