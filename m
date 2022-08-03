Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0663588546
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 03:05:55 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ2pe-0003iL-TF
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 21:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJ2kW-00080S-QB
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 21:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJ2kS-0000Rr-V5
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 21:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659488431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=siJ+LpUUJpIwKagpm691Cglg3JiFYHwfBgLziBl8+sc=;
 b=hwrwWKdiRhacslUB4GjMExVKPSJLlyGILL4+kJc4CgB/UJmiPjK0lAMyTK32+vbfe67W6k
 ry6QotOzfsv3+0kyGScYaz/65v3BH36o01rj3SyVOjL/EiM1jn/CHRbWF0/rDDdhphpRPQ
 vad+foOo5egW8bE6G/F6xd1sy2J2rA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-M7i9KbLfO065vTtRWgJYLw-1; Tue, 02 Aug 2022 21:00:27 -0400
X-MC-Unique: M7i9KbLfO065vTtRWgJYLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AE69185A7B2;
 Wed,  3 Aug 2022 01:00:27 +0000 (UTC)
Received: from [10.64.54.20] (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3FDC3598B;
 Wed,  3 Aug 2022 01:00:23 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
Date: Wed, 3 Aug 2022 13:01:04 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 8/2/22 7:41 PM, Eric Auger wrote:
> On 8/2/22 08:45, Gavin Shan wrote:
>> There are 3 highmem IO regions as below. They can be disabled in
>> two situations: (a) The specific region is disabled by user. (b)
>> The specific region doesn't fit in the PA space. However, the base
>> address and highest_gpa are still updated no matter if the region
>> is enabled or disabled. It's incorrectly incurring waste in the PA
>> space.
> If I am not wrong highmem_redists and highmem_mmio are not user selectable
> 
> Only highmem ecam depends on machine type & ACPI setup. But I would say
> that in server use case it is always set. So is that optimization really
> needed?

There are two other cases you missed.

- highmem_ecam is enabled after virt-2.12, meaning it stays disabled
   before that.

- The high memory region can be disabled if user is asking large
   (normal) memory space through 'maxmem=' option. When the requested
   memory by 'maxmem=' is large enough, the high memory regions are
   disabled. It means the normal memory has higher priority than those
   high memory regions. This is the case I provided in (b) of the
   commit log.

In the commit log, I was supposed to say something like below for
(a):

- The specific high memory region can be disabled through changing
   the code by user or developer. For example, 'vms->highmem_mmio'
   is changed from true to false in virt_instance_init().

>>
>> Improve address assignment for highmem IO regions to avoid the waste
>> in the PA space by putting the logic into virt_memmap_fits().
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 54 +++++++++++++++++++++++++++++----------------------
>>   1 file changed, 31 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9633f822f3..bc0cd218f9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1688,6 +1688,34 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>       return arm_cpu_mp_affinity(idx, clustersz);
>>   }
>>   
>> +static void virt_memmap_fits(VirtMachineState *vms, int index,
>> +                             bool *enabled, hwaddr *base, int pa_bits)
>> +{
>> +    hwaddr size = extended_memmap[index].size;
>> +
>> +    /* The region will be disabled if its size isn't given */
>> +    if (!*enabled || !size) {
> In which case do you have !size?

Yeah, we don't have !size and the condition should be removed.

>> +        *enabled = false;
>> +        vms->memmap[index].base = 0;
>> +        vms->memmap[index].size = 0;
> It looks dangerous to me to reset the region's base and size like that.
> for instance fdt_add_gic_node() will add dummy data in the dt.

I would guess you missed that the high memory regions won't be exported
through device-tree if they have been disabled. We have a check there,
which is "if (nb_redist_regions == 1)"

>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Check if the memory region fits in the PA space. The memory map
>> +     * and highest_gpa are updated if it fits. Otherwise, it's disabled.
>> +     */
>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
> using a 'fits' local variable would make the code more obvious I think

Lets confirm if you're suggesting something like below?

         bool fits;

         fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));

         if (fits) {
            /* update *base, memory mapping, highest_gpa */
         } else {
            *enabled = false;
         }

I guess we can simply do

         if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
            /* update *base, memory mapping, highest_gpa */
         } else {
            *enabled = false;
         }

Please let me know which one looks best to you.

>> +    if (*enabled) {
>> +        *base = ROUND_UP(*base, size);
>> +        vms->memmap[index].base = *base;
>> +        vms->memmap[index].size = size;
>> +        vms->highest_gpa = *base + size - 1;
>> +
>> +	*base = *base + size;
>> +    }
>> +}
>> +
>>   static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>   {
>>       MachineState *ms = MACHINE(vms);
>> @@ -1744,37 +1772,17 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>       vms->highest_gpa = memtop - 1;
>>   
>>       for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>> -        hwaddr size = extended_memmap[i].size;
>> -        bool fits;
>> -
>> -        base = ROUND_UP(base, size);
>> -        vms->memmap[i].base = base;
>> -        vms->memmap[i].size = size;
>> -
>> -        /*
>> -         * Check each device to see if they fit in the PA space,
>> -         * moving highest_gpa as we go.
>> -         *
>> -         * For each device that doesn't fit, disable it.
>> -         */
>> -        fits = (base + size) <= BIT_ULL(pa_bits);
>> -        if (fits) {
>> -            vms->highest_gpa = base + size - 1;
>> -        }
>> -
> 
> we could avoid running the code below in case highmem is not set. We would need to reset that flags though.
> 

Yeah, I think it's not a big deal. My though is to update the flag in virt_memmap_fits().

>>           switch (i) {
>>           case VIRT_HIGH_GIC_REDIST2:
>> -            vms->highmem_redists &= fits;
>> +            virt_memmap_fits(vms, i, &vms->highmem_redists, &base, pa_bits);
>>               break;
>>           case VIRT_HIGH_PCIE_ECAM:
>> -            vms->highmem_ecam &= fits;
>> +            virt_memmap_fits(vms, i, &vms->highmem_ecam, &base, pa_bits);
>>               break;
>>           case VIRT_HIGH_PCIE_MMIO:
>> -            vms->highmem_mmio &= fits;
>> +            virt_memmap_fits(vms, i, &vms->highmem_mmio, &base, pa_bits);
>>               break;
>>           }
>> -
>> -        base += size;
>>       }
>>   
>>       if (device_memory_size > 0) {

Thanks,
Gavin


