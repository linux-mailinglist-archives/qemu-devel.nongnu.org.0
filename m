Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A407C49CB55
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:50:59 +0100 (CET)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCihO-0004F9-Ka
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:50:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nCiHA-0006hE-Ua; Wed, 26 Jan 2022 08:23:53 -0500
Received: from mga02.intel.com ([134.134.136.20]:58683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nCiH7-0004S4-Dx; Wed, 26 Jan 2022 08:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643203429; x=1674739429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4wcw5DXn/q/TS5MZaY9kRb/2sJ1D05ITvopz3+wvT64=;
 b=C7JVrLOzInHIMBfjmFwn7Qf2rku+Gcu6WuWWkWylEb0CP8EIz+0aO5Eb
 3qQ1vc47KT2HNil6fNfyY0Ev3Agv9KoOnyElkWZrf0vrC4PJI5BGCS/JF
 rXcMcK5lAB07iuhyE/IZOHq14z2Aw9NiN0dE2kGkuW0ln7UtFc2civ3lv
 F22nCi2PjcRmdOu8ZWKH42vh9ingJBLB+lgw+FSWFveiDTw0treFDt630
 RVeYtHxFy16nDxiH89h/NnrvyEfJZfO2wH7zLguC9u7ROFUe+aa6YIS/3
 jA2Q+Q8YIj1T53cgAF378TJq37nKxLdfp526IJHWyYYKjmCzDoJhXw2R6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="233922669"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="233922669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:23:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674354194"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.54.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:23:41 -0800
Date: Wed, 26 Jan 2022 14:23:35 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 01/15] pcie: Add support for Single Root I/O
 Virtualization (SR/IOV)
Message-ID: <20220126132320.GA24682@lgieryk-VirtualBox>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
 <20211221143246.2052050-2-lukasz.maniak@linux.intel.com>
 <20220106050426-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220106050426-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Klaus Jensen <its@irrelevant.dk>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm sorry for the delayed response. We (I and the other Lukasz) somehow
had hoped that Knut, the original author of this patch, would have
responded.

Let me address your questions, up to my best knowledge.
  
> > -static pcibus_t pci_bar_address(PCIDevice *d,
> > -                                int reg, uint8_t type, pcibus_t size)
> > +static pcibus_t pci_config_get_bar_addr(PCIDevice *d, int reg,
> > +                                        uint8_t type, pcibus_t size)
> > +{
> > +    pcibus_t new_addr;
> > +    if (!pci_is_vf(d)) {
> > +        int bar = pci_bar(d, reg);
> > +        if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > +            new_addr = pci_get_quad(d->config + bar);
> > +        } else {
> > +            new_addr = pci_get_long(d->config + bar);
> > +        }
> > +    } else {
> > +        PCIDevice *pf = d->exp.sriov_vf.pf;
> > +        uint16_t sriov_cap = pf->exp.sriov_cap;
> > +        int bar = sriov_cap + PCI_SRIOV_BAR + reg * 4;
> > +        uint16_t vf_offset = pci_get_word(pf->config + sriov_cap + PCI_SRIOV_VF_OFFSET);
> > +        uint16_t vf_stride = pci_get_word(pf->config + sriov_cap + PCI_SRIOV_VF_STRIDE);
> > +        uint32_t vf_num = (d->devfn - (pf->devfn + vf_offset)) / vf_stride;
> > +
> > +        if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > +            new_addr = pci_get_quad(pf->config + bar);
> > +        } else {
> > +            new_addr = pci_get_long(pf->config + bar);
> > +        }
> > +        new_addr += vf_num * size;
> > +    }
> > +    if (reg != PCI_ROM_SLOT) {
> > +        /* Preserve the rom enable bit */
> > +        new_addr &= ~(size - 1);
> 
> This comment puzzles me. How does clearing low bits preserve
> any bits? Looks like this will clear low bits if any.
> 

I think the comment applies to (reg != PCI_ROM_SLOT), i.e., the bits are
cleared for BARs, but not for expansion ROM. I agree the placement of this
comment is slightly misleading. We will move it up and rephrase slightly.
 
> > +pcibus_t pci_bar_address(PCIDevice *d,
> > +                         int reg, uint8_t type, pcibus_t size)
> >  {
> >      pcibus_t new_addr, last_addr;
> > -    int bar = pci_bar(d, reg);
> >      uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
> >      Object *machine = qdev_get_machine();
> >      ObjectClass *oc = object_get_class(machine);
> > @@ -1309,7 +1363,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
> >          if (!(cmd & PCI_COMMAND_IO)) {
> >              return PCI_BAR_UNMAPPED;
> >          }
> > -        new_addr = pci_get_long(d->config + bar) & ~(size - 1);
> > +        new_addr = pci_config_get_bar_addr(d, reg, type, size);
> >          last_addr = new_addr + size - 1;
> >          /* Check if 32 bit BAR wraps around explicitly.
> >           * TODO: make priorities correct and remove this work around.
> > @@ -1324,11 +1378,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
> >      if (!(cmd & PCI_COMMAND_MEMORY)) {
> >          return PCI_BAR_UNMAPPED;
> >      }
> > -    if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > -        new_addr = pci_get_quad(d->config + bar);
> > -    } else {
> > -        new_addr = pci_get_long(d->config + bar);
> > -    }
> > +    new_addr = pci_config_get_bar_addr(d, reg, type, size);
> >      /* the ROM slot has a specific enable bit */
> >      if (reg == PCI_ROM_SLOT && !(new_addr & PCI_ROM_ADDRESS_ENABLE)) {
> 
> And in fact here we check the low bit and handle it specially.

The code seems correct for me. The bit is preserved for ROM case.

> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index d7d73a31e4..182a225054 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -446,6 +446,11 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> >      PCIDevice *pci_dev = PCI_DEVICE(dev);
> >      uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
> >  
> > +    if(pci_is_vf(pci_dev)) {
> > +        /* We don't want to change any state in hotplug_dev for SR/IOV virtual functions */
> > +        return;
> > +    }
> > +
> 
> Coding style violation here.  And pls document the why not the what.
> E.g. IIRC the reason is that VFs don't have an express capability,
> right?

I think the reason is that virtual functions don’t exist physically, so
they cannot be individually disconnected. Only PF should respond to
hotplug events, implicitly disconnecting (thus: destroying) all child
VFs.

Anyway, we will update this comment to state *why* and add the missing
space.

V4 with the mentioned changes will happen really soon.


