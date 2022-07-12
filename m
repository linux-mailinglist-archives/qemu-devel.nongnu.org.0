Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF60572279
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:22:45 +0200 (CEST)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKWy-0002Qu-7y
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHh-0003Q7-M5
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHc-0006cI-Rv
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2MqlcrH8oCsn3jX2oUvHRexUsP+yE7iMYGGoBc7IsE=;
 b=a1MBv/BbUcd1IJbfEMma62wAi8C1pLvGotFj4hmlamZuhTtgHdokJX4fGZCy2MH9gjrDPM
 nfaYcaBBgfzrCEX9EG3v+TSmjcp6kaLA7htOSZhnDGdgb21qq/8S0la6AL8vT3ZygojAkK
 mWS8myb4ENvMFDdNWtDzItDR2beEh+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-vU7vcuGuO_WvKAa7xWoPvQ-1; Tue, 12 Jul 2022 14:06:48 -0400
X-MC-Unique: vU7vcuGuO_WvKAa7xWoPvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2021F8037A9;
 Tue, 12 Jul 2022 18:06:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D07B52026D64;
 Tue, 12 Jul 2022 18:06:47 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 16/35] block: Make 'bytes' param of blk_{pread,
 pwrite}() an int64_t
Date: Tue, 12 Jul 2022 20:05:58 +0200
Message-Id: <20220712180617.1362407-17-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

For consistency with other I/O functions, and in preparation to
implement them using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-5-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h | 6 +++---
 block/block-backend.c             | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index e2e7ab9e6c..8bf1296105 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -101,10 +101,10 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
+int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
               BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
-               BdrvRequestFlags flags);
+int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+               const void *buf, BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index 5fb3890bab..3203b25695 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1563,7 +1563,7 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
+int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
               BdrvRequestFlags flags)
 {
     int ret;
@@ -1577,8 +1577,8 @@ int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
     return ret;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
-               BdrvRequestFlags flags)
+int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+               const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
-- 
2.35.3


