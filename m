Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDFE85806
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 04:14:27 +0200 (CEST)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvXwg-0007O0-3v
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 22:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hvXwB-0006zL-2G
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 22:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hvXwA-0008Ts-5n
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 22:13:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:38439)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hvXw9-0008Tj-Uc
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 22:13:54 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 19:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="258568241"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 07 Aug 2019 19:13:51 -0700
Date: Thu, 8 Aug 2019 10:13:29 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Zeng, Star" <star.zeng@intel.com>
Message-ID: <20190808021329.GC26938@richard>
References: <20190730003740.20694-1-richardw.yang@linux.intel.com>
 <20190730003740.20694-2-richardw.yang@linux.intel.com>
 <0C09AFA07DD0434D9E2A0C6AEB0483104038F59D@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0C09AFA07DD0434D9E2A0C6AEB0483104038F59D@shsmsx102.ccr.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
 "david@redhat.com" <david@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 08, 2019 at 01:42:14AM +0000, Zeng, Star wrote:
>> -----Original Message-----
>> From: Qemu-devel [mailto:qemu-devel-
>> bounces+star.zeng=intel.com@nongnu.org] On Behalf Of Wei Yang
>> Sent: Tuesday, July 30, 2019 8:38 AM
>> To: qemu-devel@nongnu.org
>> Cc: imammedo@redhat.com; david@redhat.com; Wei Yang
>> <richardw.yang@linux.intel.com>; mst@redhat.com
>> Subject: [Qemu-devel] [PATCH v2 1/2] memory-device: not necessary to use
>> goto for the last check
>> 
>> We are already at the last condition check.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> ---
>>  hw/mem/memory-device.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c index
>> 5f2c408036..df3261b32a 100644
>> --- a/hw/mem/memory-device.c
>> +++ b/hw/mem/memory-device.c
>> @@ -186,7 +186,6 @@ static uint64_t
>> memory_device_get_free_addr(MachineState *ms,
>>      if (!range_contains_range(&as, &new)) {
>>          error_setg(errp, "could not find position in guest address space for "
>>                     "memory device - memory fragmented due to alignments");
>> -        goto out;
>
>Is it better to return 0 (or set new_addr to 0) for this error path and another remaining "goto out" path?
>

I may not get your point.

We set errp which is handled in its caller. By doing so, the error is
propagated.

Do I miss something?

>
>Thanks,
>Star
>
>>      }
>>  out:
>>      g_slist_free(list);
>> --
>> 2.17.1
>> 

-- 
Wei Yang
Help you, Help me

