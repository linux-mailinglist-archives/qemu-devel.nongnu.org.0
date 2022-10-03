Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E695F392E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:37:49 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofU4K-0000HS-1X
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofTl5-0006Qn-0o
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 18:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofTl1-0006rP-Fb
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 18:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664835468;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eX1OAoJhOSbGIRBUThFxRfIRipRwpCyc6gf9+ePOUH8=;
 b=IwriGKbbb14cs8kQ+9JZCpO9Gxil/zQuGyfpALSO3j+njaJNfNL/nuF3lPOwjlYH82YIXF
 FywGrCuXRL7HxyPkVlqEIZVbeSvtkzG1qr3OmgBjEyU9RoW5HisDJz0lxXs80OllY/2TIC
 DCTK1J+JXPiWISydx7DYNFiGXXLW1v8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-oQrCqSfSOu69RECMsuLk0w-1; Mon, 03 Oct 2022 18:17:45 -0400
X-MC-Unique: oQrCqSfSOu69RECMsuLk0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F4CC85C1D1;
 Mon,  3 Oct 2022 22:17:45 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FB3340C6EC2;
 Mon,  3 Oct 2022 22:17:41 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] hw/arm/virt: Improve high memory region address
 assignment
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-5-gshan@redhat.com>
 <6c9a644a-6add-af29-8463-eddb101c1c99@redhat.com>
 <580f5f69-d794-3792-2c99-5cb367a5e8c0@redhat.com>
 <8ff4a537-3050-7c28-4f2d-8e1771e1e3a4@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b6447520-7642-503b-1565-37fcfe633d0f@redhat.com>
Date: Tue, 4 Oct 2022 06:17:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <8ff4a537-3050-7c28-4f2d-8e1771e1e3a4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/3/22 4:44 PM, Eric Auger wrote:
> On 9/29/22 01:37, Gavin Shan wrote:
>> On 9/28/22 10:51 PM, Eric Auger wrote:
>>> On 9/22/22 01:13, Gavin Shan wrote:
>>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>>> are floating on highest RAM address. However, they can be disabled
>>>> in several cases.
>>>>
>>>> (1) One specific high memory region is disabled by developer by
>>>>       toggling vms->highmem_{redists, ecam, mmio}.
>>>>
>>>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>>       'virt-2.12' or ealier than it.
>>>>
>>>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>>       on 32-bits system.
>>>>
>>>> (4) One specific high memory region is disabled when it breaks the
>>>>       PA space limit.
>>>>
>>>> The current implementation of virt_set_memmap() isn't comprehensive
>>>> because the space for one specific high memory region is always
>>>> reserved from the PA space for case (1), (2) and (3). In the code,
>>>> 'base' and 'vms->highest_gpa' are always increased for those three
>>>> cases. It's unnecessary since the assigned space of the disabled
>>>> high memory region won't be used afterwards.
>>>>
>>>> This improves the address assignment for those three high memory
>>>> region by skipping the address assignment for one specific high
>>>> memory region if it has been disabled in case (1), (2) and (3).
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/virt.c | 44 ++++++++++++++++++++++++++------------------
>>>>    1 file changed, 26 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index b0b679d1f4..b702f8f2b5 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1693,15 +1693,31 @@ static void
>>>> virt_set_high_memmap(VirtMachineState *vms,
>>>>                                     hwaddr base, int pa_bits)
>>>>    {
>>>>        hwaddr region_base, region_size;
>>>> -    bool fits;
>>>> +    bool *region_enabled, fits;
>>> IDo you really need a pointer? If the region is unknown this is a bug in
>>> virt code.
>>
>> The pointer is needed so that we can disable the region by setting
>> 'false'
>> to it at later point. Yeah, I think you're correct that 'unknown region'
>> is a bug and we need to do assert(region_enabled), or something like
>> below.
> Yeah I don't think using a pointer here is useful.

When the high memory region can't fit into the PA space, it is disabled
by toggling the corresponding flag (vms->highmem_{redists, ecam, mmio})
to false. It's part of the original implementation, as below. We either
need a 'switch ... case' or a pointer. A pointer is more convenient since
we need check and possibly update to the value.

        switch (i) {
         case VIRT_HIGH_GIC_REDIST2:
             vms->highmem_redists &= fits;
             break;
         case VIRT_HIGH_PCIE_ECAM:
             vms->highmem_ecam &= fits;
             break;
         case VIRT_HIGH_PCIE_MMIO:
             vms->highmem_mmio &= fits;
             break;
         }

>>
>>>>        int i;
>>>>          for (i = VIRT_LOWMEMMAP_LAST; i <
>>>> ARRAY_SIZE(extended_memmap); i++) {
>>>>            region_base = ROUND_UP(base, extended_memmap[i].size);
>>>>            region_size = extended_memmap[i].size;
>>>>    -        vms->memmap[i].base = region_base;
>>>> -        vms->memmap[i].size = region_size;
>>>> +        switch (i) {
>>>> +        case VIRT_HIGH_GIC_REDIST2:
>>>> +            region_enabled = &vms->highmem_redists;
>>>> +            break;
>>>> +        case VIRT_HIGH_PCIE_ECAM:
>>>> +            region_enabled = &vms->highmem_ecam;
>>>> +            break;
>>>> +        case VIRT_HIGH_PCIE_MMIO:
>>>> +            region_enabled = &vms->highmem_mmio;
>>>> +            break;
>>> While we are at it I would change the vms fields dealing with those
>>> highmem regions and turn those fields into an array of bool indexed
>>> using i - VIRT_LOWMEMMAP_LAST (using a macro or something alike). We
>>> would not be obliged to have this switch, now duplicated.
>>
>> It makes sense to me. How about to have something like below in v4?
>>
>> static inline bool *virt_get_high_memmap_enabled(VirtMachineState
>> *vms, int index)
>> {
>>      bool *enabled_array[] = {
>>            &vms->highmem_redists,
>>            &vms->highmem_ecam,
>>            &vms->highmem_mmio,
>>      };
>>
>>      assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
>>
>>      return enabled_array[index - VIRT_LOWMEMMAP_LAST];
>> }
> I was rather thinking as directly using a vms->highmem_flags[] but your
> proposal may work as well.

Ok. I will use my proposed change in next revision.

>>
>>>> +        default:
>>>> +            region_enabled = NULL;
>>>> +        }
>>>> +
>>>> +        /* Skip unknown region */
>>>> +        if (!region_enabled) {
>>>> +            continue;
>>>> +        }
>>>>              /*
>>>>             * Check each device to see if they fit in the PA space,
>>>> @@ -1710,23 +1726,15 @@ static void
>>>> virt_set_high_memmap(VirtMachineState *vms,
>>>>             * For each device that doesn't fit, disable it.
>>>>             */
>>>>            fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>>>> -        if (fits) {
>>>> -            vms->highest_gpa = region_base + region_size - 1;
>>>> -        }
>>>> +        if (*region_enabled && fits) {
>>>> +            vms->memmap[i].base = region_base;
>>>> +            vms->memmap[i].size = region_size;
>>>>    -        switch (i) {
>>>> -        case VIRT_HIGH_GIC_REDIST2:
>>>> -            vms->highmem_redists &= fits;
>>>> -            break;
>>>> -        case VIRT_HIGH_PCIE_ECAM:
>>>> -            vms->highmem_ecam &= fits;
>>>> -            break;
>>>> -        case VIRT_HIGH_PCIE_MMIO:
>>>> -            vms->highmem_mmio &= fits;
>>>> -            break;
>>>> +            vms->highest_gpa = region_base + region_size - 1;
>>>> +            base = region_base + region_size;
>>>> +        } else {
>>>> +            *region_enabled = false;
> what's the purpose to update the region_enabled here? Is it used anywhere?
> 
> The fact you do not update vms->highmem_* flags may introduce
> regressions I think as the resulting flag may be used in some places
> such as:
> virt_gicv3_redist_region_count().
> 

'region_enabled' points to 'vms->highmem_{redist2, ecam, mmio}'. They
are same thing.

>>>> -
>>>> -        base = region_base + region_size;
>>>>        }
>>>>    }
>>>>    

Thanks,
Gavin


