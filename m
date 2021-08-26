Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228DF3F902A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:31:25 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMxz-00034X-3H
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJMiX-0002Bu-6R
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:15:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49906
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJMiV-0008UX-15
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:15:20 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJMi4-0009lc-2N; Thu, 26 Aug 2021 22:14:57 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-4-philmd@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
Date: Thu, 26 Aug 2021 22:15:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826200720.2196827-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 3/3] hw/usb/xhci: Always expect 'dma' link property to
 be set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2021 21:07, Philippe Mathieu-Daudé wrote:

> Simplify by always passing a MemoryRegion property to the device.
> Doing so we can move the AddressSpace field to the device struct,
> removing need for heap allocation.
> 
> Update the MicroVM machine to pass the default system memory instead
> of a NULL value.
> 
> We don't need to change the Versal machine, as the link property is
> initialize as "versal.dwc3_alias" MemoryRegion alias.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Versal untested
> ---
>   hw/usb/hcd-xhci.h        |  2 +-
>   hw/i386/microvm.c        |  2 ++
>   hw/usb/hcd-xhci-pci.c    |  3 ++-
>   hw/usb/hcd-xhci-sysbus.c | 13 ++++++-------
>   hw/usb/hcd-xhci.c        | 20 ++++++++++----------
>   5 files changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> index 98f598382ad..ea76ec4f277 100644
> --- a/hw/usb/hcd-xhci.h
> +++ b/hw/usb/hcd-xhci.h
> @@ -180,7 +180,7 @@ typedef struct XHCIState {
>       USBBus bus;
>       MemoryRegion mem;
>       MemoryRegion *dma_mr;
> -    AddressSpace *as;
> +    AddressSpace as;
>       MemoryRegion mem_cap;
>       MemoryRegion mem_oper;
>       MemoryRegion mem_runtime;
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index aba0c832190..2d55114a676 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -219,6 +219,8 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>           qdev_prop_set_uint32(dev, "slots", XHCI_MAXSLOTS);
>           qdev_prop_set_uint32(dev, "p2", 8);
>           qdev_prop_set_uint32(dev, "p3", 8);
> +        object_property_set_link(OBJECT(dev), "dma",
> +                                 OBJECT(get_system_memory()), &error_abort);

In a way I could see why you may wish to explicitly set the DMA memory region, but a 
quick look around suggests that devices where the memory region is unspecified 
(typically using a link property called "dma_mr") then the default is assumed to be 
get_system_memory(). That seems a reasonably intuitive default to me, but presumably 
there is another type of mistake you're trying to guard against here?

>           sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
>           sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, MICROVM_XHCI_BASE);
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
> index 24c528d210f..10f5cc374fe 100644
> --- a/hw/usb/hcd-xhci-pci.c
> +++ b/hw/usb/hcd-xhci-pci.c
> @@ -116,6 +116,8 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
>       dev->config[0x60] = 0x30; /* release number */
>   
>       object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_abort);
> +    object_property_set_link(OBJECT(dev), "dma",
> +                             OBJECT(pci_dma_memory_region(dev)), &error_abort);
>       s->xhci.intr_update = xhci_pci_intr_update;
>       s->xhci.intr_raise = xhci_pci_intr_raise;
>       if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
> @@ -161,7 +163,6 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
>                     &s->xhci.mem, 0, OFF_MSIX_PBA,
>                     0x90, NULL);
>       }
> -    s->xhci.as = pci_get_address_space(dev);
>   }
>   
>   static void usb_xhci_pci_exit(PCIDevice *dev)
> diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
> index a14e4381960..f212ce785bd 100644
> --- a/hw/usb/hcd-xhci-sysbus.c
> +++ b/hw/usb/hcd-xhci-sysbus.c
> @@ -36,6 +36,11 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
>   {
>       XHCISysbusState *s = XHCI_SYSBUS(dev);
>   
> +    if (!s->xhci.dma_mr) {
> +        error_setg(errp, TYPE_XHCI_SYSBUS " 'dma' link not set");
> +        return;
> +    }
> +
>       object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
>       if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
>           return;
> @@ -43,13 +48,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
>       s->irq = g_new0(qemu_irq, s->xhci.numintrs);
>       qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
>                                s->xhci.numintrs);
> -    if (s->xhci.dma_mr) {
> -        s->xhci.as =  g_malloc0(sizeof(AddressSpace));
> -        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
> -    } else {
> -        s->xhci.as = &address_space_memory;
> -    }
> -
> +    address_space_init(&s->xhci.as, s->xhci.dma_mr, "usb-xhci-dma");
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
>   }

My understanding of the patch is that you're trying to avoid the heap allocation 
above (which is a good idea!) so from that perspective all you need is somewhere to 
store the AddressSpace used for the the xhci-sysbus device, for which XHCISysbusState 
would be the natural choice.

It seems to me that the easiest approach is just to set the s->xhci.as pointer in 
xhci_sysbus_realize() in exactly the same as usb_xhci_pci_realize() does:

typedef struct XHCISysbusState {
     ...
     ...
     AddressSpace as;
} XHCISysbusState

static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
{
     XHCISysbusState *s = XHCI_SYSBUS(dev);
     ...
     ...
     address_space_init(&s->as, s->xhci.dma_mr ? s->xhci.dma_mr : get_system_memory(),
                        "usb-xhci-dma");
     s->xhci.as = &s->as;
}

I think this approach is clearer since the xhci-sysbus device always creates its own 
address space which is either an alias onto normal system memory or the custom 
MemoryRegion provided via the "dma_mr" link property. Note that 
xhci_sysbus_finalize() should also not forget to remove the AddressSpace via 
address_space_destroy() to prevent a leak there too.

> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index e01700039b1..011f1233ef3 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -487,7 +487,7 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci, dma_addr_t addr,
>   
>       assert((len % sizeof(uint32_t)) == 0);
>   
> -    dma_memory_read(xhci->as, addr, buf, len);
> +    dma_memory_read(&xhci->as, addr, buf, len);
>   
>       for (i = 0; i < (len / sizeof(uint32_t)); i++) {
>           buf[i] = le32_to_cpu(buf[i]);
> @@ -507,7 +507,7 @@ static inline void xhci_dma_write_u32s(XHCIState *xhci, dma_addr_t addr,
>       for (i = 0; i < n; i++) {
>           tmp[i] = cpu_to_le32(buf[i]);
>       }
> -    dma_memory_write(xhci->as, addr, tmp, len);
> +    dma_memory_write(&xhci->as, addr, tmp, len);
>   }
>   
>   static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
> @@ -618,7 +618,7 @@ static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
>                                  ev_trb.status, ev_trb.control);
>   
>       addr = intr->er_start + TRB_SIZE*intr->er_ep_idx;
> -    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE);
> +    dma_memory_write(&xhci->as, addr, &ev_trb, TRB_SIZE);
>   
>       intr->er_ep_idx++;
>       if (intr->er_ep_idx >= intr->er_size) {
> @@ -679,7 +679,7 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
>   
>       while (1) {
>           TRBType type;
> -        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE);
> +        dma_memory_read(&xhci->as, ring->dequeue, trb, TRB_SIZE);
>           trb->addr = ring->dequeue;
>           trb->ccs = ring->ccs;
>           le64_to_cpus(&trb->parameter);
> @@ -726,7 +726,7 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
>   
>       while (1) {
>           TRBType type;
> -        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE);
> +        dma_memory_read(&xhci->as, dequeue, &trb, TRB_SIZE);
>           le64_to_cpus(&trb.parameter);
>           le32_to_cpus(&trb.status);
>           le32_to_cpus(&trb.control);
> @@ -781,7 +781,7 @@ static void xhci_er_reset(XHCIState *xhci, int v)
>           xhci_die(xhci);
>           return;
>       }
> -    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg));
> +    dma_memory_read(&xhci->as, erstba, &seg, sizeof(seg));
>       le32_to_cpus(&seg.addr_low);
>       le32_to_cpus(&seg.addr_high);
>       le32_to_cpus(&seg.size);
> @@ -1393,7 +1393,7 @@ static int xhci_xfer_create_sgl(XHCITransfer *xfer, int in_xfer)
>       int i;
>   
>       xfer->int_req = false;
> -    qemu_sglist_init(&xfer->sgl, DEVICE(xhci), xfer->trb_count, xhci->as);
> +    qemu_sglist_init(&xfer->sgl, DEVICE(xhci), xfer->trb_count, &xhci->as);
>       for (i = 0; i < xfer->trb_count; i++) {
>           XHCITRB *trb = &xfer->trbs[i];
>           dma_addr_t addr;
> @@ -2059,7 +2059,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
>       assert(slotid >= 1 && slotid <= xhci->numslots);
>   
>       dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
> -    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
> +    poctx = ldq_le_dma(&xhci->as, dcbaap + 8 * slotid);
>       ictx = xhci_mask64(pictx);
>       octx = xhci_mask64(poctx);
>   
> @@ -2397,7 +2397,7 @@ static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
>       /* TODO: actually implement real values here */
>       bw_ctx[0] = 0;
>       memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
> -    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
> +    dma_memory_write(&xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
>   
>       return CC_SUCCESS;
>   }
> @@ -3434,7 +3434,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
>               continue;
>           }
>           slot->ctx =
> -            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
> +            xhci_mask64(ldq_le_dma(&xhci->as, dcbaap + 8 * slotid));
>           xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
>           slot->uport = xhci_lookup_uport(xhci, slot_ctx);
>           if (!slot->uport) {


ATB,

Mark.

