Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42A66035C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:35:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDojw-0001hU-Ea; Fri, 06 Jan 2023 10:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDojt-0001gw-Kz; Fri, 06 Jan 2023 10:34:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDojr-0003tb-TF; Fri, 06 Jan 2023 10:34:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BA3E374638A;
 Fri,  6 Jan 2023 16:32:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C76B7746335; Fri,  6 Jan 2023 16:32:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C46F2746307;
 Fri,  6 Jan 2023 16:32:12 +0100 (CET)
Date: Fri, 6 Jan 2023 16:32:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH] hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
In-Reply-To: <20230106113927.8603-1-shentey@gmail.com>
Message-ID: <b1cac26d-9f1d-ad10-8af1-31ae6ca87441@eik.bme.hu>
References: <20230106113927.8603-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Fri, 6 Jan 2023, Bernhard Beschow wrote:
> mv64361_pcihost_map_irq() is a reimplementation of
> pci_swizzle_map_irq_fn(). Resolve this redundancy.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> Testing done:
> * `qemu-system-ppc -machine pegasos2 \
>                   -rtc base=localtime \
>                   -device ati-vga,guest_hwcursor=true,romfile="" \
>                   -cdrom morphos-3.17.iso \
>                   -kernel morphos-3.17/boot.img`
> ---
> hw/pci-host/mv64361.c | 7 +------
> 1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index cc9c4d6d3b..70db142ec3 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -72,11 +72,6 @@ struct MV64361PCIState {
>     uint64_t remap[5];
> };
>
> -static int mv64361_pcihost_map_irq(PCIDevice *pci_dev, int n)
> -{
> -    return (n + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
> -}
> -
> static void mv64361_pcihost_set_irq(void *opaque, int n, int level)
> {
>     MV64361PCIState *s = opaque;
> @@ -97,7 +92,7 @@ static void mv64361_pcihost_realize(DeviceState *dev, Error **errp)
>     g_free(name);
>     name = g_strdup_printf("pci.%d", s->index);
>     h->bus = pci_register_root_bus(dev, name, mv64361_pcihost_set_irq,
> -                                   mv64361_pcihost_map_irq, dev,
> +                                   pci_swizzle_map_irq_fn, dev,
>                                    &s->mem, &s->io, 0, 4, TYPE_PCI_BUS);
>     g_free(name);
>     pci_create_simple(h->bus, 0, TYPE_MV64361_PCI_BRIDGE);
>

