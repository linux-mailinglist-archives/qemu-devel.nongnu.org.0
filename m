Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF031414E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:09:40 +0100 (CET)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dmt-0003e0-GD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l98jC-0008VP-32; Mon, 08 Feb 2021 10:45:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:54174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l98j3-000208-6i; Mon, 08 Feb 2021 10:45:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9141A64E50;
 Mon,  8 Feb 2021 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612799118;
 bh=W66X6fOPZEihJAv+IYVPydHlqPqVyPkhiOw4wd5JKiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5YqHpPvWMgHyaG6Ke2fmZQ8m4oXUAqhtoWuZI7ckERpKS9H5pU8b4gcUd4Cay/Wx
 1WjIw15vZN1JjRa75C8CPX8EqexZidZoW1FVnGR2Wd1SuhjDi/vvVYhUDfjDbDSNqp
 vq5taSohCQvm51kSFLjcbT+LELKyu9cyu1Sh5pwoYnbit+1I+jCOVKF1ou8e4K48pf
 h1/MUpqz/UOYAgN1g/sK8kQr2qVY0B0dbxGS1aQsDNbSq7RJtoy5NdANnArr4QpMQR
 qxm+4RMkjY02XhCk9SSbjaCELZ9XAKmw6/QXBLCbZDjoXvgCuQJu0PD8tD3hV2LFJR
 xYx1R62rf1LDA==
Date: Tue, 9 Feb 2021 00:45:15 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v2 4/8] hw/block/nvme: try to deal with the iov/qsg
 duality
Message-ID: <20210208154515.GC16360@redsun51.ssa.fujisawa.hgst.com>
References: <20210207214940.281889-1-its@irrelevant.dk>
 <20210207214940.281889-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207214940.281889-5-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 07, 2021 at 10:49:36PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Introduce NvmeSg and try to deal with that pesky qsg/iov duality that
> haunts all the memory-related functions.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.h |   8 ++-
>  hw/block/nvme.c | 171 ++++++++++++++++++++++++------------------------
>  2 files changed, 90 insertions(+), 89 deletions(-)
> 
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index cb2b5175f1a1..0e4fbd6990ad 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -29,6 +29,11 @@ typedef struct NvmeAsyncEvent {
>      NvmeAerResult result;
>  } NvmeAsyncEvent;
>  
> +typedef struct NvmeSg {
> +    QEMUSGList   qsg;
> +    QEMUIOVector iov;
> +} NvmeSg;

It's always one or the other, right? If so, this could be a 'union'
type, and then you'd just need an indicator field to say which type it
is. There may be a meaninful memory savings that way since we
potentially allocate thousands of these.

