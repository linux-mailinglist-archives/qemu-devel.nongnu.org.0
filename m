Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE76C401
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:06:10 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnus5-0004hA-FF
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51906)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnurk-0003kd-HS
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnurj-0003jv-Jd
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:05:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:12087)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnurj-0003j4-Bm
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:05:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 18:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="319489324"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga004.jf.intel.com with ESMTP; 17 Jul 2019 18:05:44 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jul 2019 09:04:55 +0800
Message-Id: <20190718010456.4234-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718010456.4234-1-richardw.yang@linux.intel.com>
References: <20190718010456.4234-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v3 1/2] bitmap: get last word mask from nr
 directly
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
Cc: quintela@redhat.com, corentincj@iksaif.net, pl@kamp.de, peterx@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value left in nr is the number of bits for the last word, which
could be calculate the last word mask directly.

Remove the unnecessary size.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

---
v2: refine bitmap_set_atomic too, suggested from Peter
---
 util/bitmap.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/util/bitmap.c b/util/bitmap.c
index 1753ff7f5b..5b15249796 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -160,7 +160,6 @@ int slow_bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
 void bitmap_set(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-    const long size = start + nr;
     int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
     unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
 
@@ -174,7 +173,7 @@ void bitmap_set(unsigned long *map, long start, long nr)
         p++;
     }
     if (nr) {
-        mask_to_set &= BITMAP_LAST_WORD_MASK(size);
+        mask_to_set &= BITMAP_LAST_WORD_MASK(nr);
         *p |= mask_to_set;
     }
 }
@@ -182,7 +181,6 @@ void bitmap_set(unsigned long *map, long start, long nr)
 void bitmap_set_atomic(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-    const long size = start + nr;
     int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
     unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
 
@@ -208,7 +206,7 @@ void bitmap_set_atomic(unsigned long *map, long start, long nr)
 
     /* Last word */
     if (nr) {
-        mask_to_set &= BITMAP_LAST_WORD_MASK(size);
+        mask_to_set &= BITMAP_LAST_WORD_MASK(nr);
         atomic_or(p, mask_to_set);
     } else {
         /* If we avoided the full barrier in atomic_or(), issue a
@@ -221,7 +219,6 @@ void bitmap_set_atomic(unsigned long *map, long start, long nr)
 void bitmap_clear(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-    const long size = start + nr;
     int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
     unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
 
@@ -235,7 +232,7 @@ void bitmap_clear(unsigned long *map, long start, long nr)
         p++;
     }
     if (nr) {
-        mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
+        mask_to_clear &= BITMAP_LAST_WORD_MASK(nr);
         *p &= ~mask_to_clear;
     }
 }
-- 
2.17.1


