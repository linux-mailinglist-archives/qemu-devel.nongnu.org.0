Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AE2325B5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 21:58:26 +0200 (CEST)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0sDZ-0005gu-7C
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 15:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0sCn-00050m-K7; Wed, 29 Jul 2020 15:57:38 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0sCk-00086u-VI; Wed, 29 Jul 2020 15:57:36 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 45C96BF616;
 Wed, 29 Jul 2020 19:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596052652;
 bh=GDEUIFzgcL+5zl8s2v3EUmWr5TyMvwsZyAaMVKBN3WI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y+SdwYnRY7U2c8rJv+SaSDFf2Z3pyrWLp6DBdACiocuzzXFmU2QZrxbkc41/nzSNK
 lFSBJu9brNE0B/i8/SMThknsBegMCwkaAhYfFCyLzK+dy0AquewPQT7MtLlpySiHtx
 yhA8hvVBuK41H0YTzOKVAJ9gVbi9o11FMgwV0wuzk3c1dClFzqpVbWoEEFwYL/h5sQ
 fsvQorKfLlH5e0swrIqHXj1BVdiuYF4/Px8E9nx5vHwAFGon6cYjQ7h51+XxUkt69I
 im63btE2SCjeNSJhwzFY87w4DssoUdmjiVC96B25pcX4nm2LFZTMj+wGh0Tfgvh27I
 0hHTB2GdQnBWw==
Date: Wed, 29 Jul 2020 21:57:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 16/16] hw/block/nvme: use preallocated qsg/iov in
 nvme_dma_prp
Message-ID: <20200729195730.GD293496@apples.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-17-its@irrelevant.dk>
 <20200729161548.GO14876@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200729161548.GO14876@localhost.localdomain>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On Jul 30 01:15, Minwoo Im wrote:
> On 20-07-20 13:37:48, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Since clean up of the request qsg/iov is now always done post-use, there
> > is no need to use a stack-allocated qsg/iov in nvme_dma_prp.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Acked-by: Keith Busch <kbusch@kernel.org>
> > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> > ---
> >  hw/block/nvme.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 0b3dceccc89b..b6da5a9f3fc6 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -381,45 +381,39 @@ static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> >                               uint64_t prp1, uint64_t prp2, DMADirection dir,
> >                               NvmeRequest *req)
> >  {
> > -    QEMUSGList qsg;
> > -    QEMUIOVector iov;
> >      uint16_t status = NVME_SUCCESS;
> >  
> > -    status = nvme_map_prp(n, &qsg, &iov, prp1, prp2, len, req);
> > +    status = nvme_map_prp(n, &req->qsg, &req->iov, prp1, prp2, len, req);
> 
> After this change, can we make nvme_map_prp() just receive
> NvmeRequest *req without &req->qsg, &req->iov by retrieve them from
> inside of the nvme_map_prp()?

Absolutely. I added a follow up patch to do this :)

