Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE060C2439
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 17:26:00 +0200 (CEST)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iExYl-0002Co-MW
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 11:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExOJ-0004YT-SE
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExOI-0005tr-EU
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:15:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:46692)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExOF-0005op-9V; Mon, 30 Sep 2019 11:15:07 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExOB-0005tD-BC; Mon, 30 Sep 2019 18:15:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 01/10] hbitmap: introduce HBITMAP_MAX_ORIG_SIZE
Date: Mon, 30 Sep 2019 18:14:53 +0300
Message-Id: <20190930151502.7829-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930151502.7829-1-vsementsov@virtuozzo.com>
References: <20190930151502.7829-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/hbitmap.h | 7 +++++++
 util/hbitmap.c         | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 1bf944ca3d..82317c5364 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -33,6 +33,13 @@ typedef struct HBitmapIter HBitmapIter;
  */
 #define HBITMAP_LEVELS         ((HBITMAP_LOG_MAX_SIZE / BITS_PER_LEVEL) + 1)
 
+/*
+ * We have APIs which returns signed int64_t, to be able to return error.
+ * Therefore we can't handle bitmaps with absolute size larger than
+ * (INT64_MAX+1). Still, keep it INT64_MAX to be a bit safer.
+ */
+#define HBITMAP_MAX_ORIG_SIZE INT64_MAX
+
 struct HBitmapIter {
     const HBitmap *hb;
 
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 757d39e360..df192234e3 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -708,6 +708,7 @@ HBitmap *hbitmap_alloc(uint64_t size, int granularity)
     HBitmap *hb = g_new0(struct HBitmap, 1);
     unsigned i;
 
+    assert(size <= HBITMAP_MAX_ORIG_SIZE);
     hb->orig_size = size;
 
     assert(granularity >= 0 && granularity < 64);
@@ -738,6 +739,7 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     uint64_t num_elements = size;
     uint64_t old;
 
+    assert(size <= HBITMAP_MAX_ORIG_SIZE);
     hb->orig_size = size;
 
     /* Size comes in as logical elements, adjust for granularity. */
-- 
2.21.0


