Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366453F72A5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:07:47 +0200 (CEST)
Received: from localhost ([::1]:45864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpow-0005bu-BU
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mIpoD-0004wB-EX
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:07:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mIpoA-00023U-He
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:07:00 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GvhP05vTpz8v2D;
 Wed, 25 Aug 2021 18:02:44 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 18:06:53 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 18:06:53 +0800
Subject: Re: [PATCH 3/5] vfio: defer to enable msix in migration resume phase
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <alex.williamson@redhat.com>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, 
 <pbonzini@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-4-longpeng2@huawei.com>
 <5137d6c9-b917-2bed-cdcf-7b7072632c6c@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <1504cd9a-0d90-db90-a942-78186886af13@huawei.com>
Date: Wed, 25 Aug 2021 18:06:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5137d6c9-b917-2bed-cdcf-7b7072632c6c@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.305,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arei.gonglei@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/8/25 17:57, Philippe Mathieu-Daudé 写道:
> On 8/25/21 9:56 AM, Longpeng(Mike) wrote:
>> The vf's unmasked msix vectors will be enable one by one in
>> migraiton resume phase, VFIO_DEVICE_SET_IRQS will be called
> 
> Typo "migration"
> 
Ok.

>> for each vector, it's a bit expensive if the vf has more
>> vectors.
>>
>> We can call VFIO_DEVICE_SET_IRQS once outside the loop of set
>> vector notifiers to reduce the cost.
>>
>> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
>> we mesure the cost of the vfio_msix_enable for each one, and
> 
> Typo "measure"
> 
Ok.

>> we can see 10% costs can be reduced.
>>
>>         Origin          Apply this patch
>> 1st     8               4
>> 2nd     15              11
>> 3rd     22              18
>> 4th     24              25
>> 5th     36              33
>> 6th     44              40
>> 7th     51              47
>> 8th     58              54
>> Total   258ms           232ms
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
> 
> What about passing defer_add_virq as boolean argument
> to vfio_msix_enable()?
> 
We'll use defer_add_virq in the deep of the calltrace, it need to change more
functions to support the parameter passing in this way.

>> +        vdev->defer_add_virq = false;
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
>>
> 
> .
> 

