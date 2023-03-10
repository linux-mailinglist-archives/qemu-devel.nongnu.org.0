Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF9C6B3D71
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paaiI-0007ZD-5y; Fri, 10 Mar 2023 06:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1paaiG-0007Yx-9m
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:15:04 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1paaiD-0006PQ-W9
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:15:03 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id E0DD445895;
 Fri, 10 Mar 2023 12:14:51 +0100 (CET)
Message-ID: <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
Date: Fri, 10 Mar 2023 12:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fam Zheng <fam@euphon.net>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230205040737.3567731-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 05.02.23 um 05:07 schrieb Alexander Bulekov:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Acked-by: Peter Xu <peterx@redhat.com>
> ---
>  include/hw/qdev-core.h |  7 +++++++
>  softmmu/memory.c       | 17 +++++++++++++++++
>  softmmu/trace-events   |  1 +
>  3 files changed, 25 insertions(+)
> 
Hi,
there seems to be an issue with this patch or existing issue exposed by
this patch in combination with the LSI SCSI controller.

After applying this patch on current master (i.e.
ee59483267de29056b5b2ee2421ef3844e5c9932), a Debian 11 with the LSI
controller would not boot properly anymore:
> [    7.540907] sym0: <895a> rev 0x0 at pci 0000:00:05.0 irq 10
> [    7.546028] sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> [    7.559724] sym0: SCSI BUS has been reset.
> [    7.560820] sym0: interrupted SCRIPT address not found.
> [    7.563802] scsi host2: sym-2.2.3
> [    7.881111] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> [    7.881998] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
> [    7.925902] e1000 0000:00:03.0 ens3: renamed from eth0
> [   32.654811] scsi 2:0:0:0: tag#192 ABORT operation started
> [   37.764283] scsi 2:0:0:0: ABORT operation timed-out.
> [   37.774974] scsi 2:0:0:0: tag#192 DEVICE RESET operation started
> [   42.882488] scsi 2:0:0:0: DEVICE RESET operation timed-out.
> [   42.883606] scsi 2:0:0:0: tag#192 BUS RESET operation started
> [   48.002437] scsi 2:0:0:0: BUS RESET operation timed-out.
> [   48.003030] scsi 2:0:0:0: tag#192 HOST RESET operation started
> [   48.010226] sym0: SCSI BUS has been reset.
> [   53.122472] scsi 2:0:0:0: HOST RESET operation timed-out.
> [   53.123030] scsi 2:0:0:0: Device offlined - not ready after error recovery

The commandline I used is:
./qemu-system-x86_64 \
   -cpu 'kvm64' \
   -m 4096 \
   -serial 'stdio' \
   -device 'lsi,id=scsihw0,bus=pci.0,addr=0x5' \
   -drive
'file=/dev/zvol/myzpool/vm-9006-disk-0,if=none,id=drive-scsi0,format=raw' \
   -device
'scsi-hd,bus=scsihw0.0,scsi-id=0,drive=drive-scsi0,id=scsi0,bootindex=100' \
   -machine 'pc'

Happy to provide any more information if necessary!

CC-ing Fam Zheng (reviewer:SCSI)

Originally reported by one of our community members:
https://forum.proxmox.com/threads/123843/

Best Regards,
Fiona


