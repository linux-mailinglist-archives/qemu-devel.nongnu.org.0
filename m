Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44736B336
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 03:29:52 +0200 (CEST)
Received: from localhost ([::1]:53432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnYlT-0000Yc-KY
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 21:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37974)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnYlH-0000AO-6g
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnYlG-0002fR-8K
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:29:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:54000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnYlG-0002en-0O
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:29:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 18:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="366855425"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jul 2019 18:29:34 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 09:29:02 +0800
Message-Id: <20190717012902.23958-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [RESEND][PATCH] bitmap: get last word mask from nr
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
resend with wider audience
---
 util/bitmap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/util/bitmap.c b/util/bitmap.c
index cb618c65a5..5aa60b8717 100644
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
@@ -221,7 +220,6 @@ void bitmap_set_atomic(unsigned long *map, long start, long nr)
 void bitmap_clear(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-    const long size = start + nr;
     int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
     unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
 
@@ -235,7 +233,7 @@ void bitmap_clear(unsigned long *map, long start, long nr)
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


