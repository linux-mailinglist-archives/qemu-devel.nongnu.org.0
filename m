Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF5F0878
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 22:36:48 +0100 (CET)
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS6VL-000516-Fa
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 16:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5pe-0001OP-1p
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5pc-0002TS-CC
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iS5pa-00026s-MR; Tue, 05 Nov 2019 15:53:40 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5KpWjh144523; Tue, 5 Nov 2019 15:53:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3fuuhad8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:53:17 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xA5KrH1j001572;
 Tue, 5 Nov 2019 15:53:17 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3fuuhacr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:53:17 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5KnxqA018309;
 Tue, 5 Nov 2019 20:53:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2w11e7177r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 20:53:19 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5KrF2s51052800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 20:53:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8705D124064;
 Tue,  5 Nov 2019 20:53:15 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7333112405E;
 Tue,  5 Nov 2019 20:53:15 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 20:53:15 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 50/55] util/hbitmap: strict hbitmap_reset
Date: Tue,  5 Nov 2019 14:52:38 -0600
Message-Id: <20191105205243.3766-51-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
References: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=944 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050170
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

hbitmap_reset has an unobvious property: it rounds requested region up.
It may provoke bugs, like in recently fixed write-blocking mode of
mirror: user calls reset on unaligned region, not keeping in mind that
there are possible unrelated dirty bytes, covered by rounded-up region
and information of this unrelated "dirtiness" will be lost.

Make hbitmap_reset strict: assert that arguments are aligned, allowing
only one exception when @start + @count == hb->orig_size. It's needed
to comfort users of hbitmap_next_dirty_area, which cares about
hb->orig_size.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20190806152611.280389-1-vsementsov@virtuozzo.com>
[Maintainer edit: Max's suggestions from on-list. --js]
[Maintainer edit: Eric's suggestion for aligned macro. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
(cherry picked from commit 48557b138383aaf69c2617ca9a88bfb394fc50ec)
*prereq for fed33bd175f663cc8c13f8a490a4f35a19756cfe
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 include/qemu/hbitmap.h | 5 +++++
 tests/test-hbitmap.c   | 2 +-
 util/hbitmap.c         | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 4afbe6292e..1bf944ca3d 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -132,6 +132,11 @@ void hbitmap_set(HBitmap *hb, uint64_t start, uint64_t count);
  * @count: Number of bits to reset.
  *
  * Reset a consecutive range of bits in an HBitmap.
+ * @start and @count must be aligned to bitmap granularity. The only exception
+ * is resetting the tail of the bitmap: @count may be equal to hb->orig_size -
+ * @start, in this case @count may be not aligned. The sum of @start + @count is
+ * allowed to be greater than hb->orig_size, but only if @start < hb->orig_size
+ * and @start + @count = ALIGN_UP(hb->orig_size, granularity).
  */
 void hbitmap_reset(HBitmap *hb, uint64_t start, uint64_t count);
 
diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index 592d8219db..2be56d1597 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -423,7 +423,7 @@ static void test_hbitmap_granularity(TestHBitmapData *data,
     hbitmap_test_check(data, 0);
     hbitmap_test_set(data, 0, 3);
     g_assert_cmpint(hbitmap_count(data->hb), ==, 4);
-    hbitmap_test_reset(data, 0, 1);
+    hbitmap_test_reset(data, 0, 2);
     g_assert_cmpint(hbitmap_count(data->hb), ==, 2);
 }
 
diff --git a/util/hbitmap.c b/util/hbitmap.c
index bcc0acdc6a..71c6ba2c52 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -476,6 +476,10 @@ void hbitmap_reset(HBitmap *hb, uint64_t start, uint64_t count)
     /* Compute range in the last layer.  */
     uint64_t first;
     uint64_t last = start + count - 1;
+    uint64_t gran = 1ULL << hb->granularity;
+
+    assert(QEMU_IS_ALIGNED(start, gran));
+    assert(QEMU_IS_ALIGNED(count, gran) || (start + count == hb->orig_size));
 
     trace_hbitmap_reset(hb, start, count,
                         start >> hb->granularity, last >> hb->granularity);
-- 
2.17.1


