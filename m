Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939342963DC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 19:43:49 +0200 (CEST)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVecu-0008OY-7T
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 13:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kVebC-0007xp-My
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 13:42:02 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kVeb9-0006eL-RU
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 13:42:01 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f91c4070000>; Thu, 22 Oct 2020 10:40:23 -0700
Received: from [10.40.101.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 17:41:43 +0000
Subject: Re: [PATCH v27 05/17] vfio: Add VM state change handler to know state
 of VM
To: Alex Williamson <alex.williamson@redhat.com>
References: <1603365127-14202-1-git-send-email-kwankhede@nvidia.com>
 <1603365127-14202-6-git-send-email-kwankhede@nvidia.com>
 <20201022103524.1e567cb2@w520.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <41a47e87-50f9-8c16-7c2b-598ca77c06f0@nvidia.com>
Date: Thu, 22 Oct 2020 23:11:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022103524.1e567cb2@w520.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603388423; bh=YvUYgxAL5rOfdtx/G0ALtLnN5EKCrQKBy4GS1V5l5YU=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=Rndm7MLocjrE7A7gbPfkimO+PlxIA841Roq3SkIyrskH+pNagpS30VDpPn0I4X/b6
 L9vwWXXhKZXtByYdYBlKbYK5+zrcAbh9RBKNkKKkD9svp+l22Na8uK4ezUC5+saCjh
 TqgvZ/Gw4w1etWRDXNijGD0BlbrvrOBPkYDXvi7M6dr23er2bfAO9giqSC4QOnv5lT
 ZtNuH6BAGrBc05ofx6GnVQaezlfpYOONMYBNLJvhwsbunWKfte0CKuZVjZOOITd1sC
 S6tIxI8AWcVJJvncL3i+c5NYvQ2SaoeAF7fZy+DKyP+Y2rOzm72608Px3rJVqvb/Re
 rzdONk/JpCQtw==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 12:16:56
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/22/2020 10:05 PM, Alex Williamson wrote:
> On Thu, 22 Oct 2020 16:41:55 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> VM state change handler is called on change in VM's state. Based on
>> VM state, VFIO device state should be changed.
>> Added read/write helper functions for migration region.
>> Added function to set device_state.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>   hw/vfio/migration.c           | 158 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/vfio/trace-events          |   2 +
>>   include/hw/vfio/vfio-common.h |   4 ++
>>   3 files changed, 164 insertions(+)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 5f74a3ad1d72..34f39c7e2e28 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -10,6 +10,7 @@
>>   #include "qemu/osdep.h"
>>   #include <linux/vfio.h>
>>   
>> +#include "sysemu/runstate.h"
>>   #include "hw/vfio/vfio-common.h"
>>   #include "cpu.h"
>>   #include "migration/migration.h"
>> @@ -22,6 +23,157 @@
>>   #include "exec/ram_addr.h"
>>   #include "pci.h"
>>   #include "trace.h"
>> +#include "hw/hw.h"
>> +
>> +static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>> +                                  off_t off, bool iswrite)
>> +{
>> +    int ret;
>> +
>> +    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
>> +                    pread(vbasedev->fd, val, count, off);
>> +    if (ret < count) {
>> +        error_report("vfio_mig_%s %d byte %s: failed at offset 0x%lx, err: %s",
>> +                     iswrite ? "write" : "read", count,
>> +                     vbasedev->name, off, strerror(errno));
>> +        return (ret < 0) ? ret : -EINVAL;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
>> +                       off_t off, bool iswrite)
>> +{
>> +    int ret, done = 0;
>> +    __u8 *tbuf = buf;
>> +
>> +    while (count) {
>> +        int bytes = 0;
>> +
>> +        if (count >= 8 && !(off % 8)) {
>> +            bytes = 8;
>> +        } else if (count >= 4 && !(off % 4)) {
>> +            bytes = 4;
>> +        } else if (count >= 2 && !(off % 2)) {
>> +            bytes = 2;
>> +        } else {
>> +            bytes = 1;
>> +        }
>> +
>> +        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
>> +        if (ret) {
>> +            return ret;
>> +        }
>> +
>> +        count -= bytes;
>> +        done += bytes;
>> +        off += bytes;
>> +        tbuf += bytes;
>> +    }
>> +    return done;
>> +}
>> +
>> +#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
>> +#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
>> +
>> +#define VFIO_MIG_STRUCT_OFFSET(f)       \
>> +                                 offsetof(struct vfio_device_migration_info, f)
>> +/*
>> + * Change the device_state register for device @vbasedev. Bits set in @mask
>> + * are preserved, bits set in @value are set, and bits not set in either @mask
>> + * or @value are cleared in device_state. If the register cannot be accessed,
>> + * the resulting state would be invalid, or the device enters an error state,
>> + * an error is returned.
>> + */
>> +
>> +static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
>> +                                    uint32_t value)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    VFIORegion *region = &migration->region;
>> +    off_t dev_state_off = region->fd_offset +
>> +                          VFIO_MIG_STRUCT_OFFSET(device_state);
>> +    uint32_t device_state;
>> +    int ret;
>> +
>> +    ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
>> +                        dev_state_off);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    device_state = (device_state & mask) | value;
>> +
>> +    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = vfio_mig_write(vbasedev, &device_state, sizeof(device_state),
>> +                         dev_state_off);
>> +    if (ret < 0) {
>> +        int rret;
>> +
>> +        rret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
>> +                             dev_state_off);
>> +
>> +        if ((rret < 0) || (VFIO_DEVICE_STATE_IS_ERROR(device_state))) {
>> +            hw_error("%s: Device in error state 0x%x", vbasedev->name,
>> +                     device_state);
>> +            return rret ? rret : -EIO;
>> +        }
>> +        return ret;
>> +    }
>> +
>> +    migration->device_state = device_state;
>> +    trace_vfio_migration_set_state(vbasedev->name, device_state);
>> +    return 0;
>> +}
>> +
>> +static void vfio_vmstate_change(void *opaque, int running, RunState state)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    uint32_t value, mask;
>> +    int ret;
>> +
>> +    if ((vbasedev->migration->vm_running == running)) {
>> +        return;
>> +    }
>> +
>> +    if (running) {
>> +        /*
>> +         * Here device state can have one of _SAVING, _RESUMING or _STOP bit.
>> +         * Transition from _SAVING to _RUNNING can happen if there is migration
>> +         * failure, in that case clear _SAVING bit.
>> +         * Transition from _RESUMING to _RUNNING occurs during resuming
>> +         * phase, in that case clear _RESUMING bit.
>> +         * In both the above cases, set _RUNNING bit.
>> +         */
>> +        mask = ~VFIO_DEVICE_STATE_MASK;
>> +        value = VFIO_DEVICE_STATE_RUNNING;
>> +    } else {
>> +        /*
>> +         * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
>> +         * _RUNNING bit
>> +         */
>> +        mask = ~VFIO_DEVICE_STATE_RUNNING;
>> +        value = 0;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, mask, value);
>> +    if (ret) {
>> +        /*
>> +         * Migration should be aborted in this case, but vm_state_notify()
>> +         * currently does not support reporting failures.
>> +         */
>> +        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>> +                     (migration->device_state & mask) | value);
>> +        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +    }
>> +    vbasedev->migration->vm_running = running;
>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>> +            (migration->device_state & mask) | value);
>> +}
>>   
>>   static void vfio_migration_region_exit(VFIODevice *vbasedev)
>>   {
>> @@ -71,6 +223,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>       }
>>   
>>       vbasedev->migration = migration;
>> +    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>> +                                                          vbasedev);
>>       return 0;
>>   
>>   err:
>> @@ -118,6 +272,10 @@ add_blocker:
>>   
>>   void vfio_migration_finalize(VFIODevice *vbasedev)
>>   {
>> +    if (vbasedev->migration->vm_state) {
>> +        qemu_del_vm_change_state_handler(vbasedev->migration->vm_state);
>> +    }
> 
> 
> This looks like a segfault, vfio_migration_teardown() is eventually
> called unconditionally.  The next patch modifies this function further,
> but never checks that vbasedev->migration is non-NULL.  Thanks,
> 

Yup.
Updated patch 4, 5 and 6. So now vfio_migration_finalize() looks like:

void vfio_migration_finalize(VFIODevice *vbasedev)
{
     VFIOMigration *migration = vbasedev->migration;

     if (migration) {
         if (migration->migration_state.notify) {
 
remove_migration_state_change_notifier(&migration->migration_state);
         }

         if (migration->vm_state) {
             qemu_del_vm_change_state_handler(migration->vm_state);
         }

         vfio_migration_region_exit(vbasedev);
         g_free(vbasedev->migration);
         vbasedev->migration = NULL;
     }

     if (vbasedev->migration_blocker) {
         migrate_del_blocker(vbasedev->migration_blocker);
         error_free(vbasedev->migration_blocker);
         vbasedev->migration_blocker = NULL;
     }
}

Thanks,
Kirti

> Alex
> 
> 
>> +
>>       if (vbasedev->migration_blocker) {
>>           migrate_del_blocker(vbasedev->migration_blocker);
>>           error_free(vbasedev->migration_blocker);
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 9ced5ec6277c..41de81f12f60 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -148,3 +148,5 @@ vfio_display_edid_write_error(void) ""
>>   
>>   # migration.c
>>   vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
>> +vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
>> +vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 8275c4c68f45..9a571f1fb552 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -29,6 +29,7 @@
>>   #ifdef CONFIG_LINUX
>>   #include <linux/vfio.h>
>>   #endif
>> +#include "sysemu/sysemu.h"
>>   
>>   #define VFIO_MSG_PREFIX "vfio %s: "
>>   
>> @@ -58,7 +59,10 @@ typedef struct VFIORegion {
>>   } VFIORegion;
>>   
>>   typedef struct VFIOMigration {
>> +    VMChangeStateEntry *vm_state;
>>       VFIORegion region;
>> +    uint32_t device_state;
>> +    int vm_running;
>>   } VFIOMigration;
>>   
>>   typedef struct VFIOAddressSpace {
> 

