Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF991B08
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 04:28:06 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzXOv-0003V3-MD
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 22:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzXO4-00034n-CT
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzXO3-0005ND-0u
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:27:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:29387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hzXO2-0005Kz-NU
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:27:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 19:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="329238100"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga004.jf.intel.com with ESMTP; 18 Aug 2019 19:27:02 -0700
Date: Mon, 19 Aug 2019 10:26:39 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190819022639.GA6368@richard>
References: <20190712032704.7826-1-richardw.yang@linux.intel.com>
 <20190719175400.GJ3000@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719175400.GJ3000@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH] migration: check length directly to make
 sure the range is aligned
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, quintela@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 19, 2019 at 06:54:00PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> Since the start addr is already checked, to make sure the range is
>> aligned, checking the length is enough.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  exec.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>> 
>> diff --git a/exec.c b/exec.c
>> index 50ea9c5aaa..8fa980baae 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -4067,10 +4067,9 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
>>  
>>      if ((start + length) <= rb->used_length) {
>>          bool need_madvise, need_fallocate;
>> -        uint8_t *host_endaddr = host_startaddr + length;
>> -        if ((uintptr_t)host_endaddr & (rb->page_size - 1)) {
>> -            error_report("ram_block_discard_range: Unaligned end address: %p",
>> -                         host_endaddr);
>> +        if (length & (rb->page_size - 1)) {
>> +            error_report("ram_block_discard_range: Unaligned length: %lx",
>> +                         length);
>
>Yes, I *think* this is safe, we'll need to watch out for any warnings;
>David Gibson's balloon fix from February means that the balloon code
>should now warn in it's case.
>
>rth: Want to pick this up?
>
>Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

Hi, David

Do you like this one?

>>              goto err;
>>          }
>>  
>> -- 
>> 2.17.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

