Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D86DE2A0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:35:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHt9-0004si-AX; Tue, 11 Apr 2023 13:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmHsx-0004pk-Ae
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmHsv-00037F-MJ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681234465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rywU8qKijEbleewWpvG8Ak/csx8RfR2RxvlSfew+ppM=;
 b=NrXOj0oDb2M0X8/lt3kic1Q7UA+l8d953Sg6VUpzoHI16kb/hiGZJXp9ECjnL6rF+lxZ08
 kaZvIWKzkRxEDWWZVGJ1EuODZHg5KYjSwCP9Ohas3O/Hwuxhz8d7Ie1srBpCBcaYaPS7bR
 h9AP1W/hQt9Y7EPcfnl+WoeRHIdG0W4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-xiW81hDEMRKGuRnH1uks2w-1; Tue, 11 Apr 2023 13:34:21 -0400
X-MC-Unique: xiW81hDEMRKGuRnH1uks2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778BF3C0F666;
 Tue, 11 Apr 2023 17:34:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1276C492C13;
 Tue, 11 Apr 2023 17:34:20 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 1/4] util/iov: Make qiov_slice() public
Date: Tue, 11 Apr 2023 19:34:15 +0200
Message-Id: <20230411173418.19549-2-hreitz@redhat.com>
In-Reply-To: <20230411173418.19549-1-hreitz@redhat.com>
References: <20230411173418.19549-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
requests, and having access to qiov_slice() is useful for this.  As a
public function, it is renamed to qemu_iovec_slice().

(We will need to count the number of I/O vector elements of a slice
there, and then later process this slice.  Without qiov_slice(), we
would need to call qemu_iovec_subvec_niov(), and all further
IOV-processing functions may need to skip prefixing elements to
accomodate for a qiov_offset.  Because qemu_iovec_subvec_niov()
internally calls qiov_slice(), we can just have the block/io.c code call
qiov_slice() itself, thus get the number of elements, and also create an
iovec array with the superfluous prefixing elements stripped, so the
following processing functions no longer need to skip them.)

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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


