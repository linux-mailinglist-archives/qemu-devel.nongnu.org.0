Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885A6BF026
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEDq-0003ID-Vb; Fri, 17 Mar 2023 13:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEDo-0003HT-Ux
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEDn-0001sm-C1
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679075430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfyG5xA2cYgdiI5VTO99mBxf6pd4N6F8raBJRO/Vw+Q=;
 b=hS3WKg6sNf57N1vXwTz4iHA2aA8Yhl/mW6eRtGddjZnRnY9W57lX57mKtg7Cu2kh1ThIvA
 9Li5crGh0VcG1TG5uXIH19/sG/my6JvzuBoWgT6ayrvGbybOWHnU8qI7R9c6kxE3DcCiW9
 rFC8X7uCuP8u0IEO8BaFTbLsLGmTbiw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-pLi-0wJqNIitjd4fEfttWQ-1; Fri, 17 Mar 2023 13:50:26 -0400
X-MC-Unique: pLi-0wJqNIitjd4fEfttWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80692101A54F;
 Fri, 17 Mar 2023 17:50:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5ED40D1C8;
 Fri, 17 Mar 2023 17:50:26 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 3/4] util/iov: Remove qemu_iovec_init_extended()
Date: Fri, 17 Mar 2023 18:50:18 +0100
Message-Id: <20230317175019.10857-4-hreitz@redhat.com>
In-Reply-To: <20230317175019.10857-1-hreitz@redhat.com>
References: <20230317175019.10857-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

bdrv_pad_request() was the main user of qemu_iovec_init_extended().
HEAD^ has removed that use, so we can remove qemu_iovec_init_extended()
now.

The only remaining user is qemu_iovec_init_slice(), which can easily
inline the small part it really needs.

Note that qemu_iovec_init_extended() offered a memcpy() optimization to
initialize the new I/O vector.  qemu_iovec_concat_iov(), which is used
to replace its functionality, does not, but calls qemu_iovec_add() for
every single element.  If we decide this optimization was important, we
will need to re-implement it in qemu_iovec_concat_iov(), which might
also benefit its pre-existing users.

Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
 include/qemu/iov.h |  5 ---
 util/iov.c         | 79 +++++++---------------------------------------
 2 files changed, 11 insertions(+), 73 deletions(-)

diff --git a/include/qemu/iov.h b/include/qemu/iov.h
index 46fadfb27a..63a1c01965 100644
--- a/include/qemu/iov.h
+++ b/include/qemu/iov.h
@@ -222,11 +222,6 @@ static inline void *qemu_iovec_buf(QEMUIOVector *qiov)
 
 void qemu_iovec_init(QEMUIOVector *qiov, int alloc_hint);
 void qemu_iovec_init_external(QEMUIOVector *qiov, struct iovec *iov, int niov);
-int qemu_iovec_init_extended(
-        QEMUIOVector *qiov,
-        void *head_buf, size_t head_len,
-        QEMUIOVector *mid_qiov, size_t mid_offset, size_t mid_len,
-        void *tail_buf, size_t tail_len);
 void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
                            size_t offset, size_t len);
 struct iovec *qemu_iovec_slice(QEMUIOVector *qiov,
diff --git a/util/iov.c b/util/iov.c
index 65a70449da..866fb577f3 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -416,70 +416,6 @@ int qemu_iovec_subvec_niov(QEMUIOVector *qiov, size_t offset, size_t len)
     return niov;
 }
 
-/*
- * Compile new iovec, combining @head_buf buffer, sub-qiov of @mid_qiov,
- * and @tail_buf buffer into new qiov.
- */
-int qemu_iovec_init_extended(
-        QEMUIOVector *qiov,
-        void *head_buf, size_t head_len,
-        QEMUIOVector *mid_qiov, size_t mid_offset, size_t mid_len,
-        void *tail_buf, size_t tail_len)
-{
-    size_t mid_head, mid_tail;
-    int total_niov, mid_niov = 0;
-    struct iovec *p, *mid_iov = NULL;
-
-    assert(mid_qiov->niov <= IOV_MAX);
-
-    if (SIZE_MAX - head_len < mid_len ||
-        SIZE_MAX - head_len - mid_len < tail_len)
-    {
-        return -EINVAL;
-    }
-
-    if (mid_len) {
-        mid_iov = qemu_iovec_slice(mid_qiov, mid_offset, mid_len,
-                                   &mid_head, &mid_tail, &mid_niov);
-    }
-
-    total_niov = !!head_len + mid_niov + !!tail_len;
-    if (total_niov > IOV_MAX) {
-        return -EINVAL;
-    }
-
-    if (total_niov == 1) {
-        qemu_iovec_init_buf(qiov, NULL, 0);
-        p = &qiov->local_iov;
-    } else {
-        qiov->niov = qiov->nalloc = total_niov;
-        qiov->size = head_len + mid_len + tail_len;
-        p = qiov->iov = g_new(struct iovec, qiov->niov);
-    }
-
-    if (head_len) {
-        p->iov_base = head_buf;
-        p->iov_len = head_len;
-        p++;
-    }
-
-    assert(!mid_niov == !mid_len);
-    if (mid_niov) {
-        memcpy(p, mid_iov, mid_niov * sizeof(*p));
-        p[0].iov_base = (uint8_t *)p[0].iov_base + mid_head;
-        p[0].iov_len -= mid_head;
-        p[mid_niov - 1].iov_len -= mid_tail;
-        p += mid_niov;
-    }
-
-    if (tail_len) {
-        p->iov_base = tail_buf;
-        p->iov_len = tail_len;
-    }
-
-    return 0;
-}
-
 /*
  * Check if the contents of subrange of qiov data is all zeroes.
  */
@@ -511,14 +447,21 @@ bool qemu_iovec_is_zero(QEMUIOVector *qiov, size_t offset, size_t bytes)
 void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
                            size_t offset, size_t len)
 {
-    int ret;
+    struct iovec *slice_iov;
+    int slice_niov;
+    size_t slice_head, slice_tail;
 
     assert(source->size >= len);
     assert(source->size - len >= offset);
 
-    /* We shrink the request, so we can't overflow neither size_t nor MAX_IOV */
-    ret = qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
-    assert(ret == 0);
+    slice_iov = qemu_iovec_slice(source, offset, len,
+                                 &slice_head, &slice_tail, &slice_niov);
+    if (slice_niov == 1) {
+        qemu_iovec_init_buf(qiov, slice_iov[0].iov_base + slice_head, len);
+    } else {
+        qemu_iovec_init(qiov, slice_niov);
+        qemu_iovec_concat_iov(qiov, slice_iov, slice_niov, slice_head, len);
+    }
 }
 
 void qemu_iovec_destroy(QEMUIOVector *qiov)
-- 
2.39.1


