Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E82D360A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:19:24 +0100 (CET)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlKN-00021H-DA
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kmlAA-0002ge-Cm; Tue, 08 Dec 2020 17:08:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:50688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kmlA7-0004bt-1h; Tue, 08 Dec 2020 17:08:49 -0500
Date: Wed, 9 Dec 2020 07:08:37 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607465323;
 bh=B/mD0kAm/v4yKfxmXoaorzQOJF4SAgSQLb/ldrujh9I=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vj4iIxpTToBmGkcVACFDJE2q/RSHpetdd1fJ1IawFtHXOhHMULoV925/DR1//yWX1
 AuqBvdvAGRNC/8uTFU0wGy7w/zd2LWfmM6vkASPO9a7/tqt2fBQSPh2oOpvkLaIPAF
 WToofchjNaS9XiQegLUjk7LAdMUJVNnR4Gn6dyIUsgtzBZM9sQPIWd3UfOwOphCCfG
 fbcLuRwU3UZoNRN4S53W4nVNs3UXzuFmK2WpS3FPzxpJTL3Nc/3/Wk/pXDqilYqm5N
 MdjX3upjMuHTPcsXfVqlmUn0Bx95i8THHHOtItD7n008Rd9Jg7J9YKpoqDZyXYexro
 W864olfphbu2g==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: fix bad clearing of CAP
Message-ID: <20201208220837.GG27155@redsun51.ssa.fujisawa.hgst.com>
References: <20201208091658.41820-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208091658.41820-1-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 10:16:58AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Commit 37712e00b1f0 ("hw/block/nvme: factor out pmr setup") changed the
> control flow such that the CAP register is erronously cleared after
> nvme_init_pmr() has configured it. Since the entire NvmeCtrl structure
> is zero-filled initially, there is no need for the explicit clearing, so
> just remove it.
> 
> Fixes: 37712e00b1f0 ("hw/block/nvme: factor out pmr setup")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Oops, nice catch.

Reviewed-by: Keith Busch <kbusch@kernel.org>

> ---
>  hw/block/nvme.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 8814201364c1..28416b18a5c0 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3040,7 +3040,6 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>      id->psd[0].enlat = cpu_to_le32(0x10);
>      id->psd[0].exlat = cpu_to_le32(0x4);
>  
> -    n->bar.cap = 0;
>      NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
>      NVME_CAP_SET_CQR(n->bar.cap, 1);
>      NVME_CAP_SET_TO(n->bar.cap, 0xf);
> -- 
> 2.29.2
> 

