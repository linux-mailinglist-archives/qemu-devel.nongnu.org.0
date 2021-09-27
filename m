Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740AC41A195
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 23:58:11 +0200 (CEST)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUydV-0005E9-Vp
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 17:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybU-0002YH-O4
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybR-0002nK-Pv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnaTtIFlu8h3fzy0uvKMYWkFyYzCckWHm+jXBjvCJiA=;
 b=awHQPG2V3jDloSdXjheAZRfAYuVRrSepXo5mDbg766aBVtpw1gtbjF+5J1sX1lg0E3+HH/
 bDd4WtXg7riZ/3D1A6mURpdE7CYb3AlgrxdSR90D4ojO1UFogsj3YaWeqRDJJM+VNJiw/k
 fRwywC/izaoEE3jPPsxP6s4J1dvApKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375--Q6iT1euM3uVxt8eraOJkw-1; Mon, 27 Sep 2021 17:55:59 -0400
X-MC-Unique: -Q6iT1euM3uVxt8eraOJkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93227108468A;
 Mon, 27 Sep 2021 21:55:58 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07D515D9D5;
 Mon, 27 Sep 2021 21:55:57 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] qcow2: check request on vmstate save/load path
Date: Mon, 27 Sep 2021 16:55:28 -0500
Message-Id: <20210927215545.3930309-4-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We modify the request by adding an offset to vmstate. Let's check the
modified request. It will help us to safely move .bdrv_co_preadv_part
and .bdrv_co_pwritev_part to int64_t type of offset and bytes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903102807.27127-3-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  3 +++
 block/io.c                |  6 +++---
 block/qcow2.c             | 43 +++++++++++++++++++++++++++++++++------
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5451f89b8df9..ed60495938a6 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -94,6 +94,9 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;

+int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            Error **errp);
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);

 struct BlockDriver {
diff --git a/block/io.c b/block/io.c
index 58602f84dbf0..a4f124f75577 100644
--- a/block/io.c
+++ b/block/io.c
@@ -956,9 +956,9 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
     return waited;
 }

-static int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
-                                   QEMUIOVector *qiov, size_t qiov_offset,
-                                   Error **errp)
+int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            Error **errp)
 {
     /*
      * Check generic offset/bytes correctness
diff --git a/block/qcow2.c b/block/qcow2.c
index 02f9f3e63679..1c3cf7f91d86 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5227,24 +5227,55 @@ static int qcow2_has_zero_init(BlockDriverState *bs)
     }
 }

+/*
+ * Check the request to vmstate. On success return
+ *      qcow2_vm_state_offset(bs) + @pos
+ */
+static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t vmstate_offset = qcow2_vm_state_offset(s);
+    int ret;
+
+    /* Incoming requests must be OK */
+    bdrv_check_qiov_request(pos, qiov->size, qiov, 0, &error_abort);
+
+    if (INT64_MAX - pos < vmstate_offset) {
+        return -EIO;
+    }
+
+    pos += vmstate_offset;
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return pos;
+}
+
 static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                               int64_t pos)
 {
-    BDRVQcow2State *s = bs->opaque;
+    int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
+    if (offset < 0) {
+        return offset;
+    }

     BLKDBG_EVENT(bs->file, BLKDBG_VMSTATE_SAVE);
-    return bs->drv->bdrv_co_pwritev_part(bs, qcow2_vm_state_offset(s) + pos,
-                                         qiov->size, qiov, 0, 0);
+    return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }

 static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                               int64_t pos)
 {
-    BDRVQcow2State *s = bs->opaque;
+    int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
+    if (offset < 0) {
+        return offset;
+    }

     BLKDBG_EVENT(bs->file, BLKDBG_VMSTATE_LOAD);
-    return bs->drv->bdrv_co_preadv_part(bs, qcow2_vm_state_offset(s) + pos,
-                                        qiov->size, qiov, 0, 0);
+    return bs->drv->bdrv_co_preadv_part(bs, offset, qiov->size, qiov, 0, 0);
 }

 /*
-- 
2.31.1


