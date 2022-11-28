Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64763A448
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oza8A-0000W1-Ii; Mon, 28 Nov 2022 04:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1oza7q-0000VC-7B
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:08:40 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1oza7n-0001xd-8U
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:08:29 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NLKNz6FTnzRq1x;
 Mon, 28 Nov 2022 17:07:31 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 28 Nov 2022 17:08:06 +0800
Message-ID: <45e851db-7633-8942-4baf-5ca608c9dd61@huawei.com>
Date: Mon, 28 Nov 2022 17:08:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] vhost: configure all host notifiers in a single MR
 transaction
To: Jason Wang <jasowang@redhat.com>
CC: <stefanha@redhat.com>, <mst@redhat.com>, <sgarzare@redhat.com>,
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20221118144915.2009-1-longpeng2@huawei.com>
 <CACGkMEu4R92uX_J43ZKetg3Q1FCTQR1Z7u4Ua3Jx2y7cjxX1Og@mail.gmail.com>
In-Reply-To: <CACGkMEu4R92uX_J43ZKetg3Q1FCTQR1Z7u4Ua3Jx2y7cjxX1Og@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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



在 2022/11/21 12:01, Jason Wang 写道:
> On Fri, Nov 18, 2022 at 10:49 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>
>> From: Longpeng <longpeng2@huawei.com>
>>
>> This allows the vhost device to batch the setup of all its host notifiers.
>> This significantly reduces the device starting time, e.g. the vhost-vDPA
>> generic device [1] start time reduce from 376ms to 9.1ms for a VM with
>> 64 vCPUs and 3 vDPA device(64vq per device).
> 
> Great, I think we need to do this for host_notifiers_mr as well. This
> helps for the case when the notification area could be mapped directly
> to guests.
> 
Batch and commit once for host_notifiers_mrs can reduce the cost from 
423ms to 32ms, testing on vdpasim_blk (3 devices and 64 vqs per device) 
with doorbell passthrough support.
I'll append a patch in the next version.

>>
>> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>>   hw/virtio/vhost.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index d1c4c20b8c..bf82d9b176 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1507,6 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
>>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>>   {
>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +    int vq_init_count = 0;
>>       int i, r, e;
>>
>>       /* We will pass the notifiers to the kernel, make sure that QEMU
>> @@ -1518,6 +1519,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>>           goto fail;
>>       }
>>
>> +    /*
>> +     * Batch all the host notifiers in a single transaction to avoid
>> +     * quadratic time complexity in address_space_update_ioeventfds().
>> +     */
>> +    memory_region_transaction_begin();
>> +
>>       for (i = 0; i < hdev->nvqs; ++i) {
>>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>>                                            true);
>> @@ -1525,19 +1532,33 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>>               error_report("vhost VQ %d notifier binding failed: %d", i, -r);
>>               goto fail_vq;
>>           }
>> +
>> +        vq_init_count++;
>>       }
> 
> Nit, the name needs some tweak, it's actually the number of the host
> notifiers that is initialized. And we can count it out of the loop.
> 
Ok, I will refer to virtio_device_start_ioeventfd_impl().

>>
>> +    memory_region_transaction_commit();
>> +
>>       return 0;
>>   fail_vq:
>> -    while (--i >= 0) {
>> +    for (i = 0; i < vq_init_count; i++) {
> 
> It looks to me there's no need for this change.
> 
> Others look good.
> 
> Thanks
> 
>>           e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>>                                            false);
>>           if (e < 0) {
>>               error_report("vhost VQ %d notifier cleanup error: %d", i, -r);
>>           }
>>           assert (e >= 0);
>> +    }
>> +
>> +    /*
>> +     * The transaction expects the ioeventfds to be open when it
>> +     * commits. Do it now, before the cleanup loop.
>> +     */
>> +    memory_region_transaction_commit();
>> +
>> +    for (i = 0; i < vq_init_count; i++) {
>>           virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
>>       }
>> +
>>       virtio_device_release_ioeventfd(vdev);
>>   fail:
>>       return r;
>> @@ -1553,6 +1574,12 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>>       int i, r;
>>
>> +    /*
>> +     * Batch all the host notifiers in a single transaction to avoid
>> +     * quadratic time complexity in address_space_update_ioeventfds().
>> +     */
>> +    memory_region_transaction_begin();
>> +
>>       for (i = 0; i < hdev->nvqs; ++i) {
>>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>>                                            false);
>> @@ -1560,8 +1587,18 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>>               error_report("vhost VQ %d notifier cleanup failed: %d", i, -r);
>>           }
>>           assert (r >= 0);
>> +    }
>> +
>> +    /*
>> +     * The transaction expects the ioeventfds to be open when it
>> +     * commits. Do it now, before the cleanup loop.
>> +     */
>> +    memory_region_transaction_commit();
>> +
>> +    for (i = 0; i < hdev->nvqs; ++i) {
>>           virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
>>       }
>> +
>>       virtio_device_release_ioeventfd(vdev);
>>   }
>>
>> --
>> 2.23.0
>>
> 
> .

