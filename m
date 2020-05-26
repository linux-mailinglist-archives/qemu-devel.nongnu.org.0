Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29691C7A7A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 21:49:55 +0200 (CEST)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWQ3G-0005Mb-E2
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 15:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jWQ1z-0004dx-La
 for qemu-devel@nongnu.org; Wed, 06 May 2020 15:48:35 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jWQ1x-0000Oa-Nh
 for qemu-devel@nongnu.org; Wed, 06 May 2020 15:48:34 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eb314480000>; Wed, 06 May 2020 12:47:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 06 May 2020 12:48:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 06 May 2020 12:48:31 -0700
Received: from [10.40.101.152] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 May
 2020 19:48:23 +0000
Subject: Re: [PATCH v16 QEMU 04/16] vfio: Add save and load functions for VFIO
 PCI devices
To: Yan Zhao <yan.y.zhao@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>
References: <1585084154-29461-1-git-send-email-kwankhede@nvidia.com>
 <1585084154-29461-5-git-send-email-kwankhede@nvidia.com>
 <20200325135638.32421bf9@w520.home>
 <8504c8ad-9b0b-6079-3290-60caa447e708@nvidia.com>
 <20200504223711.307123eb@x1.home> <20200506061102.GA19334@joy-OptiPlex-7040>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <8a120b05-adf9-cd16-7497-f9f533f53117@nvidia.com>
Date: Thu, 7 May 2020 01:18:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200506061102.GA19334@joy-OptiPlex-7040>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588794441; bh=wHjdeKmJBBWTTNjLppUDDrWrE9jtwFfpUlOTJQcdlo0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=XATxnt6vvCfvNoUq72TRDqQMcqib6Ia6dEl6GB0DAVnQqvjiqQV0GsXHfayum09oP
 WFmBup8Zov8d1jn1fujnjC+aBSHWbqOr1UWohgcDq1PFGWCAO6KN0EZlTUtRj3brj0
 bkjJpjI5osQJhk3SgD4LJq23aHXbnUajWCy9Y/mLGqDMUMsQze9WtkWmYkuSj3TT6q
 jMhQbYvxdDPAIIv14W7ud15FczoqFOztId8gix7EgaLWyo3mtcc3QXqdD7ovkRbp+M
 rp/wjIME6hPeq6wOo/QfpdmAAKKP6y/BKQAz744HK7GZ8TkSCTmf25mapRSlZn9X85
 MO4UzlHZ73+8A==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 15:30:17
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/6/2020 11:41 AM, Yan Zhao wrote:
> On Tue, May 05, 2020 at 12:37:11PM +0800, Alex Williamson wrote:
>> On Tue, 5 May 2020 04:48:37 +0530
>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
>>
>>> On 3/26/2020 1:26 AM, Alex Williamson wrote:
>>>> On Wed, 25 Mar 2020 02:39:02 +0530
>>>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
>>>>    
>>>>> These functions save and restore PCI device specific data - config
>>>>> space of PCI device.
>>>>> Tested save and restore with MSI and MSIX type.
>>>>>
>>>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>>>>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>>>>> ---
>>>>>    hw/vfio/pci.c                 | 163 ++++++++++++++++++++++++++++++++++++++++++
>>>>>    include/hw/vfio/vfio-common.h |   2 +
>>>>>    2 files changed, 165 insertions(+)
>>>>>
>>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>>> index 6c77c12e44b9..8deb11e87ef7 100644
>>>>> --- a/hw/vfio/pci.c
>>>>> +++ b/hw/vfio/pci.c
>>>>> @@ -41,6 +41,7 @@
>>>>>    #include "trace.h"
>>>>>    #include "qapi/error.h"
>>>>>    #include "migration/blocker.h"
>>>>> +#include "migration/qemu-file.h"
>>>>>    
>>>>>    #define TYPE_VFIO_PCI "vfio-pci"
>>>>>    #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
>>>>> @@ -1632,6 +1633,50 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
>>>>>        }
>>>>>    }
>>>>>    
>>>>> +static int vfio_bar_validate(VFIOPCIDevice *vdev, int nr)
>>>>> +{
>>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>>> +    VFIOBAR *bar = &vdev->bars[nr];
>>>>> +    uint64_t addr;
>>>>> +    uint32_t addr_lo, addr_hi = 0;
>>>>> +
>>>>> +    /* Skip unimplemented BARs and the upper half of 64bit BARS. */
>>>>> +    if (!bar->size) {
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    addr_lo = pci_default_read_config(pdev, PCI_BASE_ADDRESS_0 + nr * 4, 4);
>>>>> +
>>>>> +    addr_lo = addr_lo & (bar->ioport ? PCI_BASE_ADDRESS_IO_MASK :
>>>>> +                                       PCI_BASE_ADDRESS_MEM_MASK);
>>>>
>>>> Nit, &= or combine with previous set.
>>>>    
>>>>> +    if (bar->type == PCI_BASE_ADDRESS_MEM_TYPE_64) {
>>>>> +        addr_hi = pci_default_read_config(pdev,
>>>>> +                                         PCI_BASE_ADDRESS_0 + (nr + 1) * 4, 4);
>>>>> +    }
>>>>> +
>>>>> +    addr = ((uint64_t)addr_hi << 32) | addr_lo;
>>>>
>>>> Could we use a union?
>>>>    
>>>>> +
>>>>> +    if (!QEMU_IS_ALIGNED(addr, bar->size)) {
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>
>>>> What specifically are we validating here?  This should be true no
>>>> matter what we wrote to the BAR or else BAR emulation is broken.  The
>>>> bits that could make this unaligned are not implemented in the BAR.
>>>>    
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int vfio_bars_validate(VFIOPCIDevice *vdev)
>>>>> +{
>>>>> +    int i, ret;
>>>>> +
>>>>> +    for (i = 0; i < PCI_ROM_SLOT; i++) {
>>>>> +        ret = vfio_bar_validate(vdev, i);
>>>>> +        if (ret) {
>>>>> +            error_report("vfio: BAR address %d validation failed", i);
>>>>> +            return ret;
>>>>> +        }
>>>>> +    }
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>>>>    {
>>>>>        VFIOBAR *bar = &vdev->bars[nr];
>>>>> @@ -2414,11 +2459,129 @@ static Object *vfio_pci_get_object(VFIODevice *vbasedev)
>>>>>        return OBJECT(vdev);
>>>>>    }
>>>>>    
>>>>> +static void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
>>>>> +{
>>>>> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
>>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>>> +    uint16_t pci_cmd;
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < PCI_ROM_SLOT; i++) {
>>>>> +        uint32_t bar;
>>>>> +
>>>>> +        bar = pci_default_read_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, 4);
>>>>> +        qemu_put_be32(f, bar);
>>>>> +    }
>>>>> +
>>>>> +    qemu_put_be32(f, vdev->interrupt);
>>>>> +    if (vdev->interrupt == VFIO_INT_MSI) {
>>>>> +        uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
>>>>> +        bool msi_64bit;
>>>>> +
>>>>> +        msi_flags = pci_default_read_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
>>>>> +                                            2);
>>>>> +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
>>>>> +
>>>>> +        msi_addr_lo = pci_default_read_config(pdev,
>>>>> +                                         pdev->msi_cap + PCI_MSI_ADDRESS_LO, 4);
>>>>> +        qemu_put_be32(f, msi_addr_lo);
>>>>> +
>>>>> +        if (msi_64bit) {
>>>>> +            msi_addr_hi = pci_default_read_config(pdev,
>>>>> +                                             pdev->msi_cap + PCI_MSI_ADDRESS_HI,
>>>>> +                                             4);
>>>>> +        }
>>>>> +        qemu_put_be32(f, msi_addr_hi);
>>>>> +
>>>>> +        msi_data = pci_default_read_config(pdev,
>>>>> +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
>>>>> +                2);
>>>>> +        qemu_put_be32(f, msi_data);
>>>>
>>>> Isn't the data field only a u16?
>>>>    
>>>
>>> Yes, fixing it.
>>>
>>>>> +    } else if (vdev->interrupt == VFIO_INT_MSIX) {
>>>>> +        uint16_t offset;
>>>>> +
>>>>> +        /* save enable bit and maskall bit */
>>>>> +        offset = pci_default_read_config(pdev,
>>>>> +                                       pdev->msix_cap + PCI_MSIX_FLAGS + 1, 2);
>>>>> +        qemu_put_be16(f, offset);
>>>>> +        msix_save(pdev, f);
>>>>> +    }
>>>>> +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
>>>>> +    qemu_put_be16(f, pci_cmd);
>>>>> +}
>>>>> +
>>>>> +static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>>>>> +{
>>>>> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
>>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>>> +    uint32_t interrupt_type;
>>>>> +    uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
>>>>> +    uint16_t pci_cmd;
>>>>> +    bool msi_64bit;
>>>>> +    int i, ret;
>>>>> +
>>>>> +    /* retore pci bar configuration */
>>>>> +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
>>>>> +    vfio_pci_write_config(pdev, PCI_COMMAND,
>>>>> +                        pci_cmd & (!(PCI_COMMAND_IO | PCI_COMMAND_MEMORY)), 2);
>>>>> +    for (i = 0; i < PCI_ROM_SLOT; i++) {
>>>>> +        uint32_t bar = qemu_get_be32(f);
>>>>> +
>>>>> +        vfio_pci_write_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, bar, 4);
>>>>> +    }
>>>>> +
>>>>> +    ret = vfio_bars_validate(vdev);
>>>>> +    if (ret) {
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    interrupt_type = qemu_get_be32(f);
>>>>> +
>>>>> +    if (interrupt_type == VFIO_INT_MSI) {
>>>>> +        /* restore msi configuration */
>>>>> +        msi_flags = pci_default_read_config(pdev,
>>>>> +                                            pdev->msi_cap + PCI_MSI_FLAGS, 2);
>>>>> +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
>>>>> +
>>>>> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
>>>>> +                              msi_flags & (!PCI_MSI_FLAGS_ENABLE), 2);
>>>>> +
>>>>> +        msi_addr_lo = qemu_get_be32(f);
>>>>> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_LO,
>>>>> +                              msi_addr_lo, 4);
>>>>> +
>>>>> +        msi_addr_hi = qemu_get_be32(f);
>>>>> +        if (msi_64bit) {
>>>>> +            vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_HI,
>>>>> +                                  msi_addr_hi, 4);
>>>>> +        }
>>>>> +        msi_data = qemu_get_be32(f);
>>>>> +        vfio_pci_write_config(pdev,
>>>>> +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
>>>>> +                msi_data, 2);
>>>>> +
>>>>> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
>>>>> +                              msi_flags | PCI_MSI_FLAGS_ENABLE, 2);
>>>>> +    } else if (interrupt_type == VFIO_INT_MSIX) {
>>>>> +        uint16_t offset = qemu_get_be16(f);
>>>>> +
>>>>> +        /* load enable bit and maskall bit */
>>>>> +        vfio_pci_write_config(pdev, pdev->msix_cap + PCI_MSIX_FLAGS + 1,
>>>>> +                              offset, 2);
>>>>> +        msix_load(pdev, f);
>>>>> +    }
>>>>> +    pci_cmd = qemu_get_be16(f);
>>>>> +    vfio_pci_write_config(pdev, PCI_COMMAND, pci_cmd, 2);
>>>>> +    return 0;
>>>>> +}
>>>>
>>>> It always seems like there should be a lot more state than this, and I
>>>> probably sound like a broken record because I ask every time, but maybe
>>>> that's a good indication that we (or at least I) need a comment
>>>> explaining why we only care about these.  For example, what if we
>>>> migrate a device in the D3 power state, don't we need to account for
>>>> the state stored in the PM capability or does the device wake up into
>>>> D0 auto-magically after migration?  I think we could repeat that
>>>> question for every capability that can be modified.  Even for the MSI/X
>>>> cases, the interrupt may not be active, but there could be state in
>>>> virtual config space that would be different on the target.  For
>>>> example, if we migrate with a device in INTx mode where the guest had
>>>> written vector fields on the source, but only writes the enable bit on
>>>> the target, can we seamlessly figure out the rest?  For other
>>>> capabilities, that state may represent config space changes written
>>>> through to the physical device and represent a functional difference on
>>>> the target.  Thanks,
>>>>   
>>>
>>> These are very basic set of registers from config state. Other are more
>>> of vendor specific which vendor driver can save and restore in their own
>>> data. I don't think we have to take care of all those vendor specific
>>> fields here.
>>
>> That had not been clear to me.  Intel folks, is this your understanding
>> regarding the responsibility of the user to save and restore config
>> space of the device as part of the vendor provided migration stream
>> data?  Thanks,
>>
> Currently, the code works for us. but I agree with you that there should
> be more states to save, at least for emulated config bits.
> I think we should call pci_device_save() to serve that purpose.
> 

If vendor driver can restore all vendor specific config space, then 
adding it again in QEMU might be redundant. As an example, I had mailed 
mtty sample code, in which config space has vendor specific information 
and that is restored in easy way.

Thanks,
Kirti

