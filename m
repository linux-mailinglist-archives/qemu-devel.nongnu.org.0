Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA3840C912
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:57:59 +0200 (CEST)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXIL-0008UN-Vu
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mQXGO-0007Fw-TI; Wed, 15 Sep 2021 11:55:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:60112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mQXGM-0008Hm-TM; Wed, 15 Sep 2021 11:55:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A074260BD3;
 Wed, 15 Sep 2021 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631721351;
 bh=2ZZn3sGcETYHyWcTlrCWnzp9asDOTRWblOngQTvX8UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iEZWo/BA37C62vzbd+eF5pfplgZckM3Sg403CQiYJO5W9N62Q7mv0iOdzBURgrzSk
 /OFCpx6/PyWyVa/3IUifwwfec1thMNuGvUeu7hcumFgF+0yLu7V9+e0c7CTrbOygj/
 Pq5zsEnFZ4AtqJdyhGLGfpfxULtvqaa62DeLnFXj/10kamLAvVLHVTl+hUVFUh/Yb2
 7VuzdQPPhYOWJoqOZN66FbwmssS6HbOovVH/NQLeEkRSkV1JqE97WjgRHREyjMosPm
 s8mwptaJBId5M7zNkOwVb4WqA5XLCYK3Qrr7ZrQoyJJNoWwDC/H1MmFVsJ3D8dtejh
 CFIwYhMQtkPxg==
Date: Wed, 15 Sep 2021 08:55:48 -0700
From: Keith Busch <kbusch@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v2] hw/nvme: Return error for fused operations
Message-ID: <20210915155548.GB3850143@dhcp-10-100-145-180.wdc.com>
References: <CGME20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32@eucas1p2.samsung.com>
 <8df37610-0200-d02a-7281-30b22718201d@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df37610-0200-d02a-7281-30b22718201d@samsung.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: its@irrelevant.dk, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 05:43:30PM +0200, Pankaj Raghav wrote:
> Currently, FUSED operations are not supported by QEMU. As per the 1.4 SPEC,
> controller should abort the command that requested a fused operation with 
> an INVALID FIELD error code if they are not supported.
> 
> Changes from v1:
> Added FUSE flag check also to the admin cmd processing as the FUSED 
> operations are mentioned in the general SQE section in the SPEC. 

Just for future reference, the changes from previous versions should go
below the "---" line so that they don't get included in the official
changelog.

> +    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
> +        return NVME_INVALID_FIELD;
> +    }
> +
>      req->ns = ns;
>  
>      switch (req->cmd.opcode) {
> @@ -5475,6 +5479,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
>  
> +    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
> +        return NVME_INVALID_FIELD;
> +    }

I'm a little surprised this macro exists considering this is the first
time it's used! But this looks fine, I really hope hosts weren't
actually trying fused commands on this target, but it's good to confirm.

Reviewed-by: Keith Busch <kbusch@kernel.org>

