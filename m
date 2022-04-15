Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843C502F55
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 21:37:48 +0200 (CEST)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfRlK-0002Mn-Fo
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 15:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nfRjE-0001VZ-5P; Fri, 15 Apr 2022 15:35:36 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:35938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nfRjB-0000cp-KJ; Fri, 15 Apr 2022 15:35:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4C6061EB8;
 Fri, 15 Apr 2022 19:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B281BC385AB;
 Fri, 15 Apr 2022 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650051316;
 bh=M6lnbEqDDzJElnX43mukGgArccbDGoUKnp/h3GsRoUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPDK2Jc3EBuVI7nCGitlfWarGV/IjF1OGY1jCbYTCEzBzt6JT2FoA9o3yIHWrQiax
 UTbg+yM7ZEW5H0l3vqOBUDj8jxDFFscoM6nHVa86eYN1t2co4aCt9ACj0Xaj3LCcY+
 ma+09RQw+GVG4/tZPiRCIrNfvrnCxPqoPjPP+lM0XwpM6jEgckxfstGk6ZbWAcFf/A
 wSN7L5iUm6UzbHMIRxzVgmIJ1hZ4LlbdKYh2pdzS8j3+DOgZ9RPuM6K0UpS1QipYEN
 ZloJTRslpO+IdQ+8XgxDrkDFJ8FnwbNbiAFoXMmrkZbiz/HIjQ3AH3sF4wA6ujTf/x
 bEXhRYtjBd60A==
Date: Fri, 15 Apr 2022 13:35:13 -0600
From: Keith Busch <kbusch@kernel.org>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH] hw/nvme: fix control flow statement
Message-ID: <YlnI8EONxaX/fnPZ@kbusch-mbp.dhcp.thefacebook.com>
References: <20220415192721.tkbokbl65rrwkbew@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415192721.tkbokbl65rrwkbew@localhost.localdomain>
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
Cc: its@irrelevant.dk, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 15, 2022 at 10:27:21PM +0300, Dmitry Tikhov wrote:
> Since there is no else after nvme_dsm_cb invocation, metadata associated
> with non-zero block range is currently zeroed. Also this behaviour leads
> to segfault since we schedule iocb->bh two times. First when entering
> nvme_dsm_cb with iocb->idx == iocb->nr and second on call stack unwinding
> by calling blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback
> because of missing else statement.
> 
> Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
> ---
>  hw/nvme/ctrl.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 03760ddeae..7ebd2aa326 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -2372,11 +2372,12 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
>          }
>  
>          nvme_dsm_cb(iocb, 0);
> +    } else {
> +        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
> +                                            nvme_m2b(ns, nlb), BDRV_REQ_MAY_UNMAP,
> +                                            nvme_dsm_cb, iocb);
>      }

Instead of the 'else', just insert an early 'return;' after nvme_dsm_cb() like
the earlier condition above here. Otherwise, looks good, and thanks for the
fix.

