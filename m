Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C45633E74
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTvM-00025x-4q; Tue, 22 Nov 2022 09:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxTvJ-00022P-Ic; Tue, 22 Nov 2022 09:06:53 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxTvG-0006TN-Te; Tue, 22 Nov 2022 09:06:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 74D5774638A;
 Tue, 22 Nov 2022 15:06:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5FBC374633D; Tue, 22 Nov 2022 15:06:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5E5E5746307;
 Tue, 22 Nov 2022 15:06:14 +0100 (CET)
Date: Tue, 22 Nov 2022 15:06:14 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 1/2] cleanup: Tweak and re-run return_directly.cocci
In-Reply-To: <20221122134917.1217307-2-armbru@redhat.com>
Message-ID: <8e38e4d1-4b1a-bae7-873b-2ad61489dc77@eik.bme.hu>
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Tue, 22 Nov 2022, Markus Armbruster wrote:
> Tweak the semantic patch to drop redundant parenthesis around the
> return expression.
>
> Coccinelle drops a comment in hw/rdma/vmw/pvrdma_cmd.c; restored
> manually.
>
> Coccinelle messes up vmdk_co_create(), not sure why.  Change dropped,
> will be done manually in the next commit.
>
> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
> manually.
>
> Whitespace in tools/virtiofsd/fuse_lowlevel.c tidied up manually.
>
> checkpatch.pl complains "return of an errno should typically be -ve"
> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
> it visible to checkpatch.pl.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> scripts/coccinelle/return_directly.cocci |  5 +--
> include/hw/pci/pci.h                     |  7 +--
> target/avr/cpu.h                         |  4 +-
> hw/9pfs/9p-synth.c                       | 14 ++----
> hw/char/sifive_uart.c                    |  4 +-
> hw/ppc/ppc4xx_sdram.c                    |  5 +--
> hw/rdma/vmw/pvrdma_cmd.c                 | 57 +++++++++---------------
> hw/virtio/vhost-user.c                   |  6 +--
> migration/dirtyrate.c                    | 10 +----
> migration/tls.c                          |  6 +--
> replay/replay-time.c                     |  5 +--
> semihosting/console.c                    |  4 +-
> softmmu/memory.c                         | 11 +----
> softmmu/physmem.c                        |  9 +---
> target/loongarch/cpu.c                   |  4 +-
> target/mips/tcg/dsp_helper.c             | 15 ++-----
> target/riscv/debug.c                     |  6 +--
> target/riscv/vector_helper.c             | 28 +++---------
> tests/bench/benchmark-crypto-akcipher.c  |  6 +--
> tests/qtest/erst-test.c                  |  5 +--
> tests/qtest/hexloader-test.c             |  6 +--
> tests/qtest/pvpanic-pci-test.c           |  6 +--
> tests/qtest/pvpanic-test.c               |  6 +--
> tests/qtest/test-filter-mirror.c         |  6 +--
> tests/qtest/virtio-ccw-test.c            |  6 +--
> tests/tcg/multiarch/sha512.c             |  9 +---
> tools/virtiofsd/fuse_lowlevel.c          | 24 +++-------
> 27 files changed, 70 insertions(+), 204 deletions(-)
>
> diff --git a/scripts/coccinelle/return_directly.cocci b/scripts/coccinelle/return_directly.cocci
> index 4cf50e75ea..6cb1b3c99a 100644
> --- a/scripts/coccinelle/return_directly.cocci
> +++ b/scripts/coccinelle/return_directly.cocci
> @@ -11,9 +11,8 @@ identifier F;
> -    T VAR;
>      ... when != VAR
>
> --    VAR =
> -+    return
> -     E;
> +-    VAR = (E);
> -    return VAR;
> ++    return E;
>      ... when != VAR
>  }
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6ccaaf5154..06e2d5f889 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -921,11 +921,8 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
> static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
>                                 dma_addr_t *plen, DMADirection dir)
> {
> -    void *buf;
> -
> -    buf = dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
> -                         MEMTXATTRS_UNSPECIFIED);
> -    return buf;
> +    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
> +                          MEMTXATTRS_UNSPECIFIED);
> }
>
> static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index 96419c0c2b..f19dd72926 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -215,8 +215,7 @@ static inline int cpu_interrupts_enabled(CPUAVRState *env)
>
> static inline uint8_t cpu_get_sreg(CPUAVRState *env)
> {
> -    uint8_t sreg;
> -    sreg = (env->sregC) << 0
> +    return (env->sregC) << 0
>          | (env->sregZ) << 1
>          | (env->sregN) << 2
>          | (env->sregV) << 3
> @@ -224,7 +223,6 @@ static inline uint8_t cpu_get_sreg(CPUAVRState *env)
>          | (env->sregH) << 5
>          | (env->sregT) << 6
>          | (env->sregI) << 7;
> -    return sreg;
> }
>
> static inline void cpu_set_sreg(CPUAVRState *env, uint8_t sreg)
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index 1c5813e4dd..38d787f494 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -72,7 +72,6 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *parent, int mode,
> int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
>                           const char *name, V9fsSynthNode **result)
> {
> -    int ret;
>     V9fsSynthNode *node, *tmp;
>
>     if (!synth_fs) {
> @@ -87,8 +86,7 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
>     QEMU_LOCK_GUARD(&synth_mutex);
>     QLIST_FOREACH(tmp, &parent->child, sibling) {
>         if (!strcmp(tmp->name, name)) {
> -            ret = EEXIST;
> -            return ret;
> +            return EEXIST;
>         }
>     }
>     /* Add the name */
> @@ -98,15 +96,13 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
>     v9fs_add_dir_node(node, node->attr->mode, ".",
>                       node->attr, node->attr->inode);
>     *result = node;
> -    ret = 0;
> -    return ret;
> +    return 0;
> }
>
> int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
>                              const char *name, v9fs_synth_read read,
>                              v9fs_synth_write write, void *arg)
> {
> -    int ret;
>     V9fsSynthNode *node, *tmp;
>
>     if (!synth_fs) {
> @@ -122,8 +118,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
>     QEMU_LOCK_GUARD(&synth_mutex);
>     QLIST_FOREACH(tmp, &parent->child, sibling) {
>         if (!strcmp(tmp->name, name)) {
> -            ret = EEXIST;
> -            return ret;
> +            return EEXIST;
>         }
>     }
>     /* Add file type and remove write bits */
> @@ -138,8 +133,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
>     node->private      = arg;
>     pstrcpy(node->name, sizeof(node->name), name);
>     QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> -    ret = 0;
> -    return ret;
> +    return 0;
> }
>
> static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 1c75f792b3..f2684e57bc 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -274,7 +274,6 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
> {
>     DeviceState *dev;
>     SysBusDevice *s;
> -    SiFiveUARTState *r;
>
>     dev = qdev_new("riscv.sifive.uart");
>     s = SYS_BUS_DEVICE(dev);
> @@ -284,6 +283,5 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>                                 sysbus_mmio_get_region(s, 0));
>     sysbus_connect_irq(s, 0, irq);
>
> -    r = SIFIVE_UART(dev);
> -    return r;
> +    return SIFIVE_UART(dev);
> }
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> index 8d7137faf3..54bf9a2b44 100644
> --- a/hw/ppc/ppc4xx_sdram.c
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -520,13 +520,10 @@ static inline hwaddr sdram_ddr2_base(uint32_t bcr)
>
> static hwaddr sdram_ddr2_size(uint32_t bcr)
> {
> -    hwaddr size;
>     int sh;
>
>     sh = 1024 - ((bcr >> 6) & 0x3ff);
> -    size = 8 * MiB * sh;
> -
> -    return size;
> +    return 8 * MiB * sh;
> }
>
> static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)

There's also an sdram_ddr_size() that's similar and could be changed to

return sh == 7 ? -1 : (4 * MiB) << sh;

just to keep these two functions simliar but Coccinelle probably does not 
catch that. Also while you're at it the assigmment of sh could be moved to 
the declaration to save even more lines. As this then becomes more of a 
handwritten patch, maybe it should be a separate patch cleaning these two 
functions before the rest.

Otherwise for this part (or separate patch as above):

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan

