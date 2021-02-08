Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B12D31437F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:10:00 +0100 (CET)
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FfL-0008UN-6G
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l9Bkn-0001QG-AX; Mon, 08 Feb 2021 13:59:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:46178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l9Bki-00049v-Gd; Mon, 08 Feb 2021 13:59:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BF7564E84;
 Mon,  8 Feb 2021 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612810754;
 bh=ykrEEdx7zvNF+2NDxFvRRFbQBVRr5+sg8bcP3RyOYco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fr3lHcnNdNHzkkCPfnQ+A+QW2jrpvP9rCYRDE3NyHan2Q1/HMaUQqezADiJZGtraW
 uZIa9qZIdvQpvnX7Ulvm4iAyck/8VNEZbbw3pP96GYU8GO+WCw/fY8ZFf+FbDONxD/
 bwIvNJE1nWh4EMFJYM7uJnxK9FXGeiY693pxakEkWmeWjy0LApgywr7HcUSG5j0nlr
 MbNxVO0sGZDtBVSsz57upqTM1rAt/pbwOfhK0ZT7RbcAVojU1eEGoMs8KMTd5ygtrV
 obKSCHcVrCwftf5frc3SkB2Fx5sLKwJyzsfubLZDBB/gvyZLa+w52/ccqqAi+IyXbh
 MBl/pR00nMsAg==
Date: Tue, 9 Feb 2021 03:59:07 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <20210208185907.GA17042@redsun51.ssa.fujisawa.hgst.com>
References: <20210125204231.254925-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125204231.254925-1-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 09:42:31PM +0100, Klaus Jensen wrote:
> @@ -1644,10 +1679,56 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
>  
>  static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
>  {
> -    block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
> -                     BLOCK_ACCT_FLUSH);
> -    req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb, req);
> -    return NVME_NO_COMPLETE;
> +    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
> +    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
> +    uint16_t status;
> +    struct nvme_aio_flush_ctx *ctx;
> +    NvmeNamespace *ns;
> +
> +    trace_pci_nvme_flush(nvme_cid(req), nsid);
> +
> +    if (nsid != NVME_NSID_BROADCAST) {
> +        req->ns = nvme_ns(n, nsid);
> +        if (unlikely(!req->ns)) {
> +            return NVME_INVALID_FIELD | NVME_DNR;
> +        }
> +
> +        block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
> +                         BLOCK_ACCT_FLUSH);
> +        req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb, req);
> +        return NVME_NO_COMPLETE;
> +    }
> +
> +    /* 1-initialize; see comment in nvme_dsm */
> +    *num_flushes = 1;
> +
> +    for (int i = 1; i <= n->num_namespaces; i++) {
> +        ns = nvme_ns(n, i);
> +        if (!ns) {
> +            continue;
> +        }
> +
> +        ctx = g_new(struct nvme_aio_flush_ctx, 1);
> +        ctx->req = req;
> +        ctx->ns = ns;
> +
> +        (*num_flushes)++;
> +
> +        block_acct_start(blk_get_stats(ns->blkconf.blk), &ctx->acct, 0,
> +                         BLOCK_ACCT_FLUSH);
> +        req->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_cb, ctx);
> +    }

Overwriting req->aiocb with the most recent flush request doesn't seem
right.

This whole implementation would be much simpler with the synchronous
blk_flush() routine instead of the AIO equivalent. This is not really a
performant feature, so I don't think it's critical to get these
operations happening in parallel. What do you think?

