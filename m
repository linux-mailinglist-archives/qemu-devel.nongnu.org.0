Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A58786B2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 09:51:54 +0200 (CEST)
Received: from localhost ([::1]:50264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs0Rl-0000X8-Uh
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 03:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hs0Qv-0007jP-RC
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 03:51:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hs0Qu-0008Of-Ra
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 03:51:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:18589)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hs0Qu-0008Ma-IH
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 03:51:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 00:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="162099284"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga007.jf.intel.com with ESMTP; 29 Jul 2019 00:50:57 -0700
Date: Mon, 29 Jul 2019 15:50:35 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190729075035.GB2255@richard>
References: <20190728131304.1282-1-richardw.yang@linux.intel.com>
 <20190728131304.1282-3-richardw.yang@linux.intel.com>
 <07a5431d-1928-d1ab-a0a2-7be21b411742@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07a5431d-1928-d1ab-a0a2-7be21b411742@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [PATCH 2/3] memory-device: break the loop if no
 hint is provided
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
Cc: imammedo@redhat.com, mst@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 29, 2019 at 09:45:24AM +0200, David Hildenbrand wrote:
>On 28.07.19 15:13, Wei Yang wrote:
>> When there is no hint, the first un-overlapped range is the proper one.
>> Just break the loop instead of iterate the whole list.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  hw/mem/memory-device.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
>> index df3261b32a..413b514586 100644
>> --- a/hw/mem/memory-device.c
>> +++ b/hw/mem/memory-device.c
>> @@ -180,6 +180,8 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
>>                  range_make_empty(&new);
>>                  break;
>>              }
>> +        } else if (!hint) {
>> +            break;
>>          }
>>      }
>>  
>> 
>
>I think
>
>a) This is fine. I was not able to construct a counter-example where
>this would not work. Whenever we modify the range, we check against the
>next one in the sorted list. If there is no overlap, it fits. And, it
>won't overlap with any other range (and therefore never be changed again)
>
>b) This should therefore not change the assignment order / break migration.
>
>Maybe mention that this will not change the assigned addresses compared
>to old code in all scenarios.
>

Thanks, let me add this in change log.

>Reviewed-by: David Hildenbrand <david@redhat.com>
>
>-- 
>
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

