Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6A300B98
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:44:59 +0100 (CET)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l31QN-0004sW-Ia
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l31OM-0004N0-MV; Fri, 22 Jan 2021 13:42:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:38196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l31OL-0000AX-3H; Fri, 22 Jan 2021 13:42:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E2B223ABA;
 Fri, 22 Jan 2021 18:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611340959;
 bh=BEN4EkycUkbNXzbMzbMEQauqYicmIyLmor5z0KLCBvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hH/4ZV7G5D8cx1XnbbUXnienxOX0/Ks23JoSUq157rGn64DGUOVWM9lH9lB2EFQrk
 fO4K8EvWkk8bltjgrO2Gdb5nydPaHYALF7ub2cwa7TbJmcfpQPhKVJICZ87E3oQ5h6
 r7xHuecCzzmdCWsPOFWosxGSzPyzSyKxRnVOwzGKF+KXbzj6sFi0KMwH574/bBjrRs
 vK7KxtUUQ9P/hXWVsog/k5cNqfZeirNDZvULi70XamfgupbxxcUbjq2hTVP5pSegu5
 GxvPYCOB1bi6jInpVKWeNqPSSg3Tq4rjZElyCj1bsdVLpC2Uw8onF3FnY6DbdbDr+N
 ZGu+GIjl+DWJQ==
Date: Fri, 22 Jan 2021 10:42:36 -0800
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V5 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210122184236.GA1728586@dhcp-10-100-145-180.wdc.com>
References: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
 <20210122120736.5242-5-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122120736.5242-5-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 09:07:34PM +0900, Minwoo Im wrote:
> index b525fca14103..3dedefb8ebba 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4435,6 +4435,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>      strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
>      strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
>      strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
> +
> +    id->cntlid = n->cntlid;

cpu_to_le16()? It might be okay to not do that since the only
requirement is that this is a unique value, but it would be confusing
for decoding commands that have a controller id field.

