Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F04021DF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:12:36 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQbC-0002k6-SG
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQaK-0001zF-BJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:11:40 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQaH-0000XC-1T
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:11:39 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H3TDZ6TS9zQtvh;
 Tue,  7 Sep 2021 10:07:26 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:11:26 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:11:26 +0800
Subject: Re: [PATCH 1/5] vfio: use helper to simplfy the failure path in
 vfio_msi_enable
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-2-longpeng2@huawei.com>
 <20210903155549.6fefbda7.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <319d69f5-af08-b4cb-0a1d-914a736a1fea@huawei.com>
Date: Tue, 7 Sep 2021 10:11:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210903155549.6fefbda7.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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



ÔÚ 2021/9/4 5:55, Alex Williamson Ð´µÀ:
> On Wed, 25 Aug 2021 15:56:16 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
> 
>> The main difference of the failure path in vfio_msi_enable and
>> vfio_msi_disable_common is enable INTX or not.
>>
>> Extend the vfio_msi_disable_common to provide a arg to decide
> 
> "an arg"
> 

Thanks a lot, I'll fix all of the grammatical errors and typos in this version
together.

>> whether need to fallback, and then we can use this helper to
>> instead the redundant code in vfio_msi_enable.
> 
> Do you mean s/instead/replace/?
> 
>>
>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> ---
>>  hw/vfio/pci.c | 34 ++++++++++++----------------------
>>  1 file changed, 12 insertions(+), 22 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e1ea1d8..7cc43fe 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -47,6 +47,7 @@
>>  
>>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
>> +static void vfio_msi_disable_common(VFIOPCIDevice *vdev, bool enable_intx);
>>  
>>  /*
>>   * Disabling BAR mmaping can be slow, but toggling it around INTx can
>> @@ -650,29 +651,17 @@ retry:
>>      if (ret) {
>>          if (ret < 0) {
>>              error_report("vfio: Error: Failed to setup MSI fds: %m");
>> -        } else if (ret != vdev->nr_vectors) {
> 
> This part of the change is subtle and not mentioned in the commit log.
> It does seem unnecessary to test against this specific return value
> since any positive return is an error indicating the number of vectors
> we should retry with, but this change should be described in a separate
> patch.
> 
Ok, thanks, I'll split in the next version.

>> +        } else {
>>              error_report("vfio: Error: Failed to enable %d "
>>                           "MSI vectors, retry with %d", vdev->nr_vectors, ret);
>>          }
>>  
>> -        for (i = 0; i < vdev->nr_vectors; i++) {
>> -            VFIOMSIVector *vector = &vdev->msi_vectors[i];
>> -            if (vector->virq >= 0) {
>> -                vfio_remove_kvm_msi_virq(vector);
>> -            }
>> -            qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
>> -                                NULL, NULL, NULL);
>> -            event_notifier_cleanup(&vector->interrupt);
>> -        }
>> -
>> -        g_free(vdev->msi_vectors);
>> -        vdev->msi_vectors = NULL;
>> +        vfio_msi_disable_common(vdev, false);
>>  
>> -        if (ret > 0 && ret != vdev->nr_vectors) {
>> +        if (ret > 0) {
>>              vdev->nr_vectors = ret;
>>              goto retry;
>>          }
>> -        vdev->nr_vectors = 0;
>>  
>>          /*
>>           * Failing to setup MSI doesn't really fall within any specification.
>> @@ -680,7 +669,6 @@ retry:
>>           * out to fall back to INTx for this device.
>>           */
>>          error_report("vfio: Error: Failed to enable MSI");
>> -        vdev->interrupt = VFIO_INT_NONE;
>>  
>>          return;
>>      }
>> @@ -688,7 +676,7 @@ retry:
>>      trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
>>  }
>>  
>> -static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
>> +static void vfio_msi_disable_common(VFIOPCIDevice *vdev, bool enable_intx)
> 
> I'd rather avoid these sort of modal options to functions where we can.
> Maybe this suggests instead that re-enabling INTx should be removed
> from the common helper and callers needing to do so should do it
> outside of the common helper.  Thanks,
> 
Ok, thanks.

> Alex
> 
> 
>>  {
>>      Error *err = NULL;
>>      int i;
>> @@ -710,9 +698,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
>>      vdev->nr_vectors = 0;
>>      vdev->interrupt = VFIO_INT_NONE;
>>  
>> -    vfio_intx_enable(vdev, &err);
>> -    if (err) {
>> -        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>> +    if (enable_intx) {
>> +        vfio_intx_enable(vdev, &err);
>> +        if (err) {
>> +            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>> +        }
>>      }
>>  }
>>  
>> @@ -737,7 +727,7 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
>>          vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
>>      }
>>  
>> -    vfio_msi_disable_common(vdev);
>> +    vfio_msi_disable_common(vdev, true);
>>  
>>      memset(vdev->msix->pending, 0,
>>             BITS_TO_LONGS(vdev->msix->entries) * sizeof(unsigned long));
>> @@ -748,7 +738,7 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
>>  static void vfio_msi_disable(VFIOPCIDevice *vdev)
>>  {
>>      vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSI_IRQ_INDEX);
>> -    vfio_msi_disable_common(vdev);
>> +    vfio_msi_disable_common(vdev, true);
>>  
>>      trace_vfio_msi_disable(vdev->vbasedev.name);
>>  }
> 
> .
> 

