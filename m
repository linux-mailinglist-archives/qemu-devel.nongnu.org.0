Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE19542AC5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 11:08:13 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyrff-0007bh-NR
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 05:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nyrcR-0006eF-QC; Wed, 08 Jun 2022 05:04:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:65254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nyrcO-0002lJ-Nw; Wed, 08 Jun 2022 05:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654679088; x=1686215088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gq0G6vMZu3gOUze3QcwueDj6vv+B48wLWAvFmIE9kpk=;
 b=DwAqTH0J1Ww0H+ND+IuFSI/wKerYbbze0yYRJvfPWsEtEwtAv7GTzBM7
 fbqR0HA5kvZzwmXqil5B7GO1q0g6bji4jUws82gz+z/L6wgVlDWQLj92p
 IeQVu1lhyyHf2vZ3det3G4sU294m/V69MIHhX6zGjbXigwB7GePh1w+sp
 ZQ8XVx0WRTdC4s4dfG2msG8rfsY0/KUXHBs29vY4WW12X3/Tf98v37aHL
 gSK8sr/U8M1Yx1ue1m+yiEsvpGwFyMqMq22pOWWJowmYzLW2hLES2jDkO
 tSdZtik5/fQsOiqbzIIdFEIaR5xUqHcPsHNmCBN+kNSLQv+2vZYJfB4tP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="340938682"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="340938682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 02:04:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="636695501"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.213.0.164])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 02:04:42 -0700
Date: Wed, 8 Jun 2022 11:04:35 +0200
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v3] hw/nvme: clean up CC register write logic
Message-ID: <20220608090435.GA29771@lgieryk-VirtualBox>
References: <20220607112320.58532-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607112320.58532-1-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga07.intel.com
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
> Reviewed-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
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

Reviewed-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>


