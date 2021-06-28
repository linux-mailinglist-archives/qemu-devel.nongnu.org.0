Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5573B69BE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:36:17 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxzM-00074X-D2
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lxxyI-0006FS-Cw; Mon, 28 Jun 2021 16:35:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lxxyD-0001QP-ED; Mon, 28 Jun 2021 16:35:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D418B61CD7;
 Mon, 28 Jun 2021 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624912503;
 bh=xqPQvFcxHC0soiMCDxWV6M3ZssrdXri4B6M0yAOrLEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mjvFAyoWEV/BxBziqd9cTKfLmpKHWl4T1RYcCLCqwLDuUFdHNTrb9EfwluMErOIHq
 /auRQsdZJOryFq7reXAC2fky5ZjVfpoL2Zpnrlnd8J/wRkk20OigC5tsDd79TrcTJX
 hZigMgGTN2GWiZnExDwKDCoxGLOM3wQ3tN70WufPUVnTH/ILpKs0TVlOeX7RC82ZCy
 rNMm6Yj6NbEqwszzW9jv2XFrGr07WH2yt4dCnV7BPdaxrLWYgn20Vv7QMdZsc9h1RB
 eAyhHWkAzvO+eHZEXdhmNVDAAxh2gPrzF+cdWRTHEc6F4gtoohxPn+eoEpBGyus/e5
 PdSjH73DjNNJA==
Date: Mon, 28 Jun 2021 13:35:00 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: fix missing check for PMR capability
Message-ID: <20210628203500.GB2822061@dhcp-10-100-145-180.wdc.com>
References: <20210607094757.29661-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607094757.29661-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 11:47:57AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Qiang Liu reported that an access on an unknown address is triggered in
> memory_region_set_enabled because a check on CAP.PMRS is missing for the
> PMRCTL register write when no PMR is configured.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 75c3c9de961d ("hw/block/nvme: disable PMR at boot up")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/362
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

> ---
>  hw/nvme/ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 0bcaf7192f99..463772602c4e 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5583,6 +5583,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                         "invalid write to PMRCAP register, ignored");
>          return;
>      case 0xe04: /* PMRCTL */
> +        if (!NVME_CAP_PMRS(n->bar.cap)) {
> +            return;
> +        }
> +
>          n->bar.pmrctl = data;
>          if (NVME_PMRCTL_EN(data)) {
>              memory_region_set_enabled(&n->pmr.dev->mr, true);
> -- 
> 2.31.1

