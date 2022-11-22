Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE24634258
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWvB-0002Zz-V6; Tue, 22 Nov 2022 12:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oxWv8-0002Zg-Qt; Tue, 22 Nov 2022 12:18:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oxWv6-0002PX-LS; Tue, 22 Nov 2022 12:18:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFA4C617CB;
 Tue, 22 Nov 2022 17:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C856AC433C1;
 Tue, 22 Nov 2022 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669137527;
 bh=ltCMzCBoKLzM6NKiaZow0WQN5RsMAyY/dJoKI953RzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qRJffUEDkw10+iXhK8WTi72ROLfeUDORVradzB6y2iKpPHb7E4aO/0nnFLXp0vBTn
 s7lfUXzPe5ZzlHnab4JbExnnVamuUBedM6PMsyWaCEndr6Sta4IC8M6dVJSnaazraZ
 V9iFvHEAT8WCz4d/z0iHZInQD/Vmvu1pqEDhDVXoM/z8jdXQCUqMS/wbUh88Qc8OX4
 mJRe9nC1T/ueQTPnUIgKMwqg0wcfqlSRm39smfEJXgf1yU6bNPC6V8/1bnHG6s5xDE
 bGrnJuBfnWXRLVp36jyotbL08r5gMtFjBrRzfdX4xW6QD9SgB86aU9garVu8zfxJpq
 Jf79hM1rqBLJQ==
Date: Tue, 22 Nov 2022 10:18:44 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: Re: [PATCH for-7.2 1/5] hw/nvme: fix aio cancel in format
Message-ID: <Y30EdCqaFolbQqjF@kbusch-mbp.dhcp.thefacebook.com>
References: <20221122081348.49963-1-its@irrelevant.dk>
 <20221122081348.49963-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122081348.49963-2-its@irrelevant.dk>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 09:13:44AM +0100, Klaus Jensen wrote:
> There are several bugs in the async cancel code for the Format command.
> 
> Firstly, cancelling a format operation neglects to set iocb->ret as well
> as clearing the iocb->aiocb after cancelling the underlying aiocb which
> causes the aio callback to ignore the cancellation. Trivial fix.
> 
> Secondly, and worse, because the request is queued up for posting to the
> CQ in a bottom half, if the cancellation is due to the submission queue
> being deleted (which calls blk_aio_cancel), the req structure is
> deallocated in nvme_del_sq prior to the bottom half being schedulued.
> 
> Fix this by simply removing the bottom half, there is no reason to defer
> it anyway.

I thought for sure I'd find a reason defered execution was needed, but
hey, it looks perfectly fine with this change!
 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index ac3885ce5079..26b53469328f 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5756,14 +5756,15 @@ typedef struct NvmeFormatAIOCB {
>      uint8_t pil;
>  } NvmeFormatAIOCB;

I think you can remove the QEMUBH member from the above struct with this
patch.

Otherwise looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

