Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4271259101
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:43:29 +0200 (CEST)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7VQ-0006Te-MS
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7ND-0007wU-0X
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:34:59 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50171
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7NB-00077U-HD
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598970896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+eXjCZTMHHxoPLz+HDrgIdDMcjZ0hOTm+j/NTbG2aA=;
 b=ffJ52rQa6iqalURUYNFjkhLAZG3nqzOyhQwXAhSaKfCY/4B6VNqi3o6atPluLGlGm/zfZi
 B2csRyFZz/x1YZ/NuiouoKMVQLLY2LitAlVM/0khQd82/mzgJ4+CC3lt9IWCOFh3YxqQVd
 UqiCjhxRsDFaX85NTLDNAlKvDsh69Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-hvxLZMrsPq2gUEMJdSg23g-1; Tue, 01 Sep 2020 10:34:53 -0400
X-MC-Unique: hvxLZMrsPq2gUEMJdSg23g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB29964081;
 Tue,  1 Sep 2020 14:34:51 +0000 (UTC)
Received: from localhost (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C311002D5A;
 Tue,  1 Sep 2020 14:34:51 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 11/43] block: Use CAFs in block status functions
Date: Tue,  1 Sep 2020 16:33:52 +0200
Message-Id: <20200901143424.884735-12-mreitz@redhat.com>
In-Reply-To: <20200901143424.884735-1-mreitz@redhat.com>
References: <20200901143424.884735-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 02:08:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the child access functions in the block status inquiry functions as
appropriate.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/block/io.c b/block/io.c
index 01e3477a77..4ee8fe5465 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2409,9 +2409,10 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     if (ret & (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO)) {
         ret |= BDRV_BLOCK_ALLOCATED;
     } else if (want_zero && bs->drv->supports_backing) {
-        if (bs->backing) {
-            BlockDriverState *bs2 = bs->backing->bs;
-            int64_t size2 = bdrv_getlength(bs2);
+        BlockDriverState *cow_bs = bdrv_cow_bs(bs);
+
+        if (cow_bs) {
+            int64_t size2 = bdrv_getlength(cow_bs);
 
             if (size2 >= 0 && offset >= size2) {
                 ret |= BDRV_BLOCK_ZERO;
@@ -2479,7 +2480,7 @@ static int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
     bool first = true;
 
     assert(bs != base);
-    for (p = bs; p != base; p = backing_bs(p)) {
+    for (p = bs; p != base; p = bdrv_filter_or_cow_bs(p)) {
         ret = bdrv_co_block_status(p, want_zero, offset, bytes, pnum, map,
                                    file);
         if (ret < 0) {
@@ -2553,7 +2554,7 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
 int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
-    return bdrv_block_status_above(bs, backing_bs(bs),
+    return bdrv_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
                                    offset, bytes, pnum, map, file);
 }
 
@@ -2563,9 +2564,9 @@ int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
     int ret;
     int64_t dummy;
 
-    ret = bdrv_common_block_status_above(bs, backing_bs(bs), false, offset,
-                                         bytes, pnum ? pnum : &dummy, NULL,
-                                         NULL);
+    ret = bdrv_common_block_status_above(bs, bdrv_filter_or_cow_bs(bs), false,
+                                         offset, bytes, pnum ? pnum : &dummy,
+                                         NULL, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -2628,7 +2629,7 @@ int bdrv_is_allocated_above(BlockDriverState *top,
             break;
         }
 
-        intermediate = backing_bs(intermediate);
+        intermediate = bdrv_filter_or_cow_bs(intermediate);
     }
 
     *pnum = n;
-- 
2.26.2


