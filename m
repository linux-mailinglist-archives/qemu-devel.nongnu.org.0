Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129BD57223A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:11:12 +0200 (CEST)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKLn-0001SK-62
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHL-00036P-21
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHJ-0006U1-Bx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reKIuaNtoVxSL+i4bkwxJD8IekVIsIck56hjvPusOb8=;
 b=EVB0apcH/KLfGHGmQb8nklb1yneSu8fPn16ZXztWtuPRqtEF8cB61YKjhP8J9jFGX/5Dde
 OqD7D+EBFSMGYL2EHZzqHbLax6QyLkmTe5wxsbQhZxwjRHdGeRE+zIS2QZ5ElrenF/XT4q
 Rn324B8XEB1XhN6g54fqJbqpgZoqtwg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-CqFW0koRPZymO6RRMnNxJg-1; Tue, 12 Jul 2022 14:06:31 -0400
X-MC-Unique: CqFW0koRPZymO6RRMnNxJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2353E3C02B6F;
 Tue, 12 Jul 2022 18:06:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3A2140CFD0A;
 Tue, 12 Jul 2022 18:06:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 06/35] block: Make 'bytes' param of bdrv_co_{pread, pwrite,
 preadv, pwritev}() an int64_t
Date: Tue, 12 Jul 2022 20:05:48 +0200
Message-Id: <20220712180617.1362407-7-hreitz@redhat.com>
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

For consistency with other I/O functions, and in preparation to
implement bdrv_{pread,pwrite}() using generated_co_wrapper.

unsigned int fits in int64_t, so all callers remain correct.

bdrv_check_request32() is called further down the stack and causes -EIO
to be returned if 'bytes' is negative or greater than
BDRV_REQUEST_MAX_BYTES, which in turns never exceeds SIZE_MAX.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Message-Id: <20220609152744.3891847-7-afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
index 5474293c4f..91cdd61692 100644
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


