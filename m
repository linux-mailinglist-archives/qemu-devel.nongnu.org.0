Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8C31F756
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:34:52 +0100 (CET)
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD37b-0006Ty-V5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lD36O-0005cp-DI; Fri, 19 Feb 2021 05:33:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lD36L-0003n8-DN; Fri, 19 Feb 2021 05:33:36 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DhntP4Cv8zlMkd;
 Fri, 19 Feb 2021 18:31:25 +0800 (CST)
Received: from [10.174.184.135] (10.174.184.135) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 18:33:14 +0800
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
To: Kirti Wankhede <kwankhede@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <b51b7282-ad47-01d1-7b83-834aead08d76@nvidia.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <e7c3c94d-82ef-a6d4-e6ba-13e67bf125dd@huawei.com>
Date: Fri, 19 Feb 2021 18:33:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <b51b7282-ad47-01d1-7b83-834aead08d76@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/2/18 22:42, Kirti Wankhede wrote:
> 
> 
> On 12/9/2020 1:39 PM, Shenming Lu wrote:
>> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
>> setup, if the restoring of the VFIO PCI device config space is
>> before the VGIC, an error might occur in the kernel.
>>
>> So we move the saving of the config space to the non-iterable
>> process, so that it will be called after the VGIC according to
>> their priorities.
>>
>> As for the possible dependence of the device specific migration
>> data on it's config space, we can let the vendor driver to
>> include any config info it needs in its own data stream.
>> (Should we note this in the header file linux-headers/linux/vfio.h?)
>>
>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>> ---
>>   hw/vfio/migration.c | 25 +++++++++++++++----------
>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 00daa50ed8..3b9de1353a 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -575,11 +575,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>           return ret;
>>       }
>>   -    ret = vfio_save_device_config_state(f, opaque);
>> -    if (ret) {
>> -        return ret;
>> -    }
>> -
>>       ret = vfio_update_pending(vbasedev);
>>       if (ret) {
>>           return ret;
>> @@ -620,6 +615,19 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>       return ret;
>>   }
>>   +static void vfio_save_state(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    int ret;
>> +
>> +    /* The device specific data is migrated in the iterable process. */
>> +    ret = vfio_save_device_config_state(f, opaque);
>> +    if (ret) {
>> +        error_report("%s: Failed to save device config space",
>> +                     vbasedev->name);
>> +    }
>> +}
>> +
> 
> Since error is not propagated, set error in migration stream for migration to fail, use qemu_file_set_error() on error.

Makes sense. I will send a v3 soon.	Thanks,

Shenming

> 
> Thanks,
> Kirti
> 
>>   static int vfio_load_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -670,11 +678,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>           switch (data) {
>>           case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
>>           {
>> -            ret = vfio_load_device_config_state(f, opaque);
>> -            if (ret) {
>> -                return ret;
>> -            }
>> -            break;
>> +            return vfio_load_device_config_state(f, opaque);
>>           }
>>           case VFIO_MIG_FLAG_DEV_SETUP_STATE:
>>           {
>> @@ -720,6 +724,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
>>       .save_live_pending = vfio_save_pending,
>>       .save_live_iterate = vfio_save_iterate,
>>       .save_live_complete_precopy = vfio_save_complete_precopy,
>> +    .save_state = vfio_save_state,
>>       .load_setup = vfio_load_setup,
>>       .load_cleanup = vfio_load_cleanup,
>>       .load_state = vfio_load_state,
>>
> .

