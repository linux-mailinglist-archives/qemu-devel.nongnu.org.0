Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA00948EB58
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:14:06 +0100 (CET)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NLB-0005dP-QI
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0i-0003JX-8W
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0g-0000OJ-Fy
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBeDq1TQZkaS+a6CTH6lheHgQ07lW02DNpjs6pu+mhc=;
 b=cCbjwRKqYJ4i8/PUNguc9S/OTKfR3D2+d4TzVuoFa5HPNuaGMrv2xuneZLSPYRceZDcbJI
 ajBXGayNwUbWCKTfh++c5xvc9V4gO5eyI/GikP2gYs5/M85hJrWukCx7wGH5r8vJkblVtn
 9pf1gaOaljjuXnAXibdeH0q3ly/Q1Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-BuSpUOGqPvilPo0t3swPVQ-1; Fri, 14 Jan 2022 08:52:50 -0500
X-MC-Unique: BuSpUOGqPvilPo0t3swPVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A3D760C0;
 Fri, 14 Jan 2022 13:52:49 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B3C2105B20E;
 Fri, 14 Jan 2022 13:52:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/16] qemu-img: make is_allocated_sectors() more efficient
Date: Fri, 14 Jan 2022 14:52:24 +0100
Message-Id: <20220114135226.185407-15-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Consider the case when the whole buffer is zero and end is unaligned.

If i <= tail, we return 1 and do one unaligned WRITE, RMW happens.

If i > tail, we do on aligned WRITE_ZERO (or skip if target is zeroed)
and again one unaligned WRITE, RMW happens.

Let's do better: don't fragment the whole-zero buffer and report it as
ZERO: in case of zeroed target we just do nothing and avoid RMW. If
target is not zeroes, one unaligned WRITE_ZERO should not be much worse
than one unaligned WRITE.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211217164654.1184218-3-vsementsov@virtuozzo.com>
Tested-by: Peter Lieven <pl@kamp.de>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c                 | 23 +++++++++++++++++++----
 tests/qemu-iotests/122.out |  8 ++------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 21ba1e6800..6fe2466032 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1171,19 +1171,34 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
         }
     }
 
+    if (i == n) {
+        /*
+         * The whole buf is the same.
+         * No reason to split it into chunks, so return now.
+         */
+        *pnum = i;
+        return !is_zero;
+    }
+
     tail = (sector_num + i) & (alignment - 1);
     if (tail) {
         if (is_zero && i <= tail) {
-            /* treat unallocated areas which only consist
-             * of a small tail as allocated. */
+            /*
+             * For sure next sector after i is data, and it will rewrite this
+             * tail anyway due to RMW. So, let's just write data now.
+             */
             is_zero = false;
         }
         if (!is_zero) {
-            /* align up end offset of allocated areas. */
+            /* If possible, align up end offset of allocated areas. */
             i += alignment - tail;
             i = MIN(i, n);
         } else {
-            /* align down end offset of zero areas. */
+            /*
+             * For sure next sector after i is data, and it will rewrite this
+             * tail anyway due to RMW. Better is avoid RMW and write zeroes up
+             * to aligned bound.
+             */
             i -= tail;
         }
     }
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 69b8e8b803..e18766e167 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -201,9 +201,7 @@ convert -S 4k
 { "start": 8192, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 12288, "length": 4096, "depth": 0, "present": false, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 46080, "depth": 0, "present": false, "zero": true, "data": false},
-{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 20480, "length": 67088384, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
@@ -215,9 +213,7 @@ convert -c -S 4k
 
 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 41984, "depth": 0, "present": false, "zero": true, "data": false},
-{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 24576, "length": 67084288, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
-- 
2.31.1


