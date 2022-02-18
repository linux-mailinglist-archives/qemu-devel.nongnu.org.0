Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB64BBAD7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 15:43:42 +0100 (CET)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4U1-0006W9-51
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 09:43:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nL4Q8-0004Gj-U3; Fri, 18 Feb 2022 09:39:41 -0500
Received: from mga17.intel.com ([192.55.52.151]:30454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nL4Q6-0004r3-Ae; Fri, 18 Feb 2022 09:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645195178; x=1676731178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W1SsFGjXqV3RgiImiLnBWH1GHXW7hlrPrD7T1XIzoC8=;
 b=nAgj6XfeXNyshKCaPZJQXzt+sCfvSLZOoP814IIpjerTneo0W66qGSse
 wdGMjDTsRxK+cccWsIZpcvSkvWJSL7jrU39DERD9vsvrJJEpguS31f3+K
 ftPoWfKhpcdr1/o5pwEJIInBD3Ft9pQrFZX3IMxVN2HnOOnEk2JpBxIK+
 xbdct/+JzZAaIa4WrQntopgr2seCunbTZV16S90D4Dfqs5MNBMB6HsJJt
 f29kuuatbjKeWPNN8Lok6fSAuvpK8ChJPDiz64T0gxQxq4JHCPxXbL45O
 A7u88mEXdg04VPa0IZ/dtvEHRwEv0B90acd8ercHHrFZZQgtCCAm51L27 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231771263"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="231771263"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 06:39:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="682526720"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 06:39:33 -0800
Date: Fri, 18 Feb 2022 15:37:54 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <20220218143754.GB1070598@lmaniak-dev.igk.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-13-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220217174504.1051716-13-lukasz.maniak@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:45:01PM +0100, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> With four new properties:
>  - sriov_v{i,q}_flexible,
>  - sriov_max_v{i,q}_per_vf,
> one can configure the number of available flexible resources, as well as
> the limits. The primary and secondary controller capability structures
> are initialized accordingly.
> 
> Since the number of available queues (interrupts) now varies between
> VF/PF, BAR size calculation is also adjusted.
> 
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c       | 142 ++++++++++++++++++++++++++++++++++++++++---
>  hw/nvme/nvme.h       |   4 ++
>  include/block/nvme.h |   5 ++
>  3 files changed, 144 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 73707565345..2a6a36e733d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -36,6 +36,10 @@
>   *              zoned.zasl=<N[optional]>, \
>   *              zoned.auto_transition=<on|off[optional]>, \
>   *              sriov_max_vfs=<N[optional]> \
> + *              sriov_vq_flexible=<N[optional]> \
> + *              sriov_vi_flexible=<N[optional]> \
> + *              sriov_max_vi_per_vf=<N[optional]> \
> + *              sriov_max_vq_per_vf=<N[optional]> \
>   *              subsys=<subsys_id>
>   *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
>   *              zoned=<true|false[optional]>, \
> @@ -113,6 +117,29 @@
>   *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
>   *   Virtual function controllers will not report SR-IOV capability.
>   *
> + *   NOTE: Single Root I/O Virtualization support is experimental.
> + *   All the related parameters may be subject to change.
> + *
> + * - `sriov_vq_flexible`
> + *   Indicates the total number of flexible queue resources assignable to all
> + *   the secondary controllers. Implicitly sets the number of primary
> + *   controller's private resources to `(max_ioqpairs - sriov_vq_flexible)`.
> + *
> + * - `sriov_vi_flexible`
> + *   Indicates the total number of flexible interrupt resources assignable to
> + *   all the secondary controllers. Implicitly sets the number of primary
> + *   controller's private resources to `(msix_qsize - sriov_vi_flexible)`.
> + *
> + * - `sriov_max_vi_per_vf`
> + *   Indicates the maximum number of virtual interrupt resources assignable
> + *   to a secondary controller. The default 0 resolves to
> + *   `(sriov_vi_flexible / sriov_max_vfs)`.
> + *
> + * - `sriov_max_vq_per_vf`
> + *   Indicates the maximum number of virtual queue resources assignable to
> + *   a secondary controller. The default 0 resolves to
> + *   `(sriov_vq_flexible / sriov_max_vfs)`.
> + *
>   * nvme namespace device parameters
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   * - `shared`
> @@ -184,6 +211,7 @@
>  #define NVME_NUM_FW_SLOTS 1
>  #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
>  #define NVME_MAX_VFS 127
> +#define NVME_VF_RES_GRANULARITY 1
>  #define NVME_VF_OFFSET 0x1
>  #define NVME_VF_STRIDE 1
>  
> @@ -6512,6 +6540,54 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>              error_setg(errp, "PMR is not supported with SR-IOV");
>              return;
>          }
> +
> +        if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
> +            error_setg(errp, "both sriov_vq_flexible and sriov_vi_flexible"
> +                       " must be set for the use of SR-IOV");
> +            return;
> +        }
> +
> +        if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
> +            error_setg(errp, "sriov_vq_flexible must be greater than or equal"
> +                       " to %d (sriov_max_vfs * 2)", params->sriov_max_vfs * 2);
> +            return;
> +        }
> +
> +        if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
> +            error_setg(errp, "sriov_vq_flexible - max_ioqpairs (PF-private"
After posting, we realized that the error string is confusing. This will
be fixed in v6.

> +                       " queue resources) must be greater than or equal to 2");
> +            return;
> +        }
> +
> +        if (params->sriov_vi_flexible < params->sriov_max_vfs) {
> +            error_setg(errp, "sriov_vi_flexible must be greater than or equal"
> +                       " to %d (sriov_max_vfs)", params->sriov_max_vfs);
> +            return;
> +        }
> +
> +        if (params->msix_qsize < params->sriov_vi_flexible + 1) {
> +            error_setg(errp, "sriov_vi_flexible - msix_qsize (PF-private"
Same here.

> +                       " interrupt resources) must be greater than or equal"
> +                       " to 1");
> +            return;
> +        }
> +
> +        if (params->sriov_max_vi_per_vf &&
> +            (params->sriov_max_vi_per_vf - 1) % NVME_VF_RES_GRANULARITY) {
> +            error_setg(errp, "sriov_max_vi_per_vf must meet:"
> +                       " (X - 1) %% %d == 0 and X >= 1",
> +                       NVME_VF_RES_GRANULARITY);
> +            return;
> +        }
> +
> +        if (params->sriov_max_vq_per_vf &&
> +            (params->sriov_max_vq_per_vf < 2 ||
> +             (params->sriov_max_vq_per_vf - 1) % NVME_VF_RES_GRANULARITY)) {
> +            error_setg(errp, "sriov_max_vq_per_vf must meet:"
> +                       " (X - 1) %% %d == 0 and X >= 2",
> +                       NVME_VF_RES_GRANULARITY);
> +            return;
> +        }
>      }
>  }
>  
> @@ -6520,10 +6596,19 @@ static void nvme_init_state(NvmeCtrl *n)
>      NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
>      NvmeSecCtrlList *list = &n->sec_ctrl_list;
>      NvmeSecCtrlEntry *sctrl;
> +    uint8_t max_vfs;
>      int i;
>  
> -    n->conf_ioqpairs = n->params.max_ioqpairs;
> -    n->conf_msix_qsize = n->params.msix_qsize;
> +    if (pci_is_vf(&n->parent_obj)) {
> +        sctrl = nvme_sctrl(n);
> +        max_vfs = 0;
> +        n->conf_ioqpairs = sctrl->nvq ? le16_to_cpu(sctrl->nvq) - 1 : 0;
> +        n->conf_msix_qsize = sctrl->nvi ? le16_to_cpu(sctrl->nvi) : 1;
> +    } else {
> +        max_vfs = n->params.sriov_max_vfs;
> +        n->conf_ioqpairs = n->params.max_ioqpairs;
> +        n->conf_msix_qsize = n->params.msix_qsize;
> +    }
>  
>      n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
>      n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
> @@ -6532,14 +6617,41 @@ static void nvme_init_state(NvmeCtrl *n)
>      n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>      n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
>  
> -    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
> -    for (i = 0; i < n->params.sriov_max_vfs; i++) {
> +    list->numcntl = cpu_to_le16(max_vfs);
> +    for (i = 0; i < max_vfs; i++) {
>          sctrl = &list->sec[i];
>          sctrl->pcid = cpu_to_le16(n->cntlid);
>          sctrl->vfn = cpu_to_le16(i + 1);
>      }
>  
>      cap->cntlid = cpu_to_le16(n->cntlid);
> +    cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
> +
> +    if (pci_is_vf(&n->parent_obj)) {
> +        cap->vqprt = cpu_to_le16(1 + n->conf_ioqpairs);
> +    } else {
> +        cap->vqprt = cpu_to_le16(1 + n->params.max_ioqpairs -
> +                                 n->params.sriov_vq_flexible);
> +        cap->vqfrt = cpu_to_le32(n->params.sriov_vq_flexible);
> +        cap->vqrfap = cap->vqfrt;
> +        cap->vqgran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
> +        cap->vqfrsm = n->params.sriov_max_vq_per_vf ?
> +                        cpu_to_le16(n->params.sriov_max_vq_per_vf) :
> +                        cap->vqfrt / MAX(max_vfs, 1);
> +    }
> +
> +    if (pci_is_vf(&n->parent_obj)) {
> +        cap->viprt = cpu_to_le16(n->conf_msix_qsize);
> +    } else {
> +        cap->viprt = cpu_to_le16(n->params.msix_qsize -
> +                                 n->params.sriov_vi_flexible);
> +        cap->vifrt = cpu_to_le32(n->params.sriov_vi_flexible);
> +        cap->virfap = cap->vifrt;
> +        cap->vigran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
> +        cap->vifrsm = n->params.sriov_max_vi_per_vf ?
> +                        cpu_to_le16(n->params.sriov_max_vi_per_vf) :
> +                        cap->vifrt / MAX(max_vfs, 1);
> +    }
>  }
>  
>  static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
> @@ -6612,11 +6724,14 @@ static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
>      return bar_size;
>  }
>  
> -static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
> -                            uint64_t bar_size)
> +static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
>  {
>      uint16_t vf_dev_id = n->params.use_intel_id ?
>                           PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
> +    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
> +    uint64_t bar_size = nvme_bar_size(le16_to_cpu(cap->vqfrsm),
> +                                      le16_to_cpu(cap->vifrsm),
> +                                      NULL, NULL);
>  
>      pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
>                         n->params.sriov_max_vfs, n->params.sriov_max_vfs,
> @@ -6714,7 +6829,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>      }
>  
>      if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
> -        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
> +        nvme_init_sriov(n, pci_dev, 0x120);
>      }
>  
>      return 0;
> @@ -6738,6 +6853,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>      NvmeIdCtrl *id = &n->id_ctrl;
>      uint8_t *pci_conf = pci_dev->config;
>      uint64_t cap = ldq_le_p(&n->bar.cap);
> +    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
>  
>      id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
>      id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
> @@ -6829,6 +6945,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>  
>      stl_le_p(&n->bar.vs, NVME_SPEC_VER);
>      n->bar.intmc = n->bar.intms = 0;
> +
> +    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
> +        stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
> +    }
>  }
>  
>  static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
> @@ -6969,6 +7089,14 @@ static Property nvme_props[] = {
>      DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>                       params.auto_transition_zones, true),
>      DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
> +    DEFINE_PROP_UINT16("sriov_vq_flexible", NvmeCtrl,
> +                       params.sriov_vq_flexible, 0),
> +    DEFINE_PROP_UINT16("sriov_vi_flexible", NvmeCtrl,
> +                       params.sriov_vi_flexible, 0),
> +    DEFINE_PROP_UINT8("sriov_max_vi_per_vf", NvmeCtrl,
> +                      params.sriov_max_vi_per_vf, 0),
> +    DEFINE_PROP_UINT8("sriov_max_vq_per_vf", NvmeCtrl,
> +                      params.sriov_max_vq_per_vf, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 86b5b321331..82f11bb08f0 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -407,6 +407,10 @@ typedef struct NvmeParams {
>      bool     auto_transition_zones;
>      bool     legacy_cmb;
>      uint8_t  sriov_max_vfs;
> +    uint16_t sriov_vq_flexible;
> +    uint16_t sriov_vi_flexible;
> +    uint8_t  sriov_max_vq_per_vf;
> +    uint8_t  sriov_max_vi_per_vf;
>  } NvmeParams;
>  
>  typedef struct NvmeCtrl {
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index fde4ddfceec..a8192edcd9d 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -1526,6 +1526,11 @@ typedef struct QEMU_PACKED NvmePriCtrlCap {
>      uint8_t     rsvd80[4016];
>  } NvmePriCtrlCap;
>  
> +typedef enum NvmePriCtrlCapCrt {
> +    NVME_CRT_VQ             = 1 << 0,
> +    NVME_CRT_VI             = 1 << 1,
> +} NvmePriCtrlCapCrt;
> +
>  typedef struct QEMU_PACKED NvmeSecCtrlEntry {
>      uint16_t    scid;
>      uint16_t    pcid;
> -- 
> 2.25.1
> 

