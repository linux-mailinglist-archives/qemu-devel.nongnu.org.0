Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D991B13
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 04:40:18 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzXaj-0007ij-1c
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 22:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzXZq-0007IQ-RB
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzXZp-0003uw-Jb
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:39:22 -0400
Received: from mga05.intel.com ([192.55.52.43]:53915)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hzXZp-0003tH-BL
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:39:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 19:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="261697174"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2019 19:39:18 -0700
Date: Mon, 19 Aug 2019 10:38:55 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190819023855.GC6368@richard>
References: <20190730003740.20694-1-richardw.yang@linux.intel.com>
 <20190730003740.20694-2-richardw.yang@linux.intel.com>
 <0C09AFA07DD0434D9E2A0C6AEB0483104038F59D@shsmsx102.ccr.corp.intel.com>
 <20190808021329.GC26938@richard>
 <0C09AFA07DD0434D9E2A0C6AEB0483104038F61B@shsmsx102.ccr.corp.intel.com>
 <20190808023802.GD26938@richard>
 <a73f638c-e33d-c3d8-0b4a-0fa78943a30d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a73f638c-e33d-c3d8-0b4a-0fa78943a30d@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [PATCH v2 1/2] memory-device: not necessary to use
 goto for the last check
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
Cc: "imammedo@redhat.com" <imammedo@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>,
 "Zeng, Star" <star.zeng@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 08, 2019 at 09:06:21AM +0200, David Hildenbrand wrote:
>On 08.08.19 04:38, Wei Yang wrote:
>> On Thu, Aug 08, 2019 at 02:30:02AM +0000, Zeng, Star wrote:
>>>> -----Original Message-----
>>>> From: Wei Yang [mailto:richardw.yang@linux.intel.com]
>>>> Sent: Thursday, August 8, 2019 10:13 AM
>>>> To: Zeng, Star <star.zeng@intel.com>
>>>> Cc: Wei Yang <richardw.yang@linux.intel.com>; qemu-devel@nongnu.org;
>>>> imammedo@redhat.com; david@redhat.com; mst@redhat.com
>>>> Subject: Re: [Qemu-devel] [PATCH v2 1/2] memory-device: not necessary to
>>>> use goto for the last check
>>>>
>>>> On Thu, Aug 08, 2019 at 01:42:14AM +0000, Zeng, Star wrote:
>>>>>> -----Original Message-----
>>>>>> From: Qemu-devel [mailto:qemu-devel-
>>>>>> bounces+star.zeng=intel.com@nongnu.org] On Behalf Of Wei Yang
>>>>>> Sent: Tuesday, July 30, 2019 8:38 AM
>>>>>> To: qemu-devel@nongnu.org
>>>>>> Cc: imammedo@redhat.com; david@redhat.com; Wei Yang
>>>>>> <richardw.yang@linux.intel.com>; mst@redhat.com
>>>>>> Subject: [Qemu-devel] [PATCH v2 1/2] memory-device: not necessary to
>>>>>> use goto for the last check
>>>>>>
>>>>>> We are already at the last condition check.
>>>>>>
>>>>>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>>>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>  hw/mem/memory-device.c | 1 -
>>>>>>  1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
>>>> index
>>>>>> 5f2c408036..df3261b32a 100644
>>>>>> --- a/hw/mem/memory-device.c
>>>>>> +++ b/hw/mem/memory-device.c
>>>>>> @@ -186,7 +186,6 @@ static uint64_t
>>>>>> memory_device_get_free_addr(MachineState *ms,
>>>>>>      if (!range_contains_range(&as, &new)) {
>>>>>>          error_setg(errp, "could not find position in guest address space for "
>>>>>>                     "memory device - memory fragmented due to alignments");
>>>>>> -        goto out;
>>>>>
>>>>> Is it better to return 0 (or set new_addr to 0) for this error path and another
>>>> remaining "goto out" path?
>>>>>
>>>>
>>>> I may not get your point.
>>>>
>>>> We set errp which is handled in its caller. By doing so, the error is propagated.
>>>>
>>>> Do I miss something?
>>>
>>> Yes, you are right. Currently, the caller is checking errp, but not the returned address, so there should be no issue.
>>> But when you see other error paths, you will find they all return 0. To be aligned (return 0 when error), so just suggest also returning 0 for these two "goto out" error path. :)
>>>
>> 
>> You may have some point.
>> 
>> Let's see whether others have the same taste, or we can refine it separately.
>> 
>
>I don't think that's necessary (callers really should check for errors
>before using the return values), but I would also not object to that change.
>

In case there is no strong requirement to refactor the code. I would leave it
here.

>-- 
>
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

