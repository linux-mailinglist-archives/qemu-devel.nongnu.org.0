Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE716B618
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 07:47:39 +0200 (CEST)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hncmw-0000vM-6H
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 01:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hncmZ-0008Lm-TJ
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 01:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hncmY-0001br-SF
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 01:47:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:57666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hncmY-0001ak-J1
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 01:47:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 22:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="191153885"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jul 2019 22:47:12 -0700
Date: Wed, 17 Jul 2019 13:46:47 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Peter Xu <zhexu@redhat.com>
Message-ID: <20190717054647.GA19479@richard>
References: <20190717012902.23958-1-richardw.yang@linux.intel.com>
 <20190717015910.GD30980@xz-x1> <20190717024637.GA17163@richard>
 <20190717031155.GE30980@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717031155.GE30980@xz-x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [RESEND][PATCH] bitmap: get last word mask from nr
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: quintela@redhat.com, corentincj@iksaif.net, pl@kamp.de,
 qemu-devel@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 17, 2019 at 11:11:55AM +0800, Peter Xu wrote:
>On Wed, Jul 17, 2019 at 10:46:37AM +0800, Wei Yang wrote:
>> On Wed, Jul 17, 2019 at 09:59:10AM +0800, Peter Xu wrote:
>> >On Wed, Jul 17, 2019 at 09:29:02AM +0800, Wei Yang wrote:
>> >> The value left in nr is the number of bits for the last word, which
>> >> could be calculate the last word mask directly.
>> >
>> >Is it true even if start does not align to BITS_PER_LONG?
>> >
>> 
>> Yes. Let me see how to explain this.
>> 
>> When you look into the definition of BITMAP_LAST_WORD_MASK, it takes the
>> number of total bits and give the number of bits in last word. While the value
>> matters for the input is the number of last word. This means the following
>> equation stands
>> 
>>   BITMAP_LAST_WORD_MASK(size) == BITMAP_FIRST_WORD_MASK(size % BITS_PER_LONG)
>> 
>> Now let look at the calculation for nr. In each iteration, nr will be
>> truncated to be aligned to BITS_PER_LONG. So when we exit the loop, nr keeps
>> the number of bits in last word.
>> 
>> So we can leverage the result, no matter the start is aligned or not.
>
>Yes, you are right.
>
>Do you have plan to write some unit tests for these functions? :)
>
>It'll be tests/test-bitmap.c.  IMHO the test cases could be even more
>helpful to the QEMU project as a whole comparing to this patch to
>guarantee changes like your patch won't break.

Let me have a try. :-)

>
>At the meantime I think you can also do that to bitmap_set_atomic.
>
>Thanks,
>
>-- 
>Peter Xu

-- 
Wei Yang
Help you, Help me

