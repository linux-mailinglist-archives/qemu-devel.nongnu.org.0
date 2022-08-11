Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2958F753
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 07:39:42 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM0ux-00007Y-0Y
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 01:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oM0oO-0006TX-Hf
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 01:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oM0oK-0000hP-SK
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 01:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660195966;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHO6M5KdQ9RvAW5WU48T35KaFRI3/56bYTJi+mbOiDo=;
 b=LAePWaeVghPNyw3rd2G0aYOPRnrf7DpeLyUA4qtBcgqkMqrq3eusjHWwxp57MDNgbzykW5
 wokHLIgMdMF9cdHpDWpFEo1wJa5Re2cS1veEgZlwi7c3+mf8Y7NKTYVsdFfinf8MXt+Kbw
 mJgsV3pRyr2lbHg1FLLfST5F3tLI5DY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-BiWHpMA1O9GzmGtToTFzhg-1; Thu, 11 Aug 2022 01:32:43 -0400
X-MC-Unique: BiWHpMA1O9GzmGtToTFzhg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D193F8039A1;
 Thu, 11 Aug 2022 05:32:42 +0000 (UTC)
Received: from [10.64.54.77] (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 572E7492C3B;
 Thu, 11 Aug 2022 05:32:38 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
 <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
 <87fsi7w0vn.wl-maz@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <6669dd3f-c1cd-e3f3-21a7-afab4deb91f5@redhat.com>
Date: Thu, 11 Aug 2022 15:32:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87fsi7w0vn.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Marc,

On 8/8/22 7:17 PM, Marc Zyngier wrote:
> On Wed, 03 Aug 2022 14:02:04 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>> On 8/3/22 5:01 PM, Marc Zyngier wrote:
>>> On Wed, 03 Aug 2022 04:01:04 +0100,
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>>>> two situations: (a) The specific region is disabled by user. (b)
>>>>>> The specific region doesn't fit in the PA space. However, the base
>>>>>> address and highest_gpa are still updated no matter if the region
>>>>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>>>>> space.
>>>>> If I am not wrong highmem_redists and highmem_mmio are not user selectable
>>>>>
>>>>> Only highmem ecam depends on machine type & ACPI setup. But I would say
>>>>> that in server use case it is always set. So is that optimization really
>>>>> needed?
>>>>
>>>> There are two other cases you missed.
>>>>
>>>> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>>>>     before that.
>>>
>>> I don't get this. The current behaviour is to disable highmem_ecam if
>>> it doesn't fit in the PA space. I can't see anything that enables it
>>> if it was disabled the first place.
>>>
>>
>> There are several places or conditions where vms->highmem_ecam can be
>> disabled:
>>
>> - virt_instance_init() where vms->highmem_ecam is inherited from
>>    !vmc->no_highmem_ecam. The option is set to true after virt-2.12
>>    in virt_machine_2_12_options().
>>
>> - machvirt_init() where vms->highmem_ecam can be disable if we have
>>    32-bits vCPUs and failure on loading firmware.
> 
> Right. But at no point do we *enable* something that was disabled
> beforehand, which is how I understood your previous comment.
> 

Sorry for the delay. I think the original changelog is confusing
enough and sorry about it. I will improve it if v2 is needed :)

Yes, we shouldn't assign address to VIRT_HIGH_PCIE_ECAM region
and enable it when vms->highmem_ecam is false in virt_set_memmap().

In the original implementation of virt_set_memmap(), the memory
regioin is disabled when when vms->highmem_ecam is false. However,
the address is still assigned to the memory region, even when
vms->highmem_ecam is false. This leads to waste in the PA space.

In hw/arm/virt.c::virt_set_memmap(), @base is always added with
the memory region size, even the memory region has been disabled.

     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
         hwaddr size = extended_memmap[i].size;
         bool fits;

         base = ROUND_UP(base, size);               /* The roundup isn't necessary for disabled region */
         vms->memmap[i].base = base;
         vms->memmap[i].size = size;

          :
          :

         base += size;                              /* The increment isn't necessary for disabled region */
     }

>>
>> - Another place is where we're talking about. It's address assignment
>>    to fit the PA space.
> 
> Alignment? No, the alignment is cast into stone: it is set to the
> smallest power-of-two containing the region (natural alignment).
> 

Nope, I was talking about address assignment, instead of address
alignment. Lets have an example here to explain. For example,
we have following capability and user's command lines. In this
specific example, the memory layout is something like below:

     PA space limit:            40 bits (1TB)
     user's command line:       -m 1GB,maxmem=1019G,slots=4

     VIRT_MEM region start:     1GB
     VIRT_MEM region end:       2GB
     device_memory_base:        2GB                               // in virt_set_memmap()
     device_memory_size:     1022GB    (end at 1024GB)            // in virt_set_memmap()
     
All the high memory regions won't be enabled because we don't
have more free areas in the PA space. In virt_set_memmap(),
@base is still increased by the region's size, as said above.


>>
>>>>
>>>> - The high memory region can be disabled if user is asking large
>>>>     (normal) memory space through 'maxmem=' option. When the requested
>>>>     memory by 'maxmem=' is large enough, the high memory regions are
>>>>     disabled. It means the normal memory has higher priority than those
>>>>     high memory regions. This is the case I provided in (b) of the
>>>>     commit log.
>>>
>>> Why is that a problem? It matches the expected behaviour, as the
>>> highmem IO region is floating and is pushed up by the memory region.
>>>
>>
>> Eric thought that VIRT_HIGH_GIC_REDIST2 and VIRT_HIGH_PCIE_MMIO regions
>> aren't user selectable. I tended to explain why it's not true. 'maxmem='
>> can affect the outcome. When 'maxmem=' value is big enough, there will be
>> no free area in the PA space to hold those two regions.
> 
> Right, that's an interesting point. This is a consequence of these
> upper regions floating above RAM.
> 

Yep, it's fine for those high memory region floating above RAM, and to
disable them if we run out of PA space. Something may be irrelevant
to this topic: VIRT_HIGH_PCIE_MMIO region has 512GB, which is huge one.
It may be nice to fall back smaller sizes when we're having tight PA
space. For example, we can fall back to try 256GB if 512GB doesn't fit
into the PA space.

However, I'm not sure how we had the size (512GB) for the region. Are
there practical factors why we need a 512GB PCIe 64-bits MMIO space?

>>
>>>>
>>>> In the commit log, I was supposed to say something like below for
>>>> (a):
>>>>
>>>> - The specific high memory region can be disabled through changing
>>>>     the code by user or developer. For example, 'vms->highmem_mmio'
>>>>     is changed from true to false in virt_instance_init().
>>>
>>> Huh. By this principle, the user can change anything. Why is it
>>> important?
>>>
>>
>> Still like above. I was explaining the possible cases where those
>> 3 switches can be turned on/off by users or developers. Our code
>> needs to be consistent and comprehensive.
>>
>>    vms->highmem_redists
>>    vms->highmem_ecam
>>    vms->mmio
>>
>>>>
>>>>>>
>>>>>> Improve address assignment for highmem IO regions to avoid the waste
>>>>>> in the PA space by putting the logic into virt_memmap_fits().
>>>
>>> I guess that this is what I understand the least. What do you mean by
>>> "wasted PA space"? Either the regions fit in the PA space, and
>>> computing their addresses in relevant, or they fall outside of it and
>>> what we stick in memap[index].base is completely irrelevant.
>>>
>>
>> It's possible that we run into the following combination. we should
>> have enough PA space to enable VIRT_HIGH_PCIE_MMIO region. However,
>> the region is disabled in the original implementation because
>> VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} regions consumed 1GB, which is
>> unecessary and waste in the PA space.
>>
>>      static MemMapEntry extended_memmap[] = {
>>          [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
>>          [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>>          [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>>      };
>>
>>      IPA_LIMIT           = (1UL << 40)
>>      '-maxmem'           = 511GB              /* Memory starts from 1GB */
>>      '-slots'            = 0
>>      vms->highmem_rdist2 = false
>>      vms->highmem_ecam   = false
>>      vms->highmem_mmio   = true
>>
> 
> Sure. But that's not how QEMU works today, and these regions are
> enabled in order (though it could well be that my recent changes have
> made the situation more complicated).
> 
> What you're suggesting is a pretty radical change in the way the
> memory map is set. My hunch is that allowing the highmem IO regions to
> be selectively enabled and allowed to float in the high IO space
> should come as a new virt machine revision, with user-visible options.
> 

Yeah, These regions are enabled in order. It also means they have ascending
priorities. In other words, '-maxmem' has higher priority than those 3 high
memory regions.

My suggested code changes just improve the address assignment for these 3
high memory regions, without changing the mechanism fundamentally. The
intention of the proposed changes are like below.

- In virt_set_memmap(), don't assign address for one specific high memory
   region if it has been disabled.

- Put the logic into standalone helper, to simplify the code.

I'm not sure about the user-visible options. I would say it's going to
increase user's load. I means the user experience will be degraded.
Those user-visible options needs to be worried by users :)

Marc, lets improve the changelog and the code changes in v2, to seek
your comments if you agree? :)

Thanks,
Gavin




