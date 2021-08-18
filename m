Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568153EF8DE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 05:52:10 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGCca-000726-Mt
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 23:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mGCba-0006MY-6p
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 23:51:06 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mGCbW-0004Dw-Pi
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 23:51:05 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GqDSf2QF2zYqL8;
 Wed, 18 Aug 2021 11:50:26 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 18 Aug 2021 11:50:36 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 18 Aug 2021 11:50:36 +0800
Subject: Re: [RFC] vfio/migration: reduce the msix virq setup cost in resume
 phase
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210813040614.1764-1-longpeng2@huawei.com>
 <20210817142624.6b31c2da.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <132e65ee-5a82-0a1e-84aa-fe6c82a17bfd@huawei.com>
Date: Wed, 18 Aug 2021 11:50:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210817142624.6b31c2da.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwankhede@nvidia.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



ÔÚ 2021/8/18 4:26, Alex Williamson Ð´µÀ:
> On Fri, 13 Aug 2021 12:06:14 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
> 
>> In migration resume phase, all unmasked msix vectors need to be
>> setup when load the VF state. However, the setup operation would
>> takes longer if the VF has more unmasked vectors.
>>
>> In our case, the VF has 65 vectors and each one spend 0.8ms on
>> setup operation (vfio_add_kvm_msi_virq -> kvm_irqchip_commit_routes),
>> the total cost of the VF is more than 40ms. Even worse, the VM has
>> 8 VFs, so the downtime increase more than 320ms.
>>
>> vfio_pci_load_config
>>   vfio_msix_enable
>>     msix_set_vector_notifiers
>>       for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>>         vfio_msix_vector_do_use
>>           vfio_add_kvm_msi_virq
>>             kvm_irqchip_commit_routes <-- 0.8ms
>>       }
>>
>> Originaly, We tried to batch all routes and just commit once
>> outside the loop, but it's not easy to fallback to qemu interrupt
>> if someone fails.
> 
> I'm not sure I follow here, once we setup the virq, what's the failure
> path?  kvm_irqchip_commit_routes() returns void.  Were you looking at
> adding a "defer" arg to kvm_irqchip_add_msi_route() that skips the
> commit, which vfio_add_kvm_msi_virq() might set based on the migration
> state and vfio_pci_load_config() could then trigger the commit?

Yes, my implementation is almost exactly the same as you said here and it works,
but there's a semantic problem makes me suspect.

The calltrace in vfio_add_kvm_msi_virq is:
vfio_add_kvm_msi_virq
  kvm_irqchip_add_msi_route
    kvm_irqchip_commit_routes
      kvm_vm_ioctl(KVM_SET_GSI_ROUTING)
  kvm_irqchip_add_irqfd_notifier_gsi
    kvm_irqchip_assign_irqfd
      kvm_vm_ioctl(KVM_IRQFD)

I referred to some other places where need to assign irqfds, the asignment is
always after the virq is committed.
The KVM API doc does not declare the dependencies of them, but the existent code
seem implys the order. The "defer" makes them out of order, it can work at the
moment,  but not sure if KVM would change in the future.

I perfer "defer" too if we can make sure it's OK if the asigment and commit are
not in order. I hope we could reach agreement on this point first, and then I'll
continue to reply the comments below if still necessary.

So do you think we should keep the order of asignment and commit ?

> There's more overhead that can be removed if VFIO_DEVICE_SET_IRQS could
> be called once rather than per vector.

Yes, I've already optimized these overhead in our production before. I
saw the upstream also did ( commit ecebe53fe ) in this year, I'll backport
the upstream's soluation in order to keep pace with the community.

[ stop here ]

> 
>> So this patch trys to defer the KVM interrupt setup, the unmasked
>> vector will use qemu interrupt as default and switch to kvm interrupt
>> once it fires.
>>
>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> ---
>>  hw/vfio/pci.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>  hw/vfio/pci.h |  2 ++
>>  2 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e1ea1d8..dd35170 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -47,6 +47,8 @@
>>  
>>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
>> +static void vfio_add_kvm_msix_virq(VFIOPCIDevice *vdev,
>> +                                   VFIOMSIVector *vector, int nr);
>>  
>>  /*
>>   * Disabling BAR mmaping can be slow, but toggling it around INTx can
>> @@ -347,6 +349,11 @@ static void vfio_msi_interrupt(void *opaque)
>>          get_msg = msix_get_message;
>>          notify = msix_notify;
>>  
>> +        if (unlikely(vector->need_switch)) {
>> +            vfio_add_kvm_msix_virq(vdev, vector, nr);
>> +            vector->need_switch = false;
>> +        }
>> +
> 
> A better name might be "vector->kvm_routing_deferred".  Essentially this
> is just a lazy setup of KVM routes, we could always do this, or we could
> do this based on a device options.  I wonder if there are any affinity
> benefits in the VM to defer the KVM route.
> 
>>          /* A masked vector firing needs to use the PBA, enable it */
>>          if (msix_is_masked(&vdev->pdev, nr)) {
>>              set_bit(nr, vdev->msix->pending);
>> @@ -438,6 +445,25 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>      vector->virq = virq;
>>  }
>>  
>> +static void
>> +vfio_add_kvm_msix_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector, int nr)
>> +{
>> +    Error *err = NULL;
>> +    int fd;
>> +
>> +    vfio_add_kvm_msi_virq(vdev, vector, nr, true);
>> +    if (vector->virq < 0) {
>> +        return;
>> +    }
>> +
>> +    fd = event_notifier_get_fd(&vector->kvm_interrupt);
>> +    if (vfio_set_irq_signaling(&vdev->vbasedev,
>> +                               VFIO_PCI_MSIX_IRQ_INDEX, nr,
>> +                               VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
>> +        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>> +    }
>> +}
>> +
>>  static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
>>  {
>>      kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
>> @@ -490,7 +516,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>          }
>>      } else {
>>          if (msg) {
>> -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
>> +            if (unlikely(vdev->defer_set_virq)) {
> 
> Likewise this could be "vdev->defer_kvm_irq_routing" and we could apply
> it to all IRQ types.
> 
>> +                vector->need_switch = true;
>> +            } else {
>> +                vfio_add_kvm_msi_virq(vdev, vector, nr, true);
>> +            }
>>          }
>>      }
>>  
>> @@ -566,6 +596,11 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>>      }
>>  }
>>  
>> +static void inline vfio_msix_defer_set_virq(VFIOPCIDevice *vdev, bool defer)
>> +{
>> +    vdev->defer_set_virq = defer;
>> +}
> 
> A helper function seems excessive.
> 
>> +
>>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>  {
>>      PCIDevice *pdev = &vdev->pdev;
>> @@ -2466,7 +2501,9 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>>      if (msi_enabled(pdev)) {
>>          vfio_msi_enable(vdev);
>>      } else if (msix_enabled(pdev)) {
>> +        vfio_msix_defer_set_virq(vdev, true);
>>          vfio_msix_enable(vdev);
>> +        vfio_msix_defer_set_virq(vdev, false);
> 
> This is the algorithm you want for 65+ vectors, but is this the
> algorithm we want for 2 vectors?  Who should define that policy?
> We should at least make lazy KVM routing setup a device option to be
> able to test it outside of a migration, but should it be enabled by
> default?  Would anyone mind too much if there was some additional
> latency of each initial vector triggering?  Thanks,
> > Alex
> 
>>      }
>>  
>>      return ret;
>> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
>> index 6477751..846ae85 100644
>> --- a/hw/vfio/pci.h
>> +++ b/hw/vfio/pci.h
>> @@ -95,6 +95,7 @@ typedef struct VFIOMSIVector {
>>      struct VFIOPCIDevice *vdev; /* back pointer to device */
>>      int virq;
>>      bool use;
>> +    bool need_switch; /* switch to kvm interrupt ? */
>>  } VFIOMSIVector;
>>  
>>  enum {
>> @@ -171,6 +172,7 @@ struct VFIOPCIDevice {
>>      bool no_kvm_ioeventfd;
>>      bool no_vfio_ioeventfd;
>>      bool enable_ramfb;
>> +    bool defer_set_virq;
>>      VFIODisplay *dpy;
>>      Notifier irqchip_change_notifier;
>>  };
> 
> .
> 

