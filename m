Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDA52D23C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:15:25 +0200 (CEST)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrf3j-0007Ja-VN
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nrf0T-0005Rt-Ot; Thu, 19 May 2022 08:11:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:2721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nrf0J-0000zV-MC; Thu, 19 May 2022 08:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652962303; x=1684498303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gQCHVBazl6ZhWoiKgB2LWZdDH8PRS6+aI6xTG+CGdmA=;
 b=nQAaXzlZZv2AFaTssBkDcJ2qpK5h3CU7UNpU5RYQluh99E7xEDagxk4w
 DPe9LBEm1QABs77XfTeSACnvDwtgSzs434NqrDTqHv+BcBacnO6yu/l8Y
 xmufhyCihstkhEDe8NOtynNQC7R2GMcT1YBDap3xKanapKV96Ymudmnm5
 wHx4yTIU3omZzDCcCf4KhLXZq3eOk9lMSg65Jk2rS1lHKQZbwu1YgQIlr
 pk9fKVfYaW8iz9J1h3Pk4x3zEpcXer3kFgYPCbHcZaf/7TkXRD+S38KdT
 529TuGQq4MmifP2K5FyFCL0D0OMToQL/8v6efC81dtGZeYBo1kFS8hof4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="269759179"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="269759179"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 05:11:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="701137166"
Received: from kpiekosz-mobl.ger.corp.intel.com ([10.213.24.244])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 05:11:18 -0700
Date: Thu, 19 May 2022 14:11:13 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>, lukasz.gieryk@linux.intel.com
Subject: Re: [PATCH] hw/nvme: clean up CC register write logic
Message-ID: <YoYziE8v2reg5kQ7@kpiekosz-mobl.ger.corp.intel.com>
References: <20220517111605.1494647-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517111605.1494647-1-its@irrelevant.dk>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 01:16:05PM +0200, Klaus Jensen wrote:
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
> 
> Note, this applies on top of nvme-next with v8 of Lukasz's sriov series.
> 
>  hw/nvme/ctrl.c | 35 +++++++++++------------------------
>  1 file changed, 11 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 658584d417fe..47d971b2404c 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6190,9 +6190,8 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
>  
>      if (pci_is_vf(pci_dev)) {
>          sctrl = nvme_sctrl(n);
> +
>          stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
> -    } else {
> -        stl_le_p(&n->bar.csts, 0);

Are you sure the registers do not need to be cleared for a reset type that
does not involve a CC register i.e. FLR?
Will these registers be zeroed out elsewhere during FLR?

>      }
>  }
>  
> @@ -6405,20 +6404,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
> @@ -6429,22 +6429,9 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
>              trace_pci_nvme_mmio_stopped();
>              nvme_ctrl_reset(n, NVME_RESET_CONTROLLER);
> -            cc = 0;
>              csts &= ~NVME_CSTS_READY;
>          }
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
> -        }
> -
> -        stl_le_p(&n->bar.cc, cc);
>          stl_le_p(&n->bar.csts, csts);
>  
>          break;
> -- 
> 2.36.1
> 

