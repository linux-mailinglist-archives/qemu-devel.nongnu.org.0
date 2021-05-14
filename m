Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBC380E93
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:06:03 +0200 (CEST)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbGE-0007Yh-Oj
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawl-000674-E8
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawj-00062U-F0
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoAsd0pCs00wjIwhyC2IGFfvnFc2lb+GnBjWsgFU+tU=;
 b=cCarvWAu4CCNooS2ki1tStJTvtVX7bD5QO/Qo6Nb8ZC3IMZ7PL9PxphkubfctCV9Uj1Hmz
 yu5otAHC0Qu/+XJ89yqw+IMWxCOQehBuUPF0A9Ii1Pac0iOequiaYI8sA+Xqm0dDqLwBwA
 80qs+y4JcUd8xcD11Fot2cDdAUHPlgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-bod2cYDVO1awk7lAQW5vKw-1; Fri, 14 May 2021 12:45:50 -0400
X-MC-Unique: bod2cYDVO1awk7lAQW5vKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC45D10074A8;
 Fri, 14 May 2021 16:45:49 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9852160CCF;
 Fri, 14 May 2021 16:45:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/19] block/write-threshold: drop extra APIs
Date: Fri, 14 May 2021 18:45:11 +0200
Message-Id: <20210514164514.1057680-17-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bdrv_write_threshold_exceeded() is unused.

bdrv_write_threshold_is_set() is used only to double check the value of
bs->write_threshold_offset in tests. No real sense in it (both tests do
check real value with help of bdrv_write_threshold_get())

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210506090621.11848-5-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
[mreitz: Adjusted commit message as per Eric's suggestion]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/write-threshold.h   | 24 ------------------------
 block/write-threshold.c           | 19 -------------------
 tests/unit/test-write-threshold.c |  4 ----
 3 files changed, 47 deletions(-)

diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index 848a5dde85..a03ee1cacd 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -35,30 +35,6 @@ void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
  */
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
 
-/*
- * bdrv_write_threshold_is_set
- *
- * Tell if a write threshold is set for a given BDS.
- */
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
-
-/*
- * bdrv_write_threshold_exceeded
- *
- * Return the extent of a write request that exceeded the threshold,
- * or zero if the request is below the threshold.
- * Return zero also if the threshold was not set.
- *
- * NOTE: here we assume the following holds for each request this code
- * deals with:
- *
- * assert((req->offset + req->bytes) <= UINT64_MAX)
- *
- * Please not there is *not* an actual C assert().
- */
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req);
-
 /*
  * bdrv_write_threshold_check_write
  *
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 71df3c434f..65a6acd142 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -24,25 +24,6 @@ uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
     return bs->write_threshold_offset;
 }
 
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
-{
-    return bs->write_threshold_offset > 0;
-}
-
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (req->offset > bs->write_threshold_offset) {
-            return (req->offset - bs->write_threshold_offset) + req->bytes;
-        }
-        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
-            return (req->offset + req->bytes) - bs->write_threshold_offset;
-        }
-    }
-    return 0;
-}
-
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
     bs->write_threshold_offset = threshold_bytes;
diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index fd40a815b8..bb5c1a5217 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -18,8 +18,6 @@ static void test_threshold_not_set_on_init(void)
     BlockDriverState bs;
     memset(&bs, 0, sizeof(bs));
 
-    g_assert(!bdrv_write_threshold_is_set(&bs));
-
     res = bdrv_write_threshold_get(&bs);
     g_assert_cmpint(res, ==, 0);
 }
@@ -33,8 +31,6 @@ static void test_threshold_set_get(void)
 
     bdrv_write_threshold_set(&bs, threshold);
 
-    g_assert(bdrv_write_threshold_is_set(&bs));
-
     res = bdrv_write_threshold_get(&bs);
     g_assert_cmpint(res, ==, threshold);
 }
-- 
2.31.1


