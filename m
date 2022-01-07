Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C94487B3D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:16:56 +0100 (CET)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5srH-00015T-9e
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:16:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n5spr-0008Dt-R4
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n5spo-0006fu-DO
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641575723;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vsOOMP2jOzKaAjizeC5l39pTNWtPs1ir1jcXzS/usA=;
 b=dGZ2Q7M/1OrdNTmqtZsWS4iFEjCQPsv06nwDEDeMXm+LlsQaJufyd6vgOpP4NhzM227wq/
 e+U9y1snbwTiInQzuVHANkCkl+K4zgQ9Mj8aqF7n2SDSQ81JGc1oXKhuSExFKv+AJmgSrC
 6lBRzW4qlcHuHpMLDjwfKFKJlwm2zKU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-TBaEIcekObq9erzV_U7BBw-1; Fri, 07 Jan 2022 12:15:22 -0500
X-MC-Unique: TBaEIcekObq9erzV_U7BBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so1140765wml.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4vsOOMP2jOzKaAjizeC5l39pTNWtPs1ir1jcXzS/usA=;
 b=V1ZNGpLgxANDGHgDwcbhScmIAUiejFdGyyvHdAE3ppp0WXqf4VOGGFeYXfbqLVDmSd
 Tpf8Yrg36kgjTbtnbp5jiE06x+5nFJXzMOYdCmiPiXGCNzH/LorFKFUGcrLGi9UFLu2x
 2aWNhjqG6Yrss4a5Wzoqms+xmhjiXlALzDqfDwXKnbUi5FO0Nmoy4hvSyxezzqEIgyoY
 FH9SUdCcJzpoKmhFB7K7B2ELURzb/JoQAIPVzDcbON42xoZKNob8THEQUYA5Yxftp4Lf
 IMvVvZOz4iE8Hw0zIoiuKIJ4W7//A3nYurmAs8CCaoYiOZ8eixyaVclBE22ARC+CcNgE
 uWPQ==
X-Gm-Message-State: AOAM531/UQYbyA/HVsZMfv9gR44EwPSAImtsEn1cpZLrqz6yYz7QLWTW
 WJyARJBLiFl9cxy43fL0ZiM7d8c7NpXBrrDYQFITg7ahx67euhvV/QSxNo3FzvkfBuqoHnmb4fj
 7VqFBxCyb3p2+x0I=
X-Received: by 2002:a5d:6483:: with SMTP id o3mr58268898wri.101.1641575721114; 
 Fri, 07 Jan 2022 09:15:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8r1YuVw97cm+4Ci+idvC+xsdVFCO7vo+Z/vxPfFrHtrqAw3arjPJQbNKCupw6ctQsN426gQ==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr58268875wri.101.1641575720919; 
 Fri, 07 Jan 2022 09:15:20 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y15sm1351601wmi.40.2022.01.07.09.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 09:15:20 -0800 (PST)
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Marc Zyngier <maz@kernel.org>
References: <20211227211642.994461-1-maz@kernel.org>
 <20211227211642.994461-4-maz@kernel.org>
 <ef8b3500-04ab-5434-6a04-0e8b1dcc65d1@redhat.com>
 <871r1kzhbp.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d330de15-b452-1f9c-14fa-906b88a8b4c4@redhat.com>
Date: Fri, 7 Jan 2022 18:15:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <871r1kzhbp.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/6/22 10:26 PM, Marc Zyngier wrote:
> On Wed, 05 Jan 2022 09:22:39 +0000,
> Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Marc,
>>
>> On 12/27/21 10:16 PM, Marc Zyngier wrote:
>>> Even when the VM is configured with highmem=off, the highest_gpa
>>> field includes devices that are above the 4GiB limit.
>>> Similarily, nothing seem to check that the memory is within
>>> the limit set by the highmem=off option.
>>>
>>> This leads to failures in virt_kvm_type() on systems that have
>>> a crippled IPA range, as the reported IPA space is larger than
>>> what it should be.
>>>
>>> Instead, honor the user-specified limit to only use the devices
>>> at the lowest end of the spectrum, and fail if we have memory
>>> crossing the 4GiB limit.
>>>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> ---
>>>  hw/arm/virt.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 8b600d82c1..84dd3b36fb 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1678,6 +1678,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>>>          exit(EXIT_FAILURE);
>>>      }
>>>  
>>> +    if (!vms->highmem &&
>>> +        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
>>> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
>>> +        exit(EXIT_FAILURE);
>> The memory is composed of initial memory and device memory.
>> device memory is put after the initial memory but has a 1GB alignment
>> On top of that you have 1G page alignment per device memory slot
>>
>> so potentially the highest mem address is larger than
>> vms->memmap[VIRT_MEM].base + ms->maxram_size.
>> I would rather do the check on device_memory_base + device_memory_size
> Yup, that's a good point.
>
> There is also a corner case in one of the later patches where I check
> this limit against the PA using the rounded-up device_memory_size.
> This could result in returning an error if the last memory slot would
> still fit in the PA space, but the rounded-up quantity wouldn't. I
> don't think it matters much, but I'll fix it anyway.
>
>>> +    }
>>>      /*
>>>       * We compute the base of the high IO region depending on the
>>>       * amount of initial and device memory. The device memory start/size
>>> @@ -1707,7 +1712,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>>>          vms->memmap[i].size = size;
>>>          base += size;
>>>      }
>>> -    vms->highest_gpa = base - 1;
>>> +    vms->highest_gpa = (vms->highmem ?
>>> +                        base :
>>> +                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
>> As per the previous comment this looks wrong to me if !highmem.
> Agreed.
>
>> If !highmem, if RAM requirements are low we still could get benefit from
>> REDIST2 and HIGH ECAM which could fit within the 4GB limit. But maybe we
>> simply don't care?
> I don't see how. These devices live at a minimum of 256GB, which
> contradicts the very meaning of !highmem being a 4GB limit.
Yes I corrected the above statement afterwards, sorry for the noise.
>
>> If we don't, why don't we simply skip the extended_memmap overlay as
>> suggested in v2? I did not get your reply sorry.
> Because although this makes sense if you only care about a 32bit
> limit, we eventually want to check against an arbitrary PA limit and
> enable the individual devices that do fit in that space.

In my understanding that is what virt_kvm_type() was supposed to do by
testing the result of kvm_arm_get_max_vm_ipa_size and requested_pa_size
(which accounted the high regions) and exiting if they were
incompatible. But I must miss something.
>
> In order to do that, we need to compute the base addresses for these
> extra devices. Also, computing 3 base addresses isn't going to be
> massively expensive.
>
> Thanks,
>
> 	M.
>
Eric


