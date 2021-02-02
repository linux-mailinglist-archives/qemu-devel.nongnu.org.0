Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5130CF5C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:52:35 +0100 (CET)
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74XC-0006pm-Hg
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qg-0007RV-9o
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QZ-0005qu-H3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqWHvmR7zt4akKIavLWnyHf62H+RiSh1qHIR05dGdrw=;
 b=VCR9H1PhtxS8pgxWCSQj5moFUYmlY8KxqqXW0VrHw1XahdhkDvXMscwGyDcE/tcQF3A7PW
 oiyYCSaW7t6Z5c173KaRIHgMBHE+Z5Z/h46w3Ty+DH+o8SC8PSbCn2UB7MRkkIAZnpWjbQ
 imxbMElkTAyOCVhFZXNUos318sSybpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-5OAYozZEMt2PeqnVwGgvFQ-1; Tue, 02 Feb 2021 17:45:37 -0500
X-MC-Unique: 5OAYozZEMt2PeqnVwGgvFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85AA4100C611;
 Tue,  2 Feb 2021 22:45:36 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22FE010016F5;
 Tue,  2 Feb 2021 22:45:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] block: refactor bdrv_check_request: add errp
Date: Tue,  2 Feb 2021 16:45:11 -0600
Message-Id: <20210202224529.642055-3-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

It's better to pass &error_abort than just assert that result is 0: on
crash, we'll immediately see the reason in the backtrace.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-2-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: fix iotest 206 fallout]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h    |  2 +-
 block/io.c                   | 29 ++++++++++++++++++++++-------
 block/file-posix.c           |  2 +-
 tests/test-write-threshold.c |  5 +++--
 tests/qemu-iotests/206.out   |  2 +-
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index d01fc2372028..5bbbf9ee0af9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -93,7 +93,7 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;

-int bdrv_check_request(int64_t offset, int64_t bytes);
+int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);

 struct BlockDriver {
     const char *format_name;
diff --git a/block/io.c b/block/io.c
index d203435a73d6..23abdae79468 100644
--- a/block/io.c
+++ b/block/io.c
@@ -920,17 +920,34 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
     return waited;
 }

-int bdrv_check_request(int64_t offset, int64_t bytes)
+int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
 {
-    if (offset < 0 || bytes < 0) {
+    if (offset < 0) {
+        error_setg(errp, "offset is negative: %" PRIi64, offset);
+        return -EIO;
+    }
+
+    if (bytes < 0) {
+        error_setg(errp, "bytes is negative: %" PRIi64, bytes);
         return -EIO;
     }

     if (bytes > BDRV_MAX_LENGTH) {
+        error_setg(errp, "bytes(%" PRIi64 ") exceeds maximum(%" PRIi64 ")",
+                   bytes, BDRV_MAX_LENGTH);
+        return -EIO;
+    }
+
+    if (offset > BDRV_MAX_LENGTH) {
+        error_setg(errp, "offset(%" PRIi64 ") exceeds maximum(%" PRIi64 ")",
+                   offset, BDRV_MAX_LENGTH);
         return -EIO;
     }

     if (offset > BDRV_MAX_LENGTH - bytes) {
+        error_setg(errp, "sum of offset(%" PRIi64 ") and bytes(%" PRIi64 ") "
+                   "exceeds maximum(%" PRIi64 ")", offset, bytes,
+                   BDRV_MAX_LENGTH);
         return -EIO;
     }

@@ -939,7 +956,7 @@ int bdrv_check_request(int64_t offset, int64_t bytes)

 static int bdrv_check_request32(int64_t offset, int64_t bytes)
 {
-    int ret = bdrv_check_request(offset, bytes);
+    int ret = bdrv_check_request(offset, bytes, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -2847,7 +2864,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         return -EPERM;
     }

-    ret = bdrv_check_request(offset, bytes);
+    ret = bdrv_check_request(offset, bytes, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -3249,10 +3266,8 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         return -EINVAL;
     }

-    ret = bdrv_check_request(offset, 0);
+    ret = bdrv_check_request(offset, 0, errp);
     if (ret < 0) {
-        error_setg(errp, "Required too big image size, it must be not greater "
-                   "than %" PRId64, BDRV_MAX_LENGTH);
         return ret;
     }

diff --git a/block/file-posix.c b/block/file-posix.c
index 11aafa9d82b2..05079b40caee 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2969,7 +2969,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,

         req->bytes = BDRV_MAX_LENGTH - req->offset;

-        assert(bdrv_check_request(req->offset, req->bytes) == 0);
+        bdrv_check_request(req->offset, req->bytes, &error_abort);

         bdrv_make_request_serialising(req, bs->bl.request_alignment);
     }
diff --git a/tests/test-write-threshold.c b/tests/test-write-threshold.c
index 4cf032652dfd..fc1c45a2eb95 100644
--- a/tests/test-write-threshold.c
+++ b/tests/test-write-threshold.c
@@ -7,6 +7,7 @@
  */

 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/write-threshold.h"

@@ -64,7 +65,7 @@ static void test_threshold_not_trigger(void)
     req.offset = 1024;
     req.bytes = 1024;

-    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+    bdrv_check_request(req.offset, req.bytes, &error_abort);

     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
@@ -84,7 +85,7 @@ static void test_threshold_trigger(void)
     req.offset = (4 * 1024 * 1024) - 1024;
     req.bytes = 2 * 1024;

-    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+    bdrv_check_request(req.offset, req.bytes, &error_abort);

     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index e8a36de00bda..5dd589d14e47 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -180,7 +180,7 @@ Job failed: Could not resize image: Image size cannot be negative

 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "size": 9223372036854775296}}}
 {"return": {}}
-Job failed: Could not resize image: Required too big image size, it must be not greater than 9223372035781033984
+Job failed: Could not resize image: offset(9223372036854775296) exceeds maximum(9223372035781033984)
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}

-- 
2.30.0


