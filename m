Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE16478DBD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:23:29 +0100 (CET)
Received: from localhost ([::1]:35482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myE8t-0001kW-IQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:23:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myE6e-00087s-UT
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:21:08 -0500
Received: from relay64.bu.edu ([128.197.228.104]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myE6b-00005p-Oi
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:21:07 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1BHEK6Qp022533
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 17 Dec 2021 09:20:10 -0500
Date: Fri, 17 Dec 2021 09:20:06 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Message-ID: <20211217142006.opo3qko5cgd7m2p6@mozz.bu.edu>
References: <20211217030858.834822-1-alxndr@bu.edu>
 <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211217 0627, Qiuhao Li wrote:
> Thanks Alex. It seems this patch sets and checks if the destination device is busy. But how about the data transfers not triggered directly by PMIO/MMIO handlers? For example:
> 
> 1. Device A Timer's callback -> Device A MMIO handler
> 2. Device A BH's callback -> Device A MMIO handler
> 
> In these situations, when A launches a DMA to itself, the dev->engaged_in_direct_io is not set, so the operation is allowed. Maybe we should log the source and check the destination when we launch data transfers. Is there a way to do that?

Ahh, I forgot that this can happen in BHs as well... I think the only
place to do that, without major API changes, is at pci_dma_rw and
dma_buffer_rw (where we can catch a glimpse of the
PCIDevice/DeviceState).

I'll send a V2.

-Alex

> 
> Below is a reproducer in NVMe which triggers DMA in a timer's callback (nvme_process_sq). I can still trigger use-after-free exception with this patch on qemu-6.1.0:
> 
> cat << EOF | ./qemu-system-x86_64 -display none -machine accel=qtest \
> -machine q35 -nodefaults -drive file=null-co://,if=none,format=raw,id=disk0 \
> -device nvme,drive=disk0,serial=1 -qtest stdio \
> 
> outl 0xcf8 0x80000810               /* MLBAR (BAR0) – Memory Register Base Address, lower 32-bits */
> outl 0xcfc 0xe0000000               /* MMIO Base Address = 0xe0000000 */
> outl 0xcf8 0x80000804               /* CMD - Command */
> outw 0xcfc 0x06                     /* Bus Master Enable, Memory Space Enable */
> write 0xe0000024 0x4 0x02000200     /* [3] 3.1.8, Admin Queue Attributes */
> write 0xe0000028 0x4 0x00100000     /* asq = 0x1000 */
> write 0xe0000030 0x4 0x00200000     /* acq = 0x2000 */
> write 0xe0000014 0x4 0x01004600     /* [3] 3.1.5, Controller Configuration, start ctrl */
> write 0xe0001000 0x1 0x01           /* [3] 3.1.24, SQyTDBL – Submission Queue y Tail Doorbell */
> write 0x1000 0x1 0x02               /* cmd->opcode, NVME_ADM_CMD_GET_LOG_PAGE, nvme_get_log() */
> write 0x1018 0x4 0x140000e0         /* prp1 = 0xe0000014, NVME_REG_CC, nvme_ctrl_reset() */
> write 0x1028 0x4 0x03000004         /* cmd->cdw10, lid = 3 NVME_LOG_FW_SLOT_INFO, nvme_fw_log_info, buf_len = 4 */
> write 0x1030 0x4 0xfc010000         /* cmd->cdw12 = 0x1fc, Log Page Offset, trans_len = sizeof(fw_log) - 0x1fc = 4 */
> clock_step
> EOF
> 
> CC: Mauro Matteo Cascella and Philippe Mathieu-Daudé. Should we put the reproducer above to https://gitlab.com/qemu-project/qemu/-/issues/556?
> 
> ________________________________
> From: Alexander Bulekov <alxndr@bu.edu>
> Sent: Friday, December 17, 2021 11:08
> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> Cc: Alexander Bulekov <alxndr@bu.edu>; Philippe Mathieu-Daudé <philmd@redhat.com>; Mauro Matteo Cascella <mcascell@redhat.com>; Qiuhao Li <Qiuhao.Li@outlook.com>; Peter Xu <peterx@redhat.com>; Jason Wang <jasowang@redhat.com>; David Hildenbrand <david@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Peter Maydell <peter.maydell@linaro.org>; Li Qiang <liq3ea@gmail.com>; Thomas Huth <thuth@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Bandan Das <bsd@redhat.com>; Edgar E . Iglesias <edgar.iglesias@gmail.com>; Darren Kenny <darren.kenny@oracle.com>; Bin Meng <bin.meng@windriver.com>; Paolo Bonzini <pbonzini@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>; Daniel P. Berrangé <berrange@redhat.com>; Eduardo Habkost <eduardo@habkost.net>
> Subject: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
> 
> Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
> the DeviceState, which is set/checked when we call an accessor
> associated with the device's IO MRs.
> 
> The problem, in short, as I understand it: For the vast majority of
> cases, we want to prevent a device from accessing it's own PIO/MMIO
> regions over DMA.
> 
> This patch/solution is based on some assumptions:
> 1. DMA accesses that hit mmio regions are only dangerous if they end up
> interacting with memory-regions belonging to the device initiating the
> DMA.
> Not dangerous:  sdhci_pio->dma_write->e1000_mmio
> Dangerous:      sdhci_pio->dma_write->sdhci_mmio
> 
> 2. Most devices do not interact with their own PIO/MMIO memory-regions
> using DMA.
> 
> 3. There is no way for there to be multiple simultaneous accesses to a
> device's PIO/MMIO memory-regions.
> 
> 4. All devices are QOMified :-)
> 
> With this patch, I wasn't able to reproduce the issues being tracked
> here, with QTest reproducers:
> https://gitlab.com/qemu-project/qemu/-/issues/556
> 
> This passes the i386 qos/qtests for me and I was able to boot some linux/windows
> VMs with basic devices configured, without any apparent problems.
> 
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Li Qiang <liq3ea@gmail.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Bandan Das <bsd@redhat.com>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Darren Kenny <darren.kenny@oracle.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/qdev-core.h |  1 +
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  3 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 20d3066595..32f7c779ab 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,7 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +    int engaged_in_direct_io;
>  };
> 
>  struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7340e19ff5..255c3c602f 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      uint64_t access_mask;
>      unsigned access_size;
>      unsigned i;
> +    DeviceState *dev = NULL;
>      MemTxResult r = MEMTX_OK;
> 
>      if (!access_size_min) {
> @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
> 
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> +        if (dev->engaged_in_direct_io) {
> +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +            return MEMTX_ERROR;
> +        }
> +        dev->engaged_in_direct_io = true;
> +    }
> +
>      /* FIXME: support unaligned access? */
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> @@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                          access_mask, attrs);
>          }
>      }
> +    if (dev) {
> +        dev->engaged_in_direct_io = false;
> +    }
>      return r;
>  }
> 
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index 9c88887b3c..d7228316db 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
>  memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
> --
> 2.33.0
> 

