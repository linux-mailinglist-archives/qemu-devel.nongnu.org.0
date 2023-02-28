Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B56A5870
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:39:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyKG-0007BK-4Z; Tue, 28 Feb 2023 06:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWyKC-0007B8-9O
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:39:16 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWyK9-0005iM-67
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:39:16 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PQwLQ2pprzZfnV;
 Tue, 28 Feb 2023 19:36:30 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 19:39:07 +0800
Message-ID: <aa1a5b0d-0657-5950-f940-0e6d930d5475@huawei.com>
Date: Tue, 28 Feb 2023 19:39:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/3] virtio-pci: submit msi route changes in batch
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <jasowang@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <eperezma@redhat.com>, <alex.williamson@redhat.com>,
 <mtosatti@redhat.com>, <clg@redhat.com>, <qemu-devel@nongnu.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-2-longpeng2@huawei.com>
 <20230228051619-mutt-send-email-mst@kernel.org>
 <d21264c2-12d9-a0d3-b4e5-fb4b39cca920@huawei.com>
In-Reply-To: <d21264c2-12d9-a0d3-b4e5-fb4b39cca920@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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



在 2023/2/28 19:20, Longpeng (Mike, Cloud Infrastructure Service Product 
Dept.) 写道:
> 
> 
> 在 2023/2/28 18:17, Michael S. Tsirkin 写道:
>> On Tue, Feb 28, 2023 at 05:39:35PM +0800, Longpeng(Mike) wrote:
>>> From: Longpeng <longpeng2@huawei.com>
>>>
>>> The kvm_irqchip_commit_routes() is a time-intensive operation, it needs
>>> scan and update all irqfds that are already assigned during each 
>>> invocation,
>>> so more vectors means need more time to process them.
>>
>> I think the real reason is it's the write side of RCU.
>>
> 
> Yes, so we can reduce the invocation of it in this way.
> 
> I'll send other optimizations in the next step, including irqbypass, 
> kvm_irqfd, etc.
> 

Iterates the irqfds list is also time-consuming, it would iterate all 
existing irqfds when we commit, so the time complexity is O(n^2) without 
this patch.

>>> For virtio-pci, we
>>> can just submit once when enabling vectors of a virtio-pci device.
>>>
>>> This can reduce the downtime when migrating a VM with vhost-vdpa 
>>> devices.
>>>
>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>> ---
>>>   hw/virtio/virtio-pci.c | 24 +++++++++++++++++++++---
>>>   1 file changed, 21 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>> index 247325c193..22e76e3902 100644
>>> --- a/hw/virtio/virtio-pci.c
>>> +++ b/hw/virtio/virtio-pci.c
>>> @@ -49,6 +49,19 @@
>>>    * configuration space */
>>>   #define VIRTIO_PCI_CONFIG_SIZE(dev)     
>>> VIRTIO_PCI_CONFIG_OFF(msix_enabled(dev))
>>> +/* Protected by the BQL */
>>> +static KVMRouteChange virtio_pci_route_change;
>>> +
>>> +static inline void virtio_pci_begin_route_changes(void)
>>> +{
>>> +    virtio_pci_route_change = 
>>> kvm_irqchip_begin_route_changes(kvm_state);
>>> +}
>>> +
>>> +static inline void virtio_pci_commit_route_changes(void)
>>> +{
>>> +    kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
>>> +}
>>> +
>>>   static void virtio_pci_bus_new(VirtioBusState *bus, size_t bus_size,
>>>                                  VirtIOPCIProxy *dev);
>>>   static void virtio_pci_reset(DeviceState *qdev);
>>> @@ -790,12 +803,11 @@ static int 
>>> kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
>>>       int ret;
>>>       if (irqfd->users == 0) {
>>> -        KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
>>> -        ret = kvm_irqchip_add_msi_route(&c, vector, &proxy->pci_dev);
>>> +        ret = kvm_irqchip_add_msi_route(&virtio_pci_route_change, 
>>> vector,
>>> +                                        &proxy->pci_dev);
>>>           if (ret < 0) {
>>>               return ret;
>>>           }
>>> -        kvm_irqchip_commit_route_changes(&c);
>>>           irqfd->virq = ret;
>>>       }
>>>       irqfd->users++;
>>> @@ -903,12 +915,18 @@ static int 
>>> kvm_virtio_pci_vector_vq_use(VirtIOPCIProxy *proxy, int nvqs)
>>>       int ret = 0;
>>>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>>> +    virtio_pci_begin_route_changes();
>>> +
>>>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>>>           if (!virtio_queue_get_num(vdev, queue_no)) {
>>> +            virtio_pci_commit_route_changes();
>>>               return -1;
>>>           }
>>>           ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
>>>       }
>>> +
>>> +    virtio_pci_commit_route_changes();
>>> +
>>>       return ret;
>>>   }
>>> -- 
>>> 2.23.0
>>
>> .

