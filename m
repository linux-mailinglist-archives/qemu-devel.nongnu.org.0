Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAAB572DDD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 08:04:38 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVUD-0005mo-92
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 02:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1oBVS1-0004El-Kq
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:02:21 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1oBVRy-0006Ks-7S
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:02:20 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjRkY2gqlzVfp7;
 Wed, 13 Jul 2022 13:58:29 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 14:02:10 +0800
Subject: Re: [QUESTION] Exception print when enabling GICv4
To: Marc Zyngier <maz@kernel.org>
References: <6d6d61fb-6241-4e1e-ddff-8ae8be96f9ff@hisilicon.com>
 <87bktu1hfj.wl-maz@kernel.org>
CC: Alex Williamson <alex.williamson@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, chenxiang via <qemu-devel@nongnu.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Message-ID: <13e4fde9-05e9-f492-a2b6-20d567eb2920@hisilicon.com>
Date: Wed, 13 Jul 2022 14:02:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <87bktu1hfj.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>

Hi Marc,

Thank you for your reply.

在 2022/7/12 23:25, Marc Zyngier 写道:
> Hi Xiang,
>
> On Tue, 12 Jul 2022 13:55:16 +0100,
> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
>> Hi,
>> I encounter a issue related to GICv4 enable on ARM64 platform (kernel
>> 5.19-rc4, qemu 6.2.0):
>> We have a accelaration module whose VF has 3 MSI interrupts, and we
>> passthrough it to virtual machine with following steps:
>>
>> echo 0000:79:00.1 > /sys/bus/pci/drivers/hisi_hpre/unbind
>> echo vfio-pci >
>> /sys/devices/pci0000\:78/0000\:78\:00.0/0000\:79\:00.1/driver_override
>> echo 0000:79:00.1 > /sys/bus/pci/drivers_probe
>>
>> Then we boot VM with "-device vfio-pci,host=79:00.1,id=net0 \".
>> When insmod the driver which registers 3 PCI MSI interrupts in VM,
>> some exception print occur as following:
>>
>> vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d)
>> registration fails: 66311
>>
>> I find that bit[6:4] of register PCI_MSI_FLAGS is 2 (4 MSI interrupts)
>> though we only register 3 PCI MSI interrupt,
>>
>> and only 3 MSI interrupt is activated at last.
>> It allocates 4 vectors in function vfio_msi_enable() (qemu)  as it
>> reads the register PCI_MSI_FLAGS.
>> Later it will  call system call VFIO_DEVICE_SET_IRQS to set forwarding
>> for those interrupts
>> using function kvm_vgic_v4_set_forrwarding() as GICv4 is enabled. For
>> interrupt 0~2, it success to set forwarding as they are already
>> activated,
>> but for the 4th interrupt, it is not activated, so ite is not found in
>> function vgic_its_resolve_lpi(), so above printk occurs.
>>
>> It seems that we only allocate and activate 3 MSI interrupts in guest
>> while it tried to set forwarding for 4 MSI interrupts in host.
>> Do you have any idea about this issue?
> I have a hunch: QEMU cannot know that the guest is only using 3 MSIs
> out of the 4 that the device can use, and PCI/Multi-MSI only has a
> single enable bit for all MSIs. So it probably iterates over all
> possible MSIs and enable the forwarding. Since the guest has only
> created 3 mappings in the virtual ITS, the last call fails. I would
> expect the guest to still work properly though.

Yes, that's the reason of exception print.
Is it possible for QEMU to get the exact number of interrupts guest is 
using? It seems not.

>
> Thanks,
>
> 	M.
>


