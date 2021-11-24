Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44445CCAC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:02:36 +0100 (CET)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxXP-0002A4-0k
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:02:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mpxJP-0006M2-FX; Wed, 24 Nov 2021 13:48:07 -0500
Received: from mga07.intel.com ([134.134.136.100]:44071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mpxJN-00008y-1Q; Wed, 24 Nov 2021 13:48:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="298752681"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; d="scan'208";a="298752681"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 10:48:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; d="scan'208";a="509986910"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 10:47:57 -0800
Date: Wed, 24 Nov 2021 19:46:38 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Naveen <naveen.n1@samsung.com>
Subject: Re: [RFC PATCH v3] hw/nvme:Adding Support for namespace management
Message-ID: <20211124184638.GB1012589@lmaniak-dev.igk.intel.com>
References: <CGME20211110112647epcas5p1946f1543392f3b9563d6766fcda5c392@epcas5p1.samsung.com>
 <1636543589-32333-1-git-send-email-naveen.n1@samsung.com>
 <20211123101126.GA1012589@lmaniak-dev.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123101126.GA1012589@lmaniak-dev.igk.intel.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 d.palani@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kbusch@kernel.org, anshul@samsung.com, stefanha@redhat.com, its@irrelevant.dk,
 raphel.david@samsung.com, p.kalghatgi@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 11:11:37AM +0100, Lukasz Maniak wrote:
> On Wed, Nov 10, 2021 at 04:56:29PM +0530, Naveen wrote:
> > From: Naveen Nagar <naveen.n1@samsung.com>
> > 
> > This patch supports namespace management : create and delete operations
> > This patch has been tested with the following command and size of image
> > file for unallocated namespaces is taken as 0GB. ns_create will look into
> > the list of unallocated namespaces and it will initialize the same and 
> > return the nsid of the same. A new mandatory field has been added called
> > tnvmcap and we have ensured that the total capacity of namespace created
> > does not exceed tnvmcap
> > 
> > -device nvme-subsys,id=subsys0,tnvmcap=8
> > -device nvme,serial=foo,id=nvme0,subsys=subsys0
> > -device nvme,serial=bar,id=nvme1,subsys=subsys0
> > 
> > -drive id=ns1,file=ns1.img,if=none
> > -device nvme-ns,drive=ns1,bus=nvme0,nsid=1,zoned=false,shared=true
> > -drive id=ns2,file=ns2.img,if=none
> > -device nvme-ns,drive=ns2,bus=nvme0,nsid=2,zoned=false,shared=true
> > -drive id=ns3,file=ns3.img,if=none
> > -device nvme-ns,drive=ns3,bus=nvme0,nsid=3,zoned=false,shared=true
> > -drive id=ns4,file=ns4.img,if=none
> > -device nvme-ns,drive=ns4,bus=nvme0,nsid=4,zoned=false,shared=true
> > 
> > Please review and suggest if any changes are required.
> > 
> > Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
> > 
> > Since v2:
> > -Lukasz Maniak found a bug in namespace attachment and proposed 
> >  solution is added
> > 
> 
> Hi Naveen,
> 
> The current implementation is inconsistent and thus has a bug related to
> unvmcap support.
> 
> Namespaces are pre-allocated after boot, and the initial namespace size
> is the size of the associated blockdev. If the blockdevs are non-zero
> sized then the first deletion of the namespaces associated with them
> will increment unvmcap by their size. This will make unvmcap greater
> than tnvmcap.
> 
> While the easiest way would be to prohibit the use of non-zero sized
> blockdev with namespace management, doing so would limit the
> functionality of the namespaces itself, which we would like to avoid.
> 
> This fix below addresses issues related to unvmcap and non-zero block
> devices. The unvmcap value will be properly updated on both the first
> and subsequent controllers added to the subsystem regardless of the
> order in which nvme-ns is defined on the command line before or after
> the controller definition. Additionally, if the block device size of any
> namespace causes the unvmcap to be exceeded, an error will be returned
> at the namespace definition point.
> 
> The fix is based on v3 based on v6.1.0, as v3 does not apply to master.
> 
> ---
>  hw/nvme/ctrl.c |  7 +++++++
>  hw/nvme/ns.c   | 23 ++++++++++++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 63ea2fcb14..dc0ad4155b 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6594,6 +6594,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>      NvmeIdCtrl *id = &n->id_ctrl;
>      uint8_t *pci_conf = pci_dev->config;
>      uint64_t cap = ldq_le_p(&n->bar.cap);
> +    int i;
>  
>      id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
>      id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
> @@ -6672,6 +6673,12 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>          id->cmic |= NVME_CMIC_MULTI_CTRL;
>          id->tnvmcap = n->subsys->params.tnvmcap * GiB;
>          id->unvmcap = n->subsys->params.tnvmcap * GiB;
> +
> +        for (i = 0; i < ARRAY_SIZE(n->subsys->namespaces); i++) {
> +            if (n->subsys->namespaces[i]) {
> +                id->unvmcap -= le64_to_cpu(n->subsys->namespaces[i]->size);
> +            }
> +        }
>      }
>  
>      NVME_CAP_SET_MQES(cap, 0x7ff);
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index f62a695132..c87d7f5bd6 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -140,9 +140,12 @@ lbaf_found:
>      return 0;
>  }
>  
> -static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
> +static int nvme_ns_init_blk(NvmeNamespace *ns, NvmeSubsystem *subsys,
> +                            Error **errp)
>  {
>      bool read_only;
> +    NvmeCtrl *ctrl;
> +    int i;
>  
>      if (!blkconf_blocksizes(&ns->blkconf, errp)) {
>          return -1;
> @@ -164,6 +167,21 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
>          return -1;
>      }
>  
> +    if (subsys) {
> +        for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
> +            ctrl = nvme_subsys_ctrl(subsys, i);
> +
> +            if (ctrl) {
> +                if (ctrl->id_ctrl.unvmcap < le64_to_cpu(ns->size)) {
> +                    error_setg(errp, "blockdev size %ld exceeds subsystem's "
> +                                     "unallocated capacity", ns->size);
> +                } else {
> +                    ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
> +                }
> +            }
> +        }
> +    }
> +
>      return 0;
>  }
>  
> @@ -480,7 +498,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>          }
>      }
>  
> -    if (nvme_ns_init_blk(ns, errp)) {
> +    if (nvme_ns_init_blk(ns, subsys, errp)) {
>          return;
>      }
>  
> @@ -527,7 +545,6 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>  
>                  if (ctrl) {
>                      nvme_attach_ns(ctrl, ns);
> -                    ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
>                  }
>              }
>  
> -- 
> 2.25.1
> 

Fixing unvmcap support brought another concern to attention.

Here is another little patch on top of the previous one to truncate the
block device to 0 when the associated namespace is deleted.

Instead, it may fail to re-launch QEMU with the blockdevs from the
previous execution when the sum of the blockdev sizes after namespace
management exceeds unvmcap.

---
 hw/nvme/ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dc0ad4155b..f84f682d36 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5320,6 +5320,7 @@ static void nvme_namespace_delete(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
 {
     NvmeCtrl *ctrl;
     NvmeSubsystem *subsys = n->subsys;
+    int ret;
 
     subsys->namespaces[nsid] = NULL;
     QSLIST_INSERT_HEAD(&subsys->unallocated_namespaces, ns, entry);
@@ -5334,6 +5335,9 @@ static void nvme_namespace_delete(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
             nvme_ns_attr_changed_aer(ctrl, nsid);
         }
     }
+
+    ret = nvme_blk_truncate(ns->blkconf.blk, 0, NULL);
+    assert(!ret);
 }
 
 static uint16_t nvme_ns_management(NvmeCtrl *n, NvmeRequest *req)
-- 
2.25.1


