Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7885FBE2C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 01:09:38 +0200 (CEST)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiONV-0001yL-DS
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 19:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOL1-00085a-Q8
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 19:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOKy-00051g-GN
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 19:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665529619;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=diqwjVVZzlldCiXSMcGCpovutdly8AtP+B7OZc7bvh0=;
 b=bFnhN40SzLoVHfZvFNSHDI4HrlaFCoyj4k0u4MBiTM2gapRRxv7wZEh5C6j7s0abv8I6uy
 GygSyFg247P0j7IoKjmWeBx+FhzYBo565tlovMHmpU4eLs6aKv+yX3jvk3/ZAF7/ijSc7i
 FgoarzDAjixGI4PalG3C4EEYPQnwxLU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-UDtMRY26P-is9JTcsqDI4A-1; Tue, 11 Oct 2022 19:06:56 -0400
X-MC-Unique: UDtMRY26P-is9JTcsqDI4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4AF811E81;
 Tue, 11 Oct 2022 23:06:55 +0000 (UTC)
Received: from [10.64.54.52] (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6626C40C6FA0;
 Tue, 11 Oct 2022 23:06:52 +0000 (UTC)
Subject: Re: [PATCH v4 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
To: eric.auger@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-5-gshan@redhat.com> <87edvnooqb.fsf@redhat.com>
 <a4bb90c8-3793-23ec-79a6-edf44565c8ff@redhat.com>
 <5d804a6b-c55d-8a7b-415b-dadf807152fa@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <8e50093c-f2ee-f4b2-8caf-08412ceb847d@redhat.com>
Date: Wed, 12 Oct 2022 07:06:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <5d804a6b-c55d-8a7b-415b-dadf807152fa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/12/22 12:45 AM, Eric Auger wrote:
> On 10/5/22 00:47, Gavin Shan wrote:
>> On 10/4/22 6:41 PM, Cornelia Huck wrote:
>>> On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>>> This introduces virt_get_high_memmap_enabled() helper, which returns
>>>> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
>>>> be used in the subsequent patches.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/virt.c | 30 +++++++++++++++++-------------
>>>>    1 file changed, 17 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index b0b679d1f4..59de7b78b5 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1689,14 +1689,29 @@ static uint64_t
>>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>        return arm_cpu_mp_affinity(idx, clustersz);
>>>>    }
>>>>    +static inline bool *virt_get_high_memmap_enabled(VirtMachineState
>>>> *vms,
>>>> +                                                 int index)
>>>> +{
>>>> +    bool *enabled_array[] = {
>>>> +        &vms->highmem_redists,
>>>> +        &vms->highmem_ecam,
>>>> +        &vms->highmem_mmio,
>>>> +    };
>>>> +
>>>> +    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
>>>
>>> I wonder whether we want an assert(ARRAY_SIZE(extended_memmap) ==
>>> ARRAY_SIZE(enabled_array))? IIUC, we never want those two to get out of
>>> sync?
>>>
>>
>> Yeah, It makes sense to ensure both arrays synchronized. I will add
>> the extra check in next respin.
> 
> With Connie's suggestion this looks good to me.
> 

What we need is actually like below because the array (extended_memmap)
starts from VIRT_LOWMEMMAP_LAST instead of zero. I'm adding the extra
check into v5, which will be posted shortly.

    assert(ARRAY_SIZE(extended_memmap) - VIRT_LOWMEMMAP_LAST ==
           ARRAY_SIZE(enabled_array));

>>
>>>> +
>>>> +    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
>>>> +}
>>>> +

Thanks,
Gavin


