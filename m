Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B73059AA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:29:00 +0100 (CET)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4j0N-0005Sq-ET
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4izP-0004oT-8i; Wed, 27 Jan 2021 06:27:59 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4izI-0000yY-L1; Wed, 27 Jan 2021 06:27:59 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DQhBw2YdLzjCxF;
 Wed, 27 Jan 2021 19:26:48 +0800 (CST)
Received: from [10.174.186.182] (10.174.186.182) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 19:27:35 +0800
Subject: Re: [RFC PATCH v2 3/3] vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-4-lushenming@huawei.com>
 <20210126143614.175e271c@omen.home.shazbot.org>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <7e61e7ae-e351-4228-d250-660251dcb0c0@huawei.com>
Date: Wed, 27 Jan 2021 19:27:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210126143614.175e271c@omen.home.shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.182]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lushenming@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/1/27 5:36, Alex Williamson wrote:
> On Wed, 9 Dec 2020 16:09:19 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> Different from the normal situation when the guest starts, we can
>> know the max unmasked vetctor (at the beginning) after msix_load()
>> in VFIO migration. So in order to avoid ineffectively disabling and
> 
> s/ineffectively/inefficiently/?  It's "effective" either way I think.

Yeah, I should say "inefficiently". :-)

> 
>> enabling vectors repeatedly, let's allocate all needed vectors first
>> and then enable these unmasked vectors one by one without disabling.
>>
>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>> ---
>>  hw/pci/msix.c         | 17 +++++++++++++++++
>>  hw/vfio/pci.c         | 10 ++++++++--
>>  include/hw/pci/msix.h |  2 ++
>>  3 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>> index 67e34f34d6..bf291d3ff8 100644
>> --- a/hw/pci/msix.c
>> +++ b/hw/pci/msix.c
>> @@ -557,6 +557,23 @@ unsigned int msix_nr_vectors_allocated(const PCIDevice *dev)
>>      return dev->msix_entries_nr;
>>  }
>>  
>> +int msix_get_max_unmasked_vector(PCIDevice *dev)
>> +{
>> +    int max_unmasked_vector = -1;
>> +    int vector;
>> +
>> +    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
>> +        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
>> +        for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>> +            if (!msix_is_masked(dev, vector)) {
>> +                max_unmasked_vector = vector;
>> +            }
>> +        }
>> +    }
>> +
>> +    return max_unmasked_vector;
>> +}
> 
> Comments from QEMU PCI folks?
> 
>> +
>>  static int msix_set_notifier_for_vector(PCIDevice *dev, unsigned int vector)
>>  {
>>      MSIMessage msg;
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 51dc373695..e755ed2514 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -568,6 +568,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>>  
>>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>  {
>> +    int max_unmasked_vector = msix_get_max_unmasked_vector(&vdev->pdev);
>> +    unsigned int used_vector = MAX(max_unmasked_vector, 0);
>> +
> 
> The above PCI function could also be done inline here pretty easily too:
> 
> unsigned int nr, max_vec = 0;
> 
> if (!msix_masked(&vdev->pdev))
>     for (nr = 0; nr < msix_nr_vectors_allocated(&vdev->pdev); nr++) {
>         if (!msix_is_masked(&vdev->pdev, nr)) {
>             max_vec = nr;
>         }
>     }
> }
> 
> It's a bit cleaner than the msix utility function, imo.

Yeah, it makes sense.

> 
>>      vfio_disable_interrupts(vdev);
>>  
>>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
>> @@ -586,9 +589,12 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>       * triggering to userspace, then immediately release the vector, leaving
>>       * the physical device with no vectors enabled, but MSI-X enabled, just
>>       * like the guest view.
>> +     * If there are unmasked vectors (such as in migration) which will be
>> +     * enabled soon, we can allocate them here to avoid ineffectively disabling
>> +     * and enabling vectors repeatedly later.
> 
> It just happens that migration triggers this usage model where the
> MSI-X enable bit is set with vectors unmasked in the vector table, but
> this is not unique to migration, guests can follow this pattern as well.
> Has this been tested with a variety of guests?  Logically it seems
> correct, but always good to prove so.  Thanks,

I have tested it in migration and normal guest startup (only the latest Linux).
And I can try to test with some other kernels, could you be more specific about this?

Thanks,
Shenming

> 
> Alex
> 
>>       */
>> -    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
>> -    vfio_msix_vector_release(&vdev->pdev, 0);
>> +    vfio_msix_vector_do_use(&vdev->pdev, used_vector, NULL, NULL);
>> +    vfio_msix_vector_release(&vdev->pdev, used_vector);
>>  
>>      if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
>>                                    vfio_msix_vector_release, NULL)) {
>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>> index 4c4a60c739..4bfb463fa6 100644
>> --- a/include/hw/pci/msix.h
>> +++ b/include/hw/pci/msix.h
>> @@ -23,6 +23,8 @@ void msix_uninit_exclusive_bar(PCIDevice *dev);
>>  
>>  unsigned int msix_nr_vectors_allocated(const PCIDevice *dev);
>>  
>> +int msix_get_max_unmasked_vector(PCIDevice *dev);
>> +
>>  void msix_save(PCIDevice *dev, QEMUFile *f);
>>  void msix_load(PCIDevice *dev, QEMUFile *f);
>>  
> 
> .
> 

