Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB282D7D35
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:46:54 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmVJ-0006zr-Et
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlvV-0004h1-7N
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlum-0002Lo-8Y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnCn3WK1WUMUBMIYMdE2Z3dfBeiDvXeSor63rfgxMPg=;
 b=cNpAgL1IEXEirKAw8z17iTMADwKW05k/FVWSGgjOKMN6RP8TodbloEJlwRlmfvlbHNILAB
 juwpTpNPS3h6nj0wOw1rY41veDHehnn5T9H0d3F9iDYBCWhfOiFZP4K61R7KGN0k7+de5m
 lsJtxwZAs+QbFn4TFfAbm1eX1HpntCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-bz8SrvjcMaqPZAumFwshxQ-1; Fri, 11 Dec 2020 12:08:59 -0500
X-MC-Unique: bz8SrvjcMaqPZAumFwshxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABCA659;
 Fri, 11 Dec 2020 17:08:58 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB7745D6A8;
 Fri, 11 Dec 2020 17:08:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/34] block/io: bdrv_check_byte_request(): drop
 bdrv_is_inserted()
Date: Fri, 11 Dec 2020 18:08:08 +0100
Message-Id: <20201211170812.228643-31-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Move bdrv_is_inserted() calls into callers.

We are going to make bdrv_check_byte_request() a clean thing.
bdrv_is_inserted() is not about checking the request, it's about
checking the bs. So, it should be separate.

With this patch we probably change error path for some failure
scenarios. But depending on the fact that querying too big request on
empty cdrom (or corrupted qcow2 node with no drv) will result in EIO
and not ENOMEDIUM would be very strange. More over, we are going to
move to 64bit requests, so larger requests will be allowed anyway.

More over, keeping in mind that cdrom is the only driver that has
.bdrv_is_inserted() handler it's strange that we should care so much
about it in generic block layer, intuitively we should just do read and
write, and cdrom driver should return correct errors if it is not
inserted. But it's a work for another series.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201203222713.13507-4-vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/block/io.c b/block/io.c
index 3e91074c9f..ef75a5abb4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -884,17 +884,12 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
-static int bdrv_check_byte_request(BlockDriverState *bs, int64_t offset,
-                                   size_t size)
+static int bdrv_check_byte_request(int64_t offset, size_t size)
 {
     if (size > BDRV_REQUEST_MAX_BYTES) {
         return -EIO;
     }
 
-    if (!bdrv_is_inserted(bs)) {
-        return -ENOMEDIUM;
-    }
-
     if (offset < 0) {
         return -EIO;
     }
@@ -1642,7 +1637,11 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
 
     trace_bdrv_co_preadv(bs, offset, bytes, flags);
 
-    ret = bdrv_check_byte_request(bs, offset, bytes);
+    if (!bdrv_is_inserted(bs)) {
+        return -ENOMEDIUM;
+    }
+
+    ret = bdrv_check_byte_request(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -2054,11 +2053,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
 
     trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);
 
-    if (!bs->drv) {
+    if (!bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_byte_request(bs, offset, bytes);
+    ret = bdrv_check_byte_request(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -3045,10 +3044,10 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
     assert(!(write_flags & BDRV_REQ_NO_FALLBACK));
 
-    if (!dst || !dst->bs) {
+    if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(dst->bs, dst_offset, bytes);
+    ret = bdrv_check_byte_request(dst_offset, bytes);
     if (ret) {
         return ret;
     }
@@ -3056,10 +3055,10 @@ static int coroutine_fn bdrv_co_copy_range_internal(
         return bdrv_co_pwrite_zeroes(dst, dst_offset, bytes, write_flags);
     }
 
-    if (!src || !src->bs) {
+    if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(src->bs, src_offset, bytes);
+    ret = bdrv_check_byte_request(src_offset, bytes);
     if (ret) {
         return ret;
     }
-- 
2.29.2


