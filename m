Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C896A54F6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:59:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvpB-0001QG-1y; Tue, 28 Feb 2023 03:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWvp8-0001Q4-Do
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWvp3-0003uE-Va
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677574736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNSRaOa+rlBBHSHTwQdbcLcB1XGQTlSqNnBDj0b7BRk=;
 b=Lf8RSG/3aJ4/3TZYPGKyoJO8f68PrptNvks6m9dbhPHzpQEFjoEIr47jD2YMnZtMKbX32Y
 jA0aTyYGGEJzcvIFclR20F1xeeaGic9YxCdUQwSxnbTIxF9/fbPOIfDQtSX8ffLvecEcF9
 mQx1mTyJoJTOKb0+xrznC7TWtyMZKBg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-zRPiWQnBNfOWsEacSEfIsg-1; Tue, 28 Feb 2023 03:58:55 -0500
X-MC-Unique: zRPiWQnBNfOWsEacSEfIsg-1
Received: by mail-wr1-f69.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so1369743wrb.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 00:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNSRaOa+rlBBHSHTwQdbcLcB1XGQTlSqNnBDj0b7BRk=;
 b=dWZKLYJko54dEAGCkWZpPvs/XOTfN1sVvBzBFUiuO2FOZzLVOVxRVOV6xTPNhuW60S
 uMGueoxm6nyE0cP7k4AmQV2N5qRrYUfbT/UCdmFwo4itJCWejIVWFgU5++F+D+XfkrW6
 6+BlwTobTjB4SbfDtSD/POPmUyk0h6y5sYqj1arckQf3p3O64eV0PmYb2okZRJl2Z/Y+
 vWmt4JP5zgCMCkcGkkojnDevBEYEIjZQ8CI9a4u9UDw4sN+ys2A2ZmDvZCsSrGBEQLV4
 UbEtfhvl4h6YKifElxITV85t/JJi3jNF/FPh+Tz+f7L0PbEHNh7A6VvjHqwYQh9JO41T
 MvPA==
X-Gm-Message-State: AO0yUKVMD2y+FWh1Eg/kVRtVEaGPz6RME8s0wYbEHf9QWm/5tvHZ8eLy
 k1M/ABCiqruhu4PfSBwztFOLawxBWP5tsYsbHOt7mu8u/Y0lAJvpDY4fr0pBycuy/R3myzT4LvH
 gbgl8wJf4lpfl6RQ=
X-Received: by 2002:a05:600c:44d4:b0:3eb:29fe:7baa with SMTP id
 f20-20020a05600c44d400b003eb29fe7baamr1534979wmo.34.1677574734268; 
 Tue, 28 Feb 2023 00:58:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+nwpthjMZ7COltEjEzePKAhkP21KqFqmxAioVvbVH4P5kdiOYErvp8tKqnzIpHciM7TJoeog==
X-Received: by 2002:a05:600c:44d4:b0:3eb:29fe:7baa with SMTP id
 f20-20020a05600c44d400b003eb29fe7baamr1534964wmo.34.1677574733859; 
 Tue, 28 Feb 2023 00:58:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac?
 (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de.
 [2003:cb:c706:b800:3757:baed:f95e:20ac])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm16381438wmq.29.2023.02.28.00.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 00:58:53 -0800 (PST)
Message-ID: <0bba1105-e576-5037-2158-79c00440606b@redhat.com>
Date: Tue, 28 Feb 2023 09:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] virtio-balloon: optimize the virtio-balloon on the ARM
 platform.
To: "Michael S. Tsirkin" <mst@redhat.com>, Yangming <yangming73@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <264b6cc6a74945c3b5214fa4e8f099fe@huawei.com>
 <20230228035341-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230228035341-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28.02.23 09:56, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 03:26:56AM +0000, Yangming wrote:
>>>> Optimize the virtio-balloon feature on the ARM platform by adding a
>>>> variable to keep track of the current hot-plugged pc-dimm size,
>>>> instead of traversing the virtual machine's memory modules to count
>>>> the current RAM size during the balloon inflation or deflation
>>>> process. This variable can be updated only when plugging or unplugging
>>>> the device, which will result in an increase of approximately 60%
>>>> efficiency of balloon process on the ARM platform.
>>>>
>>>> We tested the total amount of time required for the balloon inflation
>>> process on ARM:
>>>> inflate the balloon to 64GB of a 128GB guest under stress.
>>>> Before: 102 seconds
>>>> After: 42 seconds
>>>>
>>>> Signed-off-by: Qi Xi <xiqi2@huawei.com>
>>>> Signed-off-by: Ming Yang yangming73@huawei.com
>>>> ---
>>>>    hw/mem/pc-dimm.c           |  2 ++
>>>>    hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>>>>    include/hw/boards.h        |  1 +
>>>>    3 files changed, 8 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c index
>>>> 50ef83215c..192fc7922c 100644
>>>> --- a/hw/mem/pc-dimm.c
>>>> +++ b/hw/mem/pc-dimm.c
>>>> @@ -81,6 +81,7 @@ void pc_dimm_plug(PCDIMMDevice *dimm,
>>> MachineState
>>>> *machine)
>>>>
>>>>        memory_device_plug(MEMORY_DEVICE(dimm), machine);
>>>>        vmstate_register_ram(vmstate_mr, DEVICE(dimm));
>>>> +    machine->device_memory->dimm_size += vmstate_mr->size;
>>>>    }
>>>>
>>>>    void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>>> @@
>>>> -90,6 +91,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm,
>>> MachineState
>>>> *machine)
>>>>
>>>>        memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>>>>        vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
>>>> +    machine->device_memory->dimm_size -= vmstate_mr->size;
>>>>    }
>>>
>>> Ahh, missed that my previous comment was not addressed: we only want to
>>> track "real" DIMMs, not NVDIMMs.
>>>
>>> --
>>> Thanks,
>>>
>>> David / dhildenb
>>
>> Optimize the virtio-balloon feature on the ARM platform by adding
>> a variable to keep track of the current hot-plugged pc-dimm size,
>> instead of traversing the virtual machine's memory modules to count
>> the current RAM size during the balloon inflation or deflation
>> process. This variable can be updated only when plugging or unplugging
>> the device, which will result in an increase of approximately 60%
>> efficiency of balloon process on the ARM platform.
>>
>> We tested the total amount of time required for the balloon inflation process on ARM:
>> inflate the balloon to 64GB of a 128GB guest under stress.
>> Before: 102 seconds
>> After: 42 seconds
>>
>> Signed-off-by: Qi Xi <xiqi2@huawei.com>
>> Signed-off-by: Ming Yang yangming73@huawei.com
>> ---
>>   hw/mem/pc-dimm.c           |  8 ++++++++
>>   hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>>   include/hw/boards.h        |  1 +
>>   3 files changed, 14 insertions(+), 28 deletions(-)
>>
>> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
>> index 50ef83215c..2107615016 100644
>> --- a/hw/mem/pc-dimm.c
>> +++ b/hw/mem/pc-dimm.c
>> @@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>>   
>>       memory_device_plug(MEMORY_DEVICE(dimm), machine);
>>       vmstate_register_ram(vmstate_mr, DEVICE(dimm));
>> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM);
>> +    if (!is_nvdimm) {
>> +        machine->device_memory->dimm_size += vmstate_mr->size;
>> +    }
>>   }
>>   
>>   void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>> @@ -90,6 +94,10 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>>   
>>       memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>>       vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
>> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM);
>> +    if (!is_nvdimm) {
>> +        machine->device_memory->dimm_size -= vmstate_mr->size;
>> +    }
>>   }
>>
> 
> add comments here explaining why are nvdimms excluded?
>    

I really prefer to avoid mixing declaration and initialization where it 
an be avoided.

Further, the local variable can be easily avoided completely.

if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM))

With that and with the other comments addressed

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


