Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644466AFB6C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:43:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZht0-0002F4-0I; Tue, 07 Mar 2023 19:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZhsj-0002D1-Pe
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:42:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZhsh-00059C-Ic
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678236129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5lOTMXcgnjz2mj+H8b7KETM14cPLs2Dgm6UbrM2tO4M=;
 b=LOBnDWWJBn61RCp/1PFBlD/N5Z4sj/TFZD2Pb7oLmnB9nGhnKyIWVQBtyydt1Jq6iCmsi3
 AoSENUn9KH6q0llXDGDmcSWJ7COX7zyLj2chba5sgu4Ly20TPvdUKoWQ0hiJquhWXUfm+k
 CebEbM5AzYaJmRzUrlDWUSF/wqW8/Rs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-pIZoI80FP9-UKMwK_Kcoxg-1; Tue, 07 Mar 2023 19:42:08 -0500
X-MC-Unique: pIZoI80FP9-UKMwK_Kcoxg-1
Received: by mail-ed1-f69.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso21622892edh.15
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 16:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678236127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lOTMXcgnjz2mj+H8b7KETM14cPLs2Dgm6UbrM2tO4M=;
 b=sDkJG0nL8q90p4LXcUWPrz4Z6sJWf4/hHzv9C8FcqkQmuYaann9pHdz7y2fx+Vl6dd
 QeRBdAhfyIU+upMOc/O1ru98DtnmUeFJWwF3Hz+/yv6vP9s5B9VwYrA4OCM2u27oHnMu
 dNFrWV5YUiR1htCdqspy06lHeHKBNRo5NgFLeAk7Fyo1RFPkrZ5YTvRGGOG8ScLBtupa
 +kmvu28edK9TSCVPe4JtZZ9/kU7tcxCmfkayYZJpBpJDj1O1fw28FDyXB16YZKLcdYBl
 zeInKsQC+omp9E8jIBPccLlKSHNeXgpcgcV4LyQlydRk3JGcf8t9sTju7s6sAgRLbJtC
 gN1g==
X-Gm-Message-State: AO0yUKWNPituIeg3+xhC2jYsnc/eGGFfCL7sJr4cfrmLDmiJFzoPIDmh
 Y4By3jYa4CAOFQnZQ2VN5HFkSGNuYPOJUFK3+OO2H2Tsh+nln2BweILuA7b8soosZKTjPv09jcA
 j4WUHHWZHvJDRIIA=
X-Received: by 2002:a17:907:7e8a:b0:908:7fed:f0f with SMTP id
 qb10-20020a1709077e8a00b009087fed0f0fmr19841270ejc.42.1678236126843; 
 Tue, 07 Mar 2023 16:42:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/IseVmp0xw6etsm5hx/oIlylk3l+1gSmZY3TIGL1fyBAxSPoBE+QCTqEbBZ69tf7ObFEq0KQ==
X-Received: by 2002:a17:907:7e8a:b0:908:7fed:f0f with SMTP id
 qb10-20020a1709077e8a00b009087fed0f0fmr19841240ejc.42.1678236126548; 
 Tue, 07 Mar 2023 16:42:06 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 q8-20020a170906940800b008eb89a435c9sm6690731ejx.164.2023.03.07.16.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 16:42:05 -0800 (PST)
Date: Tue, 7 Mar 2023 19:42:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yangming <yangming73@huawei.com>
Cc: "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: Re: [PATCH v2] virtio-balloon: optimize the virtio-balloon on the
 ARM platform
Message-ID: <20230307193739-mutt-send-email-mst@kernel.org>
References: <20230301062642.1058-1-xiqi2@huawei.com>
 <afd620a5e7c14a0794812e72ba1af545@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd620a5e7c14a0794812e72ba1af545@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 06:38:13AM +0000, Yangming wrote:
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
>  hw/mem/pc-dimm.c           |  7 +++++++
>  hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>  include/hw/boards.h        |  2 ++
>  3 files changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 50ef83215c..3f2734a267 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>  
>      memory_device_plug(MEMORY_DEVICE(dimm), machine);
>      vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> +    /* count only "real" DIMMs, not NVDIMMs */
> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
> +        machine->device_memory->dimm_size += vmstate_mr->size;
> +    }
>  }
>  
>  void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)

vmstate_mr->size is Int128 you are not supposed to do math on it.

And generally poking at this struct is a bad idea.

I think memory_region_size will do what you want but not 100% sure.
Maybe you need to look at the flatview ...

David?


> @@ -90,6 +94,9 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>  
>      memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>      vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
> +        machine->device_memory->dimm_size -= vmstate_mr->size;
> +    }
>  }
>  
>  static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..2814a47cb1 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      memcpy(config_data, &config, virtio_balloon_config_size(dev));
>  }
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
>  static ram_addr_t get_current_ram_size(void)
>  {
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
>      }
> -    g_slist_free(list);
> -
> -    return size;
>  }
>  
>  static bool virtio_balloon_page_poison_support(void *opaque)
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6fbbfd56c8..397ec10468 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -292,10 +292,12 @@ struct MachineClass {
>   * @base: address in guest physical address space where the memory
>   * address space for memory devices starts
>   * @mr: address space container for memory devices
> + * @dimm_size: the sum of plugged DIMMs' sizes
>   */
>  typedef struct DeviceMemoryState {
>      hwaddr base;
>      MemoryRegion mr;
> +    ram_addr_t dimm_size;
>  } DeviceMemoryState;
>  
>  /**
> -- 
> 2.33.0


