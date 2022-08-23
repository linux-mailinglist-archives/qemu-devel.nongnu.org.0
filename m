Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE459D2DA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 10:00:13 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOpY-00046G-KS
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 04:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQOhw-00025q-Qj
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:52:21 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:55733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQOhp-000831-1l
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:52:15 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN0l1Ez_1661241124; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN0l1Ez_1661241124) by smtp.aliyun-inc.com;
 Tue, 23 Aug 2022 15:52:05 +0800
Message-ID: <a63b8cf1-1477-abde-e9a8-168d58426b5c@linux.alibaba.com>
Date: Tue, 23 Aug 2022 15:52:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/24] virtio-pci: support queue reset
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d3bbe50c546b55971e87ff4cbc61e049c6800db8.1660611460.git.kangjie.xu@linux.alibaba.com>
 <4553ca4a-6df9-dac4-307e-ccc405744bb9@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <4553ca4a-6df9-dac4-307e-ccc405744bb9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


在 2022/8/23 15:40, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>
>> PCI devices support vq reset.
>>
>> Based on this function, the driver can adjust the size of the ring, and
>> quickly recycle the buffer in the ring.
>>
>> The migration of the virtio devices will not happen during a reset
>> operation. This is becuase the global iothread lock is held. Migration
>> thread also needs the lock. As a result, we do not need to migrate the
>> reset state of VirtIOPCIQueue.
>>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> ---
>>   hw/virtio/virtio-pci.c         | 19 +++++++++++++++++++
>>   include/hw/virtio/virtio-pci.h |  1 +
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 45327f0b31..ec8e92052f 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -1246,6 +1246,9 @@ static uint64_t virtio_pci_common_read(void 
>> *opaque, hwaddr addr,
>>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>>           val = proxy->vqs[vdev->queue_sel].used[1];
>>           break;
>> +    case VIRTIO_PCI_COMMON_Q_RESET:
>> +        val = proxy->vqs[vdev->queue_sel].reset;
>> +        break;
>>       default:
>>           val = 0;
>>       }
>> @@ -1333,6 +1336,7 @@ static void virtio_pci_common_write(void 
>> *opaque, hwaddr addr,
>> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>> proxy->vqs[vdev->queue_sel].used[0]);
>>               proxy->vqs[vdev->queue_sel].enabled = 1;
>> +            proxy->vqs[vdev->queue_sel].reset = 0;
>>           } else {
>>               virtio_error(vdev, "wrong value for queue_enable 
>> %"PRIx64, val);
>>           }
>> @@ -1355,6 +1359,20 @@ static void virtio_pci_common_write(void 
>> *opaque, hwaddr addr,
>>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>>           proxy->vqs[vdev->queue_sel].used[1] = val;
>>           break;
>> +    case VIRTIO_PCI_COMMON_Q_RESET:
>> +        if (val == 1) {
>> +            /*
>> +             * With the global iothread lock taken, the migration 
>> will not
>> +             * happen until the virtqueue reset is done.
>> +             */
>
>
> This comment applies to all other common cfg operation as well, So it 
> looks not necessary?
>
Get it.

>
>> + proxy->vqs[vdev->queue_sel].reset = 1;
>> +
>> +            virtio_queue_reset(vdev, vdev->queue_sel);
>> +
>> +            proxy->vqs[vdev->queue_sel].reset = 0;
>> +            proxy->vqs[vdev->queue_sel].enabled = 0;
>> +        }
>> +        break;
>>       default:
>>           break;
>>       }
>> @@ -1950,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
>>         for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>           proxy->vqs[i].enabled = 0;
>> +        proxy->vqs[i].reset = 0;
>>           proxy->vqs[i].num = 0;
>>           proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>>           proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>> diff --git a/include/hw/virtio/virtio-pci.h 
>> b/include/hw/virtio/virtio-pci.h
>> index 2446dcd9ae..e9290e2b94 100644
>> --- a/include/hw/virtio/virtio-pci.h
>> +++ b/include/hw/virtio/virtio-pci.h
>> @@ -117,6 +117,7 @@ typedef struct VirtIOPCIRegion {
>>   typedef struct VirtIOPCIQueue {
>>     uint16_t num;
>>     bool enabled;
>> +  bool reset;
>
>
> Do we need to migrate this?
>
> Thanks
>
I think we do not need to migrate this because we hold the global 
iothread lock when virtqueue reset is triggered. The migration of these 
device states also needs this lock.

On the other hand, the 'reset' state of virtqueue is same(is 0) before 
and after the process of resetting a virtqueue.

Thus, the migration will not happen when we are resetting a virtqueue 
and we do not to migrate it.

Thanks

>
>>     uint32_t desc[2];
>>     uint32_t avail[2];
>>     uint32_t used[2];

