Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCE6BF025
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEDn-0003Fp-0n; Fri, 17 Mar 2023 13:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEDk-0003Ee-SL
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEDi-0001q0-8G
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679075425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXSDZczhbqycwTTz4MRBKi4g7FLVsqztQDeIOyD/jsk=;
 b=HobjXExNFxbxGi6R+IPwF/kmQdQNLMU3wp0FN2wd1URkth6QWIoaAJlNZlITs9t1IJ3diB
 Vvl//OvwQ2L2B9z64LaatorvGHOAvcjUzS8Wb9ICt2npHjJl81pnZY1mTa94I8pAAAni/r
 Axr479e58bZ8fCAQc4vulwDATPGHa4g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-Fbjc6r2XO6KOAzdg5Y6g-A-1; Fri, 17 Mar 2023 13:50:23 -0400
X-MC-Unique: Fbjc6r2XO6KOAzdg5Y6g-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EB423822DE7;
 Fri, 17 Mar 2023 17:50:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A792166B26;
 Fri, 17 Mar 2023 17:50:22 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 1/4] util/iov: Make qiov_slice() public
Date: Fri, 17 Mar 2023 18:50:16 +0100
Message-Id: <20230317175019.10857-2-hreitz@redhat.com>
In-Reply-To: <20230317175019.10857-1-hreitz@redhat.com>
References: <20230317175019.10857-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

We want to inline qemu_iovec_init_extended() in block/io.c for padding
requests, and having access to qiov_slice() is useful for this.

(We will need to count the number of I/O vector elements of a slice
there, and then later process this slice.  Without qiov_slice(), we
would need to call qemu_iovec_subvec_niov(), and all further
IOV-processing functions may need to skip prefixing elements to
accomodate for a qiov_offset.  Because qemu_iovec_subvec_niov()
internally calls qiov_slice(), we can just have the block/io.c code call
qiov_slice() itself, thus get the number of elements, and also create an
iovec array with the superfluous prefixing elements stripped, so the
following processing functions no longer need to skip them.)

Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
 include/qemu/iov.h |  3 +++
 util/iov.c         | 14 +++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/qemu/iov.h b/include/qemu/iov.h
index 9330746680..46fadfb27a 100644
--- a/include/qemu/iov.h
+++ b/include/qemu/iov.h
@@ -229,6 +229,9 @@ int qemu_iovec_init_extended(
         void *tail_buf, size_t tail_len);
 void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
                            size_t offset, size_t len);
+struct iovec *qemu_iovec_slice(QEMUIOVector *qiov,
+                               size_t offset, size_t len,
+                               size_t *head, size_t *tail, int *niov);
 int qemu_iovec_subvec_niov(QEMUIOVector *qiov, size_t offset, size_t len);
 void qemu_iovec_add(QEMUIOVector *qiov, void *base, size_t len);
 void qemu_iovec_concat(QEMUIOVector *dst,
diff --git a/util/iov.c b/util/iov.c
index b4be580022..65a70449da 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -378,15 +378,15 @@ static struct iovec *iov_skip_offset(struct iovec *iov, size_t offset,
 }
 
 /*
- * qiov_slice
+ * qemu_iovec_slice
  *
  * Find subarray of iovec's, containing requested range. @head would
  * be offset in first iov (returned by the function), @tail would be
  * count of extra bytes in last iovec (returned iov + @niov - 1).
  */
-static struct iovec *qiov_slice(QEMUIOVector *qiov,
-                                size_t offset, size_t len,
-                                size_t *head, size_t *tail, int *niov)
+struct iovec *qemu_iovec_slice(QEMUIOVector *qiov,
+                               size_t offset, size_t len,
+                               size_t *head, size_t *tail, int *niov)
 {
     struct iovec *iov, *end_iov;
 
@@ -411,7 +411,7 @@ int qemu_iovec_subvec_niov(QEMUIOVector *qiov, size_t offset, size_t len)
     size_t head, tail;
     int niov;
 
-    qiov_slice(qiov, offset, len, &head, &tail, &niov);
+    qemu_iovec_slice(qiov, offset, len, &head, &tail, &niov);
 
     return niov;
 }
@@ -439,8 +439,8 @@ int qemu_iovec_init_extended(
     }
 
     if (mid_len) {
-        mid_iov = qiov_slice(mid_qiov, mid_offset, mid_len,
-                             &mid_head, &mid_tail, &mid_niov);
+        mid_iov = qemu_iovec_slice(mid_qiov, mid_offset, mid_len,
+                                   &mid_head, &mid_tail, &mid_niov);
     }
 
     total_niov = !!head_len + mid_niov + !!tail_len;
-- 
2.39.1


