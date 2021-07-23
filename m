Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF863D3C32
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 17:08:55 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wnG-00045o-2G
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 11:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m6wmQ-00031l-RT
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:08:02 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:34392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m6wmO-00060N-Gu
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:08:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 7AEDD1F44AF7
Subject: Re: virtio-gpu: Mapping blob resources
To: Gerd Hoffmann <kraxel@redhat.com>
References: <0eb17319-0b1d-5f43-f5d9-8ccadb0839ef@collabora.com>
 <20210723135242.w5bcqwwrm5stec3b@sirius.home.kraxel.org>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
Message-ID: <baf58f3a-6b82-74c4-5383-117ac51d6579@collabora.com>
Date: Fri, 23 Jul 2021 17:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723135242.w5bcqwwrm5stec3b@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.203,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Awesome, thanks!

I already cherry-picked that commit. :D

I am experimenting with memory regions now. So, I created a ram 
subregion, did I use the right type for the task?

I added it to the gpu hostmem at the offset specified by the map 
command. I enabled the subregion, and then I used subregion->addr for 
the vkMapMemory call.

Running the program I do not get complaints but I can not say if it 
actually works since it is now stuck on an assert at presentation time, 
which is a new kind of error, therefore it is good news!


Cheers,
Antonio



On 23/07/21 15:52, Gerd Hoffmann wrote:
> On Fri, Jul 23, 2021 at 03:33:24PM +0200, Antonio Caggiano wrote:
>> Hi,
>>
>> I am trying to implement blob resource mapping support, but there is
>> something I still did not manage to figure out.
>>
>> According to the spec, VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB maps a host-only
>> blob resource into an offset in the host visible memory region. So, I
>> believe I will need something like:
>>
>>> void *data = g->hotstmem[mblob.offset]; // pseudo-code
>>> virgl_renderer_resource_map(..., &data, ...);
>>
>> Questions:
>> - Does my approach make sense?
> 
> No ;)
> 
>> - How do I get an address to the host visible memory region?
> 
> You don't need that.
> 
> qemu has a memory api for that which manages a tree of regions.
> Each pci bar is such a region.  Below is an old patch from an
> archived branch adding a pci bar and memory region and some virtio
> feature flag stuff.  Surely will not apply as-is, but should show
> what you need to do.
> 
> Then you can create a new memory region for each (mappable) host
> resource and register that as sub-region of the pci bar memory region.
> sub-regions can be moved around (set offset) and enabled (aka mapped)
> and disabled (aka unmapped), and qemu will take care to update the
> guest's view of the memory as needed.
> 
> HTH,
>    Gerd
> 
> commit e3e24a1ff3f68335a5691d9948f29d7f50b65929
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Wed Sep 25 14:54:29 2019 +0200
> 
>      virtio-gpu: hostmem [wip]
> 
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index decc940048e1..9bb26139e686 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -108,12 +108,15 @@ enum virtio_gpu_base_conf_flags {
>       (_cfg.flags & (1 << VIRTIO_GPU_FLAG_SHARED_ENABLED))
>   #define virtio_gpu_blob_enabled(_cfg) \
>       (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> +#define virtio_gpu_hostmem_enabled(_cfg) \
> +    (_cfg.hostmem > 0)
>   
>   struct virtio_gpu_base_conf {
>       uint32_t max_outputs;
>       uint32_t flags;
>       uint32_t xres;
>       uint32_t yres;
> +    uint64_t hostmem;
>   };
>   
>   struct virtio_gpu_ctrl_command {
> @@ -137,6 +140,8 @@ typedef struct VirtIOGPUBase {
>       int renderer_blocked;
>       int enable;
>   
> +    MemoryRegion hostmem;
> +
>       struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
>   
>       int enabled_output_bitmask;
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index 09f2efb09968..985f92983a4c 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -194,6 +194,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
>       if (virtio_gpu_blob_enabled(g->conf)) {
>           features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>       }
> +    if (virtio_gpu_hostmem_enabled(g->conf)) {
> +        features |= (1 << VIRTIO_GPU_F_HOSTMEM);
> +    }
>   
>       return features;
>   }
> diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> index 3d152ff5c873..3f81f4952e59 100644
> --- a/hw/display/virtio-gpu-pci.c
> +++ b/hw/display/virtio-gpu-pci.c
> @@ -33,6 +33,19 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>       int i;
>       Error *local_error = NULL;
>   
> +    if (virtio_gpu_hostmem_enabled(g->conf)) {
> +        vpci_dev->msix_bar_idx = 1;
> +        vpci_dev->modern_mem_bar_idx = 2;
> +        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
> +                           g->conf.hostmem);
> +        pci_register_bar(&vpci_dev->pci_dev, 4,
> +                         PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                         &g->hostmem);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
> +    }
> +
>       qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
>       virtio_pci_force_virtio_1(vpci_dev);
>       object_property_set_bool(OBJECT(vdev), true, "realized", &local_error);
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 795c4c1d429c..58bcd9c116c8 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1213,11 +1213,20 @@ static void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
>           }
>       }
>   
> +    if (virtio_gpu_hostmem_enabled(g->parent_obj.conf)) {
> +        /* FIXME: to be investigated ... */
> +        if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> +            error_setg(errp, "hostmem and virgl are not compatible (yet)");
> +            return;
> +        }
> +    }
> +
>       if (virtio_gpu_shared_enabled(g->parent_obj.conf) ||
> -        virtio_gpu_blob_enabled(g->parent_obj.conf)) {
> +        virtio_gpu_blob_enabled(g->parent_obj.conf) ||
> +        virtio_gpu_hostmem_enabled(g->parent_obj.conf)) {
>           /* FIXME: must xfer resource type somehow */
>           error_setg(&g->parent_obj.migration_blocker,
> -                   "shared/blob is not migratable (yet)");
> +                   "shared/blob/hostmem is not migratable (yet)");
>           migrate_add_blocker(g->parent_obj.migration_blocker, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
> @@ -1344,6 +1353,7 @@ static Property virtio_gpu_properties[] = {
>   #endif
>       DEFINE_PROP_BIT("shared", VirtIOGPU, parent_obj.conf.flags,
>                       VIRTIO_GPU_FLAG_SHARED_ENABLED, false),
> +    DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 2b4c2aa126c7..933b74c496e5 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -112,8 +112,21 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>        * virtio regions are moved to the end of bar #2, to make room for
>        * the stdvga mmio registers at the start of bar #2.
>        */
> -    vpci_dev->modern_mem_bar_idx = 2;
> -    vpci_dev->msix_bar_idx = 4;
> +    if (!virtio_gpu_hostmem_enabled(g->conf)) {
> +        vpci_dev->modern_mem_bar_idx = 2;
> +        vpci_dev->msix_bar_idx = 4;
> +    } else {
> +        vpci_dev->msix_bar_idx = 1;
> +        vpci_dev->modern_mem_bar_idx = 2;
> +        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
> +                           g->conf.hostmem);
> +        pci_register_bar(&vpci_dev->pci_dev, 4,
> +                         PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                         &g->hostmem);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
> +    }
>   
>       if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
>           /*
> 
> 

