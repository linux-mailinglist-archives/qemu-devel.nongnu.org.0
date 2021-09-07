Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87ED4021E0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:15:55 +0200 (CEST)
Received: from localhost ([::1]:59900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQeQ-0006An-RM
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQbR-00045u-PJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:12:50 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQbO-0001Hj-NY
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:12:49 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H3TG10SGmzbmHv;
 Tue,  7 Sep 2021 10:08:41 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:12:40 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:12:40 +0800
Subject: Re: [PATCH 3/5] vfio: defer to enable msix in migration resume phase
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-4-longpeng2@huawei.com>
 <20210903155653.789bdeb0.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <9c1392ac-06b9-840c-de63-299dab33b5b1@huawei.com>
Date: Tue, 7 Sep 2021 10:12:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210903155653.789bdeb0.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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



ÔÚ 2021/9/4 5:56, Alex Williamson Ð´µÀ:
> On Wed, 25 Aug 2021 15:56:18 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
> 
>> The vf's unmasked msix vectors will be enable one by one in
>> migraiton resume phase, VFIO_DEVICE_SET_IRQS will be called
>> for each vector, it's a bit expensive if the vf has more
>> vectors.
>>
>> We can call VFIO_DEVICE_SET_IRQS once outside the loop of set
>> vector notifiers to reduce the cost.
>>
>> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
>> we mesure the cost of the vfio_msix_enable for each one, and
>> we can see 10% costs can be reduced.
>>
>>         Origin          Apply this patch
> 
> Original?
> 
>> 1st     8               4
>> 2nd     15              11
>> 3rd     22              18
>> 4th     24              25
>> 5th     36              33
>> 6th     44              40
>> 7th     51              47
>> 8th     58              54
>> Total   258ms           232ms
> 
> If the values here are ms for execution of vfio_msix_enable() per VF,

Yes.

> why are the values increasing per VF?  Do we have 65 vectors per VF or
> do we have 65 vectors total, weighted towards to higher VFs?

We have 65 vectors per VF.

The KVM_SET_GSI_ROUTING scans and updates all of the assigned irqfds
unconditionally, so it will spend more time if there are more irqfds.

We have 65 irqfds when process the 1st VF, 130 irqfds when process the 2nd VF,
195 irqfds when process the 3rd VF ... so we'll see the values are increasing as
a result.

> This doesn't make sense without the data from the last patch in the
> series.
> 
>>
>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> ---
>>  hw/vfio/pci.c | 22 ++++++++++++++++++++++
>>  hw/vfio/pci.h |  1 +
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 7cc43fe..ca37fb7 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -372,6 +372,10 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>>      int ret = 0, i, argsz;
>>      int32_t *fds;
>>  
>> +    if (!vdev->nr_vectors) {
>> +        return 0;
>> +    }
> 
> How would this occur?  Via the new call below?  But then we'd leave
> vfio_msix_enabled() with MSI-X DISABLED???
> 
>> +
>>      argsz = sizeof(*irq_set) + (vdev->nr_vectors * sizeof(*fds));
>>  
>>      irq_set = g_malloc0(argsz);
>> @@ -495,6 +499,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>          }
>>      }
>>  
>> +    if (vdev->defer_add_virq) {
>> +        vdev->nr_vectors = MAX(vdev->nr_vectors, nr + 1);
>> +        goto clear_pending;
>> +    }
> 
> This is a really ugly use of 'goto' to simply jump around code you'd
> like to skip rather than reformat the function with branches to
> conditionalize that code.  Gotos for consolidated error paths, retries,
> hard to break loops are ok, not this.
> 

Got it, thanks.

> 
>> +
>>      /*
>>       * We don't want to have the host allocate all possible MSI vectors
>>       * for a device if they're not in use, so we shutdown and incrementally
>> @@ -524,6 +533,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>          }
>>      }
>>  
>> +clear_pending:
>>      /* Disable PBA emulation when nothing more is pending. */
>>      clear_bit(nr, vdev->msix->pending);
>>      if (find_first_bit(vdev->msix->pending,
>> @@ -608,6 +618,16 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>      if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
>>                                    vfio_msix_vector_release, NULL)) {
>>          error_report("vfio: msix_set_vector_notifiers failed");
>> +        return;
>> +    }
>> +
>> +    if (!pdev->msix_function_masked && vdev->defer_add_virq) {
>> +        int ret;
>> +        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
>> +        ret = vfio_enable_vectors(vdev, true);
>> +        if (ret) {
>> +            error_report("vfio: failed to enable vectors, %d", ret);
>> +        }
>>      }
>>  
>>      trace_vfio_msix_enable(vdev->vbasedev.name);
>> @@ -2456,7 +2476,9 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>>      if (msi_enabled(pdev)) {
>>          vfio_msi_enable(vdev);
>>      } else if (msix_enabled(pdev)) {
>> +        vdev->defer_add_virq = true;
>>          vfio_msix_enable(vdev);
>> +        vdev->defer_add_virq = false;
> 
> 
> Ick.  Why is this a special case for vfio_msix_enable()?  Wouldn't we
> prefer to always batch vector-use work while we're in the process of
> enabling MSI-X?  
> 

Ok, will do in next version.

In addition, I'll rename the field to 'defer_kvm_irq_routing' as you suggested
in another earlier thread.

    '''
    > -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
    > +            if (unlikely(vdev->defer_set_virq)) {

    Likewise this could be "vdev->defer_kvm_irq_routing" and we could apply
    it to all IRQ types.

    > +                vector->need_switch = true;
    > +            } else {
    '''

>>      }
>>  
>>      return ret;
>> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
>> index 6477751..4235c83 100644
>> --- a/hw/vfio/pci.h
>> +++ b/hw/vfio/pci.h
>> @@ -171,6 +171,7 @@ struct VFIOPCIDevice {
>>      bool no_kvm_ioeventfd;
>>      bool no_vfio_ioeventfd;
>>      bool enable_ramfb;
>> +    bool defer_add_virq;
>>      VFIODisplay *dpy;
>>      Notifier irqchip_change_notifier;
>>  };
> 
> .
> 

