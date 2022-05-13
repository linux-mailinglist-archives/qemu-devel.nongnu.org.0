Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B45259FA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 05:19:14 +0200 (CEST)
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npLph-00005N-1x
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 23:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1npLoU-0007q9-0y
 for qemu-devel@nongnu.org; Thu, 12 May 2022 23:17:58 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1npLoQ-00009N-Ba
 for qemu-devel@nongnu.org; Thu, 12 May 2022 23:17:57 -0400
Received: from kwepemi500025.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kzv2S6mkzzQwNg;
 Fri, 13 May 2022 11:17:04 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi500025.china.huawei.com (7.221.188.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 11:17:45 +0800
Message-ID: <40a6afa4-3684-f65b-fd88-a68e47e597a4@huawei.com>
Date: Fri, 13 May 2022 11:17:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/4] virtio: get class_id and pci device id by the
 virtio id
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <stefanha@redhat.com>, <jasowang@redhat.com>, <sgarzare@redhat.com>,
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20220512062103.1875-1-longpeng2@huawei.com>
 <20220512062103.1875-3-longpeng2@huawei.com>
 <20220512025113-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220512025113-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500025.china.huawei.com (7.221.188.170)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



在 2022/5/12 14:56, Michael S. Tsirkin 写道:
> On Thu, May 12, 2022 at 02:21:01PM +0800, Longpeng(Mike) wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> Add helpers to get the "Transitional PCI Device ID" and "class_id"
>> of the device specified by the "Virtio Device ID".
>>
>> These helpers will be used to build the generic vDPA device later.
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
> 
> 
> Except, the IDs in the current header a broken. I just fixed them
> and they will be hopefully OK in the next version.
> 

Do you mean this patch ?

```
virtio: fix virtio transitional ids
This commit fixes the transitional PCI device ID.

Fixes: d61914ea6ada ("virtio: update virtio id table, add transitional ids")
Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
Link: https://lore.kernel.org/r/20220510102723.87666-1-mie@igel.co.jp
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
```

Luckily, we use PCI_DEVICE_ID_VIRTIO_xxx instead of VIRTIO_TRANS_ID_xxx 
here.


>> ---
>>   hw/virtio/virtio-pci.c | 77 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/virtio/virtio-pci.h |  5 +++
>>   2 files changed, 82 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 7cf1231c1c..fdfa205cee 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -19,6 +19,7 @@
>>   
>>   #include "exec/memop.h"
>>   #include "standard-headers/linux/virtio_pci.h"
>> +#include "standard-headers/linux/virtio_ids.h"
>>   #include "hw/boards.h"
>>   #include "hw/virtio/virtio.h"
>>   #include "migration/qemu-file-types.h"
>> @@ -212,6 +213,79 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
>>       return 0;
>>   }
>>   
>> +typedef struct VirtIOPCIIDInfo {
>> +    /* virtio id */
>> +    uint16_t vdev_id;
>> +    /* pci device id for the transitional device */
>> +    uint16_t trans_devid;
>> +    uint16_t class_id;
>> +} VirtIOPCIIDInfo;
>> +
>> +#define VIRTIO_TRANS_DEV_ID_INFO(name, class)       \
>> +    {                                               \
>> +        .vdev_id = VIRTIO_ID_##name,                \
>> +        .trans_devid = PCI_DEVICE_ID_VIRTIO_##name, \
>> +        .class_id = class,                          \
>> +    }
>> +
>> +#define VIRTIO_MODERN_DEV_ID_NFO(name, class)       \
>> +    {                                               \
>> +        .vdev_id = VIRTIO_ID_##name,                \
>> +        .class_id = class,                          \
>> +    }
>> +
> 
> No, I think I liked the original approach in the RFC better, even though
> it duplicates a tiny bit of code.
> This trick does not save a lot of typing and obscures the ID
> use in case it's wrong (as was the case just recently).
> 
OK, will do in v6.

Thanks.

> 
>> +static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
>> +    /* Non-transitional devices */
>> +    VIRTIO_MODERN_DEV_ID_NFO(CRYPTO,    PCI_CLASS_OTHERS),
>> +    VIRTIO_MODERN_DEV_ID_NFO(FS,        PCI_CLASS_STORAGE_OTHER),
>> +    /* Transitional devices */
>> +    VIRTIO_TRANS_DEV_ID_INFO(NET,       PCI_CLASS_NETWORK_ETHERNET),
>> +    VIRTIO_TRANS_DEV_ID_INFO(BLOCK,     PCI_CLASS_STORAGE_SCSI),
>> +    VIRTIO_TRANS_DEV_ID_INFO(CONSOLE,   PCI_CLASS_COMMUNICATION_OTHER),
>> +    VIRTIO_TRANS_DEV_ID_INFO(SCSI,      PCI_CLASS_STORAGE_SCSI),
>> +    VIRTIO_TRANS_DEV_ID_INFO(9P,        PCI_BASE_CLASS_NETWORK),
>> +    VIRTIO_TRANS_DEV_ID_INFO(BALLOON,   PCI_CLASS_OTHERS),
>> +    VIRTIO_TRANS_DEV_ID_INFO(RNG,       PCI_CLASS_OTHERS),
>> +};
>> +
>> +static const VirtIOPCIIDInfo *virtio_pci_get_id_info(uint16_t vdev_id)
>> +{
>> +    const VirtIOPCIIDInfo *info = NULL;
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
>> +        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
>> +            info = &virtio_pci_id_info[i];
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (!info) {
>> +        /* The device id is invalid or not added to the id_info yet. */
>> +        error_report("Invalid virtio device(id %u)", vdev_id);
>> +        abort();
>> +    }
>> +
>> +    return info;
>> +}
>> +
>> +/*
>> + * Get the Transitional Device ID for the specific device, return
>> + * zero if the device is non-transitional.
>> + */
>> +uint16_t virtio_pci_get_trans_devid(uint16_t device_id)
>> +{
>> +    return virtio_pci_get_id_info(device_id)->trans_devid;
>> +}
>> +
>> +/*
>> + * Get the Class ID for the specific device.
>> + */
>> +uint16_t virtio_pci_get_class_id(uint16_t device_id)
>> +{
>> +    return virtio_pci_get_id_info(device_id)->class_id;
>> +}
>> +
>>   static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
>>   {
>>       VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
>> @@ -1675,6 +1749,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>>            * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
>>            */
>>           pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
>> +        if (proxy->trans_devid) {
>> +            pci_config_set_device_id(config, proxy->trans_devid);
>> +        }
>>       } else {
>>           /* pure virtio-1.0 */
>>           pci_set_word(config + PCI_VENDOR_ID,
>> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
>> index 2446dcd9ae..f08665cd1b 100644
>> --- a/hw/virtio/virtio-pci.h
>> +++ b/hw/virtio/virtio-pci.h
>> @@ -146,6 +146,8 @@ struct VirtIOPCIProxy {
>>       bool disable_modern;
>>       bool ignore_backend_features;
>>       OnOffAuto disable_legacy;
>> +    /* Transitional device id */
>> +    uint16_t trans_devid;
>>       uint32_t class_code;
>>       uint32_t nvectors;
>>       uint32_t dfselect;
>> @@ -158,6 +160,9 @@ struct VirtIOPCIProxy {
>>       VirtioBusState bus;
>>   };
>>   
>> +uint16_t virtio_pci_get_trans_devid(uint16_t device_id);
>> +uint16_t virtio_pci_get_class_id(uint16_t device_id);
>> +
>>   static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
>>   {
>>       return !proxy->disable_modern;
>> -- 
>> 2.23.0
> 
> 
> .

