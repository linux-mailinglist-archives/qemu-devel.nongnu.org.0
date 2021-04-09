Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F2359CBE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:11:51 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUp3G-0000bh-3g
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUp1U-0007w7-BA; Fri, 09 Apr 2021 07:10:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUp1R-0000id-Tq; Fri, 09 Apr 2021 07:10:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id nh5so2716225pjb.5;
 Fri, 09 Apr 2021 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Poap7U7SLBafBUbZArYgJ58j6mFrEMBmWzVNT4iIpB4=;
 b=PqC4U7nbk1j8UqH/nyRagNqjnsVAZx/aIoOzk/VTNqU9OQhWq8kuD3PwipuzP/mnkG
 g35LAigdgh9OBSUhbDiDDhb7auve851i2IFrfa+ViHKpLwbf2IGMzVqWUQPhGfdvYsAy
 Q6g9IgfOLrNv9uQfci95roww4bLOd1SYJ+SJ1Xubj5yLX0cOiBuHareFMNSkKmhuTd8w
 qbg8LLC9f9M/VPjLmhrWX3I2fZxbKsqKln8IUEustRHtT0rQOxMc0m8w+8iuYLRgfbab
 Snqg5bLXWey5ZawbJXpZCtBCpUkEqvNTTjxVXmrjyVw2Zfyqm6h2XHHT/gIJNnuJOCIY
 lWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Poap7U7SLBafBUbZArYgJ58j6mFrEMBmWzVNT4iIpB4=;
 b=TAWFuIU3TTxMnmnyc7M2raERTxbTYRmfgPKMMn1P0w4yyT4fHIHnkBfp3UR/dGqHaX
 EZQ1rLtvupgNMuaHu7ZsmnpZxaUGiswoY28pANHxkz21vERdTUMncacG1Hc2q6Q4tMOS
 toq7dd40BcN2iujRV3jTp4FPq9hyTtEbE6hWQ2xMqPfe4/bRIVcWOFOn7zpIusdN13E4
 BeQOwBQkg0tF76rsD7Wpt3ziDtSUZQZJbrfWf1UvrNEOqVBUVswW57GvFPs7FnUilB1i
 ccGq29zrY7mCUpTqN6HRJbcQ3R7BrzJPD0qey/zS9s5aBW4ncOqJ90JCK/PB+2AmRq5Q
 u/0Q==
X-Gm-Message-State: AOAM532mYQoATpU+5blyK9VwVYwhybuh7+eROjSnYBGCu4yUm5CRljag
 ZTMq0py66JiG4QLj2A1VRvs=
X-Google-Smtp-Source: ABdhPJxOPCTjwxomPBShRo3Os2lb3STEVMF7qw5Hc+dQc3DDpzpzJIJ0ojDtLGg+5Zx+AravnUuxzg==
X-Received: by 2002:a17:902:e84a:b029:e8:c4ca:1164 with SMTP id
 t10-20020a170902e84ab02900e8c4ca1164mr12252820plg.26.1617966596253; 
 Fri, 09 Apr 2021 04:09:56 -0700 (PDT)
Received: from localhost ([58.127.46.74])
 by smtp.gmail.com with ESMTPSA id fa6sm2092930pjb.2.2021.04.09.04.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 04:09:55 -0700 (PDT)
Date: Fri, 9 Apr 2021 20:09:54 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <20210409110954.GE2085@localhost>
References: <20210408193709.435939-1-its@irrelevant.dk>
 <20210408193709.435939-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210408193709.435939-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102a.google.com
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-04-08 21:37:09, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> For most commands, when issuing an AIO, the BlockAIOCB is stored in the
> NvmeRequest aiocb pointer when the AIO is issued. The main use of this
> is cancelling AIOs when deleting submission queues (it is currently not
> used for Abort).
> 
> However, some commands like Dataset Management Zone Management Send
> (zone reset) may involve more than one AIO and here the AIOs are issued
> without saving a reference to the BlockAIOCB. This is a problem since
> nvme_del_sq() will attempt to cancel outstanding AIOs, potentially with
> an invalid BlockAIOCB since the aiocb pointer is not NULL'ed when the
> request structure is recycled.
> 
> Fix this by
> 
>   1. making sure the aiocb pointer is NULL'ed when requests are recycled
>   2. only attempt to cancel the AIO if the aiocb is non-NULL
>   3. if any AIOs could not be cancelled, drain all aio as a last resort.
> 
> Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
> Fixes: c94973288cd9 ("hw/block/nvme: add broadcast nsid support flush command")
> Fixes: e4e430b3d6ba ("hw/block/nvme: add simple copy command")
> Fixes: 5f5dc4c6a942 ("hw/block/nvme: zero out zones on reset")
> Fixes: 2605257a26b8 ("hw/block/nvme: add the dataset management command")
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Cc: Minwoo Im <minwoo.im@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 94bc373260be..3c4297e38a52 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -470,6 +470,7 @@ static void nvme_req_clear(NvmeRequest *req)
>  {
>      req->ns = NULL;
>      req->opaque = NULL;
> +    req->aiocb = NULL;
>      memset(&req->cqe, 0x0, sizeof(req->cqe));
>      req->status = NVME_SUCCESS;
>  }
> @@ -3681,6 +3682,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>      NvmeSQueue *sq;
>      NvmeCQueue *cq;
>      uint16_t qid = le16_to_cpu(c->qid);
> +    int nsid;

Even we don't have fully supported number of namespaces in this device
(0xFFFFFFFF), can we have this one with `uint32_t` ?

Otherwise, looks good to me.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

