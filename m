Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7253FFAF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:09:45 +0200 (CEST)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYxs-0001R9-Bu
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nyYF7-0000Sz-DT; Tue, 07 Jun 2022 08:23:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:19495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nyYF0-00088o-T8; Tue, 07 Jun 2022 08:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654604602; x=1686140602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EY8GPt89rNIjCxuozpwEWpjJtiSFidkUYBTBGiHQKdM=;
 b=nq+krJOjenNYlHrxjL5IAVsz1LnojFGUjq7Qsvjsg/9eUbheTh7fFJ0S
 2nrWU0cygoxn2f6QcmIYStIMwfPqZ9XrD4fosu046EM60I0ze/J9zcV6t
 kPFSL7Fp+JhFoGFPSGW/3s+wOqdNXjAGit6jveJrDEW1taPOcHCqHhlyX
 WVyUugdMgLSOfUxHf7gsS248vWtnaHHOchZz7Tm8QvT9cTjCogc1ll2k9
 xvEgZ46dWmgqsZG89PYC6ZLQO4nZltPZ/yxXyaWYeJ5rCV+ehC3+8A0mD
 L0tWaopxNn8KzKKNIcLs7rTTTRiLlP8M1aMR5rGRjVtYstukc5p7tXb70 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="256556049"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="256556049"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 05:23:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="614903289"
Received: from hmowinsk-mobl2.ger.corp.intel.com (HELO
 kzawora-mobl.ger.corp.intel.com) ([10.213.29.246])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 05:23:12 -0700
Date: Tue, 7 Jun 2022 14:23:08 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v3] hw/nvme: clean up CC register write logic
Message-ID: <Yp9DLD5QFWNBFIZT@kzawora-mobl.ger.corp.intel.com>
References: <20220607112320.58532-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607112320.58532-1-its@irrelevant.dk>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

On Tue, Jun 07, 2022 at 01:23:20PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The SRIOV series exposed an issued with how CC register writes are
> handled and how CSTS is set in response to that. Specifically, after
> applying the SRIOV series, the controller could end up in a state with
> CC.EN set to '1' but with CSTS.RDY cleared to '0', causing drivers to
> expect CSTS.RDY to transition to '1' but timing out.
> 
> Clean this up.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> v3:
>   * clear intms/intmc/cc regardless of reset type
> 
>  hw/nvme/ctrl.c | 38 ++++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 658584d417fe..a558f5cb29c1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6190,10 +6190,15 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
>  
>      if (pci_is_vf(pci_dev)) {
>          sctrl = nvme_sctrl(n);
> +
>          stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
>      } else {
>          stl_le_p(&n->bar.csts, 0);
>      }
> +
> +    stl_le_p(&n->bar.intms, 0);
> +    stl_le_p(&n->bar.intmc, 0);
> +    stl_le_p(&n->bar.cc, 0);
>  }
>  
>  static void nvme_ctrl_shutdown(NvmeCtrl *n)
> @@ -6405,20 +6410,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          nvme_irq_check(n);
>          break;
>      case NVME_REG_CC:
> +        stl_le_p(&n->bar.cc, data);
> +
>          trace_pci_nvme_mmio_cfg(data & 0xffffffff);
>  
> -        /* Windows first sends data, then sends enable bit */
> -        if (!NVME_CC_EN(data) && !NVME_CC_EN(cc) &&
> -            !NVME_CC_SHN(data) && !NVME_CC_SHN(cc))
> -        {
> -            cc = data;
> +        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
> +            trace_pci_nvme_mmio_shutdown_set();
> +            nvme_ctrl_shutdown(n);
> +            csts &= ~(CSTS_SHST_MASK << CSTS_SHST_SHIFT);
> +            csts |= NVME_CSTS_SHST_COMPLETE;
> +        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
> +            trace_pci_nvme_mmio_shutdown_cleared();
> +            csts &= ~(CSTS_SHST_MASK << CSTS_SHST_SHIFT);
>          }
>  
>          if (NVME_CC_EN(data) && !NVME_CC_EN(cc)) {
> -            cc = data;
> -
> -            /* flush CC since nvme_start_ctrl() needs the value */
> -            stl_le_p(&n->bar.cc, cc);
>              if (unlikely(nvme_start_ctrl(n))) {
>                  trace_pci_nvme_err_startfail();
>                  csts = NVME_CSTS_FAILED;
> @@ -6429,22 +6435,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
>              trace_pci_nvme_mmio_stopped();
>              nvme_ctrl_reset(n, NVME_RESET_CONTROLLER);
> -            cc = 0;
> -            csts &= ~NVME_CSTS_READY;
> -        }
>  
> -        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
> -            trace_pci_nvme_mmio_shutdown_set();
> -            nvme_ctrl_shutdown(n);
> -            cc = data;
> -            csts |= NVME_CSTS_SHST_COMPLETE;
> -        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
> -            trace_pci_nvme_mmio_shutdown_cleared();
> -            csts &= ~NVME_CSTS_SHST_COMPLETE;
> -            cc = data;
> +            break;
>          }
>  
> -        stl_le_p(&n->bar.cc, cc);
>          stl_le_p(&n->bar.csts, csts);
>  
>          break;
> -- 
> 2.36.1
> 

Reviewed-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>

