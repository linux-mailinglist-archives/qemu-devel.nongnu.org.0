Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8453854523F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:45:45 +0200 (CEST)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLI0-0003aF-In
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK52-0008EM-TI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK50-0000tc-B1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/6cm83sT/Sd7jO/HJV0ZsENGnOydcF8BraJHY781uI=;
 b=FBmszSsbjlOk2GD0ZbD0qaZZgQgay6I6b/CKfDiVhnUQkSGxJwVs52f5y1kFwZzAngFfWS
 n7F44/O2UFtXQyzi7j1pYOqFsVi1MY8NST0wOJ24+nOIiDsCnhw9oRpQRLkQug74v4dpLO
 qwKXU63Bs0y0fuEaTmACIgNPZ8pCv4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-9bO5idf8MUObnDvbioVwWQ-1; Thu, 09 Jun 2022 11:28:09 -0400
X-MC-Unique: 9bO5idf8MUObnDvbioVwWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C3BD804194;
 Thu,  9 Jun 2022 15:28:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 914EC492C3B;
 Thu,  9 Jun 2022 15:28:06 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH v5 06/10] block: Make 'bytes' param of bdrv_co_{pread, pwrite,
 preadv, pwritev}() an int64_t
Date: Thu,  9 Jun 2022 16:27:40 +0100
Message-Id: <20220609152744.3891847-7-afaria@redhat.com>
In-Reply-To: <20220609152744.3891847-1-afaria@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

For consistency with other I/O functions, and in preparation to
implement bdrv_{pread,pwrite}() using generated_co_wrapper.

unsigned int fits in int64_t, so all callers remain correct.

bdrv_check_request32() is called further down the stack and causes -EIO
to be returned if 'bytes' is negative or greater than
BDRV_REQUEST_MAX_BYTES, which in turns never exceeds SIZE_MAX.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/coroutines.h           | 4 ++--
 include/block/block_int-io.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 830ecaa733..3f41238b33 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -91,11 +91,11 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  */
 
 int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
+bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
             QEMUIOVector *qiov, BdrvRequestFlags flags);
 
 int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
+bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
              QEMUIOVector *qiov, BdrvRequestFlags flags);
 
 int generated_co_wrapper
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index d4d3bed783..d1a6970dc6 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -56,7 +56,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 
 static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
-    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
@@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
 }
 
 static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
-    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
-- 
2.35.3


