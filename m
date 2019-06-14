Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA445450CF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 02:43:03 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbaJ4-0005vu-Lt
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 20:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hbaHF-0004d0-Rh
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 20:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hba5V-00056U-F3
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 20:29:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:17999)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hba5R-0004ya-Kd
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 20:28:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 17:28:48 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2019 17:28:47 -0700
Date: Fri, 14 Jun 2019 08:28:22 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190614002822.GA32195@richard>
References: <20190425032831.22551-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425032831.22551-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [PATCH] bitmap: get last word mask from nr directly
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: corentincj@iksaif.net, pl@kamp.de, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 25, 2019 at 11:28:31AM +0800, Wei Yang wrote:
>The value left in nr is the number of bits for the last word, which
>could be calculate the last word mask directly.
>
>Remove the unnecessary size.

Ping...

>
>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>---
> util/bitmap.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/util/bitmap.c b/util/bitmap.c
>index cb618c65a5..5aa60b8717 100644
>--- a/util/bitmap.c
>+++ b/util/bitmap.c
>@@ -160,7 +160,6 @@ int slow_bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
> void bitmap_set(unsigned long *map, long start, long nr)
> {
>     unsigned long *p = map + BIT_WORD(start);
>-    const long size = start + nr;
>     int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
>     unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
> 
>@@ -174,7 +173,7 @@ void bitmap_set(unsigned long *map, long start, long nr)
>         p++;
>     }
>     if (nr) {
>-        mask_to_set &= BITMAP_LAST_WORD_MASK(size);
>+        mask_to_set &= BITMAP_LAST_WORD_MASK(nr);
>         *p |= mask_to_set;
>     }
> }
>@@ -221,7 +220,6 @@ void bitmap_set_atomic(unsigned long *map, long start, long nr)
> void bitmap_clear(unsigned long *map, long start, long nr)
> {
>     unsigned long *p = map + BIT_WORD(start);
>-    const long size = start + nr;
>     int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
>     unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
> 
>@@ -235,7 +233,7 @@ void bitmap_clear(unsigned long *map, long start, long nr)
>         p++;
>     }
>     if (nr) {
>-        mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
>+        mask_to_clear &= BITMAP_LAST_WORD_MASK(nr);
>         *p &= ~mask_to_clear;
>     }
> }
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

