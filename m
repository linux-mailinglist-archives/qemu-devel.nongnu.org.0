Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38302152F1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 09:16:39 +0200 (CEST)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsLMk-0008NA-PG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 03:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsLM2-0007o1-25; Mon, 06 Jul 2020 03:15:54 -0400
Received: from charlie.dont.surf ([128.199.63.193]:58226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsLLz-0002Mh-Nm; Mon, 06 Jul 2020 03:15:53 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id C2528BF600;
 Mon,  6 Jul 2020 07:15:48 +0000 (UTC)
Date: Mon, 6 Jul 2020 09:15:45 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v4 2/2] nvme: allow cmb and pmr to be enabled on same
 device
Message-ID: <20200706071545.md4tivimefffgyi6@apples.localdomain>
References: <20200701214858.28515-1-andrzej.jakowski@linux.intel.com>
 <20200701214858.28515-3-andrzej.jakowski@linux.intel.com>
 <20200702101318.rmd65uzwfpcmb24n@apples.localdomain>
 <20200702103127.hoonqkas3bw2v7re@apples.localdomain>
 <8f871a0d-47f1-1c8a-fcc2-aab2638c70cf@linux.intel.com>
 <20200702175113.6qtnpxqimpavzx7h@apples.localdomain>
 <191b39ed-0588-b5db-d352-965efd19128a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <191b39ed-0588-b5db-d352-965efd19128a@linux.intel.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 02:13:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul  2 16:33, Andrzej Jakowski wrote:
> On 7/2/20 10:51 AM, Klaus Jensen wrote:
> > On Jul  2 08:07, Andrzej Jakowski wrote:
> >> On 7/2/20 3:31 AM, Klaus Jensen wrote:
> >>> Aight, an update here. This only happens when QEMU is run with a virtual
> >>> IOMMU. Otherwise, the kernel is happy.
> >>>
> >>> With the vIOMMU, qemu also craps out a bit:
> >>>
> >>> qemu-system-x86_64: vtd_iova_to_slpte: detected slpte permission error (iova=0xfd200000, level=0x2, slpte=0x0, write=0)
> >>> qemu-system-x86_64: vtd_iommu_translate: detected translation failure (dev=03:00:00, iova=0xfd200000)
> >>>
> >>> So I think we are back in QEMU land for the bug.
> >>
> >> Can you share command line for that?
> >>
> >>
> > 
> > qemu-system-x86_64 \
> >   -nodefaults \
> >   -display none \
> >   -device intel-iommu,pt,intremap=on,device-iotlb=on \
> >   -machine type=q35,accel=kvm,kernel_irqchip=split \
> >   -cpu host \
> >   -smp 4 \
> >   -m 8G \
> >   -nic user,model=virtio-net-pci,hostfwd=tcp::2222-:22 \
> >   -device virtio-rng-pci \
> >   -drive id=boot,file=/home/kbj/work/src/vmctl/state/pmr/boot.qcow2,format=qcow2,if=virtio,discard=on,detect-zeroes=unmap \
> >   -device pcie-root-port,id=pcie_root_port1,chassis=1,slot=0 \
> >   -device x3130-upstream,id=pcie_upstream1,bus=pcie_root_port1 \
> >   -device xio3130-downstream,id=pcie_downstream1,bus=pcie_upstream1,chassis=1,slot=1 \
> >   -drive id=nvme0n1,file=/home/kbj/work/src/vmctl/state/pmr/nvme0n1.img,format=raw,if=none,discard=on,detect-zeroes=unmap \
> >   -object memory-backend-file,id=pmr,share=on,mem-path=pmr.bin,size=1M \
> >   -device nvme,id=nvme0,serial=deadbeef,bus=pcie_downstream1,drive=nvme0n1,msix_qsize=1,pmrdev=pmr,cmb_size_mb=2 \
> >   -pidfile /home/kbj/work/src/vmctl/run/pmr/pidfile \
> >   -kernel /home/kbj/work/src/kernel/linux/arch/x86_64/boot/bzImage \
> >   -append root=/dev/vda1 console=ttyS0,115200 audit=0 nokaslr \
> >   -virtfs local,path=/home/kbj/work/src/kernel/linux,security_model=none,readonly,mount_tag=modules \
> >   -serial mon:stdio \
> >   -trace pci_nvme*
> > 
> > 
> 
> I focused on reproduction and it looks to me that my patch doesn't 
> necessarily introduce regression. I run it w/ and w/o patch in both cases
> getting error while registering. Here is kernel guest log:
> 
> [   87.606482] nvme nvme0: pci function 0000:00:04.0
> [   87.635577] dev=0000000095b0a83b bar=2 size=134217728 offset=0
> [   87.636593] nvme nvme0: failed to register the CMB ret=-95
> [   87.643262] nvme nvme0: 12/0/0 default/read/poll queues
> 
> Any thoughts?
> 

Hmm, that's not what I am seeing.

With kernel v5.8-rc4, I'm not seeing any issues with CMB with and
without IOMMU on QEMU master. With your patches, my kernel (v5.8-rc4)
pukes both with and without iommu.

BUT! This doesn't mean that your patch is bad, it looks more like an
issue in the kernel. I still think the BAR configuration looks sane, but
I am not expert on this.

To satisify my curiosity I tried mending your patch to put the CMB on
offset 0 and move the MSI-X vector table and PBA to BAR 0 (like I
suggested back in the day). That works. With and without IOMMU. So, I
think it is an issue with the Linux kernel not being too happy about the
CMB being at an offset. It doesn't directly look like an issue in the
nvme driver since the issue shows up far lower in the memory subsystem,
but it would be nice to have the linux nvme gang at least acknowledge
the issue.

