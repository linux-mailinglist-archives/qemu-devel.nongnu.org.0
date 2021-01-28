Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC083079A2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:27:14 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59CT-0001yz-C4
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l59AD-0000Ss-Vw; Thu, 28 Jan 2021 10:24:53 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l59A9-0005xH-Qt; Thu, 28 Jan 2021 10:24:53 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRPPQ4MfQzjDTL;
 Thu, 28 Jan 2021 23:23:22 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 28 Jan 2021 23:24:13 +0800
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <590a2752-9bba-6971-51b0-a8accee6e814@nvidia.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <e4507b91-a132-950a-90f8-e1f29da7343c@huawei.com>
Date: Thu, 28 Jan 2021 23:24:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <590a2752-9bba-6971-51b0-a8accee6e814@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo
 Habkost <ehabkost@redhat.com>, jiangkunkun@huawei.com, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo and Kirti,

Many thanks for reply. I am busy today and will reply you tomorrow, Thanks.

Keqian.

On 2021/1/28 5:03, Kirti Wankhede wrote:
> 
> 
> On 1/11/2021 1:04 PM, Keqian Zhu wrote:
>> For now the switch of vfio dirty page tracking is integrated into
>> the vfio_save_handler, it causes some problems [1].
>>
> 
> Sorry, I missed [1] mail, somehow it didn't landed in my inbox.
> 
>> The object of dirty tracking is guest memory, but the object of
>> the vfio_save_handler is device state. This mixed logic produces
>> unnecessary coupling and conflicts:
>>
>> 1. Coupling: Their saving granule is different (perVM vs perDevice).
>>     vfio will enable dirty_page_tracking for each devices, actually
>>     once is enough.
> 
> That's correct, enabling dirty page tracking once is enough. But log_start and log_stop gets called on address space update transaction, region_add() or region_del(), at this point migration may not be active. We don't want to allocate bitmap memory in kernel for lifetime of VM, without knowing migration will be happen or not. vfio_iommu_type1 module should allocate bitmap memory only while migration is active.
> 
> Paolo's suggestion here to use log_global_start and log_global_stop callbacks seems correct here. But at this point vfio device state is not yet changed to |_SAVING as you had identified it in [1]. May be we can start tracking bitmap in iommu_type1 module while device is not yet _SAVING, but getting dirty bitmap while device is yet not in _SAVING|_RUNNING state doesn't seem optimal solution.
> 
> Pasting here your question from [1]
> 
>> Before start dirty tracking, we will check and ensure that the device
>>  is at _SAVING state and return error otherwise.  But the question is
>>  that what is the rationale?  Why does the VFIO_IOMMU_DIRTY_PAGES
>> ioctl have something to do with the device state?
> 
> Lets walk through the types of devices we are supporting:
> 1. mdev devices without IOMMU backed device
>     Vendor driver pins pages as and when required during runtime. We can say that vendor driver is smart which identifies the pages to pin. We are good here.
> 
> 2. mdev device with IOMMU backed device
>     This is similar to vfio-pci, direct assigned device, where all pages are pinned at VM bootup. Vendor driver is not smart, so bitmap query will report all pages dirty always. If --auto-converge is not set, VM stucks infinitely in pre-copy phase. This is known to us.
> 
> 3. mdev device with IOMMU backed device with smart vendor driver
>     In this case as well all pages are pinned at VM bootup, but vendor driver is smart to identify the pages and pin them explicitly.
> Pages can be pinned anytime, i.e. during normal VM runtime or on setting _SAVING flag (entering pre-copy phase) or while in iterative pre-copy phase. There is no restriction based on these phases for calling vfio_pin_pages(). Vendor driver can start pinning pages based on its device state when _SAVING flag is set. In that case, if dirty bitmap is queried before that then it will report all sysmem as dirty with an unnecessary copy of sysmem.
> As an optimal solution, I think its better to query bitmap only after all vfio devices are in pre-copy phase, i.e. after _SAVING flag is set.
> 
>> 2. Conflicts: The ram_save_setup() traverses all memory_listeners
>>     to execute their log_start() and log_sync() hooks to get the
>>     first round dirty bitmap, which is used by the bulk stage of
>>     ram saving. However, it can't get dirty bitmap from vfio, as
>>     @savevm_ram_handlers is registered before @vfio_save_handler.
>>
> Right, but it can get dirty bitmap from vfio device in it's iterative callback
> ram_save_pending ->
>     migration_bitmap_sync_precopy() .. ->
>          vfio_listerner_log_sync
> 
> Thanks,
> Kirti
> 
>> Move the switch of vfio dirty_page_tracking into vfio_memory_listener
>> can solve above problems. Besides, Do not require devices in SAVING
>> state for vfio_sync_dirty_bitmap().
>>
>> [1] https://www.spinics.net/lists/kvm/msg229967.html
>>
>> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>   hw/vfio/common.c    | 53 +++++++++++++++++++++++++++++++++++++--------
>>   hw/vfio/migration.c | 35 ------------------------------
>>   2 files changed, 44 insertions(+), 44 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 6ff1daa763..9128cd7ee1 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -311,7 +311,7 @@ bool vfio_mig_active(void)
>>       return true;
>>   }
>>   -static bool vfio_devices_all_saving(VFIOContainer *container)
>> +static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>   {
>>       VFIOGroup *group;
>>       VFIODevice *vbasedev;
>> @@ -329,13 +329,8 @@ static bool vfio_devices_all_saving(VFIOContainer *container)
>>                   return false;
>>               }
>>   -            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
>> -                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
>> -                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>> -                        return false;
>> -                }
>> -                continue;
>> -            } else {
>> +            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
>> +                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>>                   return false;
>>               }
>>           }
>> @@ -987,6 +982,44 @@ static void vfio_listener_region_del(MemoryListener *listener,
>>       }
>>   }
>>   +static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>> +{
>> +    int ret;
>> +    struct vfio_iommu_type1_dirty_bitmap dirty = {
>> +        .argsz = sizeof(dirty),
>> +    };
>> +
>> +    if (start) {
>> +        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>> +    } else {
>> +        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
>> +    }
>> +
>> +    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
>> +    if (ret) {
>> +        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
>> +                     dirty.flags, errno);
>> +    }
>> +}
>> +
>> +static void vfio_listener_log_start(MemoryListener *listener,
>> +                                    MemoryRegionSection *section,
>> +                                    int old, int new)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +
>> +    vfio_set_dirty_page_tracking(container, true);
>> +}
>> +
>> +static void vfio_listener_log_stop(MemoryListener *listener,
>> +                                   MemoryRegionSection *section,
>> +                                   int old, int new)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +
>> +    vfio_set_dirty_page_tracking(container, false);
>> +}
>> +
>>   static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>                                    uint64_t size, ram_addr_t ram_addr)
>>   {
>> @@ -1128,7 +1161,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>>           return;
>>       }
>>   -    if (vfio_devices_all_saving(container)) {
>> +    if (vfio_devices_all_dirty_tracking(container)) {
>>           vfio_sync_dirty_bitmap(container, section);
>>       }
>>   }
>> @@ -1136,6 +1169,8 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>>   static const MemoryListener vfio_memory_listener = {
>>       .region_add = vfio_listener_region_add,
>>       .region_del = vfio_listener_region_del,
>> +    .log_start = vfio_listener_log_start,
>> +    .log_stop = vfio_listener_log_stop,
>>       .log_sync = vfio_listerner_log_sync,
>>   };
>>   diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 00daa50ed8..c0f646823a 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -395,40 +395,10 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>>       return qemu_file_get_error(f);
>>   }
>>   -static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool start)
>> -{
>> -    int ret;
>> -    VFIOMigration *migration = vbasedev->migration;
>> -    VFIOContainer *container = vbasedev->group->container;
>> -    struct vfio_iommu_type1_dirty_bitmap dirty = {
>> -        .argsz = sizeof(dirty),
>> -    };
>> -
>> -    if (start) {
>> -        if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
>> -            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>> -        } else {
>> -            return -EINVAL;
>> -        }
>> -    } else {
>> -            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
>> -    }
>> -
>> -    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
>> -    if (ret) {
>> -        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
>> -                     dirty.flags, errno);
>> -        return -errno;
>> -    }
>> -    return ret;
>> -}
>> -
>>   static void vfio_migration_cleanup(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>>   -    vfio_set_dirty_page_tracking(vbasedev, false);
>> -
>>       if (migration->region.mmaps) {
>>           vfio_region_unmap(&migration->region);
>>       }
>> @@ -469,11 +439,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>>           return ret;
>>       }
>>   -    ret = vfio_set_dirty_page_tracking(vbasedev, true);
>> -    if (ret) {
>> -        return ret;
>> -    }
>> -
>>       qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>         ret = qemu_file_get_error(f);
>>
> .
> 

