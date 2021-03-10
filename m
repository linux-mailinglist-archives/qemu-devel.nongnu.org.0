Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14B3339F8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:29:03 +0100 (CET)
Received: from localhost ([::1]:59542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw5O-00028L-Tn
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJvvs-0006tG-W4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJvvp-0002H6-CD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615371548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Plb2liEx2aEtt8vsamgsc6sLeneWggcmjpJgR1zNPUo=;
 b=bWjFPJEWkvB+iAeznK1UPfNBgARXLPamxBsjtk/VTfP9CEHWn4kPZenW9NnD7TXwSnVkHa
 bUCLSJQHxyDQGPCOE2GEr+2EAEQ1aBNNpbGXjTno70S3motj4HySkE+cdXr3MQu/1zgpY0
 rytEKR1bFHPCidjqVR+6jBBY98YFLPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-rl0D6FffO62T9T9PbPzAlQ-1; Wed, 10 Mar 2021 05:19:04 -0500
X-MC-Unique: rl0D6FffO62T9T9PbPzAlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7CD3801817;
 Wed, 10 Mar 2021 10:19:02 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9415E1F415;
 Wed, 10 Mar 2021 10:18:53 +0000 (UTC)
Subject: Re: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu
 option for pci root bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <e37590d0-d65f-e4e4-ec59-92eb3166d9d9@redhat.com>
 <697b7fcd-c75e-71c9-baf9-64ef610d9efb@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9594e4c6-b7e3-988f-fe84-425cd76dc055@redhat.com>
Date: Wed, 10 Mar 2021 11:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <697b7fcd-c75e-71c9-baf9-64ef610d9efb@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 3/10/21 3:13 AM, Wang Xingang wrote:
> Hi Eric,
> 
> On 2021/3/9 22:36, Auger Eric wrote:
>> Hi,
>> On 2/27/21 9:33 AM, Wang Xingang wrote:
>>> From: Xingang Wang <wangxingang5@huawei.com>
>>>
>>> These patches add support for configure iommu on/off for pci root bus,
>>> including primary bus and pxb root bus. At present, All root bus will go
>>> through iommu when iommu is configured, which is not flexible.
>>>
>>> So this add option to enable/disable iommu for primary bus and pxb
>>> root bus.
>>> When iommu is enabled for the root bus, devices attached to it will go
>>> through iommu. When iommu is disabled for the root bus, devices will not
>>> go through iommu accordingly.
>>
>> Please could you give an example of the qemu command line for which the
>> new option is useful for you. This would help me to understand your
>> pcie/pci topology and also make sure I test it with the smmu.
>>
>> Thank you in advance
>>
>> Best Regards
>>
>> Eric
>>>
>>> Xingang Wang (4):
>>>    pci: Add PCI_BUS_IOMMU property
>>>    hw/pci: Add iommu option for pci root bus
>>>    hw/pci: Add pci_root_bus_max_bus
>>>    hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
>>>
>>>   hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
>>>   hw/arm/virt.c                       | 29 +++++++++
>>>   hw/pci-bridge/pci_expander_bridge.c |  6 ++
>>>   hw/pci/pci.c                        | 35 ++++++++++-
>>>   include/hw/arm/virt.h               |  1 +
>>>   include/hw/pci/pci.h                |  1 +
>>>   include/hw/pci/pci_bus.h            | 13 ++++
>>>   7 files changed, 153 insertions(+), 24 deletions(-)
>>>
>>
>> .
>>
> 
> Thanks for your advice.
> 
> I test this with the following script, in which i add two options.
> 
> The option `primary_bus_iommu=false(or true)` for `-machine
> virt,iommu=smmuv3`, this helps to enable/disable whether primary bus go
> through iommu.
> 
> The other option `iommu=false` or `iommu=true` for `-device pxb-pcie`
> helps to enable/disable whether pxb root bus go through iommu.
> 
>> #!/bin/sh
>>
>> /path/to/qemu/build/aarch64-softmmu/qemu-system-aarch64 \
>> -enable-kvm \
>> -cpu host \
>> -kernel /path/to/linux/arch/arm64/boot/Image \
>> -m 16G \
>> -smp 8,sockets=8,cores=1,threads=1 \
>> -machine
>> virt,kernel_irqchip=on,gic-version=3,iommu=smmuv3,primary_bus_iommu=false
>> \
>> -drive
>> file=./QEMU_EFI-pflash.raw,if=pflash,format=raw,unit=0,readonly=on \
>> -device
>> pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1,iommu=false \
>> -device
>> pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x3.0x2,iommu=true \
>> -device
>> pxb-pcie,bus_nr=0x23,id=pci.30,bus=pcie.0,addr=0x3.0x3,iommu=true \
>> -device
>> pxb-pcie,bus_nr=0x40,id=pci.40,bus=pcie.0,addr=0x3.0x4,iommu=false \
>> -device pcie-pci-bridge,id=pci.11,bus=pci.10,addr=0x1 \
>> -device pcie-pci-bridge,id=pci.21,bus=pci.20,addr=0x1 \
>> -device
>> pcie-root-port,port=0x20,chassis=10,id=pci.2,bus=pcie.0,addr=0x2 \
>> -device
>> pcie-root-port,port=0x20,chassis=11,id=pci.12,bus=pci.10,addr=0x2 \
>> -device
>> pcie-root-port,port=0x20,chassis=19,id=pci.19,bus=pci.11,addr=0x3 \
>> -device
>> pcie-root-port,port=0x20,chassis=12,id=pci.22,bus=pci.20,addr=0x2 \
>> -device
>> pcie-root-port,port=0x20,chassis=13,id=pci.42,bus=pci.40,addr=0x2 \
>> -device virtio-scsi-pci,id=scsi0,bus=pci.12,addr=0x1 \
>> -device vfio-pci,host=b5:00.2,bus=pci.42,addr=0x0,id=acc2 \
>> -net none \
>> -initrd /path/to/rootfs.cpio.gz \
>> -nographic \
>> -append "rdinit=init console=ttyAMA0 earlycon=pl011,0x9000000 nokaslr" \
> 
> I test the command line with an accelerator. The IORT table will have
> some changes, so only the root bus with iommu=true will go through smmuv3.

Thank you for sharing your command line.

On my end without using ",iommu=smmuv3" and the new options, my guest
crashes.

    0.833665] ACPI: PCI Root Bridge [PC0A] (domain 0000 [bus 0a-0b])
[    0.837630] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI HPX-Type3]
[    0.843377] acpi PNP0A08:00: _OSC: platform does not support [LTR]
[    0.846796] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
AER PCIeCapability]
[    0.851082] acpi PNP0A08:00: ECAM area [mem
0x4010a00000-0x4010bfffff] reserved by PNP0C02:00
[    0.854742] acpi PNP0A08:00: ECAM at [mem 0x4010a00000-0x4010bfffff]
for [bus 0a-0b]
[    0.859569] ------------[ cut here ]------------
[    0.862470] kernel BUG at mm/ioremap.c:76!
[    0.865066] Internal error: Oops - BUG: 0 [#1] SMP
[    0.868130] Modules linked in:
[    0.870060] CPU: 6 PID: 1 Comm: swapper/0 Not tainted
5.11.0-rc6-guest-upstream+ #26
[    0.874920] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0
02/06/2015
[    0.879283] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[    0.883055] pc : ioremap_page_range+0x33c/0x3e0
[    0.885942] lr : ioremap_page_range+0x30/0x3e0
[    0.888737] sp : ffff80001272f800
[    0.890824] x29: ffff80001272f800 x28: ffffffbffe801000
[    0.894168] x27: ffffffc020040000 x26: ffff8000111b01f8
[    0.897543] x25: 0400000000000001 x24: ffffffbffe800000
[    0.900882] x23: 000000003eff3000 x22: ffffffbffe801000
[    0.904221] x21: ffffffbffe801000 x20: ffff0003f2270020
[    0.907612] x19: 0000000000000001 x18: 0000000000000030
[    0.910952] x17: 0000000000000000 x16: 0000000000000001
[    0.914283] x15: ffffffffffffffff x14: ffff8000116d49c8
[    0.917679] x13: 000000003eff3000 x12: 0000000000000041
[    0.921018] x11: ffff800011f2f000 x10: 000000000000002e
[    0.924359] x9 : ffff800010c372c4 x8 : ffffffbffe800000
[    0.927744] x7 : ffff0003f224eff8 x6 : 0000000000000001
[    0.931092] x5 : ffffffbffe800fff x4 : ffff8000116de650
[    0.934430] x3 : 0068000000000f17 x2 : 0140000000000000
[    0.937813] x1 : 00000040407f0000 x0 : ffff0003ffdcccc0
[    0.941165] Call trace:
[    0.942713]  ioremap_page_range+0x33c/0x3e0
[    0.945374]  pci_remap_iospace+0x7c/0x90
[    0.947881]  acpi_pci_probe_root_resources+0x180/0x238
[    0.951122]  pci_acpi_root_prepare_resources+0x28/0xc8
[    0.954357]  acpi_pci_root_create+0x9c/0x2f8
[    0.956990]  pci_acpi_scan_root+0x150/0x240
[    0.959639]  acpi_pci_root_add+0x34c/0x4e0
[    0.962220]  acpi_bus_attach+0x15c/0x2c0
[    0.964692]  acpi_bus_attach+0x9c/0x2c0
[    0.967135]  acpi_bus_attach+0x9c/0x2c0
[    0.969582]  acpi_bus_scan+0x64/0x118
[    0.971888]  acpi_scan_init+0x10c/0x244
[    0.974302]  acpi_init+0x2bc/0x328
[    0.976463]  do_one_initcall+0x54/0x268
[    0.978913]  kernel_init_freeable+0x22c/0x2c4
[    0.981658]  kernel_init+0x1c/0x128
[    0.983864]  ret_from_fork+0x10/0x34
[    0.986139] Code: a9446bf9 a8cb7bfd d50323bf d65f03c0 (d4210000)
[    0.990037] ---[ end trace fc68f309d1db57e3 ]---
[    0.992939] Kernel panic - not syncing: Oops - BUG: Fatal exception
[    0.996893] SMP: stopping secondary CPUs
[    0.999487] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
exception ]---

Do you have any idea. I am using

http://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/4198/QEMU-AARCH64/RELEASE_GCC5/

Thanks

Eric




> 
> Thanks,
> Xingang
> .
> 


