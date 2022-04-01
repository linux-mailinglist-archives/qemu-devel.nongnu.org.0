Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921194EE5E1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:04:03 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na6du-0002W0-Df
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:04:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benh@kernel.crashing.org>)
 id 1na6cn-0001Hq-TA; Thu, 31 Mar 2022 22:02:53 -0400
Received: from gate.crashing.org ([63.228.1.57]:33285)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <benh@kernel.crashing.org>)
 id 1na6ck-000120-KB; Thu, 31 Mar 2022 22:02:53 -0400
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2311xULh000950;
 Thu, 31 Mar 2022 20:59:31 -0500
Message-ID: <5b581691e0063d831649b4a6e36f07ef00e42861.camel@kernel.crashing.org>
Subject: Re: [PULL 19/35] ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Peter Maydell <peter.maydell@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>
Date: Fri, 01 Apr 2022 12:59:30 +1100
In-Reply-To: <CAFEAcA-_KiR1ZVPu3auXkTE3CtayyfPwT+0sd2y+X_5xOdGk_w@mail.gmail.com>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
 <20200203061123.59150-20-david@gibson.dropbear.id.au>
 <CAFEAcA-_KiR1ZVPu3auXkTE3CtayyfPwT+0sd2y+X_5xOdGk_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.228.1.57;
 envelope-from=benh@kernel.crashing.org; helo=gate.crashing.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-03-31 at 18:51 +0100, Peter Maydell wrote:
> 
> Hi; Coverity has just spotted an error in this old change
> (CID 1487176):

Oh my this is old ... I don't work for IBM anymore but I found the
relevant doc here: 
https://wiki.raptorcs.com/w/images/a/a5/POWER9_PCIe_controller_v11_27JUL2018_pub.pdf

So....

> > +++ b/hw/pci-host/pnv_phb4_pec.c
> > +static void pnv_pec_pci_xscom_write(void *opaque, hwaddr addr,
> > +                                    uint64_t val, unsigned size)
> > +{
> > +    PnvPhb4PecState *pec = PNV_PHB4_PEC(opaque);
> > +    uint32_t reg = addr >> 3;
> > +
> > +    switch (reg) {
> > +    case PEC_PCI_PBAIB_HW_CONFIG:
> > +    case PEC_PCI_PBAIB_READ_STK_OVR:
> > +        pec->pci_regs[reg] = val;
> 
> This write function switches on 'reg' and is written assuming
> that these PEC_PCI* constants are valid array indexes...

They should be but...

> > +        break;
> > +    default:
> > +        phb_pec_error(pec, "%s @0x%"HWADDR_PRIx"=%"PRIx64"\n",
> > __func__,
> > +                      addr, val);
> > +    }
> > +}
> > +++ b/include/hw/pci-host/pnv_phb4.h
> > +struct PnvPhb4PecStatimages/images/e {
> > +    DeviceState parent;
> > +
> > +    /* PEC number in chip */
> > +    uint32_t index;
> > +    uint32_t chip_id;images/
> > +
> > +    MemoryRegion *system_memory;
> > +
> > +    /* Nest registers, excuding per-stack */
> > +#define PHB4_PEC_NEST_REGS_COUNT    0xf
> > +    uint64_t nest_regs[PHB4_PEC_NEST_REGS_COUNT];
> > +    MemoryRegion nest_regs_mr;
> > +
> > +    /* PCI registers, excluding per-stack */
> > +#define PHB4_PEC_PCI_REGS_COUNT     0x2
> > +    uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
> > +    MemoryRegion pci_regs_mr;
> 
> ...but we define the pci_regs[] array in PnvPhb4PecState to
> have only 2 elements...
> 
> > +++ b/include/hw/pci-host/pnv_phb4_regs.h
> > +/* XSCOM PCI global registers */
> > +#define PEC_PCI_PBAIB_HW_CONFIG         0x00
> > +#define PEC_PCI_PBAIB_READ_STK_OVR      0x02
> 
> ...and here we define PEC_PCI_PBAIB_READ_STK_OVR as 2, which makes
> it not a valid index into pci_regs[].
> 
> 
> Which of these is wrong?

This one:

#define PHB4_PEC_PCI_REGS_COUNT     0x2

Should be

#define PHB4_PEC_PCI_REGS_COUNT     0x3

There is no register at 0x1 though.

Cheers,
Ben.


