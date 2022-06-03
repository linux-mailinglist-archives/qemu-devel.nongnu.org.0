Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7812453D265
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:33:30 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxD33-0006nz-3K
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nxD17-0005TI-0L; Fri, 03 Jun 2022 15:31:30 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:60196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nxD14-0002jG-Ge; Fri, 03 Jun 2022 15:31:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B92D0619F3;
 Fri,  3 Jun 2022 19:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92ECBC385B8;
 Fri,  3 Jun 2022 19:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654284675;
 bh=lC8GVEczpMWoXgotNXXHwBhWaIvuN1iobpyKUQ1G8BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QeNCoXEGwFKXVcuQmwOkBN49+j3+wprT6pi6yKg+vjtO4rUEljJKOyNP322I9kPDO
 eUGMPMop0XaWsv4XCUJK7PCLh0i5L/t0hMy8/y/ji8HRlVnQylgItrttlJiez90Hoy
 LMCkm90Rb9GXc7SEEMHyJbhreSybKTu1TgYT2mkTjhufn1rHW0oNOKzmhsmnfuzvOy
 UjDXVL9TErY7j0dZD97joFM8ssAsm/mE1Rmw0hXQVDVD0FPOTasbKCvM3pwkV/IH5Y
 5Y8LvDxt+sv7a35jA7BQDRFtlcYHtvtDgnHf42z1Iun6DhjQmQ1m22ppWPCIZCGKzK
 fFIvTHBBkTfzQ==
Date: Fri, 3 Jun 2022 13:31:11 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>,
 Francis Pravin AntonyX Michael Raj <francis.michael@solidigm.com>,
 Michael Kropaczek <michael.kropaczek@solidigm.com>,
 Jonathan Derrick <jonathan.derrick@solidigm.com>
Subject: Re: [PATCH] hw/nvme: Fix deallocate when metadata is present
Message-ID: <Ypphf71Lyzl4IS2X@kbusch-mbp.dhcp.thefacebook.com>
References: <20220603191440.3625-1-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603191440.3625-1-jonathan.derrick@linux.dev>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jun 03, 2022 at 01:14:40PM -0600, Jonathan Derrick wrote:
> When metadata is present in the namespace and deallocates are issued, the first
> deallocate could fail to zero the block range, resulting in another
> deallocation to be issued. Normally after the deallocation completes and the
> range is checked for zeroes, a deallocation is then issued for the metadata
> space. In the failure case where the range is not zeroed, deallocation is
> reissued for the block range (and followed with metadata deallocation), but the
> original range deallocation task will also issue a metadata deallocation:
> 
> nvme_dsm_cb()
>   *range deallocation*
>   nvme_dsm_md_cb()
>     if (nvme_block_status_all()) (range deallocation failure)
>       nvme_dsm_cb()
>       *range deallocation*
>         nvme_dsm_md_cb()
>           if (nvme_block_status_all()) (no failure)
>           *metadata deallocation*
>     *metadata deallocation*
> 
> This sequence results in reentry of nvme_dsm_cb() before the metadata has been
> deallocated. During reentry, the metadata is deallocated in the reentrant task.
> nvme_dsm_bh() is called which deletes and sets iocb->bh to NULL. When reentry
> returns from nvme_dsm_cb(), metadata deallocation takes place again, and
> results in a null pointer dereference on the iocb->bh:

Nice, thank you for the detailed analysis. Patch looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

