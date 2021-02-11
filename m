Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE453183BA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 03:50:45 +0100 (CET)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA243-00018K-Mv
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 21:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA22W-0000c8-O4; Wed, 10 Feb 2021 21:49:08 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA22U-0007mK-Q0; Wed, 10 Feb 2021 21:49:08 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s15so2464035plr.9;
 Wed, 10 Feb 2021 18:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vU3kQQdlq7Uk26gjjnYtgjDj+u7y/xlPD7jSjjC8750=;
 b=MEafzis8ZPXrCjJP+y3iN8IVsTzNYyYNTkuMSO8faOjIqpR4XXle+WQ6mqDBipUZVi
 U+Z76tY99U+XMjh0cw42Rs+legXf56V4zaDOnA2QEyetCX3WUc5g156zeQDPGrDI6+YK
 cgIBuea3q6By6pEmZQs+fnsu20XPngWdpgtT5ysKnD0v+zvYlheEZ6g5hS9In2WD5B6x
 dCNAJaeUDyydwyhRboJtepjWTOqPiv0vQ6OOo1FAyi//kPRMNS1tfw6piRz+mG5lMf+1
 zSIlWcAXMYjS9r7FjFcizKqGiGNtdKUTs0xdIuOESsErzQV2HsUozjDmCOmFhI2Inb+V
 /vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vU3kQQdlq7Uk26gjjnYtgjDj+u7y/xlPD7jSjjC8750=;
 b=UN3YWs0IQt0U/JVuGJIxsgo62bPX5EMaUGPtV09ECkoOW19BOjrnaeBSjVaVTRC10I
 NbWx3HIEbLvrUhL6xs5npqBV5AClatRFAZ5Rn9LfG0bmK3ixL+l0prp2PParAg7aNcWm
 /e5H81Zg1VJaLIEPvyth4luSZSrUJ+2l+SvFp3Y+o2ODKSattdA6Vv8kZrM8q4F9RtMr
 f7pIaxnL/khNO0POa+NsmweQ7F/AjHfwcx0RagzYvWYF1HglCKxygwAWoDsX+3L5EIzP
 Ed7RWIQsisGtp32oe1ZKFgOonggPob4e3pdAyG11ShEj/iXAacGkxMQ32DaBIKph62VU
 TR9w==
X-Gm-Message-State: AOAM531gQvqCnD7LjdKInAtmUnyOHFZhnD8xzdzoiCT6qGRxbOOe3wUE
 jihYuR4//pDNNe35hAICvVc=
X-Google-Smtp-Source: ABdhPJzYEwB0CIzpZWzF2nJQdsHAJGfwo94efolJiL/tu0cWVgPt3nHn8QgachHqbtQYm5t1TNm+/A==
X-Received: by 2002:a17:902:7408:b029:e1:63d0:75e5 with SMTP id
 g8-20020a1709027408b02900e163d075e5mr5668834pll.20.1613011744970; 
 Wed, 10 Feb 2021 18:49:04 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id n1sm3633415pgn.94.2021.02.10.18.49.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 18:49:04 -0800 (PST)
Date: Thu, 11 Feb 2021 11:49:02 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <20210211024902.GA24885@localhost.localdomain>
References: <20210127131505.394550-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127131505.394550-1-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-27 14:15:05, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> For most commands, when issuing an AIO, the BlockAIOCB is stored in the
> NvmeRequest aiocb pointer when the AIO is issued. The purpose of storing
> this is to allow the AIO to be cancelled when deleting submission
> queues (it is currently not used for Abort).
> 
> Since the addition of the Dataset Management command and Zoned
> Namespaces, NvmeRequests may involve more than one AIO and the AIOs are
> issued without saving a reference to the BlockAIOCB. This is a problem
> since nvme_del_sq will attempt to cancel outstanding AIOs, potentially
> with an invalid BlockAIOCB.
> 
> Fix this by instead of explicitly cancelling the requests, just allow
> the AIOs to complete by draining the namespace blockdevs.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 316858fd8adf..91f6fb6da1e2 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -403,6 +403,7 @@ static void nvme_req_clear(NvmeRequest *req)
>  {
>      req->ns = NULL;
>      req->opaque = NULL;
> +    req->aiocb = NULL;
>      memset(&req->cqe, 0x0, sizeof(req->cqe));
>      req->status = NVME_SUCCESS;
>  }
> @@ -2396,6 +2397,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>      NvmeSQueue *sq;
>      NvmeCQueue *cq;
>      uint16_t qid = le16_to_cpu(c->qid);
> +    int i;
>  
>      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
>          trace_pci_nvme_err_invalid_del_sq(qid);
> @@ -2404,12 +2406,18 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>  
>      trace_pci_nvme_del_sq(qid);
>  
> -    sq = n->sq[qid];
> -    while (!QTAILQ_EMPTY(&sq->out_req_list)) {
> -        r = QTAILQ_FIRST(&sq->out_req_list);
> -        assert(r->aiocb);
> -        blk_aio_cancel(r->aiocb);
> +    for (i = 1; i <= n->num_namespaces; i++) {
> +        NvmeNamespace *ns = nvme_ns(n, i);
> +        if (!ns) {
> +            continue;
> +        }
> +
> +        nvme_ns_drain(ns);

If we just drain the entire namespaces here, commands which has nothing
to do with the target sq to be deleted will be drained.  And this might
be a burden for a single SQ deletion.

By the way, agree with the multiple AIOs references problem for newly added
commands.  But, shouldn't we manage the inflight AIO request references for
the newlly added commands with some other way and kill them all
explicitly as it was?  Maybe some of list for AIOCBs?

