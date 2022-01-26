Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A733C49CB0E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:41:51 +0100 (CET)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiYY-0001gY-M0
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:41:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1nCiPc-0006Ay-KW; Wed, 26 Jan 2022 08:32:37 -0500
Received: from mail-out04.uio.no ([129.240.10.76]:52737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1nCiPQ-0006Nw-Ev; Wed, 26 Jan 2022 08:32:33 -0500
Received: from mail-mx10.uio.no ([129.240.10.27])
 by mail-out04.uio.no with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <knuto@ifi.uio.no>)
 id 1nCiP7-002FIb-SC; Wed, 26 Jan 2022 14:32:05 +0100
Received: from 108.84-234-134.customer.lyse.net ([84.234.134.108]
 helo=[172.25.2.5])
 by mail-mx10.uio.no with esmtpsa (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 user knuto (Exim 4.94.2) (envelope-from <knuto@ifi.uio.no>)
 id 1nCiP6-000ADj-VM; Wed, 26 Jan 2022 14:32:05 +0100
Message-ID: <ebbd32070c27ed088b54ddf2c35486d86e461f47.camel@ifi.uio.no>
Subject: Re: [PATCH v3 01/15] pcie: Add support for Single Root I/O
 Virtualization (SR/IOV)
From: Knut Omang <knuto@ifi.uio.no>
To: =?UTF-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 26 Jan 2022 14:32:04 +0100
In-Reply-To: <20220126132320.GA24682@lgieryk-VirtualBox>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
 <20211221143246.2052050-2-lukasz.maniak@linux.intel.com>
 <20220106050426-mutt-send-email-mst@kernel.org>
 <20220126132320.GA24682@lgieryk-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-UiO-SPF-Received: Received-SPF: neutral (mail-mx10.uio.no: 84.234.134.108 is
 neither permitted nor denied by domain of ifi.uio.no)
 client-ip=84.234.134.108; envelope-from=knuto@ifi.uio.no; helo=[172.25.2.5]; 
X-UiO-Spam-info: not spam, SpamAssassin (score=-5.0, required=5.0,
 autolearn=disabled, TVD_RCVD_IP=0.001, UIO_MAIL_IS_INTERNAL=-5)
X-UiO-Scanned: AB60454690488531BDE68BC184608335379B27CE
X-UiOonly: D67D0E6EC97A914E6438BBD42B904BC248B4558B
Received-SPF: pass client-ip=129.240.10.76; envelope-from=knuto@ifi.uio.no;
 helo=mail-out04.uio.no
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: qemu-block@nongnu.org, Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-01-26 at 14:23 +0100, Łukasz Gieryk wrote:
> I'm sorry for the delayed response. We (I and the other Lukasz) somehow
> had hoped that Knut, the original author of this patch, would have
> responded.

Yes, sorry - this one flushed past me here for some reason,

> 
> Let me address your questions, up to my best knowledge.
>   
> > > -static pcibus_t pci_bar_address(PCIDevice *d,
> > > -                                int reg, uint8_t type, pcibus_t size)
> > > +static pcibus_t pci_config_get_bar_addr(PCIDevice *d, int reg,
> > > +                                        uint8_t type, pcibus_t size)
> > > +{
> > > +    pcibus_t new_addr;
> > > +    if (!pci_is_vf(d)) {
> > > +        int bar = pci_bar(d, reg);
> > > +        if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > > +            new_addr = pci_get_quad(d->config + bar);
> > > +        } else {
> > > +            new_addr = pci_get_long(d->config + bar);
> > > +        }
> > > +    } else {
> > > +        PCIDevice *pf = d->exp.sriov_vf.pf;
> > > +        uint16_t sriov_cap = pf->exp.sriov_cap;
> > > +        int bar = sriov_cap + PCI_SRIOV_BAR + reg * 4;
> > > +        uint16_t vf_offset = pci_get_word(pf->config + sriov_cap +
> > > PCI_SRIOV_VF_OFFSET);
> > > +        uint16_t vf_stride = pci_get_word(pf->config + sriov_cap +
> > > PCI_SRIOV_VF_STRIDE);
> > > +        uint32_t vf_num = (d->devfn - (pf->devfn + vf_offset)) / vf_stride;
> > > +
> > > +        if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > > +            new_addr = pci_get_quad(pf->config + bar);
> > > +        } else {
> > > +            new_addr = pci_get_long(pf->config + bar);
> > > +        }
> > > +        new_addr += vf_num * size;
> > > +    }
> > > +    if (reg != PCI_ROM_SLOT) {
> > > +        /* Preserve the rom enable bit */
> > > +        new_addr &= ~(size - 1);
> > 
> > This comment puzzles me. How does clearing low bits preserve
> > any bits? Looks like this will clear low bits if any.
> > 
> 
> I think the comment applies to (reg != PCI_ROM_SLOT), i.e., the bits are
> cleared for BARs, but not for expansion ROM. I agree the placement of this
> comment is slightly misleading. We will move it up and rephrase slightly.

I agree - it's maybe better to just put the comment above the if(...) 
other than that I believe it is correct.

Knut

>  
> > > +pcibus_t pci_bar_address(PCIDevice *d,
> > > +                         int reg, uint8_t type, pcibus_t size)
> > >   {
> > >       pcibus_t new_addr, last_addr;
> > > -    int bar = pci_bar(d, reg);
> > >       uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
> > >       Object *machine = qdev_get_machine();
> > >       ObjectClass *oc = object_get_class(machine);
> > > @@ -1309,7 +1363,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
> > >           if (!(cmd & PCI_COMMAND_IO)) {
> > >               return PCI_BAR_UNMAPPED;
> > >           }
> > > -        new_addr = pci_get_long(d->config + bar) & ~(size - 1);
> > > +        new_addr = pci_config_get_bar_addr(d, reg, type, size);
> > >           last_addr = new_addr + size - 1;
> > >           /* Check if 32 bit BAR wraps around explicitly.
> > >            * TODO: make priorities correct and remove this work around.
> > > @@ -1324,11 +1378,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
> > >       if (!(cmd & PCI_COMMAND_MEMORY)) {
> > >           return PCI_BAR_UNMAPPED;
> > >       }
> > > -    if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > > -        new_addr = pci_get_quad(d->config + bar);
> > > -    } else {
> > > -        new_addr = pci_get_long(d->config + bar);
> > > -    }
> > > +    new_addr = pci_config_get_bar_addr(d, reg, type, size);
> > >       /* the ROM slot has a specific enable bit */
> > >       if (reg == PCI_ROM_SLOT && !(new_addr & PCI_ROM_ADDRESS_ENABLE)) {
> > 
> > And in fact here we check the low bit and handle it specially.
> 
> The code seems correct for me. The bit is preserved for ROM case.
> 
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index d7d73a31e4..182a225054 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -446,6 +446,11 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev,
> > > DeviceState *dev,
> > >       PCIDevice *pci_dev = PCI_DEVICE(dev);
> > >       uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
> > >   
> > > +    if(pci_is_vf(pci_dev)) {
> > > +        /* We don't want to change any state in hotplug_dev for SR/IOV virtual
> > > functions */
> > > +        return;
> > > +    }
> > > +
> > 
> > Coding style violation here.  And pls document the why not the what.
> > E.g. IIRC the reason is that VFs don't have an express capability,
> > right?
> 
> I think the reason is that virtual functions don’t exist physically, so
> they cannot be individually disconnected. Only PF should respond to
> hotplug events, implicitly disconnecting (thus: destroying) all child
> VFs.
> 
> Anyway, we will update this comment to state *why* and add the missing
> space.
> 
> V4 with the mentioned changes will happen really soon.
> 



