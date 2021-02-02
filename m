Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9530CF65
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:53:19 +0100 (CET)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74Xs-00087h-Mg
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qa-0007L4-Q5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QX-0005p9-A1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GkowvY329VFoMBx0/MKvr7dIKV0NAnqzDB75bORw98=;
 b=jVIWDe3vTA6pPoYRKyqc3YBFpSZ+AxKB5fa/prS//3CVmf7TTk8CXaeiMtyL7QBcZ2kOTn
 bK1Nsd41MEzp4DiL0O2mY6PN7knSoV2vLKu+Ad9ukQUJRefUi+7/MomPeNt/aIiGHLWATb
 eCmNazL5JZb8VmWP9gReaRagbk2I6Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Tqli5v7rMkinGCp627ymVg-1; Tue, 02 Feb 2021 17:45:38 -0500
X-MC-Unique: Tqli5v7rMkinGCp627ymVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52AE8100C612;
 Tue,  2 Feb 2021 22:45:37 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B967110016F9;
 Tue,  2 Feb 2021 22:45:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] util/iov: make qemu_iovec_init_extended() honest
Date: Tue,  2 Feb 2021 16:45:12 -0600
Message-Id: <20210202224529.642055-4-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Actually, we can't extend the io vector in all cases. Handle possible
MAX_IOV and size_t overflows.

For now add assertion to callers (actually they rely on success anyway)
and fix them in the following patch.

Add also some additional good assertions to qemu_iovec_init_slice()
while being here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-3-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/iov.h |  2 +-
 block/io.c         | 10 +++++++---
 util/iov.c         | 25 +++++++++++++++++++++++--
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/include/qemu/iov.h b/include/qemu/iov.h
index b6b283a5e5c1..93307466809b 100644
--- a/include/qemu/iov.h
+++ b/include/qemu/iov.h
@@ -222,7 +222,7 @@ static inline void *qemu_iovec_buf(QEMUIOVector *qiov)

 void qemu_iovec_init(QEMUIOVector *qiov, int alloc_hint);
 void qemu_iovec_init_external(QEMUIOVector *qiov, struct iovec *iov, int niov);
-void qemu_iovec_init_extended(
+int qemu_iovec_init_extended(
         QEMUIOVector *qiov,
         void *head_buf, size_t head_len,
         QEMUIOVector *mid_qiov, size_t mid_offset, size_t mid_len,
diff --git a/block/io.c b/block/io.c
index 23abdae79468..ab953bd58f48 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1680,13 +1680,17 @@ static bool bdrv_pad_request(BlockDriverState *bs,
                              int64_t *offset, unsigned int *bytes,
                              BdrvRequestPadding *pad)
 {
+    int ret;
+
     if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
         return false;
     }

-    qemu_iovec_init_extended(&pad->local_qiov, pad->buf, pad->head,
-                             *qiov, *qiov_offset, *bytes,
-                             pad->buf + pad->buf_len - pad->tail, pad->tail);
+    ret = qemu_iovec_init_extended(&pad->local_qiov, pad->buf, pad->head,
+                                   *qiov, *qiov_offset, *bytes,
+                                   pad->buf + pad->buf_len - pad->tail,
+                                   pad->tail);
+    assert(ret == 0);
     *bytes += pad->head + pad->tail;
     *offset -= pad->head;
     *qiov = &pad->local_qiov;
diff --git a/util/iov.c b/util/iov.c
index f3a9e92a378f..58c7b3eeee5f 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -415,7 +415,7 @@ int qemu_iovec_subvec_niov(QEMUIOVector *qiov, size_t offset, size_t len)
  * Compile new iovec, combining @head_buf buffer, sub-qiov of @mid_qiov,
  * and @tail_buf buffer into new qiov.
  */
-void qemu_iovec_init_extended(
+int qemu_iovec_init_extended(
         QEMUIOVector *qiov,
         void *head_buf, size_t head_len,
         QEMUIOVector *mid_qiov, size_t mid_offset, size_t mid_len,
@@ -425,12 +425,24 @@ void qemu_iovec_init_extended(
     int total_niov, mid_niov = 0;
     struct iovec *p, *mid_iov = NULL;

+    assert(mid_qiov->niov <= IOV_MAX);
+
+    if (SIZE_MAX - head_len < mid_len ||
+        SIZE_MAX - head_len - mid_len < tail_len)
+    {
+        return -EINVAL;
+    }
+
     if (mid_len) {
         mid_iov = qiov_slice(mid_qiov, mid_offset, mid_len,
                              &mid_head, &mid_tail, &mid_niov);
     }

     total_niov = !!head_len + mid_niov + !!tail_len;
+    if (total_niov > IOV_MAX) {
+        return -EINVAL;
+    }
+
     if (total_niov == 1) {
         qemu_iovec_init_buf(qiov, NULL, 0);
         p = &qiov->local_iov;
@@ -459,6 +471,8 @@ void qemu_iovec_init_extended(
         p->iov_base = tail_buf;
         p->iov_len = tail_len;
     }
+
+    return 0;
 }

 /*
@@ -492,7 +506,14 @@ bool qemu_iovec_is_zero(QEMUIOVector *qiov, size_t offset, size_t bytes)
 void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
                            size_t offset, size_t len)
 {
-    qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
+    int ret;
+
+    assert(source->size >= len);
+    assert(source->size - len >= offset);
+
+    /* We shrink the request, so we can't overflow neither size_t nor MAX_IOV */
+    ret = qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
+    assert(ret == 0);
 }

 void qemu_iovec_destroy(QEMUIOVector *qiov)
-- 
2.30.0


