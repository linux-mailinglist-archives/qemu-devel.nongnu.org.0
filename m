Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2F30CF51
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:48:46 +0100 (CET)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74TV-00017D-Lp
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qs-0007VN-EO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qd-0005tZ-3u
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ll2aY3zeMbb3kpA44SvMxsG+djU3MzpEF5vW6TAC2bw=;
 b=iQqE6yzXmcC/GMKeZ9H6C8NBk/zDqzq1biwrteigqh+INTvjp48NfufRdQBY7vGvV5dTks
 YzT132kOJhCopHgFEGdn6f/+81ktRIYBo8E5Hpx8V/icgkABg/V3cqECTczddVyXk7lCMs
 9H6U3xAYn+xXR02LiM1ECc7h1Bx2y4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-KZz_BqbgMpGrYXi93tfouA-1; Tue, 02 Feb 2021 17:45:44 -0500
X-MC-Unique: KZz_BqbgMpGrYXi93tfouA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0315A59;
 Tue,  2 Feb 2021 22:45:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6818510016F9;
 Tue,  2 Feb 2021 22:45:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] block/io: use int64_t bytes in driver wrappers
Date: Tue,  2 Feb 2021 16:45:19 -0600
Message-Id: <20210202224529.642055-11-eblake@redhat.com>
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

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver wrappers parameters which are already 64bit to
signed type.

Requests in block/io.c must never exceed BDRV_MAX_LENGTH (which is less
than INT64_MAX), which makes the conversion to signed 64bit type safe.

Add corresponding assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-10-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 1c23587d18c6..cb5064155b6a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1125,7 +1125,7 @@ static void bdrv_co_io_em_complete(void *opaque, int ret)
 }

 static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
+                                           int64_t offset, int64_t bytes,
                                            QEMUIOVector *qiov,
                                            size_t qiov_offset, int flags)
 {
@@ -1135,6 +1135,7 @@ static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
     QEMUIOVector local_qiov;
     int ret;

+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(!(flags & ~BDRV_REQ_MASK));
     assert(!(flags & BDRV_REQ_NO_FALLBACK));

@@ -1194,7 +1195,7 @@ out:
 }

 static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
+                                            int64_t offset, int64_t bytes,
                                             QEMUIOVector *qiov,
                                             size_t qiov_offset, int flags)
 {
@@ -1204,6 +1205,7 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     QEMUIOVector local_qiov;
     int ret;

+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(!(flags & ~BDRV_REQ_MASK));
     assert(!(flags & BDRV_REQ_NO_FALLBACK));

@@ -1274,14 +1276,16 @@ emulate_flags:
 }

 static int coroutine_fn
-bdrv_driver_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
-                               uint64_t bytes, QEMUIOVector *qiov,
+bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
+                               int64_t bytes, QEMUIOVector *qiov,
                                size_t qiov_offset)
 {
     BlockDriver *drv = bs->drv;
     QEMUIOVector local_qiov;
     int ret;

+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
-- 
2.30.0


