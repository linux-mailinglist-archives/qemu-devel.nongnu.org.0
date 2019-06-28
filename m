Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4415A761
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 01:06:32 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgzws-0007Y0-69
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 19:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48885)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hgzvY-0006mX-7X
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hgzvX-0002qE-60
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:05:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:52074)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hgzvW-0002fm-SZ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:05:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 16:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,429,1557212400"; d="scan'208";a="167896451"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 28 Jun 2019 16:04:59 -0700
Date: Sat, 29 Jun 2019 07:04:36 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190628230436.GA8241@richard>
References: <20190627020822.15485-1-richardw.yang@linux.intel.com>
 <20190627020822.15485-2-richardw.yang@linux.intel.com>
 <20190628150950.GG2922@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628150950.GG2922@work-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [PATCH 1/3] migration/postcopy: the valid
 condition is one less then end
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
Cc: quintela@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 28, 2019 at 04:09:50PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> If one equals end, it means we have gone through the whole bitmap.
>> 
>> Use a more restrict check to skip a unnecessary condition.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Yes, I don't think that'll break, since I think the find_next_zero_bit
>will also return end, and then discard_length would be 0; still I think
>it's a correct fix.

Yep, you are exactly right.

>
>Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
>> ---
>>  migration/ram.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 908517fc2b..b78169e811 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2777,7 +2777,7 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms,
>>      for (current = 0; current < end; ) {
>>          unsigned long one = find_next_bit(unsentmap, end, current);
>>  
>> -        if (one <= end) {
>> +        if (one < end) {
>>              unsigned long zero = find_next_zero_bit(unsentmap, end, one + 1);
>>              unsigned long discard_length;
>>  
>> -- 
>> 2.19.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

