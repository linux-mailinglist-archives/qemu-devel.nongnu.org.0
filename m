Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D743647F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:38:46 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZDR-0002iI-9l
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mdZ9M-00076q-35; Thu, 21 Oct 2021 10:34:32 -0400
Received: from mga07.intel.com ([134.134.136.100]:25576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mdZ9J-0003Xb-0Z; Thu, 21 Oct 2021 10:34:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292513212"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="292513212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:34:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="495174063"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:34:23 -0700
Date: Thu, 21 Oct 2021 16:33:13 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <20211021143313.GA3331@lmaniak-dev.igk.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
 <YXBpA7ydMl9//wZ1@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXBpA7ydMl9//wZ1@apples.localdomain>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 09:07:47PM +0200, Klaus Jensen wrote:
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
> > @@ -35,6 +35,7 @@
> >   *              mdts=<N[optional]>,vsl=<N[optional]>, \
> >   *              zoned.zasl=<N[optional]>, \
> >   *              zoned.auto_transition=<on|off[optional]>, \
> > + *              sriov_max_vfs=<N[optional]> \
> >   *              subsys=<subsys_id>
> >   *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
> >   *              zoned=<true|false[optional]>, \
> > @@ -106,6 +107,12 @@
> >   *   transitioned to zone state closed for resource management purposes.
> >   *   Defaults to 'on'.
> >   *
> > + * - `sriov_max_vfs`
> > + *   Indicates the maximum number of PCIe virtual functions supported
> > + *   by the controller. The default value is 0. Specifying a non-zero value
> > + *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
> > + *   Virtual function controllers will not report SR-IOV capability.
> > + *
> >   * nvme namespace device parameters
> >   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   * - `shared`
> > @@ -160,6 +167,7 @@
> >  #include "sysemu/block-backend.h"
> >  #include "sysemu/hostmem.h"
> >  #include "hw/pci/msix.h"
> > +#include "hw/pci/pcie_sriov.h"
> >  #include "migration/vmstate.h"
> >  
> >  #include "nvme.h"
> > @@ -175,6 +183,9 @@
> >  #define NVME_TEMPERATURE_CRITICAL 0x175
> >  #define NVME_NUM_FW_SLOTS 1
> >  #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
> > +#define NVME_MAX_VFS 127
> > +#define NVME_VF_OFFSET 0x1
> > +#define NVME_VF_STRIDE 1
> >  
> >  #define NVME_GUEST_ERR(trace, fmt, ...) \
> >      do { \
> > @@ -5583,6 +5594,10 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
> >          g_free(event);
> >      }
> >  
> > +    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
> > +        pcie_sriov_pf_disable_vfs(&n->parent_obj);
> > +    }
> > +
> >      n->aer_queued = 0;
> >      n->outstanding_aers = 0;
> >      n->qs_created = false;
> > @@ -6264,6 +6279,19 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
> >          error_setg(errp, "vsl must be non-zero");
> >          return;
> >      }
> > +
> > +    if (params->sriov_max_vfs) {
> > +        if (!n->subsys) {
> > +            error_setg(errp, "subsystem is required for the use of SR-IOV");
> > +            return;
> > +        }
> > +
> > +        if (params->sriov_max_vfs > NVME_MAX_VFS) {
> > +            error_setg(errp, "sriov_max_vfs must be between 0 and %d",
> > +                       NVME_MAX_VFS);
> > +            return;
> > +        }
> > +    }
> >  }
> >  
> >  static void nvme_init_state(NvmeCtrl *n)
> > @@ -6321,6 +6349,20 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
> >      memory_region_set_enabled(&n->pmr.dev->mr, false);
> >  }
> >  
> > +static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
> > +                            uint64_t bar_size)
> > +{
> > +    uint16_t vf_dev_id = n->params.use_intel_id ?
> > +                         PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
> > +
> > +    pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
> > +                       n->params.sriov_max_vfs, n->params.sriov_max_vfs,
> > +                       NVME_VF_OFFSET, NVME_VF_STRIDE, NULL);
> 
> Did you consider adding a new device for the virtual function device,
> "nvmevf"?
> 
> Down the road it might help with the variations in capabilities that you
> describe.

Hi Klaus,

A separate nvmevf device was actually the first approach I tried.
Well, it came down to copying the nvme device functions in favor of a
few changes that can be covered with conditions.

As for limiting VF capabilities, the problem comes down to a nice
restriction on supported command set by the VF controller. Thus, using
nvmevf for this purpose sounds like an overkill.

Concerning restriction on the supported command set, an actual real
device would reduce VF's ability to use namespace attachment, namespace
management, virtualization enhancements, and corresponding identify
commands. However, since implementing secure virtualization in QEMU
would be complex and is not required it can be skipped for now.

Kind regards,
Lukasz

