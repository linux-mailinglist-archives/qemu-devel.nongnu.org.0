Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDF30659D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:06:44 +0100 (CET)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4s1T-0000WE-Cs
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1l4rz6-0007xK-Lm
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:04:17 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1l4rz3-0006uC-4J
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:04:16 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6011d5470000>; Wed, 27 Jan 2021 13:04:07 -0800
Received: from [10.40.102.156] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 21:03:59 +0000
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: Keqian Zhu <zhukeqian1@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <590a2752-9bba-6971-51b0-a8accee6e814@nvidia.com>
Date: Thu, 28 Jan 2021 02:33:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210111073439.20236-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611781447; bh=SWA4c2DL1jtbVjyAynnMSN8GPaTlkiWjh97GtplZftE=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=C2OvG8fQl5TiwgTAiVfmKhE+tTXFFKTuwfcVjAGurIfhJU/ZxW72wf4fOA5BzXj0P
 GPkNyHlXCiY6VxhnpddTJOWvehnv3/GeZc0XkwVI0qKBIvuTGYOOvyt8VNq3GrI81C
 NGKlFEca6xQj3mNf3rUJ81E0F5K1xgJeUYcVlQz9w5MkFAAhIOEVIuzMfnD5B3T0MW
 dV6k2SLQ2m6RoRbRPBVOyHbV6s8o8t5KhwfiQ7SvwNZRMLkPXbNcSgGQRVsv4CnHVk
 6nUfNrt9z0EoJ8kiKAaK+3yEq06nGqf+5OSdUeoIJOr+jOek1HIt+VSHmfoziM/PV5
 i49ezNXWOsCEg==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/11/2021 1:04 PM, Keqian Zhu wrote:
> For now the switch of vfio dirty page tracking is integrated into
> the vfio_save_handler, it causes some problems [1].
> 

Sorry, I missed [1] mail, somehow it didn't landed in my inbox.

> The object of dirty tracking is guest memory, but the object of
> the vfio_save_handler is device state. This mixed logic produces
> unnecessary coupling and conflicts:
> 
> 1. Coupling: Their saving granule is different (perVM vs perDevice).
>     vfio will enable dirty_page_tracking for each devices, actually
>     once is enough.

That's correct, enabling dirty page tracking once is enough. But 
log_start and log_stop gets called on address space update transaction, 
region_add() or region_del(), at this point migration may not be active. 
We don't want to allocate bitmap memory in kernel for lifetime of VM, 
without knowing migration will be happen or not. vfio_iommu_type1 module 
should allocate bitmap memory only while migration is active.

Paolo's suggestion here to use log_global_start and log_global_stop 
callbacks seems correct here. But at this point vfio device state is not 
yet changed to |_SAVING as you had identified it in [1]. May be we can 
start tracking bitmap in iommu_type1 module while device is not yet 
_SAVING, but getting dirty bitmap while device is yet not in 
_SAVING|_RUNNING state doesn't seem optimal solution.

Pasting here your question from [1]

 > Before start dirty tracking, we will check and ensure that the device
 >  is at _SAVING state and return error otherwise.  But the question is
 >  that what is the rationale?  Why does the VFIO_IOMMU_DIRTY_PAGES
 > ioctl have something to do with the device state?

Lets walk through the types of devices we are supporting:
1. mdev devices without IOMMU backed device
	Vendor driver pins pages as and when required during runtime. We can 
say that vendor driver is smart which identifies the pages to pin. We 
are good here.

2. mdev device with IOMMU backed device
	This is similar to vfio-pci, direct assigned device, where all pages 
are pinned at VM bootup. Vendor driver is not smart, so bitmap query 
will report all pages dirty always. If --auto-converge is not set, VM 
stucks infinitely in pre-copy phase. This is known to us.

3. mdev device with IOMMU backed device with smart vendor driver
	In this case as well all pages are pinned at VM bootup, but vendor 
driver is smart to identify the pages and pin them explicitly.
Pages can be pinned anytime, i.e. during normal VM runtime or on setting 
_SAVING flag (entering pre-copy phase) or while in iterative pre-copy 
phase. There is no restriction based on these phases for calling 
vfio_pin_pages(). Vendor driver can start pinning pages based on its 
device state when _SAVING flag is set. In that case, if dirty bitmap is 
queried before that then it will report all sysmem as dirty with an 
unnecessary copy of sysmem.
As an optimal solution, I think its better to query bitmap only after 
all vfio devices are in pre-copy phase, i.e. after _SAVING flag is set.

> 2. Conflicts: The ram_save_setup() traverses all memory_listeners
>     to execute their log_start() and log_sync() hooks to get the
>     first round dirty bitmap, which is used by the bulk stage of
>     ram saving. However, it can't get dirty bitmap from vfio, as
>     @savevm_ram_handlers is registered before @vfio_save_handler.
> 
Right, but it can get dirty bitmap from vfio device in it's iterative 
callback
ram_save_pending ->
	migration_bitmap_sync_precopy() .. ->
		 vfio_listerner_log_sync

Thanks,
Kirti

> Move the switch of vfio dirty_page_tracking into vfio_memory_listener
> can solve above problems. Besides, Do not require devices in SAVING
> state for vfio_sync_dirty_bitmap().
> 
> [1] https://www.spinics.net/lists/kvm/msg229967.html
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>   hw/vfio/common.c    | 53 +++++++++++++++++++++++++++++++++++++--------
>   hw/vfio/migration.c | 35 ------------------------------
>   2 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..9128cd7ee1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -311,7 +311,7 @@ bool vfio_mig_active(void)
>       return true;
>   }
>   
> -static bool vfio_devices_all_saving(VFIOContainer *container)
> +static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>   {
>       VFIOGroup *group;
>       VFIODevice *vbasedev;
> @@ -329,13 +329,8 @@ static bool vfio_devices_all_saving(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
> -                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> -                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> -                        return false;
> -                }
> -                continue;
> -            } else {
> +            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> +                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>                   return false;
>               }
>           }
> @@ -987,6 +982,44 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       }
>   }
>   
> +static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
> +{
> +    int ret;
> +    struct vfio_iommu_type1_dirty_bitmap dirty = {
> +        .argsz = sizeof(dirty),
> +    };
> +
> +    if (start) {
> +        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
> +    } else {
> +        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
> +    }
> +
> +    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
> +    if (ret) {
> +        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
> +                     dirty.flags, errno);
> +    }
> +}
> +
> +static void vfio_listener_log_start(MemoryListener *listener,
> +                                    MemoryRegionSection *section,
> +                                    int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, true);
> +}
> +
> +static void vfio_listener_log_stop(MemoryListener *listener,
> +                                   MemoryRegionSection *section,
> +                                   int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, false);
> +}
> +
>   static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>                                    uint64_t size, ram_addr_t ram_addr)
>   {
> @@ -1128,7 +1161,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>           return;
>       }
>   
> -    if (vfio_devices_all_saving(container)) {
> +    if (vfio_devices_all_dirty_tracking(container)) {
>           vfio_sync_dirty_bitmap(container, section);
>       }
>   }
> @@ -1136,6 +1169,8 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>   static const MemoryListener vfio_memory_listener = {
>       .region_add = vfio_listener_region_add,
>       .region_del = vfio_listener_region_del,
> +    .log_start = vfio_listener_log_start,
> +    .log_stop = vfio_listener_log_stop,
>       .log_sync = vfio_listerner_log_sync,
>   };
>   
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 00daa50ed8..c0f646823a 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -395,40 +395,10 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>       return qemu_file_get_error(f);
>   }
>   
> -static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool start)
> -{
> -    int ret;
> -    VFIOMigration *migration = vbasedev->migration;
> -    VFIOContainer *container = vbasedev->group->container;
> -    struct vfio_iommu_type1_dirty_bitmap dirty = {
> -        .argsz = sizeof(dirty),
> -    };
> -
> -    if (start) {
> -        if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
> -            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
> -        } else {
> -            return -EINVAL;
> -        }
> -    } else {
> -            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
> -    }
> -
> -    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
> -    if (ret) {
> -        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
> -                     dirty.flags, errno);
> -        return -errno;
> -    }
> -    return ret;
> -}
> -
>   static void vfio_migration_cleanup(VFIODevice *vbasedev)
>   {
>       VFIOMigration *migration = vbasedev->migration;
>   
> -    vfio_set_dirty_page_tracking(vbasedev, false);
> -
>       if (migration->region.mmaps) {
>           vfio_region_unmap(&migration->region);
>       }
> @@ -469,11 +439,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>           return ret;
>       }
>   
> -    ret = vfio_set_dirty_page_tracking(vbasedev, true);
> -    if (ret) {
> -        return ret;
> -    }
> -
>       qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>   
>       ret = qemu_file_get_error(f);
> 

