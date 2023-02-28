Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483766A54E3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:57:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvmU-0005yj-VQ; Tue, 28 Feb 2023 03:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvmS-0005xA-2M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvmP-0003RB-7x
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677574571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fiiegtKjUuha9vgeosMfcjy/7s+YnJDBKW8dCLfoFgM=;
 b=ibuCHiZ7LH4FSvIa5qe2gGfSDYqnL8/mCdiLffxky+btRDNNtxA/1q1U1qz5v6O0dRbcvh
 cPcq6VO6uFbf7NJE1N2PIOmWUoGK6eNMm03kBt7nOaPKq5l6QKYcl5KoB9tOXVQObpU8xQ
 miz466PqHrGTDI5etUz69hDoEL4CL80=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-Oowj_lCKOCqv7xuEz-XQtg-1; Tue, 28 Feb 2023 03:56:10 -0500
X-MC-Unique: Oowj_lCKOCqv7xuEz-XQtg-1
Received: by mail-ed1-f71.google.com with SMTP id
 da15-20020a056402176f00b004ace822b750so12882969edb.20
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 00:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677574568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fiiegtKjUuha9vgeosMfcjy/7s+YnJDBKW8dCLfoFgM=;
 b=J7xRbeL7rlBU6Y11lTZYqI/LLrEe/VR0vaaKrSHJpyM4EBDSfO979xXaEfALzWv8Pk
 z8bwmcP5J24kvJ5e9L44s/QBbUV00ux80ZgwiKWIs3jRGLQzXTH2ifXj4I/D6M4QAS2j
 5/pQ6upuTGb1qLEsbAdcsgNK27YrlIitHfU8d5FLaEP+Y7sG/RnydVAVVv5nwbZEjfA4
 /UIasYL/S+E6npDpTMnExG3PE9CZjBcUAtC6dwbD5WPOL1gZC052t3mz493sZ9gH1tCN
 3SllWlvXqUdI5t6oRYx8H5xY6xF/n/H4gYMDMyMzyU+KQ9D6wiKGz/npGklrNwIcSkq+
 36/w==
X-Gm-Message-State: AO0yUKU56HnKPPqMpVXkWwdskKzpInBUcxDsQkfsQtFaByj3ty+o9i2f
 lIllBemxTTkasGQVdI3WbkuviJ6L/0UEULIJqKLcUk0oMJu0z3REfLV457um9cYlov/mPUQzCEO
 CW4075NLlAixq6og=
X-Received: by 2002:a17:907:a49:b0:86c:a3ed:1442 with SMTP id
 be9-20020a1709070a4900b0086ca3ed1442mr2203427ejc.4.1677574567828; 
 Tue, 28 Feb 2023 00:56:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/7j96fO1BnXrAsBiWpYGcL6AVb5O3gAyb/XOGW4HN4n4GKByX2joOxuQnju9ckDciCFk5Z+w==
X-Received: by 2002:a17:907:a49:b0:86c:a3ed:1442 with SMTP id
 be9-20020a1709070a4900b0086ca3ed1442mr2203411ejc.4.1677574567543; 
 Tue, 28 Feb 2023 00:56:07 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 e29-20020a170906749d00b008c33ebac259sm4235245ejl.127.2023.02.28.00.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:56:06 -0800 (PST)
Date: Tue, 28 Feb 2023 03:56:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yangming <yangming73@huawei.com>
Cc: David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: Re: [PATCH] virtio-balloon: optimize the virtio-balloon on the ARM
 platform.
Message-ID: <20230228035341-mutt-send-email-mst@kernel.org>
References: <264b6cc6a74945c3b5214fa4e8f099fe@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <264b6cc6a74945c3b5214fa4e8f099fe@huawei.com>
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

On Tue, Feb 28, 2023 at 03:26:56AM +0000, Yangming wrote:
> > > Optimize the virtio-balloon feature on the ARM platform by adding a
> > > variable to keep track of the current hot-plugged pc-dimm size,
> > > instead of traversing the virtual machine's memory modules to count
> > > the current RAM size during the balloon inflation or deflation
> > > process. This variable can be updated only when plugging or unplugging
> > > the device, which will result in an increase of approximately 60%
> > > efficiency of balloon process on the ARM platform.
> > >
> > > We tested the total amount of time required for the balloon inflation
> > process on ARM:
> > > inflate the balloon to 64GB of a 128GB guest under stress.
> > > Before: 102 seconds
> > > After: 42 seconds
> > >
> > > Signed-off-by: Qi Xi <xiqi2@huawei.com>
> > > Signed-off-by: Ming Yang yangming73@huawei.com
> > > ---
> > >   hw/mem/pc-dimm.c           |  2 ++
> > >   hw/virtio/virtio-balloon.c | 33 +++++----------------------------
> > >   include/hw/boards.h        |  1 +
> > >   3 files changed, 8 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c index
> > > 50ef83215c..192fc7922c 100644
> > > --- a/hw/mem/pc-dimm.c
> > > +++ b/hw/mem/pc-dimm.c
> > > @@ -81,6 +81,7 @@ void pc_dimm_plug(PCDIMMDevice *dimm,
> > MachineState
> > > *machine)
> > >
> > >       memory_device_plug(MEMORY_DEVICE(dimm), machine);
> > >       vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> > > +    machine->device_memory->dimm_size += vmstate_mr->size;
> > >   }
> > >
> > >   void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
> > @@
> > > -90,6 +91,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm,
> > MachineState
> > > *machine)
> > >
> > >       memory_device_unplug(MEMORY_DEVICE(dimm), machine);
> > >       vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> > > +    machine->device_memory->dimm_size -= vmstate_mr->size;
> > >   }
> > 
> > Ahh, missed that my previous comment was not addressed: we only want to
> > track "real" DIMMs, not NVDIMMs.
> > 
> > --
> > Thanks,
> > 
> > David / dhildenb
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
>  hw/mem/pc-dimm.c           |  8 ++++++++
>  hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>  include/hw/boards.h        |  1 +
>  3 files changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 50ef83215c..2107615016 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>  
>      memory_device_plug(MEMORY_DEVICE(dimm), machine);
>      vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM);
> +    if (!is_nvdimm) {
> +        machine->device_memory->dimm_size += vmstate_mr->size;
> +    }
>  }
>  
>  void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
> @@ -90,6 +94,10 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>  
>      memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>      vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM);
> +    if (!is_nvdimm) {
> +        machine->device_memory->dimm_size -= vmstate_mr->size;
> +    }
>  }
>

add comments here explaining why are nvdimms excluded?
  
>  static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..80bbb59132 100644
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
> +    if (machine->device_memory != NULL) {

just if (machine->device_memory) is equivalent and shorter

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
> index 6fbbfd56c8..551b4b419e 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -296,6 +296,7 @@ struct MachineClass {
>  typedef struct DeviceMemoryState {
>      hwaddr base;
>      MemoryRegion mr;
> +    ram_addr_t dimm_size;

add a comment explaining what this is?

>  } DeviceMemoryState;
>  
>  /**
> -- 
> 2.33.0
> 


