Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421F291449
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 22:26:36 +0200 (CEST)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTsmf-0005eJ-FX
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 16:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kTslZ-0005An-Cu
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 16:25:25 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kTslR-0003I0-JB
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 16:25:21 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8b52fe0000>; Sat, 17 Oct 2020 13:24:30 -0700
Received: from [10.40.101.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 17 Oct
 2020 20:24:59 +0000
Subject: Re: [PATCH v26 05/17] vfio: Add VM state change handler to know state
 of VM
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>
References: <1600817059-26721-1-git-send-email-kwankhede@nvidia.com>
 <1600817059-26721-6-git-send-email-kwankhede@nvidia.com>
 <20200924170220.0a9836fe.cohuck@redhat.com> <20200929110312.GF2826@work-vm>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <3dd3fe95-c81a-de40-47b0-24f0772974d4@nvidia.com>
Date: Sun, 18 Oct 2020 01:54:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929110312.GF2826@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602966270; bh=CXFodyv4lLrrYdiEO8IqrRXuvAW6SFgDCJuawQsL8a8=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=VVNBiKMmYL3Z08KxgLBs2+SBrGOG0UkQXQM4WTxQcVd7sBCQEWUD6uLcGr5IDOjpd
 ZitNg7XHTHJtpgA+BQHI8pJ2Tp0956aNR/GYB/6UmOZNGmx6v/cJDDF/lC5mlEZllJ
 +amlPAkHU49iNIVAeaFwnvRWzCgjvY7Qb7Cq0sQfCNYS+qdzisbGXcZNC1GfFDWF47
 eLIaUmLhuHWDhA4Avx+fOQdkji6E0kVbkh4z+X34sNRbrICKaao6y2xnWfpacJoTO1
 iAyQWbN2X6kDVOxK1+eV9snwQOkOSCWMWPvixgB5GS9exdcbQpmGTFfKJGMzW+YX+6
 Ahe4rIRD6ZdRQ==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 16:25:15
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.247, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: cjia@nvidia.com, aik@ozlabs.ru, Zhengxiao.zx@alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eauger@redhat.com, yi.l.liu@intel.com, quintela@redhat.com,
 ziye.yang@intel.com, armbru@redhat.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, felipe@nutanix.com, zhi.a.wang@intel.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, alex.williamson@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/29/2020 4:33 PM, Dr. David Alan Gilbert wrote:
> * Cornelia Huck (cohuck@redhat.com) wrote:
>> On Wed, 23 Sep 2020 04:54:07 +0530
>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
>>
>>> VM state change handler gets called on change in VM's state. This is used to set
>>> VFIO device state to _RUNNING.
>>>
>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> ---
>>>   hw/vfio/migration.c           | 136 ++++++++++++++++++++++++++++++++++++++++++
>>>   hw/vfio/trace-events          |   3 +-
>>>   include/hw/vfio/vfio-common.h |   4 ++
>>>   3 files changed, 142 insertions(+), 1 deletion(-)
>>>
>>
>> (...)
>>
>>> +static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
>>> +                                    uint32_t value)
>>
>> I think I've mentioned that before, but this function could really
>> benefit from a comment what mask and value mean.
>>

Adding a comment as:

/*
  *  Write device_state field to inform the vendor driver about the 
device state
  *  to be transitioned to.
  *  vbasedev: VFIO device
  *  mask : bits set in the mask are preserved in device_state
  *  value: bits set in the value are set in device_state
  *  Remaining bits in device_state are cleared.
  */


>>> +{
>>> +    VFIOMigration *migration = vbasedev->migration;
>>> +    VFIORegion *region = &migration->region;
>>> +    off_t dev_state_off = region->fd_offset +
>>> +                      offsetof(struct vfio_device_migration_info, device_state);
>>> +    uint32_t device_state;
>>> +    int ret;
>>> +
>>> +    ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
>>> +                        dev_state_off);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    device_state = (device_state & mask) | value;
>>> +
>>> +    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = vfio_mig_write(vbasedev, &device_state, sizeof(device_state),
>>> +                         dev_state_off);
>>> +    if (ret < 0) {
>>> +        ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
>>> +                          dev_state_off);
>>> +        if (ret < 0) {
>>> +            return ret;
>>> +        }
>>> +
>>> +        if (VFIO_DEVICE_STATE_IS_ERROR(device_state)) {
>>> +            hw_error("%s: Device is in error state 0x%x",
>>> +                     vbasedev->name, device_state);
>>> +            return -EFAULT;
>>
>> Is -EFAULT a good return value here? Maybe -EIO?
>>

Ok. Changing to -EIO.

>>> +        }
>>> +    }
>>> +
>>> +    vbasedev->device_state = device_state;
>>> +    trace_vfio_migration_set_state(vbasedev->name, device_state);
>>> +    return 0;
>>> +}
>>> +
>>> +static void vfio_vmstate_change(void *opaque, int running, RunState state)
>>> +{
>>> +    VFIODevice *vbasedev = opaque;
>>> +
>>> +    if ((vbasedev->vm_running != running)) {
>>> +        int ret;
>>> +        uint32_t value = 0, mask = 0;
>>> +
>>> +        if (running) {
>>> +            value = VFIO_DEVICE_STATE_RUNNING;
>>> +            if (vbasedev->device_state & VFIO_DEVICE_STATE_RESUMING) {
>>> +                mask = ~VFIO_DEVICE_STATE_RESUMING;
>>
>> I've been staring at this for some time and I think that the desired
>> result is
>> - set _RUNNING
>> - if _RESUMING was set, clear it, but leave the other bits intact

Upto here, you're correct.

>> - if _RESUMING was not set, clear everything previously set
>> This would really benefit from a comment (or am I the only one
>> struggling here?)
>>

Here mask should be ~0. Correcting it.


>>> +            }
>>> +        } else {
>>> +            mask = ~VFIO_DEVICE_STATE_RUNNING;
>>> +        }
>>> +
>>> +        ret = vfio_migration_set_state(vbasedev, mask, value);
>>> +        if (ret) {
>>> +            /*
>>> +             * vm_state_notify() doesn't support reporting failure. If such
>>> +             * error reporting support added in furure, migration should be
>>> +             * aborted.
>>
>>
>> "We should abort the migration in this case, but vm_state_notify()
>> currently does not support reporting failures."
>>
>> ?
>>

Ok. Updating comment as suggested here.

>> Can/should we mark the failing device in some way?
> 
> I think you can call qemu_file_set_error on the migration stream to
> force an error.
> 

It should be as below, right?
qemu_file_set_error(migrate_get_current()->to_dst_file, ret);


Thanks,
Kirti

> Dave
> 
>>> +             */
>>> +            error_report("%s: Failed to set device state 0x%x",
>>> +                         vbasedev->name, value & mask);
>>> +        }
>>> +        vbasedev->vm_running = running;
>>> +        trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>>> +                                  value & mask);
>>> +    }
>>> +}
>>> +
>>>   static int vfio_migration_init(VFIODevice *vbasedev,
>>>                                  struct vfio_region_info *info)
>>>   {
>>
>> (...)

