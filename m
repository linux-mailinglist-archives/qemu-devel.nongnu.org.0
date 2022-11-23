Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC8F636A36
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 20:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxvq9-0004ZW-QK; Wed, 23 Nov 2022 14:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oxvq7-0004Z7-Aq
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 14:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oxvq5-0004TR-1e
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 14:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669233319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3dxfZ3Nx+gRHeQ3GOY4Y3fAAOJM3/0qRH8nPud9yng=;
 b=cYNWD3BeBHc+fLY4PIwjpMt13aAbxdpfxi/TQ2R1brj4KYwlRs5rNKVqON0n6wUcnp+uhE
 gP0SKgNOy5A8E6SSLnVW84hj4WQ1lh67XoP8KWju75BYC6t3ozFIO2rNjvzyFrAIPEyHeE
 p9Zz/LM4WOVxkEHJD6fmoyuEx3pEUDY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-6yxyx42eNF2YoHhRy0fiAA-1; Wed, 23 Nov 2022 14:55:17 -0500
X-MC-Unique: 6yxyx42eNF2YoHhRy0fiAA-1
Received: by mail-io1-f70.google.com with SMTP id
 n19-20020a6b7713000000b006dee0b795a5so5311772iom.18
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 11:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3dxfZ3Nx+gRHeQ3GOY4Y3fAAOJM3/0qRH8nPud9yng=;
 b=COczA1IBFQZpoEUkXURJwi7tg4S/b3SMzZz2izveK6gNXPwbnifxGqped2GnVQF8Nb
 czN0GcoQoJHyxAcQKrNYqIrgmwCKwNm96+IvynqsvNSh30ajXXAJaPy+4/lmPtoUd1DO
 HTiCY6BidlSdoKHoKSfeIT7Djr1/6+QW4It44zxLqCb+0eqmu69IJF4cfbKqiEJ/spcO
 6E/Vk8TT3ffizpyOebH2iDtU/lnMFt9iDXyc6htHZ+7sp86vxRUEswqmzvfodWe7LDNb
 yw9EGDmloQNQpowsgn00LNx9yX97bCAQVAiMEuE8Oct94JkYe8i3IqLgyNVfAmVuo8Fm
 ghCw==
X-Gm-Message-State: ANoB5plXojZtAFGAu5/icRTS5bg1o08PlgdpS4ctMV32EzQJpDVBw7vC
 TC/OD7i+hwm82+U5YpxpWBosK3ZPnSFxLdEGe+TnN5iLk0w3u/WsjFY4VNKP60LNrvr+MKJNIWx
 q3hwwaecnxXZULlM=
X-Received: by 2002:a05:6e02:ef0:b0:302:c56c:c924 with SMTP id
 j16-20020a056e020ef000b00302c56cc924mr4878108ilk.252.1669233317079; 
 Wed, 23 Nov 2022 11:55:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ScbCCR5OAJ8zoXarOh4IKEVQqJPcyV+vYP/EIjdQHxxIMP1SSsV9yBIzDTtBoN3zLx9cfAg==
X-Received: by 2002:a05:6e02:ef0:b0:302:c56c:c924 with SMTP id
 j16-20020a056e020ef000b00302c56cc924mr4878095ilk.252.1669233316810; 
 Wed, 23 Nov 2022 11:55:16 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b21-20020a056602331500b006ccc36c963fsm6600750ioz.43.2022.11.23.11.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:55:15 -0800 (PST)
Date: Wed, 23 Nov 2022 12:55:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: chenxiang <chenxiang66@hisilicon.com>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v2] vfio/pci: Verify each MSI vector to avoid invalid
 MSI vectors
Message-ID: <20221123125514.5bf83fa8.alex.williamson@redhat.com>
In-Reply-To: <86k03loouy.wl-maz@kernel.org>
References: <1669167756-196788-1-git-send-email-chenxiang66@hisilicon.com>
 <86k03loouy.wl-maz@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 23 Nov 2022 12:08:05 +0000
Marc Zyngier <maz@kernel.org> wrote:

> On Wed, 23 Nov 2022 01:42:36 +0000,
> chenxiang <chenxiang66@hisilicon.com> wrote:
> > 
> > From: Xiang Chen <chenxiang66@hisilicon.com>
> > 
> > Currently the number of MSI vectors comes from register PCI_MSI_FLAGS
> > which should be power-of-2 in qemu, in some scenaries it is not the same as
> > the number that driver requires in guest, for example, a PCI driver wants
> > to allocate 6 MSI vecotrs in guest, but as the limitation, it will allocate
> > 8 MSI vectors. So it requires 8 MSI vectors in qemu while the driver in
> > guest only wants to allocate 6 MSI vectors.
> > 
> > When GICv4.1 is enabled, it iterates over all possible MSIs and enable the
> > forwarding while the guest has only created some of mappings in the virtual
> > ITS, so some calls fail. The exception print is as following:
> > vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d) registration
> > fails:66311
> > 
> > To avoid the issue, verify each MSI vector, skip some operations such as
> > request_irq() and irq_bypass_register_producer() for those invalid MSI vectors.
> > 
> > Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> > ---
> > I reported the issue at the link:
> > https://lkml.kernel.org/lkml/87cze9lcut.wl-maz@kernel.org/T/
> > 
> > Change Log:
> > v1 -> v2:
> > Verify each MSI vector in kernel instead of adding systemcall according to
> > Mar's suggestion
> > ---
> >  arch/arm64/kvm/vgic/vgic-irqfd.c  | 13 +++++++++++++
> >  arch/arm64/kvm/vgic/vgic-its.c    | 36 ++++++++++++++++++++++++++++++++++++
> >  arch/arm64/kvm/vgic/vgic.h        |  1 +
> >  drivers/vfio/pci/vfio_pci_intrs.c | 33 +++++++++++++++++++++++++++++++++
> >  include/linux/kvm_host.h          |  2 ++
> >  5 files changed, 85 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
> > index 475059b..71f6af57 100644
> > --- a/arch/arm64/kvm/vgic/vgic-irqfd.c
> > +++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
> > @@ -98,6 +98,19 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
> >  	return vgic_its_inject_msi(kvm, &msi);
> >  }
> >  
> > +int kvm_verify_msi(struct kvm *kvm,
> > +		   struct kvm_kernel_irq_routing_entry *irq_entry)
> > +{
> > +	struct kvm_msi msi;
> > +
> > +	if (!vgic_has_its(kvm))
> > +		return -ENODEV;
> > +
> > +	kvm_populate_msi(irq_entry, &msi);
> > +
> > +	return vgic_its_verify_msi(kvm, &msi);
> > +}
> > +
> >  /**
> >   * kvm_arch_set_irq_inatomic: fast-path for irqfd injection
> >   */
> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> > index 94a666d..8312a4a 100644
> > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > @@ -767,6 +767,42 @@ int vgic_its_inject_cached_translation(struct kvm *kvm, struct kvm_msi *msi)
> >  	return 0;
> >  }
> >  
> > +int vgic_its_verify_msi(struct kvm *kvm, struct kvm_msi *msi)
> > +{
> > +	struct vgic_its *its;
> > +	struct its_ite *ite;
> > +	struct kvm_vcpu *vcpu;
> > +	int ret = 0;
> > +
> > +	if (!irqchip_in_kernel(kvm) || (msi->flags & ~KVM_MSI_VALID_DEVID))
> > +		return -EINVAL;
> > +
> > +	if (!vgic_has_its(kvm))
> > +		return -ENODEV;
> > +
> > +	its = vgic_msi_to_its(kvm, msi);
> > +	if (IS_ERR(its))
> > +		return PTR_ERR(its);
> > +
> > +	mutex_lock(&its->its_lock);
> > +	if (!its->enabled) {
> > +		ret = -EBUSY;
> > +		goto unlock;
> > +	}
> > +	ite = find_ite(its, msi->devid, msi->data);
> > +	if (!ite || !its_is_collection_mapped(ite->collection)) {
> > +		ret = E_ITS_INT_UNMAPPED_INTERRUPT;
> > +		goto unlock;
> > +	}
> > +
> > +	vcpu = kvm_get_vcpu(kvm, ite->collection->target_addr);
> > +	if (!vcpu)
> > +		ret = E_ITS_INT_UNMAPPED_INTERRUPT;  
> 
> I'm sorry, but what does this mean to the caller? This should never
> leak outside of the ITS code.
> 
> > +unlock:
> > +	mutex_unlock(&its->its_lock);
> > +	return ret;
> > +}
> > +
> >  /*
> >   * Queries the KVM IO bus framework to get the ITS pointer from the given
> >   * doorbell address.
> > diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> > index 0c8da72..d452150 100644
> > --- a/arch/arm64/kvm/vgic/vgic.h
> > +++ b/arch/arm64/kvm/vgic/vgic.h
> > @@ -240,6 +240,7 @@ int kvm_vgic_register_its_device(void);
> >  void vgic_enable_lpis(struct kvm_vcpu *vcpu);
> >  void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu);
> >  int vgic_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi);
> > +int vgic_its_verify_msi(struct kvm *kvm, struct kvm_msi *msi);
> >  int vgic_v3_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr);
> >  int vgic_v3_dist_uaccess(struct kvm_vcpu *vcpu, bool is_write,
> >  			 int offset, u32 *val);
> > diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> > index 40c3d7c..3027805 100644
> > --- a/drivers/vfio/pci/vfio_pci_intrs.c
> > +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/vfio.h>
> >  #include <linux/wait.h>
> >  #include <linux/slab.h>
> > +#include <linux/kvm_irqfd.h>
> >  
> >  #include "vfio_pci_priv.h"
> >  
> > @@ -315,6 +316,28 @@ static int vfio_msi_enable(struct vfio_pci_core_device *vdev, int nvec, bool msi
> >  	return 0;
> >  }
> >  
> > +static int vfio_pci_verify_msi_entry(struct vfio_pci_core_device *vdev,
> > +		struct eventfd_ctx *trigger)
> > +{
> > +	struct kvm *kvm = vdev->vdev.kvm;
> > +	struct kvm_kernel_irqfd *tmp;
> > +	struct kvm_kernel_irq_routing_entry irq_entry;
> > +	int ret = -ENODEV;
> > +
> > +	spin_lock_irq(&kvm->irqfds.lock);
> > +	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
> > +		if (trigger == tmp->eventfd) {
> > +			ret = 0;
> > +			break;
> > +		}
> > +	}
> > +	spin_unlock_irq(&kvm->irqfds.lock);
> > +	if (ret)
> > +		return ret;
> > +	irq_entry = tmp->irq_entry;
> > +	return kvm_verify_msi(kvm, &irq_entry);  
> 
> How does this work on !arm64? Why do we need an on-stack version of
> tmp->irq_entry?

Not only on !arm64, but in any scenario that doesn't involve KVM.
There cannot be a hard dependency between vfio and kvm.  Thanks,

Alex

PS - What driver/device actually cares about more than 1 MSI vector and
doesn't implement MSI-X?

> 
> > +}
> > +
> >  static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
> >  				      int vector, int fd, bool msix)
> >  {
> > @@ -355,6 +378,16 @@ static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
> >  		return PTR_ERR(trigger);
> >  	}
> >  
> > +	if (!msix) {
> > +		ret = vfio_pci_verify_msi_entry(vdev, trigger);
> > +		if (ret) {
> > +			kfree(vdev->ctx[vector].name);
> > +			eventfd_ctx_put(trigger);
> > +			if (ret > 0)
> > +				ret = 0;
> > +			return ret;
> > +		}
> > +	}  
> 
> Honestly, the whole things seems really complicated to avoid something
> that is only a harmless warning . How about just toning down the
> message instead?
> 
> 	M.
> 


