Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4C44349C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:36:04 +0100 (CET)
Received: from localhost ([::1]:42634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxha-0002PB-Uu
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mhxgS-0001ax-OX; Tue, 02 Nov 2021 13:34:52 -0400
Received: from mga14.intel.com ([192.55.52.115]:22345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mhxgP-0006lw-UY; Tue, 02 Nov 2021 13:34:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231583560"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="231583560"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 10:34:45 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="638272943"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 10:34:43 -0700
Date: Tue, 2 Nov 2021 18:33:31 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <20211102173244.GA3643516@lmaniak-dev.igk.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
 <YYFMK3z1iAY52hp6@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYFMK3z1iAY52hp6@apples.localdomain>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 02, 2021 at 03:33:15PM +0100, Klaus Jensen wrote:
> On Oct  7 18:23, Lukasz Maniak wrote:
> > This patch implements initial support for Single Root I/O Virtualization
> > on an NVMe device.
> > 
> > Essentially, it allows to define the maximum number of virtual functions
> > supported by the NVMe controller via sriov_max_vfs parameter.
> > 
> > Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
> > capability by a physical controller and ARI capability by both the
> > physical and virtual function devices.
> > 
> > NVMe controllers created via virtual functions mirror functionally
> > the physical controller, which may not entirely be the case, thus
> > consideration would be needed on the way to limit the capabilities of
> > the VF.
> > 
> > NVMe subsystem is required for the use of SR-IOV.
> > 
> > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> > ---
> >  hw/nvme/ctrl.c           | 74 ++++++++++++++++++++++++++++++++++++++--
> >  hw/nvme/nvme.h           |  1 +
> >  include/hw/pci/pci_ids.h |  1 +
> >  3 files changed, 73 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 6a571d18cf..ad79ff0c00 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -6361,8 +6406,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
> >                            n->reg_size);
> >      memory_region_add_subregion(&n->bar0, 0, &n->iomem);
> >  
> > -    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> > -                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > +    if (pci_is_vf(pci_dev)) {
> > +        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
> > +    } else {
> > +        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> > +                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > +    }
> 
> I assume that the assert we are seeing means that the pci_register_bars
> in nvme_init_cmb and nvme_init_pmr must be changed similarly to this.

Assert will only arise for CMB as VF params are initialized with PF
params.

@@ -6532,6 +6585,15 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
     Error *local_err = NULL;
+    NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
+
+    if (pci_is_vf(pci_dev)) {
+        /* VFs derive settings from the parent. PF's lifespan exceeds
+         * that of VF's, so it's safe to share params.serial.
+         */
+        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
+        n->subsys = pn->subsys;
+    }
 
     nvme_check_constraints(n, &local_err);
     if (local_err) {

The following simple fix will both fix assert and also allow
each VF to have its own CMB of the size defined for PF.

---
 hw/nvme/ctrl.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 19b32dd4da..99daa6290c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6837,10 +6837,15 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
     n->cmb.buf = g_malloc0(cmb_size);
     memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
                           "nvme-cmb", cmb_size);
-    pci_register_bar(pci_dev, NVME_CMB_BIR,
-                     PCI_BASE_ADDRESS_SPACE_MEMORY |
-                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
-                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
+
+    if (pci_is_vf(pci_dev)) {
+        pcie_sriov_vf_register_bar(pci_dev, NVME_CMB_BIR, &n->cmb.mem);
+    } else {
+        pci_register_bar(pci_dev, NVME_CMB_BIR,
+                        PCI_BASE_ADDRESS_SPACE_MEMORY |
+                        PCI_BASE_ADDRESS_MEM_TYPE_64 |
+                        PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
+    }
 
     NVME_CAP_SET_CMBS(cap, 1);
     stq_le_p(&n->bar.cap, cap);

As for PMR, it is currently only available on PF, as only PF is capable
of specifying the memory-backend-file object to use with PMR.
Otherwise, either VFs would have to share the PMR with its PF, or there
would be a requirement to define a memory-backend-file object for each VF.

