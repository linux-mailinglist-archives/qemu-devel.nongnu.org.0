Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DFB639419
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 07:35:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyoku-0000qh-D0; Sat, 26 Nov 2022 01:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1oyokq-0000qW-T9
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 01:33:36 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1oyokn-0006SF-HQ
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 01:33:36 -0500
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NK23954DMzHwCB;
 Sat, 26 Nov 2022 14:32:37 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 14:33:16 +0800
Subject: Re: [PATCH v2] vfio/pci: Verify each MSI vector to avoid invalid MSI
 vectors
To: Marc Zyngier <maz@kernel.org>
References: <1669167756-196788-1-git-send-email-chenxiang66@hisilicon.com>
 <86k03loouy.wl-maz@kernel.org>
CC: <alex.williamson@redhat.com>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Message-ID: <d8eb618b-681c-8811-6ddf-1b951753fee6@hisilicon.com>
Date: Sat, 26 Nov 2022 14:33:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <86k03loouy.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/11/23 20:08, Marc Zyngier 写道:
> On Wed, 23 Nov 2022 01:42:36 +0000,
> chenxiang <chenxiang66@hisilicon.com> wrote:
>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>
>> Currently the number of MSI vectors comes from register PCI_MSI_FLAGS
>> which should be power-of-2 in qemu, in some scenaries it is not the same as
>> the number that driver requires in guest, for example, a PCI driver wants
>> to allocate 6 MSI vecotrs in guest, but as the limitation, it will allocate
>> 8 MSI vectors. So it requires 8 MSI vectors in qemu while the driver in
>> guest only wants to allocate 6 MSI vectors.
>>
>> When GICv4.1 is enabled, it iterates over all possible MSIs and enable the
>> forwarding while the guest has only created some of mappings in the virtual
>> ITS, so some calls fail. The exception print is as following:
>> vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d) registration
>> fails:66311
>>
>> To avoid the issue, verify each MSI vector, skip some operations such as
>> request_irq() and irq_bypass_register_producer() for those invalid MSI vectors.
>>
>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>> ---
>> I reported the issue at the link:
>> https://lkml.kernel.org/lkml/87cze9lcut.wl-maz@kernel.org/T/
>>
>> Change Log:
>> v1 -> v2:
>> Verify each MSI vector in kernel instead of adding systemcall according to
>> Mar's suggestion
>> ---
>>   arch/arm64/kvm/vgic/vgic-irqfd.c  | 13 +++++++++++++
>>   arch/arm64/kvm/vgic/vgic-its.c    | 36 ++++++++++++++++++++++++++++++++++++
>>   arch/arm64/kvm/vgic/vgic.h        |  1 +
>>   drivers/vfio/pci/vfio_pci_intrs.c | 33 +++++++++++++++++++++++++++++++++
>>   include/linux/kvm_host.h          |  2 ++
>>   5 files changed, 85 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
>> index 475059b..71f6af57 100644
>> --- a/arch/arm64/kvm/vgic/vgic-irqfd.c
>> +++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
>> @@ -98,6 +98,19 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
>>   	return vgic_its_inject_msi(kvm, &msi);
>>   }
>>   
>> +int kvm_verify_msi(struct kvm *kvm,
>> +		   struct kvm_kernel_irq_routing_entry *irq_entry)
>> +{
>> +	struct kvm_msi msi;
>> +
>> +	if (!vgic_has_its(kvm))
>> +		return -ENODEV;
>> +
>> +	kvm_populate_msi(irq_entry, &msi);
>> +
>> +	return vgic_its_verify_msi(kvm, &msi);
>> +}
>> +
>>   /**
>>    * kvm_arch_set_irq_inatomic: fast-path for irqfd injection
>>    */
>> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
>> index 94a666d..8312a4a 100644
>> --- a/arch/arm64/kvm/vgic/vgic-its.c
>> +++ b/arch/arm64/kvm/vgic/vgic-its.c
>> @@ -767,6 +767,42 @@ int vgic_its_inject_cached_translation(struct kvm *kvm, struct kvm_msi *msi)
>>   	return 0;
>>   }
>>   
>> +int vgic_its_verify_msi(struct kvm *kvm, struct kvm_msi *msi)
>> +{
>> +	struct vgic_its *its;
>> +	struct its_ite *ite;
>> +	struct kvm_vcpu *vcpu;
>> +	int ret = 0;
>> +
>> +	if (!irqchip_in_kernel(kvm) || (msi->flags & ~KVM_MSI_VALID_DEVID))
>> +		return -EINVAL;
>> +
>> +	if (!vgic_has_its(kvm))
>> +		return -ENODEV;
>> +
>> +	its = vgic_msi_to_its(kvm, msi);
>> +	if (IS_ERR(its))
>> +		return PTR_ERR(its);
>> +
>> +	mutex_lock(&its->its_lock);
>> +	if (!its->enabled) {
>> +		ret = -EBUSY;
>> +		goto unlock;
>> +	}
>> +	ite = find_ite(its, msi->devid, msi->data);
>> +	if (!ite || !its_is_collection_mapped(ite->collection)) {
>> +		ret = E_ITS_INT_UNMAPPED_INTERRUPT;
>> +		goto unlock;
>> +	}
>> +
>> +	vcpu = kvm_get_vcpu(kvm, ite->collection->target_addr);
>> +	if (!vcpu)
>> +		ret = E_ITS_INT_UNMAPPED_INTERRUPT;
> I'm sorry, but what does this mean to the caller? This should never
> leak outside of the ITS code.

Actually it is already leak outside of ITS code, and please see the 
exception printk (E_ITS_INT_UNMAPPED_INTERRUPT is 0x10307 which is equal 
to 66311):

vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d) registration fails:66311


>
>> +unlock:
>> +	mutex_unlock(&its->its_lock);
>> +	return ret;
>> +}
>> +
>>   /*
>>    * Queries the KVM IO bus framework to get the ITS pointer from the given
>>    * doorbell address.
>> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
>> index 0c8da72..d452150 100644
>> --- a/arch/arm64/kvm/vgic/vgic.h
>> +++ b/arch/arm64/kvm/vgic/vgic.h
>> @@ -240,6 +240,7 @@ int kvm_vgic_register_its_device(void);
>>   void vgic_enable_lpis(struct kvm_vcpu *vcpu);
>>   void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu);
>>   int vgic_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi);
>> +int vgic_its_verify_msi(struct kvm *kvm, struct kvm_msi *msi);
>>   int vgic_v3_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr);
>>   int vgic_v3_dist_uaccess(struct kvm_vcpu *vcpu, bool is_write,
>>   			 int offset, u32 *val);
>> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
>> index 40c3d7c..3027805 100644
>> --- a/drivers/vfio/pci/vfio_pci_intrs.c
>> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/vfio.h>
>>   #include <linux/wait.h>
>>   #include <linux/slab.h>
>> +#include <linux/kvm_irqfd.h>
>>   
>>   #include "vfio_pci_priv.h"
>>   
>> @@ -315,6 +316,28 @@ static int vfio_msi_enable(struct vfio_pci_core_device *vdev, int nvec, bool msi
>>   	return 0;
>>   }
>>   
>> +static int vfio_pci_verify_msi_entry(struct vfio_pci_core_device *vdev,
>> +		struct eventfd_ctx *trigger)
>> +{
>> +	struct kvm *kvm = vdev->vdev.kvm;
>> +	struct kvm_kernel_irqfd *tmp;
>> +	struct kvm_kernel_irq_routing_entry irq_entry;
>> +	int ret = -ENODEV;
>> +
>> +	spin_lock_irq(&kvm->irqfds.lock);
>> +	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
>> +		if (trigger == tmp->eventfd) {
>> +			ret = 0;
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock_irq(&kvm->irqfds.lock);
>> +	if (ret)
>> +		return ret;
>> +	irq_entry = tmp->irq_entry;
>> +	return kvm_verify_msi(kvm, &irq_entry);
> How does this work on !arm64? Why do we need an on-stack version of
> tmp->irq_entry?

Right, i didn't notice that it is common code and need to be work on 
other platforms.

>
>> +}
>> +
>>   static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
>>   				      int vector, int fd, bool msix)
>>   {
>> @@ -355,6 +378,16 @@ static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
>>   		return PTR_ERR(trigger);
>>   	}
>>   
>> +	if (!msix) {
>> +		ret = vfio_pci_verify_msi_entry(vdev, trigger);
>> +		if (ret) {
>> +			kfree(vdev->ctx[vector].name);
>> +			eventfd_ctx_put(trigger);
>> +			if (ret > 0)
>> +				ret = 0;
>> +			return ret;
>> +		}
>> +	}
> Honestly, the whole things seems really complicated to avoid something
> that is only a harmless warning .

It seems also waste some interrupts. Allocating and requesting some 
interrupts but not used.

> How about just toning down the
> message instead?

ok


