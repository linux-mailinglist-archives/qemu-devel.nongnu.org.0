Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06124021E7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:21:02 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQjN-0003Bo-Dh
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQbq-0004NC-8O
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:13:14 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQbo-0001YN-16
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:13:14 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H3TG91q6Bz8yCq;
 Tue,  7 Sep 2021 10:08:49 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:13:08 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:13:08 +0800
Subject: Re: [PATCH 4/5] kvm: irqchip: support defer to commit the route
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-5-longpeng2@huawei.com>
 <20210903155719.7a95d8be.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <5e597d2f-0cb5-29b8-694b-bcbfe027676a@huawei.com>
Date: Tue, 7 Sep 2021 10:13:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210903155719.7a95d8be.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



ÔÚ 2021/9/4 5:57, Alex Williamson Ð´µÀ:
> On Wed, 25 Aug 2021 15:56:19 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
> 
>> The kvm_irqchip_commit_routes() is relatively expensive, so
>> provide the users a choice to commit the route immediately
>> or not when they add msi/msix route.
>>
>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> ---
>>  accel/kvm/kvm-all.c    | 10 +++++++---
>>  accel/stubs/kvm-stub.c |  3 ++-
>>  hw/misc/ivshmem.c      |  2 +-
>>  hw/vfio/pci.c          |  2 +-
>>  hw/virtio/virtio-pci.c |  2 +-
>>  include/sysemu/kvm.h   |  4 +++-
>>  target/i386/kvm/kvm.c  |  2 +-
>>  7 files changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 0125c17..1f788a2 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -1950,7 +1950,8 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>>      return kvm_set_irq(s, route->kroute.gsi, 1);
>>  }
>>  
>> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
>> +                              bool defer_commit)
>>  {
>>      struct kvm_irq_routing_entry kroute = {};
>>      int virq;
>> @@ -1993,7 +1994,9 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>>  
>>      kvm_add_routing_entry(s, &kroute);
>>      kvm_arch_add_msi_route_post(&kroute, vector, dev);
>> -    kvm_irqchip_commit_routes(s);
>> +    if (!defer_commit) {
>> +        kvm_irqchip_commit_routes(s);
>> +    }
> 
> 
> Personally I'd rather rename the function to
> kvm_irqchip_add_deferred_msi_route() and kvm_irqchip_add_msi_route()
> becomes a wrapper appending kvm_irqchip_commit_routes() to that.
> Thanks,
> 

Ok, will do in the next version.

> Alex
> 
>>  
>>      return virq;
>>  }
>> @@ -2151,7 +2154,8 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>>      abort();
>>  }
>>  
>> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
>> +                              bool defer_commit)
>>  {
>>      return -ENOSYS;
>>  }
>> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
>> index 5b1d00a..d5caaca 100644
>> --- a/accel/stubs/kvm-stub.c
>> +++ b/accel/stubs/kvm-stub.c
>> @@ -81,7 +81,8 @@ int kvm_on_sigbus(int code, void *addr)
>>  }
>>  
>>  #ifndef CONFIG_USER_ONLY
>> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
>> +                              bool defer_commit)
>>  {
>>      return -ENOSYS;
>>  }
>> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
>> index 1ba4a98..98b14cc 100644
>> --- a/hw/misc/ivshmem.c
>> +++ b/hw/misc/ivshmem.c
>> @@ -429,7 +429,7 @@ static void ivshmem_add_kvm_msi_virq(IVShmemState *s, int vector,
>>      IVSHMEM_DPRINTF("ivshmem_add_kvm_msi_virq vector:%d\n", vector);
>>      assert(!s->msi_vectors[vector].pdev);
>>  
>> -    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev);
>> +    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev, false);
>>      if (ret < 0) {
>>          error_setg(errp, "kvm_irqchip_add_msi_route failed");
>>          return;
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index ca37fb7..3ab67d6 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -427,7 +427,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>          return;
>>      }
>>  
>> -    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
>> +    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev, false);
>>      if (virq < 0) {
>>          event_notifier_cleanup(&vector->kvm_interrupt);
>>          return;
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 433060a..7e2d021 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -684,7 +684,7 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
>>      int ret;
>>  
>>      if (irqfd->users == 0) {
>> -        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
>> +        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev, false);
>>          if (ret < 0) {
>>              return ret;
>>          }
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index a1ab1ee..1932dc0 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -473,9 +473,11 @@ void kvm_init_cpu_signals(CPUState *cpu);
>>   *          message.
>>   * @dev:    Owner PCI device to add the route. If @dev is specified
>>   *          as @NULL, an empty MSI message will be inited.
>> + * @defer_commit:   Defer to commit new route to the KVM core.
>>   * @return: virq (>=0) when success, errno (<0) when failed.
>>   */
>> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
>> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
>> +                              bool defer_commit);
>>  int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
>>                                   PCIDevice *dev);
>>  void kvm_irqchip_commit_routes(KVMState *s);
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index e69abe4..896406b 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -4724,7 +4724,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
>>          /* If the ioapic is in QEMU and the lapics are in KVM, reserve
>>             MSI routes for signaling interrupts to the local apics. */
>>          for (i = 0; i < IOAPIC_NUM_PINS; i++) {
>> -            if (kvm_irqchip_add_msi_route(s, 0, NULL) < 0) {
>> +            if (kvm_irqchip_add_msi_route(s, 0, NULL, false) < 0) {
>>                  error_report("Could not enable split IRQ mode.");
>>                  exit(1);
>>              }
> 
> .
> 

