Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EFA3B6668
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:06:09 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtlv-0007pR-QI
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lxthF-0000ru-FJ; Mon, 28 Jun 2021 12:01:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lxth4-0004zq-Ni; Mon, 28 Jun 2021 12:01:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19CAB61C3D;
 Mon, 28 Jun 2021 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624896061;
 bh=kjkf8DZeVYQeP3TtLMUf06R33bcUKmg1jgGGwwOICww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPi2eRVqc8vae8yuorlSEa2uCxw5HaMRaxLBKCjb9JRZtl9PHOkOiQGIhaIyVUlDd
 IW60msXbDUQ3KTaVInRXj5oJhdBcJKCFb5mLUK+Z2uf5cjJMBsf54whDEAZITnfG2F
 0bt9ji5F6O+4U4/kgVFlhqM3BUzN9t+7tewk8q1Jzt7/zKjjE9eP4zaYbCBQopCt9D
 8sT9W+llqMOgUnor8TPudg151s/GcCk3OKnK4zMm+4b+fOBNoBXZAhMwJtWotlQmb4
 49IMykHSK8GZSKw8ZZiVCXKGbeW0cMp6eLgyESqbajHJmKxDT+uwQjKjA3YvHgHxfF
 kZ5wuK7ii56eg==
Date: Mon, 28 Jun 2021 09:00:59 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 11/11] Partially revert "hw/block/nvme: drain
 namespaces on sq deletion"
Message-ID: <20210628160059.GA2822061@dhcp-10-100-145-180.wdc.com>
References: <20210617190657.110823-1-its@irrelevant.dk>
 <20210617190657.110823-12-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617190657.110823-12-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:06:57PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This partially reverts commit 98f84f5a4eca5c03e32fff20f246d9b4b96d6422.
> 
> Since all "multi aio" commands are now reimplemented to properly track
> the nested aiocbs, we can revert the "hack" that was introduced to make
> sure all requests we're properly drained upon sq deletion.
> 
> The revert is partial since we keep the assert that no outstanding
> requests remain on the submission queue after the explicit cancellation.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index ec8ddb76cd39..5a1d25265a9d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -3918,7 +3918,6 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>      NvmeSQueue *sq;
>      NvmeCQueue *cq;
>      uint16_t qid = le16_to_cpu(c->qid);
> -    uint32_t nsid;
>  
>      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
>          trace_pci_nvme_err_invalid_del_sq(qid);
> @@ -3930,22 +3929,8 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>      sq = n->sq[qid];
>      while (!QTAILQ_EMPTY(&sq->out_req_list)) {
>          r = QTAILQ_FIRST(&sq->out_req_list);
> -        if (r->aiocb) {
> -            blk_aio_cancel(r->aiocb);
> -        }
> -    }
> -
> -    /*
> -     * Drain all namespaces if there are still outstanding requests that we
> -     * could not cancel explicitly.
> -     */
> -    if (!QTAILQ_EMPTY(&sq->out_req_list)) {

Quick question: was this 'if' ever even possible to hit? The preceding
'while' loop doesn't break out until the queue is empty, so this should
have been unreachable.

> -        for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
> -            NvmeNamespace *ns = nvme_ns(n, nsid);
> -            if (ns) {
> -                nvme_ns_drain(ns);
> -            }
> -        }
> +        assert(r->aiocb);
> +        blk_aio_cancel(r->aiocb);
>      }
>  
>      assert(QTAILQ_EMPTY(&sq->out_req_list));
> -- 

