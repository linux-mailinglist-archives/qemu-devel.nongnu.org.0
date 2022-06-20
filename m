Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B1551179
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:28:41 +0200 (CEST)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Bpw-0004X7-A2
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BoS-0003Xo-PB; Mon, 20 Jun 2022 03:27:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BoR-0001xk-5g; Mon, 20 Jun 2022 03:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6OWzLIZuLRPSllSyrmY7UT1EElkIqcyVobIGUHIHBbM=; b=aeGq0xGWSB3kLrjPoCqCD92KX0
 9AXGVQQpGqxocHMaJras1Pn5TGOU2zIL2Myv9XOvvehLphgihFhlNDcxtSuh0G2MKz/9qLwvQVvMF
 Bazd5O6ymB5mlC6drOnBLvXifX8dhLjWpqg17HhuuCv6VgRKqx/yO8E2rGEXxwOVFD5/8ntnFYTr1
 ICUJ4blx0UUys/m6KLw6TXg/5NzhZcloZQVnaH1RxdlLuje9XpCBpl1h9md1ocnBJq2wC3I1S2a9X
 vMmDt9arOYJu+IvsPKaiA36SPrOkheh7de3bozxbA9rW7ywW5FZJGXDEPcPBJ0h8SMTj36r9FbUjD
 kuLCqzwtlk50ioAi11fFDoUbey+r6yei1EbHvp85t1Ar0t4bY3S78F6RCKJQ/j66yx01NVr2jun7H
 1pmsYpRa3C7QNDs65oESJ6edqCKRwtv2+vrhDTNOysB2VLi3tpNvzQcSzenQd4SErhwiDN2hrHRQ+
 36eIyqzFxykPixbUsP+6PQX9dXqPh4JP/JxucwTJkkzUutrmXk9F3EUXi2qkLV/QIb4EfviLqAeq4
 kLCawK9kpjN/7zxf0y475JiUPVMpdO68ok4Oa5vd3YgyBOR/mBebq1R/VwS0dXhd7It5lolgTLnUW
 63hLdKPXzKm7+b2fnn2OzmqUbOSr6MO6ebHEkDE7E=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BnI-00089R-0X; Mon, 20 Jun 2022 08:25:56 +0100
Message-ID: <d36775a8-15f7-ab03-fc08-3fdcfc72d293@ilande.co.uk>
Date: Mon, 20 Jun 2022 08:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-4-danielhb413@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220618110202.87735-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 3/9] ppc/pnv: use dev->parent_bus->parent to get the PHB
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 18/06/2022 12:01, Daniel Henrique Barboza wrote:

> It is not advisable to execute an object_dynamic_cast() to poke into
> bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
> think we got.
> 
> A better way is to access the PnvPHB object via a QOM macro accessing
> the existing parent links of the DeviceState. For a given
> pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
> and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
> assert the type, and keep the NULL check in case we didn't get the
> object we were expecting.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb3.c | 10 +++++++---
>   hw/pci-host/pnv_phb4.c | 10 +++++++---
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 4ba660f8b9..5e7f827415 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
>       PnvPHB3 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB3);
> +    /*
> +     * dev->parent_bus gives access to the pnv-phb-root bus.
> +     * The PnvPHB3 is the owner (parent) of the bus.
> +     */
> +    if (dev->parent_bus) {

Here dev->parent_bus shouldn't be accessed directly: you should use 
qdev_get_parent_bus() instead.

> +        phb = PNV_PHB3(dev->parent_bus->parent);
> +    }

This one is a bit trickier, since part of the qdev design is that devices should only 
be aware of their immediate bus, and not the device parenting that bus i.e. 
dev->parent_bus->parent shouldn't be allowed.

What is really needed here is to use QOM links (or embed the device as a suitable QOM 
child) to get the PHB reference which I imagine will be changed as part of the 
follow-up series. So I think this can be left as-is for now, and fixed later.

>       if (!phb) {
>           error_setg(errp,
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ffd9d8a947..a0ee52e820 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
>       PnvPHB4 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB4);
> +    /*
> +     * dev->parent_bus gives access to the pnv-phb-root bus.
> +     * The PnvPHB4 is the owner (parent) of the bus.
> +     */
> +    if (dev->parent_bus) {
> +        phb = PNV_PHB4(dev->parent_bus->parent);
> +    }
>   
>       if (!phb) {
>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);

I've had a quick look over the rest of the series and from what I can see this is 
definitely heading in the right direction :)


ATB,

Mark.

