Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D85E6A6B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 02:12:30 +0100 (CET)
Received: from localhost ([::1]:50210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOta8-0002q7-Pn
	for lists+qemu-devel@lfdr.de; Sun, 27 Oct 2019 21:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iOtYi-0002NC-UT
 for qemu-devel@nongnu.org; Sun, 27 Oct 2019 21:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iOtYh-0000tI-LJ
 for qemu-devel@nongnu.org; Sun, 27 Oct 2019 21:11:00 -0400
Received: from mga04.intel.com ([192.55.52.120]:8972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iOtYg-0000oP-J2
 for qemu-devel@nongnu.org; Sun, 27 Oct 2019 21:10:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 18:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,238,1569308400"; d="scan'208";a="229534819"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2019 18:10:49 -0700
Date: Mon, 28 Oct 2019 09:10:15 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] migration: check length directly to make
 sure the range is aligned
Message-ID: <20191028011015.GA3893@richard>
References: <20190712032704.7826-1-richardw.yang@linux.intel.com>
 <20190719175400.GJ3000@work-vm>
 <0fd200f7-ad92-d753-23ca-8c89a27fd346@redhat.com>
 <20190719180651.GM3000@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719180651.GM3000@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, rth@twiddle.net,
 Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 19, 2019 at 07:06:51PM +0100, Dr. David Alan Gilbert wrote:
>* Paolo Bonzini (pbonzini@redhat.com) wrote:
>> On 19/07/19 19:54, Dr. David Alan Gilbert wrote:
>> >> -        if ((uintptr_t)host_endaddr & (rb->page_size - 1)) {
>> >> -            error_report("ram_block_discard_range: Unaligned end address: %p",
>> >> -                         host_endaddr);
>> >> +        if (length & (rb->page_size - 1)) {
>> >> +            error_report("ram_block_discard_range: Unaligned length: %lx",
>> >> +                         length);
>> > Yes, I *think* this is safe, we'll need to watch out for any warnings;
>> 
>> Do you mean compiler or QEMU warning?
>
>No, I mean lots of these error reports being printed out in some common
>case.
>

Hi, Dave

Haven't see you for a period of time :-)

>Dave
>
>  The patch is safe since there's an
>> 
>>     if ((uintptr_t)host_startaddr & (rb->page_size - 1)) {
>>         error_report("ram_block_discard_range: Unaligned start address: %p",
>>                      host_startaddr);
>>         goto err;
>>     }
>> 
>> just before this context.
>> 
>> Paolo
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

