Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7930CF70
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:57:21 +0100 (CET)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74bo-00059q-3M
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qo-0007UL-7E
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qb-0005rs-Ez
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6Zlte8eEFxs+UdsUZ6FtYnJ4x+urWq0WeenjArs4NE=;
 b=ToIsPvJPg3+EtWKQ5bj2PkuhKOKlBBOXsCQ/kgakqaeYaN3aIODlrnCIDCEKpTmb3Tw5BT
 4Ce/v6lz9KUL5zeVqk2DYBFBQ0TQYO7QPN1lH3vHx+y2n00srFGpGKCCN2bBUE1J3mJgzP
 zyuWMwv+AUOXIrukGCj4lpG9ZjFWG1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-dOcX8XyjMS6_hV1idFfe4Q-1; Tue, 02 Feb 2021 17:45:42 -0500
X-MC-Unique: dOcX8XyjMS6_hV1idFfe4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7082C801AC1;
 Tue,  2 Feb 2021 22:45:41 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D73D210016F5;
 Tue,  2 Feb 2021 22:45:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] block/io: improve bdrv_check_request: check qiov too
Date: Tue,  2 Feb 2021 16:45:17 -0600
Message-Id: <20210202224529.642055-9-eblake@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Operations with qiov add more restrictions on bytes, let's cover it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-8-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 46 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/block/io.c b/block/io.c
index 39d943c33a39..b56db913da30 100644
--- a/block/io.c
+++ b/block/io.c
@@ -920,8 +920,14 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
     return waited;
 }

-int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
+static int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, size_t qiov_offset,
+                                   Error **errp)
 {
+    /*
+     * Check generic offset/bytes correctness
+     */
+
     if (offset < 0) {
         error_setg(errp, "offset is negative: %" PRIi64, offset);
         return -EIO;
@@ -951,12 +957,38 @@ int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
         return -EIO;
     }

+    if (!qiov) {
+        return 0;
+    }
+
+    /*
+     * Check qiov and qiov_offset
+     */
+
+    if (qiov_offset > qiov->size) {
+        error_setg(errp, "qiov_offset(%zu) overflow io vector size(%zu)",
+                   qiov_offset, qiov->size);
+        return -EIO;
+    }
+
+    if (bytes > qiov->size - qiov_offset) {
+        error_setg(errp, "bytes(%" PRIi64 ") + qiov_offset(%zu) overflow io "
+                   "vector size(%zu)", bytes, qiov_offset, qiov->size);
+        return -EIO;
+    }
+
     return 0;
 }

-static int bdrv_check_request32(int64_t offset, int64_t bytes)
+int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
 {
-    int ret = bdrv_check_request(offset, bytes, NULL);
+    return bdrv_check_qiov_request(offset, bytes, NULL, 0, errp);
+}
+
+static int bdrv_check_request32(int64_t offset, int64_t bytes,
+                                QEMUIOVector *qiov, size_t qiov_offset)
+{
+    int ret = bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -1736,7 +1768,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         return -ENOMEDIUM;
     }

-    ret = bdrv_check_request32(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
     if (ret < 0) {
         return ret;
     }
@@ -2157,7 +2189,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }

-    ret = bdrv_check_request32(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
     if (ret < 0) {
         return ret;
     }
@@ -3163,7 +3195,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_request32(dst_offset, bytes);
+    ret = bdrv_check_request32(dst_offset, bytes, NULL, 0);
     if (ret) {
         return ret;
     }
@@ -3174,7 +3206,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_request32(src_offset, bytes);
+    ret = bdrv_check_request32(src_offset, bytes, NULL, 0);
     if (ret) {
         return ret;
     }
-- 
2.30.0


