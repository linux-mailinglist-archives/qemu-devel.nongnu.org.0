Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D147CD76
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:17:47 +0100 (CET)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvsg-0000hY-Ql
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvNt-0002At-Oq
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:45:59 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:57287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvNr-0005i1-IF
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:45:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 546A22081F;
 Wed, 22 Dec 2021 06:45:52 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:45:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00217707cd1-11dd-4cfe-bf9e-fa5a6ed25b62,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <db31ead6-63a7-7ea6-584e-44e2091e83cb@kaod.org>
Date: Wed, 22 Dec 2021 07:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] dma: Let ld*_dma() propagate MemTxResult
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-5-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211218145111.1540114-5-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 19c092d7-1609-4ce4-aaac-a81adc190f6f
X-Ovh-Tracer-Id: 14528612400713468801
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 15:51, Philippe Mathieu-Daudé wrote:
> dma_memory_read() returns a MemTxResult type. Do not discard
> it, return it to the caller.

Good ! We should be using it in XIVE.

> Update the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
     

> ---
>   include/hw/pci/pci.h       |  6 ++++--
>   include/hw/ppc/spapr_vio.h |  6 +++++-
>   include/sysemu/dma.h       | 25 ++++++++++++-------------
>   hw/intc/pnv_xive.c         |  8 ++++----
>   hw/usb/hcd-xhci.c          |  7 ++++---
>   5 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 0613308b1b6..8c5f2ed5054 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -854,8 +854,10 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>       static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
>                                                      dma_addr_t addr)     \
>       {                                                                   \
> -        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
> -                            MEMTXATTRS_UNSPECIFIED);                    \
> +        uint##_bits##_t val; \
> +        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
> +                     MEMTXATTRS_UNSPECIFIED); \
> +        return val; \
>       }                                                                   \
>       static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
>                                           dma_addr_t addr, uint##_bits##_t val) \
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index d2ec9b0637f..7eae1a48478 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -127,7 +127,11 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
>   #define vio_stq(_dev, _addr, _val) \
>           (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
>   #define vio_ldq(_dev, _addr) \
> -        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
> +        ({ \
> +            uint64_t _val; \
> +            ldq_be_dma(&(_dev)->as, (_addr), &_val, MEMTXATTRS_UNSPECIFIED); \
> +            _val; \
> +        })
>   
>   int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
>   
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index 191cf0b271a..589f5ba52a2 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -241,14 +241,15 @@ static inline void dma_memory_unmap(AddressSpace *as,
>   }
>   
>   #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
> -    static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
> -                                                            dma_addr_t addr, \
> -                                                            MemTxAttrs attrs) \
> -    {                                                                   \
> -        uint##_bits##_t val;                                            \
> -        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
> -        return _end##_bits##_to_cpu(val);                               \
> -    }                                                                   \
> +    static inline MemTxResult ld##_lname##_##_end##_dma(AddressSpace *as, \
> +                                                        dma_addr_t addr, \
> +                                                        uint##_bits##_t *pval, \
> +                                                        MemTxAttrs attrs) \
> +    { \
> +        MemTxResult res = dma_memory_read(as, addr, pval, (_bits) / 8, attrs); \
> +        _end##_bits##_to_cpus(pval); \
> +        return res; \
> +    } \
>       static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
>                                                           dma_addr_t addr, \
>                                                           uint##_bits##_t val, \
> @@ -258,12 +259,10 @@ static inline void dma_memory_unmap(AddressSpace *as,
>           return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
>       }
>   
> -static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
> +static inline MemTxResult ldub_dma(AddressSpace *as, dma_addr_t addr,
> +                                   uint8_t *val, MemTxAttrs attrs)
>   {
> -    uint8_t val;
> -
> -    dma_memory_read(as, addr, &val, 1, attrs);
> -    return val;
> +    return dma_memory_read(as, addr, val, 1, attrs);
>   }
>   
>   static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index d9249bbc0c1..bb207514f2d 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
>   
>       /* Get the page size of the indirect table. */
>       vsd_addr = vsd & VSD_ADDRESS_MASK;
> -    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
> +    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
>   
>       if (!(vsd & VSD_ADDRESS_MASK)) {
>   #ifdef XIVE_DEBUG
> @@ -195,8 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
>       /* Load the VSD we are looking for, if not already done */
>       if (vsd_idx) {
>           vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
> -        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
> -                         MEMTXATTRS_UNSPECIFIED);
> +        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
> +                   MEMTXATTRS_UNSPECIFIED);
>   
>           if (!(vsd & VSD_ADDRESS_MASK)) {
>   #ifdef XIVE_DEBUG
> @@ -543,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
>   
>       /* Get the page size of the indirect table. */
>       vsd_addr = vsd & VSD_ADDRESS_MASK;
> -    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
> +    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
>   
>       if (!(vsd & VSD_ADDRESS_MASK)) {
>   #ifdef XIVE_DEBUG
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index d960b814587..da5a4072107 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
>       assert(slotid >= 1 && slotid <= xhci->numslots);
>   
>       dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
> -    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
> +    ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &poctx, MEMTXATTRS_UNSPECIFIED);
>       ictx = xhci_mask64(pictx);
>       octx = xhci_mask64(poctx);
>   
> @@ -3429,6 +3429,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
>       uint32_t slot_ctx[4];
>       uint32_t ep_ctx[5];
>       int slotid, epid, state;
> +    uint64_t addr;
>   
>       dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
>   
> @@ -3437,8 +3438,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
>           if (!slot->addressed) {
>               continue;
>           }
> -        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
> -                                           MEMTXATTRS_UNSPECIFIED));
> +        ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPECIFIED);
> +        slot->ctx = xhci_mask64(addr);
>           xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
>           slot->uport = xhci_lookup_uport(xhci, slot_ctx);
>           if (!slot->uport) {
> 


