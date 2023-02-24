Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180C6A17F3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTRg-00027U-5b; Fri, 24 Feb 2023 03:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVTRe-00026t-Qp
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:28:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVTRc-0006a6-Tq
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677227323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzlqwAXImR7Vp/RjGZcZdI/paLgPTSvU9qzzvW9aNsU=;
 b=G1lJkwALoj0Hv0lxwyICmAkdsQ0L+ULegqAxEKf5kH7kAGaYqO0MHrck1QmHASkvdED+j4
 u5WYKvR+sGqmPbCnhHBWoER5EWe5P0T0SsWdims3xGievUbhnrxjQZxuMmryg/8pSaTDZr
 0yqUfFhX1QRldolxHCQC+zZvKqCDxpg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-oW0dj8vRNtKJ8UcF41Ftiw-1; Fri, 24 Feb 2023 03:28:41 -0500
X-MC-Unique: oW0dj8vRNtKJ8UcF41Ftiw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c14-20020adffb0e000000b002bfda39265aso3075524wrr.13
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzlqwAXImR7Vp/RjGZcZdI/paLgPTSvU9qzzvW9aNsU=;
 b=a1CkqPGhEfqSqgijlvfnpHVVB59nks/Xxpby7zE4CeSvBM1YRritC41tsELSJR45py
 6e1DQEYgsSS9fACi6p6h9f3FkLBU++nl6DmqtAbePIif0xM2fAL0lotborNuesVPm2Iv
 vhSZgoyBSb6maUCamBMvBo8xoCCUO8Gn2BkMa8hTwYpVTlOY6A9zqCksSnlqQCXzF+Bc
 nDs0/GwCen5lg6JnqocI7TKEdXISURSM2YSuKQJWI76TQbAkXME6DGpStY+hiFg3RcFd
 L570QzwXhItX0uWkgaq1tOBWKZVSTEnsa00kMD5f7m+PsEi9JBvj+vaOEo1CBg9eLVgN
 6UZw==
X-Gm-Message-State: AO0yUKUAOUaHALWVK0Z92KnsNMUT7Y36U9WfV4zJhbL8BIZKcBeW8Q5W
 Ecu1/14Hy9884v+js8gz7xu3m8GXui7rgakgpwYBBoatUKEYOv7HgDZJJ+qXWAAS38yvyVEj2O6
 fIGjMKmtN/tErf/0=
X-Received: by 2002:adf:fb8d:0:b0:2c5:5391:8ab1 with SMTP id
 a13-20020adffb8d000000b002c553918ab1mr12731440wrr.53.1677227319981; 
 Fri, 24 Feb 2023 00:28:39 -0800 (PST)
X-Google-Smtp-Source: AK7set99LweaKUsSqsoD7tEyZnfjlJxdI7LkPBR8hmNrD9Rj1SojOGa8ovGjXJdmrTFCAVz2uTNdCw==
X-Received: by 2002:adf:fb8d:0:b0:2c5:5391:8ab1 with SMTP id
 a13-20020adffb8d000000b002c553918ab1mr12731428wrr.53.1677227319685; 
 Fri, 24 Feb 2023 00:28:39 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f0:a3e9:76f3:3a96:2a:eb18])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5228000000b002c70851bfcasm7738680wra.28.2023.02.24.00.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:28:39 -0800 (PST)
Date: Fri, 24 Feb 2023 03:28:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yangming <yangming73@huawei.com>
Cc: "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: Re: [PATCH] virtio-balloon: optimize the virtio-balloon on the ARM
 platform.
Message-ID: <20230224032535-mutt-send-email-mst@kernel.org>
References: <20230224074624.1531-1-xiqi2@huawei.com>
 <574cdaae1fd64fd7891f87a5899b5827@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <574cdaae1fd64fd7891f87a5899b5827@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Feb 24, 2023 at 08:23:40AM +0000, Yangming wrote:
> 
> Optimize the virtio-balloon feature on the ARM platform by adding a variable to keep track of the current hot-plugged pc-dimm size, instead of traversing the virtual machine's memory modules to count the current RAM size during the balloon inflation or deflation process. This variable can be updated only when plugging or unplugging the device, which will result in an increase of more than 60% efficiency of balloon process on the ARM platform.
> 
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Ming Yang yangming73@huawei.com

What kind of performance gains are achieved by this patch?
Pls include some measurements: before and after.


> ---
>  hw/mem/pc-dimm.c           |  2 ++
>  hw/virtio/virtio-balloon.c | 44 +++++++++++++-------------------------
>  include/hw/boards.h        |  1 +
>  3 files changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c index 50ef83215c..192fc7922c 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -81,6 +81,7 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>  
>      memory_device_plug(MEMORY_DEVICE(dimm), machine);
>      vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> +    machine->device_memory->dimm_size += vmstate_mr->size;
>  }
>  
>  void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine) @@ -90,6 +91,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>  
>      memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>      vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> +    machine->device_memory->dimm_size -= vmstate_mr->size;
>  }
>  
>  static int pc_dimm_slot2bitmap(Object *obj, void *opaque) diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c index 746f07c4d2..40fa40109d 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      memcpy(config_data, &config, virtio_balloon_config_size(dev));  }
>  
> -static int build_dimm_list(Object *obj, void *opaque) -{
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
>  static ram_addr_t get_current_ram_size(void)  {
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
> +    if (machine->device_memory != NULL) {
> +        return machine->ram_size + machine->device_memory->dimm_size;
> +    } else {
> +        return machine->ram_size;
>      }
> -    g_slist_free(list);
> -
> -    return size;
>  }
>  
>  static bool virtio_balloon_page_poison_support(void *opaque) @@ -776,7 +753,11 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>      VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
>      struct virtio_balloon_config config;
>      uint32_t oldactual = dev->actual;
> -    ram_addr_t vm_ram_size = get_current_ram_size();
> +    ram_addr_t vm_ram_size;
> +    ram_addr_t vm_ram_size_new;
> +
> +retry:
> +    vm_ram_size = get_current_ram_size();
>  
>      memcpy(&config, config_data, virtio_balloon_config_size(dev));
>      dev->actual = le32_to_cpu(config.actual); @@ -784,6 +765,11 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>          qapi_event_send_balloon_change(vm_ram_size -
>                          ((ram_addr_t) dev->actual << VIRTIO_BALLOON_PFN_SHIFT));
>      }
> +    vm_ram_size_new = get_current_ram_size();
> +    if (vm_ram_size_new != vm_ram_size) {
> +        goto retry;
> +    }
> +

What is this doing? needs and comment.
And please don't implement loops using goto.


>      dev->poison_val = 0;
>      if (virtio_balloon_page_poison_support(dev)) {
>          dev->poison_val = le32_to_cpu(config.poison_val); diff --git a/include/hw/boards.h b/include/hw/boards.h index 6fbbfd56c8..551b4b419e 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -296,6 +296,7 @@ struct MachineClass {  typedef struct DeviceMemoryState {
>      hwaddr base;
>      MemoryRegion mr;
> +    ram_addr_t dimm_size;
>  } DeviceMemoryState;
>  
>  /**
> --
> 2.33.0


