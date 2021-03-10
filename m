Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C44333300
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 03:14:50 +0100 (CET)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJoN7-0001Hh-CT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 21:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lJoMM-0000jF-C9; Tue, 09 Mar 2021 21:14:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:4474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lJoMJ-00065u-91; Tue, 09 Mar 2021 21:14:02 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DwFvS0PJWzrSk8;
 Wed, 10 Mar 2021 10:12:04 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 10:13:42 +0800
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <e37590d0-d65f-e4e4-ec59-92eb3166d9d9@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu
 option for pci root bus
Message-ID: <697b7fcd-c75e-71c9-baf9-64ef610d9efb@huawei.com>
Date: Wed, 10 Mar 2021 10:13:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e37590d0-d65f-e4e4-ec59-92eb3166d9d9@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/3/9 22:36, Auger Eric wrote:
> Hi,
> On 2/27/21 9:33 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> These patches add support for configure iommu on/off for pci root bus,
>> including primary bus and pxb root bus. At present, All root bus will go
>> through iommu when iommu is configured, which is not flexible.
>>
>> So this add option to enable/disable iommu for primary bus and pxb root bus.
>> When iommu is enabled for the root bus, devices attached to it will go
>> through iommu. When iommu is disabled for the root bus, devices will not
>> go through iommu accordingly.
> 
> Please could you give an example of the qemu command line for which the
> new option is useful for you. This would help me to understand your
> pcie/pci topology and also make sure I test it with the smmu.
> 
> Thank you in advance
> 
> Best Regards
> 
> Eric
>>
>> Xingang Wang (4):
>>    pci: Add PCI_BUS_IOMMU property
>>    hw/pci: Add iommu option for pci root bus
>>    hw/pci: Add pci_root_bus_max_bus
>>    hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
>>
>>   hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
>>   hw/arm/virt.c                       | 29 +++++++++
>>   hw/pci-bridge/pci_expander_bridge.c |  6 ++
>>   hw/pci/pci.c                        | 35 ++++++++++-
>>   include/hw/arm/virt.h               |  1 +
>>   include/hw/pci/pci.h                |  1 +
>>   include/hw/pci/pci_bus.h            | 13 ++++
>>   7 files changed, 153 insertions(+), 24 deletions(-)
>>
> 
> .
> 

Thanks for your advice.

I test this with the following script, in which i add two options.

The option `primary_bus_iommu=false(or true)` for `-machine 
virt,iommu=smmuv3`, this helps to enable/disable whether primary bus go 
through iommu.

The other option `iommu=false` or `iommu=true` for `-device pxb-pcie` 
helps to enable/disable whether pxb root bus go through iommu.

> #!/bin/sh
> 
> /path/to/qemu/build/aarch64-softmmu/qemu-system-aarch64 \
> -enable-kvm \
> -cpu host \
> -kernel /path/to/linux/arch/arm64/boot/Image \
> -m 16G \
> -smp 8,sockets=8,cores=1,threads=1 \
> -machine virt,kernel_irqchip=on,gic-version=3,iommu=smmuv3,primary_bus_iommu=false \
> -drive file=./QEMU_EFI-pflash.raw,if=pflash,format=raw,unit=0,readonly=on \
> -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1,iommu=false \
> -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x3.0x2,iommu=true \
> -device pxb-pcie,bus_nr=0x23,id=pci.30,bus=pcie.0,addr=0x3.0x3,iommu=true \
> -device pxb-pcie,bus_nr=0x40,id=pci.40,bus=pcie.0,addr=0x3.0x4,iommu=false \
> -device pcie-pci-bridge,id=pci.11,bus=pci.10,addr=0x1 \
> -device pcie-pci-bridge,id=pci.21,bus=pci.20,addr=0x1 \
> -device pcie-root-port,port=0x20,chassis=10,id=pci.2,bus=pcie.0,addr=0x2 \
> -device pcie-root-port,port=0x20,chassis=11,id=pci.12,bus=pci.10,addr=0x2 \
> -device pcie-root-port,port=0x20,chassis=19,id=pci.19,bus=pci.11,addr=0x3 \
> -device pcie-root-port,port=0x20,chassis=12,id=pci.22,bus=pci.20,addr=0x2 \
> -device pcie-root-port,port=0x20,chassis=13,id=pci.42,bus=pci.40,addr=0x2 \
> -device virtio-scsi-pci,id=scsi0,bus=pci.12,addr=0x1 \
> -device vfio-pci,host=b5:00.2,bus=pci.42,addr=0x0,id=acc2 \
> -net none \
> -initrd /path/to/rootfs.cpio.gz \
> -nographic \
> -append "rdinit=init console=ttyAMA0 earlycon=pl011,0x9000000 nokaslr" \

I test the command line with an accelerator. The IORT table will have 
some changes, so only the root bus with iommu=true will go through smmuv3.

Thanks,
Xingang
.

