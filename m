Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CF644142
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2VCF-0003ZP-0w; Tue, 06 Dec 2022 05:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p2VC8-0003Wb-I8
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:29:00 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p2VC5-0002hO-Bu
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:29:00 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NRGkB6PZ9zqSsV;
 Tue,  6 Dec 2022 18:24:34 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 18:28:42 +0800
Message-ID: <1fc867d6-2c2b-36ca-1154-90ff6fc1b074@huawei.com>
Date: Tue, 6 Dec 2022 18:28:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] vhost: configure all host notifiers in a single MR
 transaction
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20221206081841.2458-1-longpeng2@huawei.com>
 <20221206081841.2458-2-longpeng2@huawei.com>
 <ee85dd7e-7ec0-03f2-ba17-c8e2987f200c@linaro.org>
In-Reply-To: <ee85dd7e-7ec0-03f2-ba17-c8e2987f200c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/12/6 17:07, Philippe Mathieu-Daudé 写道:
> On 6/12/22 09:18, Longpeng(Mike) via wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> This allows the vhost device to batch the setup of all its host 
>> notifiers.
>> This significantly reduces the device starting time, e.g. the time spend
>> on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
>> and 3 vhost-vDPA generic devices[1] (64vq per device)
>>
>> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>>   hw/virtio/vhost.c | 40 ++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 7fb008bc9e..16f8391d86 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1507,7 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
>>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice 
>> *vdev)
>>   {
>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> -    int i, r, e;
>> +    int i, n, r, e;
>>       /* We will pass the notifiers to the kernel, make sure that QEMU
>>        * doesn't interfere.
>> @@ -1518,6 +1518,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev 
>> *hdev, VirtIODevice *vdev)
>>           goto fail;
>>       }
>> +    /*
>> +     * Batch all the host notifiers in a single transaction to avoid
>> +     * quadratic time complexity in address_space_update_ioeventfds().
>> +     */
>> +    memory_region_transaction_begin();
>> +
>>       for (i = 0; i < hdev->nvqs; ++i) {
>>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
>> hdev->vq_index + i,
>>                                            true);
>> @@ -1527,8 +1533,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev 
>> *hdev, VirtIODevice *vdev)
>>           }
>>       }
>> +    memory_region_transaction_commit();
>> +
>>       return 0;
>>   fail_vq:
>> +    /* save i for a second iteration after transaction is committed. */
>> +    n = i;
>>       while (--i >= 0) {
>>           e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
>> hdev->vq_index + i,
>>                                            false);
>> @@ -1536,8 +1546,18 @@ fail_vq:
>>               error_report("vhost VQ %d notifier cleanup error: %d", 
>> i, -r);
>>           }
>>           assert (e >= 0);
>> -        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), 
>> hdev->vq_index + i);
>>       }
>> +
>> +    /*
>> +     * The transaction expects the ioeventfds to be open when it
>> +     * commits. Do it now, before the cleanup loop.
>> +     */
>> +    memory_region_transaction_commit();
>> +
>> +    while (--n >= 0) {
>> +        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), 
>> hdev->vq_index + n);
>> +    }
>> +
>>       virtio_device_release_ioeventfd(vdev);
>>   fail:
>>       return r;
> 
> Similarly to patch #2, removing both goto statement in this function (as 
> a preliminary patch) will 1/ simplify the code 2/ simplify reviewing 
> your changes, resulting in something like:
> 
> int vhost_dev_enable_notifiers(struct vhost_dev *hdev,
>                                 VirtIODevice *vdev)
> {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>      int i, r, e;
> 
>      /* We will pass the notifiers to the kernel, make sure that QEMU
>       * doesn't interfere.
>       */
>      r = virtio_device_grab_ioeventfd(vdev);
>      if (r < 0) {
>          error_report("binding does not support host notifiers");
>          return r;
>      }
> 
>      memory_region_transaction_begin();
> 
>      for (i = 0; i < hdev->nvqs; ++i) {
>          r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus),
>                                           hdev->vq_index + i,
>                                           true);
>          if (r < 0) {
>              error_report("vhost VQ %d notifier binding failed: %d",
>                           i, -r);
>              while (--i >= 0) {
>                  e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus),
>                                                   hdev->vq_index + i,
>                                                   false);
>                  if (e < 0) {
>                      error_report(
>                                 "vhost VQ %d notifier cleanup error: %d",
>                                   i, -r);
>                  }
>                  assert (e >= 0);
>                  virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus),
>                                                   hdev->vq_index + i);
>              }
>              virtio_device_release_ioeventfd(vdev);
>              break;
>          }
>      }
> 
>      memory_region_transaction_commit();
> 
>      return r;
> }
> 
> What do you think?
> 
Maybe we can use vhost_dev_disable_notifiers to further simplify the 
error path ?

And we must commit before invoking virtio_bus_cleanup_host_notifier.

> Regards,
> 
> Phil.
> .

