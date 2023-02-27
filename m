Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE946A3E3C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZim-0006dY-7u; Mon, 27 Feb 2023 04:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWZid-0006bM-Ne
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:22:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWZib-0005Ey-NP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677489768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5xRX5k5TZ4PB5cMNuXQUuu9yDZHDofkagmNj3wfO/A=;
 b=Bd9NQugkD9LQSmeW+BusLi9c+ipZlVmfEoTQMJyyWVnjfBCO8M+mfH4Nm956qZJM4534vs
 quKnYppsvn8fRb5YSAVd2Wdg8IXLXkfq3nWQlAVbY7YwyDQfCM99hdEt4CECCRoCSBDgmE
 kC7+j0sBe946dwiI4I9gjYhS+0+btoo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-VxN7iP0wPtyWuTFgEG6ZvA-1; Mon, 27 Feb 2023 04:22:46 -0500
X-MC-Unique: VxN7iP0wPtyWuTFgEG6ZvA-1
Received: by mail-wr1-f69.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so417307wrz.18
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5xRX5k5TZ4PB5cMNuXQUuu9yDZHDofkagmNj3wfO/A=;
 b=KhJfYRxMbyo7r8vHWaCW8/ZU+NQjboevS3pJ/rrCyDB0yiVsFyVRbYWFdpqFsTCu1K
 T77uX3ZSw85UXYvizi4kC8zCkVbuelTEfC2JzUswv717Z+xS0Fl50oF+QVmPG8MKrHzt
 aOCnZMiR7MLZ+wyP1SZ6bgtRGPzvvPQIyWM2EI29D1zINYrOdzcZ6kDxpeCi9lAedch3
 awx8u+0Rl/Z8vCCTINETZ48st6xj4IizuBdJ9/FcAqiFRH2b45S2pskFI7FNzjR9RgEV
 JZKCqUiLBMY7JaPRA5BfnA3hxQkRRd+3+JWakh8zFNu4o/1e7rMXG7eZXWmBoLo4ynPR
 JSgA==
X-Gm-Message-State: AO0yUKWk9+4DA8+T6vPSdGy+tMmw4O4DJgKeoGr+iVJuMnUeilBp3uca
 d3MbHM2RWTdYTvQ+Qw4UY2u48YVHvngLe43sRUsGlR+Lp9hH62YauxpaAynA5TRmtUYkKvaLtMk
 N1uebHmD4B+wkZa0=
X-Received: by 2002:adf:d1ef:0:b0:2c3:f79a:7319 with SMTP id
 g15-20020adfd1ef000000b002c3f79a7319mr7113541wrd.17.1677489765590; 
 Mon, 27 Feb 2023 01:22:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8fmSuhuwryO3LNfN7xIn9C5f/t4mRpg7/ypNd+UdheAwXdQC8IVHdmE0IIuwrfY8kguC5FhQ==
X-Received: by 2002:adf:d1ef:0:b0:2c3:f79a:7319 with SMTP id
 g15-20020adfd1ef000000b002c3f79a7319mr7113520wrd.17.1677489765187; 
 Mon, 27 Feb 2023 01:22:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:1f00:7816:2307:5967:2228?
 (p200300cbc7031f007816230759672228.dip0.t-ipconnect.de.
 [2003:cb:c703:1f00:7816:2307:5967:2228])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adff209000000b002c3e3ee7d1asm6745104wro.79.2023.02.27.01.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:22:44 -0800 (PST)
Message-ID: <336a4051-8f23-f6fa-d481-39c47b8bf5cf@redhat.com>
Date: Mon, 27 Feb 2023 10:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Reply: [PATCH] virtio-balloon: optimize the virtio-balloon on the
 ARM platform.
To: Yangming <yangming73@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <6d5f8a599b6a41de8885434e6bb91c9a@huawei.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <6d5f8a599b6a41de8885434e6bb91c9a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27.02.23 02:25, Yangming wrote:
> 
> 
>> On Fri, Feb 24, 2023 at 08:23:40AM +0000, Yangming wrote:
>>>
>>> Optimize the virtio-balloon feature on the ARM platform by adding a
>> variable to keep track of the current hot-plugged pc-dimm size, instead of
>> traversing the virtual machine's memory modules to count the current RAM
>> size during the balloon inflation or deflation process. This variable can be
>> updated only when plugging or unplugging the device, which will result in an
>> increase of more than 60% efficiency of balloon process on the ARM platform.
>>>
>>> Signed-off-by: Qi Xi <xiqi2@huawei.com>
>>> Signed-off-by: Ming Yang yangming73@huawei.com
>>
>> What kind of performance gains are achieved by this patch?
>> Pls include some measurements: before and after.
>>
>>
>>> ---
>>>   hw/mem/pc-dimm.c           |  2 ++
>>>   hw/virtio/virtio-balloon.c | 44 +++++++++++++-------------------------
>>>   include/hw/boards.h        |  1 +
>>>   3 files changed, 18 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c index
>> 50ef83215c..192fc7922c 100644
>>> --- a/hw/mem/pc-dimm.c
>>> +++ b/hw/mem/pc-dimm.c
>>> @@ -81,6 +81,7 @@ void pc_dimm_plug(PCDIMMDevice *dimm,
>> MachineState *machine)
>>>
>>>       memory_device_plug(MEMORY_DEVICE(dimm), machine);
>>>       vmstate_register_ram(vmstate_mr, DEVICE(dimm));
>>> +    machine->device_memory->dimm_size += vmstate_mr->size;
>>>   }
>>>
>>>   void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>> @@ -90,6 +91,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm,
>> MachineState *machine)
>>>
>>>       memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>>>       vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
>>> +    machine->device_memory->dimm_size -= vmstate_mr->size;
>>>   }
>>>
>>>   static int pc_dimm_slot2bitmap(Object *obj, void *opaque) diff --git
>> a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c index
>> 746f07c4d2..40fa40109d 100644
>>> --- a/hw/virtio/virtio-balloon.c
>>> +++ b/hw/virtio/virtio-balloon.c
>>> @@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice
>> *vdev, uint8_t *config_data)
>>>       memcpy(config_data, &config, virtio_balloon_config_size(dev));  }
>>>
>>> -static int build_dimm_list(Object *obj, void *opaque) -{
>>> -    GSList **list = opaque;
>>> -
>>> -    if (object_dynamic_cast(obj, TYPE_PC_DIMM)) {
>>> -        DeviceState *dev = DEVICE(obj);
>>> -        if (dev->realized) { /* only realized DIMMs matter */
>>> -            *list = g_slist_prepend(*list, dev);
>>> -        }
>>> -    }
>>> -
>>> -    object_child_foreach(obj, build_dimm_list, opaque);
>>> -    return 0;
>>> -}
>>> -
>>>   static ram_addr_t get_current_ram_size(void)  {
>>> -    GSList *list = NULL, *item;
>>> -    ram_addr_t size = current_machine->ram_size;
>>> -
>>> -    build_dimm_list(qdev_get_machine(), &list);
>>> -    for (item = list; item; item = g_slist_next(item)) {
>>> -        Object *obj = OBJECT(item->data);
>>> -        if (!strcmp(object_get_typename(obj), TYPE_PC_DIMM)) {
>>> -            size += object_property_get_int(obj, PC_DIMM_SIZE_PROP,
>>> -                                            &error_abort);
>>> -        }
>>> +    MachineState *machine = MACHINE(qdev_get_machine());
>>> +    if (machine->device_memory != NULL) {
>>> +        return machine->ram_size + machine->device_memory->dimm_size;
>>> +    } else {
>>> +        return machine->ram_size;
>>>       }
>>> -    g_slist_free(list);
>>> -
>>> -    return size;
>>>   }
>>>
>>>   static bool virtio_balloon_page_poison_support(void *opaque) @@ -776,7
>> +753,11 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>>>       VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
>>>       struct virtio_balloon_config config;
>>>       uint32_t oldactual = dev->actual;
>>> -    ram_addr_t vm_ram_size = get_current_ram_size();
>>> +    ram_addr_t vm_ram_size;
>>> +    ram_addr_t vm_ram_size_new;
>>> +
>>> +retry:
>>> +    vm_ram_size = get_current_ram_size();
>>>
>>>       memcpy(&config, config_data, virtio_balloon_config_size(dev));
>>>       dev->actual = le32_to_cpu(config.actual); @@ -784,6 +765,11 @@ static
>> void virtio_balloon_set_config(VirtIODevice *vdev,
>>>           qapi_event_send_balloon_change(vm_ram_size -
>>>                           ((ram_addr_t) dev->actual << VIRTIO_BALLOON_PFN_SHIFT));
>>>       }
>>> +    vm_ram_size_new = get_current_ram_size();
>>> +    if (vm_ram_size_new != vm_ram_size) {
>>> +        goto retry;
>>> +    }
>>> +
>>
>> What is this doing? needs and comment.
>> And please don't implement loops using goto.
>>
>>
>>>       dev->poison_val = 0;
>>>       if (virtio_balloon_page_poison_support(dev)) {
>>>           dev->poison_val = le32_to_cpu(config.poison_val); diff --git
>> a/include/hw/boards.h b/include/hw/boards.h index
>> 6fbbfd56c8..551b4b419e 100644
>>> --- a/include/hw/boards.h
>>> +++ b/include/hw/boards.h
>>> @@ -296,6 +296,7 @@ struct MachineClass {  typedef struct
>> DeviceMemoryState {
>>>       hwaddr base;
>>>       MemoryRegion mr;
>>> +    ram_addr_t dimm_size;
>>>   } DeviceMemoryState;
>>>
>>>   /**
>>> --
>>> 2.33.0
> 
> 
> Optimize the virtio-balloon feature on the ARM platform by adding
> a variable to keep track of the current hot-plugged pc-dimm size,
> instead of traversing the virtual machine's memory modules to count
> the current RAM size during the balloon inflation or deflation
> process. This variable can be updated only when plugging or unplugging
> the device, which will result in an increase of approximately 60%
> efficiency of balloon process on the ARM platform.
> 
> We tested the total amount of time required for the balloon inflation process on ARM:
> inflate the balloon to 64GB of a 128GB guest under stress.
> Before: 102 seconds
> After: 42 seconds
> 
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Ming Yang yangming73@huawei.com
> ---


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


