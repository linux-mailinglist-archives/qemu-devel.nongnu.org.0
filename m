Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A2331FC5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:29:54 +0100 (CET)
Received: from localhost ([::1]:44608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWoT-0005xi-TP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJWlD-00048W-7R; Tue, 09 Mar 2021 02:26:32 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJWl5-0006RQ-77; Tue, 09 Mar 2021 02:26:30 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dvmtg2wlgzjWbD;
 Tue,  9 Mar 2021 15:24:43 +0800 (CST)
Received: from [10.174.184.135] (10.174.184.135) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 15:26:04 +0800
Subject: Re: [PATCH v3 3/3] vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>
References: <20210223022225.50-1-lushenming@huawei.com>
 <20210223022225.50-4-lushenming@huawei.com>
 <20210302142628.60e0ab6f@omen.home.shazbot.org>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <97a3189a-f053-cb77-0ae9-02530fb4ac89@huawei.com>
Date: Tue, 9 Mar 2021 15:25:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210302142628.60e0ab6f@omen.home.shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lushenming@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 Marc Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/3 5:26, Alex Williamson wrote:
> 
> MST/Marcel,
> 
> Do you have an Ack or objection to exporting msix_masked() as below?

Or could we use msix_function_masked instead as below? :-)

if (!pdev->msix_function_masked) {
    for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
        if (!msix_is_masked(pdev, nr)) {
            max_vec = nr;
        }
    }
}

Thanks,
Shenming

> Thanks,
> 
> Alex
> 
> On Tue, 23 Feb 2021 10:22:25 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> In VFIO migration resume phase and some guest startups, there are
>> already unmasked vectors in the vector table when calling
>> vfio_msix_enable(). So in order to avoid inefficiently disabling
>> and enabling vectors repeatedly, let's allocate all needed vectors
>> first and then enable these unmasked vectors one by one without
>> disabling.
>>
>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>> ---
>>  hw/pci/msix.c         |  2 +-
>>  hw/vfio/pci.c         | 20 +++++++++++++++++---
>>  include/hw/pci/msix.h |  1 +
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>> index ae9331cd0b..e057958fcd 100644
>> --- a/hw/pci/msix.c
>> +++ b/hw/pci/msix.c
>> @@ -131,7 +131,7 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
>>      }
>>  }
>>  
>> -static bool msix_masked(PCIDevice *dev)
>> +bool msix_masked(PCIDevice *dev)
>>  {
>>      return dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] & MSIX_MASKALL_MASK;
>>  }
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index f74be78209..088fd41926 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -569,6 +569,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>>  
>>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>  {
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    unsigned int nr, max_vec = 0;
>> +
>>      vfio_disable_interrupts(vdev);
>>  
>>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
>> @@ -587,11 +590,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>       * triggering to userspace, then immediately release the vector, leaving
>>       * the physical device with no vectors enabled, but MSI-X enabled, just
>>       * like the guest view.
>> +     * If there are already unmasked vectors (in migration resume phase and
>> +     * some guest startups) which will be enabled soon, we can allocate all
>> +     * of them here to avoid inefficiently disabling and enabling vectors
>> +     * repeatedly later.
>>       */
>> -    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
>> -    vfio_msix_vector_release(&vdev->pdev, 0);
>> +    if (!msix_masked(pdev)) {
>> +        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
>> +            if (!msix_is_masked(pdev, nr)) {
>> +                max_vec = nr;
>> +            }
>> +        }
>> +    }
>> +    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
>> +    vfio_msix_vector_release(pdev, max_vec);
>>  
>> -    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
>> +    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
>>                                    vfio_msix_vector_release, NULL)) {
>>          error_report("vfio: msix_set_vector_notifiers failed");
>>      }
>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>> index 4c4a60c739..b3cd88e262 100644
>> --- a/include/hw/pci/msix.h
>> +++ b/include/hw/pci/msix.h
>> @@ -28,6 +28,7 @@ void msix_load(PCIDevice *dev, QEMUFile *f);
>>  
>>  int msix_enabled(PCIDevice *dev);
>>  int msix_present(PCIDevice *dev);
>> +bool msix_masked(PCIDevice *dev);
>>  
>>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>>  void msix_set_pending(PCIDevice *dev, unsigned vector);
> 
> .
> 

