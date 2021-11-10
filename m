Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C344C284
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:51:06 +0100 (CET)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mko0G-00076S-Oh
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:51:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mknsq-00050v-Ux; Wed, 10 Nov 2021 08:43:25 -0500
Received: from mga09.intel.com ([134.134.136.24]:15048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mknsm-00041j-Dh; Wed, 10 Nov 2021 08:43:24 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232513148"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232513148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:43:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="492100439"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:43:15 -0800
Date: Wed, 10 Nov 2021 14:42:01 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <20211110134201.GA3175@lmaniak-dev.igk.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
 <YYFMK3z1iAY52hp6@apples.localdomain>
 <20211102173244.GA3643516@lmaniak-dev.igk.intel.com>
 <20211104143045.GB3643516@lmaniak-dev.igk.intel.com>
 <YYjYO/M/bjk2WpUe@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYjYO/M/bjk2WpUe@apples.localdomain>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 08:56:43AM +0100, Klaus Jensen wrote:
> On Nov  4 15:30, Lukasz Maniak wrote:
> > On Tue, Nov 02, 2021 at 06:33:31PM +0100, Lukasz Maniak wrote:
> > > On Tue, Nov 02, 2021 at 03:33:15PM +0100, Klaus Jensen wrote:
> > > > On Oct  7 18:23, Lukasz Maniak wrote:
> > > > > This patch implements initial support for Single Root I/O Virtualization
> > > > > on an NVMe device.
> > > > > 
> > > > > Essentially, it allows to define the maximum number of virtual functions
> > > > > supported by the NVMe controller via sriov_max_vfs parameter.
> > > > > 
> > > > > Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
> > > > > capability by a physical controller and ARI capability by both the
> > > > > physical and virtual function devices.
> > > > > 
> > > > > NVMe controllers created via virtual functions mirror functionally
> > > > > the physical controller, which may not entirely be the case, thus
> > > > > consideration would be needed on the way to limit the capabilities of
> > > > > the VF.
> > > > > 
> > > > > NVMe subsystem is required for the use of SR-IOV.
> > > > > 
> > > > > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> > > > > ---
> > > > >  hw/nvme/ctrl.c           | 74 ++++++++++++++++++++++++++++++++++++++--
> > > > >  hw/nvme/nvme.h           |  1 +
> > > > >  include/hw/pci/pci_ids.h |  1 +
> > > > >  3 files changed, 73 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > > index 6a571d18cf..ad79ff0c00 100644
> > > > > --- a/hw/nvme/ctrl.c
> > > > > +++ b/hw/nvme/ctrl.c
> > > > > @@ -6361,8 +6406,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
> > > > >                            n->reg_size);
> > > > >      memory_region_add_subregion(&n->bar0, 0, &n->iomem);
> > > > >  
> > > > > -    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > > > -                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > > > > +    if (pci_is_vf(pci_dev)) {
> > > > > +        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
> > > > > +    } else {
> > > > > +        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > > > +                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > > > > +    }
> > > > 
> > > > I assume that the assert we are seeing means that the pci_register_bars
> > > > in nvme_init_cmb and nvme_init_pmr must be changed similarly to this.
> > > 
> > > Assert will only arise for CMB as VF params are initialized with PF
> > > params.
> > > 
> > > @@ -6532,6 +6585,15 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> > >      NvmeCtrl *n = NVME(pci_dev);
> > >      NvmeNamespace *ns;
> > >      Error *local_err = NULL;
> > > +    NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
> > > +
> > > +    if (pci_is_vf(pci_dev)) {
> > > +        /* VFs derive settings from the parent. PF's lifespan exceeds
> > > +         * that of VF's, so it's safe to share params.serial.
> > > +         */
> > > +        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
> > > +        n->subsys = pn->subsys;
> > > +    }
> > >  
> > >      nvme_check_constraints(n, &local_err);
> > >      if (local_err) {
> > > 
> > > The following simple fix will both fix assert and also allow
> > > each VF to have its own CMB of the size defined for PF.
> > > 
> > > ---
> > >  hw/nvme/ctrl.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > index 19b32dd4da..99daa6290c 100644
> > > --- a/hw/nvme/ctrl.c
> > > +++ b/hw/nvme/ctrl.c
> > > @@ -6837,10 +6837,15 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
> > >      n->cmb.buf = g_malloc0(cmb_size);
> > >      memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
> > >                            "nvme-cmb", cmb_size);
> > > -    pci_register_bar(pci_dev, NVME_CMB_BIR,
> > > -                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > -                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
> > > -                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
> > > +
> > > +    if (pci_is_vf(pci_dev)) {
> > > +        pcie_sriov_vf_register_bar(pci_dev, NVME_CMB_BIR, &n->cmb.mem);
> > > +    } else {
> > > +        pci_register_bar(pci_dev, NVME_CMB_BIR,
> > > +                        PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > +                        PCI_BASE_ADDRESS_MEM_TYPE_64 |
> > > +                        PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
> > > +    }
> > >  
> > >      NVME_CAP_SET_CMBS(cap, 1);
> > >      stq_le_p(&n->bar.cap, cap);
> > > 
> > > As for PMR, it is currently only available on PF, as only PF is capable
> > > of specifying the memory-backend-file object to use with PMR.
> > > Otherwise, either VFs would have to share the PMR with its PF, or there
> > > would be a requirement to define a memory-backend-file object for each VF.
> > 
> > Hi Klaus,
> > 
> > After some discussion, we decided to prohibit in V2 the use of CMB and
> > PMR in combination with SR-IOV.
> > 
> > While the implementation of CMB with SR-IOV is relatively
> > straightforward, PMR is not. We are committed to consistency in CMB and
> > PMR design in association with SR-IOV. So we considered it best to
> > disable both features and implement them in separate patches.
> > 
> 
> I am completely fine with that. However, since we are copying the
> parameters verbatimly, it would nice that the `info qtree` would reflect
> this difference (that the parameters, say, cmb_size_mb is 0 for the
> virtual controllers).
> 

Hi Klaus,

Literal copying will still be correct and there will be no difference
between PF and VF since by prohibit we mean to disable interaction
between SR-IOV functionality and CMB/PMR for PF as well.

if (params->sriov_max_vfs) {
    if (!n->subsys) {
        error_setg(errp, "subsystem is required for the use of SR-IOV");
        return;
    }

    if (params->sriov_max_vfs > NVME_MAX_VFS) {
        error_setg(errp, "sriov_max_vfs must be between 0 and %d",
                   NVME_MAX_VFS);
        return;
    }

    if (params->cmb_size_mb) {
        error_setg(errp, "CMB is not supported with SR-IOV");
        return;
    }

    if (n->pmr.dev) {
        error_setg(errp, "PMR is not supported with SR-IOV");
        return;
    }

Regards,
Lukasz

