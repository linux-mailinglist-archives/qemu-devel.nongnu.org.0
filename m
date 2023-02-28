Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1A6A5786
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:11:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxsl-0007Br-Fu; Tue, 28 Feb 2023 06:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWxsd-00078b-Eh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:10:47 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWxsa-0008Tz-24
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:10:47 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PQvls0ZxyzrSGY;
 Tue, 28 Feb 2023 19:10:01 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 19:10:38 +0800
Message-ID: <bab5d0de-133f-54b7-a239-11b354a79dd6@huawei.com>
Date: Tue, 28 Feb 2023 19:10:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/3] virtio-pci: defer to commit kvm irq routing when
 enable msi/msix
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <jasowang@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <eperezma@redhat.com>, <alex.williamson@redhat.com>,
 <mtosatti@redhat.com>, <clg@redhat.com>, <qemu-devel@nongnu.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-4-longpeng2@huawei.com>
 <20230228051830-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230228051830-mutt-send-email-mst@kernel.org>
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



在 2023/2/28 18:40, Michael S. Tsirkin 写道:
> On Tue, Feb 28, 2023 at 05:39:37PM +0800, Longpeng(Mike) wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> All unmasked vectors will be setup in msix_set_vector_notifiers(), which
>> is a time-consuming operation because each vector need to be submit to
>> KVM once. It's even worse if the VM has several devices and each devices
>> has dozens of vectors.
>>
>> We can defer and commit the vectors in batch, just like the commit dc580d51f7
>> ("vfio: defer to commit kvm irq routing when enable msi/msix"),
>>
>> The can reduce 80% of the time spending on virtio_pci_set_guest_notifiers().
> 
> cover letter also refers to 80%. what about patch 1 then? does it
> contribute some of this gain?
> 

Sorry, it's a clerical error, patch 3 reduces 50% in actually.

In my test, patch 1 can reduce 37%(160ms->101ms) and patch 3 can reduce 
50%(101ms->21ms, 80/160).

>> Signed-off-by: Longpeng <longpeng2@huawei.com>
> 
> In the age of language models there's no longer any excuse to post
> agrammatical commit messages. Please just give your text to one of these
> to correct.
> 

Oh, I really envy you because I can not use it in my workspace. Thank 
you for your correction.

> I prompted: "please correct grammar in the following text"
> and got back:
> 
> 	All unmasked vectors will be set up in
> 	msix_set_vector_notifiers(), which is a time-consuming operation because
> 	each vector needs to be submitted to KVM once. It's even worse if the VM
> 	has several devices and each device has dozens of vectors.
> 
> 	We can defer and commit the vectors in batches, just like the
> 	commit dc580d51f7 ("vfio: defer to commit kvm irq routing when enabling
> 	msi/msix").
> 
> 	This can reduce the time spent on virtio_pci_set_guest_notifiers() by 80%.
> 
> 
> 
> 
>> ---
>>   hw/virtio/virtio-pci.c     | 113 ++++++++++++++++++++++++++++++++-----
>>   include/hw/virtio/virtio.h |   1 +
>>   2 files changed, 99 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 5fd02b7cb8..13f9c31009 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -51,15 +51,22 @@
>>   
>>   /* Protected by the BQL */
>>   static KVMRouteChange virtio_pci_route_change;
>> +static unsigned virtio_pci_route_change_depth;
>>   
>>   static inline void virtio_pci_begin_route_changes(void)
>>   {
>> -    virtio_pci_route_change = kvm_irqchip_begin_route_changes(kvm_state);
>> +    if (!virtio_pci_route_change_depth) {
>> +        virtio_pci_route_change = kvm_irqchip_begin_route_changes(kvm_state);
>> +    }
>> +    virtio_pci_route_change_depth++;
>>   }
>>   
>>   static inline void virtio_pci_commit_route_changes(void)
>>   {
>> -    kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
>> +    virtio_pci_route_change_depth--;
>> +    if (!virtio_pci_route_change_depth) {
>> +        kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
>> +    }
>>   }
>>   
>>   static void virtio_pci_bus_new(VirtioBusState *bus, size_t bus_size,
>> @@ -976,6 +983,88 @@ static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
>>       kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
>>   }
>>   
>> +static int virtio_pci_vector_do_unmask(VirtIOPCIProxy *proxy,
>> +                                       unsigned int queue_no,
>> +                                       unsigned int vector,
>> +                                       EventNotifier *n)
>> +{
>> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>> +    int ret = 0;
>> +
>> +    /*
>> +     * If guest supports masking, irqfd is already setup, unmask it.
>> +     * Otherwise, set it up now.
>> +     */
>> +    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>> +        k->guest_notifier_mask(vdev, queue_no, false);
>> +        /* Test after unmasking to avoid losing events. */
>> +        if (k->guest_notifier_pending &&
>> +            k->guest_notifier_pending(vdev, queue_no)) {
>> +            event_notifier_set(n);
>> +        }
>> +    } else {
>> +        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void virtio_pci_prepare_kvm_msi_virq_batch(VirtIOPCIProxy *proxy)
>> +{
>> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>> +
>> +    assert(!vdev->defer_kvm_irq_routing);
>> +    vdev->defer_kvm_irq_routing = true;
>> +    virtio_pci_begin_route_changes();
> 
> move this out of here please - otherwise it's not clear each begin
> is matched by commit.  in fact just open code this function.
> 
>> +}
>> +
>> +static void virtio_pci_commit_kvm_msi_virq_batch(VirtIOPCIProxy *proxy)
>> +{
>> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>> +    PCIDevice *dev = &proxy->pci_dev;
>> +    VirtQueue *vq;
>> +    EventNotifier *n;
>> +    int vector, index;
>> +    int ret;
>> +
>> +    assert(vdev->defer_kvm_irq_routing);
>> +    virtio_pci_commit_route_changes();
>> +    vdev->defer_kvm_irq_routing = false;
>> +
>> +    if (!msix_enabled(dev)) {
>> +        return;
>> +    }
>> +
>> +    /* Unmask all unmasked vectors */
>> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>> +        if (msix_is_masked(dev, vector)) {
>> +            continue;
>> +        }
>> +
>> +        vq = virtio_vector_first_queue(vdev, vector);
>> +        while (vq) {
>> +            index = virtio_get_queue_index(vq);
>> +            if (!virtio_queue_get_num(vdev, index)) {
>> +                break;
>> +            }
>> +            if (index < proxy->nvqs_with_notifiers) {
>> +                n = virtio_queue_get_guest_notifier(vq);
>> +                ret = virtio_pci_vector_do_unmask(proxy, index, vector, n);
>> +                assert(ret >= 0);
>> +            }
>> +            vq = virtio_vector_next_queue(vq);
>> +        }
>> +
>> +        if (vector == vdev->config_vector) {
>> +            n = virtio_config_get_guest_notifier(vdev);
>> +            ret = virtio_pci_vector_do_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX,
>> +                                              vector, n);
>> +            assert(ret >= 0);
>> +        }
>> +    }
>> +}
>> +
>>   static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>>                                          unsigned int queue_no,
>>                                          unsigned int vector,
>> @@ -983,7 +1072,6 @@ static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>>                                          EventNotifier *n)
>>   {
>>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>>       VirtIOIRQFD *irqfd;
>>       int ret = 0;
>>   
>> @@ -1002,19 +1090,10 @@ static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>>           }
>>       }
>>   
>> -    /* If guest supports masking, irqfd is already setup, unmask it.
>> -     * Otherwise, set it up now.
>> -     */
>> -    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>> -        k->guest_notifier_mask(vdev, queue_no, false);
>> -        /* Test after unmasking to avoid losing events. */
>> -        if (k->guest_notifier_pending &&
>> -            k->guest_notifier_pending(vdev, queue_no)) {
>> -            event_notifier_set(n);
>> -        }
>> -    } else {
>> -        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>> +    if (!vdev->defer_kvm_irq_routing) {
>> +        ret = virtio_pci_vector_do_unmask(proxy, queue_no, vector, n);
>>       }
>> +
>>       return ret;
>>   }
>>   
>> @@ -1284,12 +1363,16 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>>               }
>>           }
>>   
>> +        virtio_pci_prepare_kvm_msi_virq_batch(proxy);
>> +
>>           r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
>>                                         virtio_pci_vector_mask,
>>                                         virtio_pci_vector_poll);
>>           if (r < 0) {
>>               goto notifiers_error;
>>           }
>> +
>> +        virtio_pci_commit_kvm_msi_virq_batch(proxy);
>>       }
>>   
>>       return 0;
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 77c6c55929..9d82831350 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -147,6 +147,7 @@ struct VirtIODevice
>>       bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
>>       bool disable_legacy_check;
>>       bool vhost_started;
>> +    bool defer_kvm_irq_routing;
> 
> Can't we avoid leaking kvm things all over the place?
> What does this flag even mean?
> 
>>       VMChangeStateEntry *vmstate;
>>       char *bus_name;
>>       uint8_t device_endian;
>> -- 
>> 2.23.0
> 
> .

