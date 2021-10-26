Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CCE43B4A6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:46:35 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNij-0004C2-RX
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mfNgs-0002sk-3m; Tue, 26 Oct 2021 10:44:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:26282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mfNgp-000460-Lq; Tue, 26 Oct 2021 10:44:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="229874589"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="229874589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 07:38:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486212307"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 07:38:07 -0700
Date: Tue, 26 Oct 2021 16:36:59 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 01/15] pcie: Set default and supported MaxReadReq to 512
Message-ID: <20211026143659.GB3331@lmaniak-dev.igk.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-2-lukasz.maniak@linux.intel.com>
 <20211007181056-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007181056-mutt-send-email-mst@kernel.org>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Knut Omang <knut.omang@oracle.com>, qemu-devel@nongnu.org,
 Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 06:12:41PM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 07, 2021 at 06:23:52PM +0200, Lukasz Maniak wrote:
> > From: Knut Omang <knut.omang@oracle.com>
> > 
> > Make the default PCI Express Capability for PCIe devices set
> > MaxReadReq to 512.
> 
> code says 256
> 
> > Tyipcal modern devices people would want to
> 
> 
> typo
> 
> > emulate or simulate would want this. The previous value would
> > cause warnings from the root port driver on some kernels.
> 
> 
> which specifically?
> 
> > 
> > Signed-off-by: Knut Omang <knuto@ifi.uio.no>
> 
> we can't make changes like this unconditionally, this will
> break migration across versions.
> Pls tie this to a machine version.
> 
> Thanks!
> > ---
> >  hw/pci/pcie.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 6e95d82903..c1a12f3744 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -62,8 +62,9 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t version)
> >       * Functions conforming to the ECN, PCI Express Base
> >       * Specification, Revision 1.1., or subsequent PCI Express Base
> >       * Specification revisions.
> > +     *  + set max payload size to 256, which seems to be a common value
> >       */
> > -    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER);
> > +    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER | (0x1 & PCI_EXP_DEVCAP_PAYLOAD));
> >  
> >      pci_set_long(exp_cap + PCI_EXP_LNKCAP,
> >                   (port << PCI_EXP_LNKCAP_PN_SHIFT) |
> > @@ -179,6 +180,8 @@ int pcie_cap_init(PCIDevice *dev, uint8_t offset,
> >      pci_set_long(exp_cap + PCI_EXP_DEVCAP2,
> >                   PCI_EXP_DEVCAP2_EFF | PCI_EXP_DEVCAP2_EETLPP);
> >  
> > +    pci_set_word(exp_cap + PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_READRQ_256B);
> > +
> >      pci_set_word(dev->wmask + pos + PCI_EXP_DEVCTL2, PCI_EXP_DEVCTL2_EETLPPB);
> >  
> >      if (dev->cap_present & QEMU_PCIE_EXTCAP_INIT) {
> > -- 
> > 2.25.1
> 

Hi Michael,

The reason Knut keeps rebasing this fix along with SR-IOV patch is not
clear for us.

Since we have tested the NVMe device without this fix and did not notice
any issues mentioned by Knut on kernel 5.4.0, we decided to drop it for
v2.

However, I have posted your comments to this patch on Knut's github so
they can be addressed in case Knut decides to resubmit it later though.

Thanks,
Lukasz

