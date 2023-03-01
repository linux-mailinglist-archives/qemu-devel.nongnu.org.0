Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5D6A68C9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 09:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXHeO-00032V-J8; Wed, 01 Mar 2023 03:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXHe5-00032D-3Z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXHe3-0003QP-2Q
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677658621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9r0YrXDSQLQ+p4oofsBKdCWCC4xR2vZOCGp5xx4Q8g=;
 b=bfa2ouN/IyXmgo3oLyHioNZ+XGT4sqDz7VIuDI0ZYhzZL6RnE4HUEm6Dx9c8tbIw/NtgRh
 tsqtm4xuNRl76qhWXsTqDFUJ40hbZCKfD/ygX8xVpHolXlxSS341KqW+0DZPVPNQDuPlIL
 xDYvxVA+9GoTpJzeK1clu2xoHL/LR6Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-z4sT6yNuNaCQ5coCBrOKPQ-1; Wed, 01 Mar 2023 03:16:59 -0500
X-MC-Unique: z4sT6yNuNaCQ5coCBrOKPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so2346029wrb.20
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 00:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9r0YrXDSQLQ+p4oofsBKdCWCC4xR2vZOCGp5xx4Q8g=;
 b=2cmHIVWnjTgdpXHCTryayVbnBdjV4r+wFd8sTAPA/qLVRerBvKnmlJZFZkL3kcHE0E
 qcnCZAzhLAqcgSlLETZi82Qtt0Ka9E3UdeaSXJKvlFcVLUx5dAJBtjkTy8qzrwEiNJX3
 Ylaf4RDmtgdITlSbIGAQSjpCsrP4zpCjq3DpHZ/100GSXqCgWKr+JV+HGmq270AyBZpB
 9xguV5o8fLnxtD2XVnRtHR+dNtf5opy0e314vewVi+jqOrdJ7PN/9OBoWhnI0gMGCrP+
 8W03OjhgZDwd7nHrNOloEaolMLNB6JrRhQUWNQntyIt8FmCaSOpjFhDZdAUUj5f9XmiM
 M0Vg==
X-Gm-Message-State: AO0yUKVYMreSmzAa7+vwUS5LVDosD0+l/2rDwBMeLzqwUuEgLQ68bchT
 Dnwj5L5+bkAM1mBBdkNRN3WUcF5f+uENpUZFPS/AxrPeJ9hdlFovfYyqH5VanundNaaZXH2D2GN
 WgCfLcyLuQm27N7Q=
X-Received: by 2002:a05:600c:5252:b0:3ea:8ed9:8f03 with SMTP id
 fc18-20020a05600c525200b003ea8ed98f03mr4107838wmb.24.1677658618650; 
 Wed, 01 Mar 2023 00:16:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/h03Gsb6fEQ3VPqHWxeKepJX7jhsIQPE/Zch4HAspfGjaxKcqOdtShK2O9sDQHF7seJCxpmw==
X-Received: by 2002:a05:600c:5252:b0:3ea:8ed9:8f03 with SMTP id
 fc18-20020a05600c525200b003ea8ed98f03mr4107823wmb.24.1677658618274; 
 Wed, 01 Mar 2023 00:16:58 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003dc4480df80sm19687503wmq.34.2023.03.01.00.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 00:16:57 -0800 (PST)
Message-ID: <cf2cf2c8-108c-2e21-2695-161b13cea31b@redhat.com>
Date: Wed, 1 Mar 2023 09:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] virtio-balloon: optimize the virtio-balloon on the ARM
 platform
Content-Language: en-US
To: Yangming <yangming73@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <20230301062642.1058-1-xiqi2@huawei.com>
 <afd620a5e7c14a0794812e72ba1af545@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <afd620a5e7c14a0794812e72ba1af545@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01.03.23 07:38, Yangming wrote:
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
> Refactor the code by adding comments and removing unnecessary code.
> 
>   hw/mem/pc-dimm.c           |  7 +++++++
>   hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>   include/hw/boards.h        |  2 ++
>   3 files changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 50ef83215c..3f2734a267 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>   
>       memory_device_plug(MEMORY_DEVICE(dimm), machine);
>       vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> +    /* count only "real" DIMMs, not NVDIMMs */
> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
> +        machine->device_memory->dimm_size += vmstate_mr->size;
> +    }
>   }
>   
>   void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
> @@ -90,6 +94,9 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>   
>       memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>       vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
> +        machine->device_memory->dimm_size -= vmstate_mr->size;
> +    }
>   }
>   
>   static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..2814a47cb1 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>       memcpy(config_data, &config, virtio_balloon_config_size(dev));
>   }
>   
> -static int build_dimm_list(Object *obj, void *opaque)
> -{
> -    GSList **list = opaque;
> -
> -    if (object_dynamic_cast(obj, TYPE_PC_DIMM)) {
> -        DeviceState *dev = DEVICE(obj);
> -        if (dev->realized) { /* only realized DIMMs matter */
> -            *list = g_slist_prepend(*list, dev);
> -        }
> -    }
> -
> -    object_child_foreach(obj, build_dimm_list, opaque);
> -    return 0;
> -}
> -
>   static ram_addr_t get_current_ram_size(void)
>   {
> -    GSList *list = NULL, *item;
> -    ram_addr_t size = current_machine->ram_size;
> -
> -    build_dimm_list(qdev_get_machine(), &list);
> -    for (item = list; item; item = g_slist_next(item)) {
> -        Object *obj = OBJECT(item->data);
> -        if (!strcmp(object_get_typename(obj), TYPE_PC_DIMM)) {
> -            size += object_property_get_int(obj, PC_DIMM_SIZE_PROP,
> -                                            &error_abort);
> -        }
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +    if (machine->device_memory) {
> +        return machine->ram_size + machine->device_memory->dimm_size;
> +    } else {
> +        return machine->ram_size;
>       }
> -    g_slist_free(list);
> -
> -    return size;
>   }
>   
>   static bool virtio_balloon_page_poison_support(void *opaque)
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6fbbfd56c8..397ec10468 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -292,10 +292,12 @@ struct MachineClass {
>    * @base: address in guest physical address space where the memory
>    * address space for memory devices starts
>    * @mr: address space container for memory devices
> + * @dimm_size: the sum of plugged DIMMs' sizes
>    */
>   typedef struct DeviceMemoryState {
>       hwaddr base;
>       MemoryRegion mr;
> +    ram_addr_t dimm_size;
>   } DeviceMemoryState;
>   
>   /**

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


