Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B1232554
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 21:23:52 +0200 (CEST)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0rg2-0001Fo-Da
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 15:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0rfD-0000Wp-Ue; Wed, 29 Jul 2020 15:22:55 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0rf9-00045B-Ld; Wed, 29 Jul 2020 15:22:55 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id C4386BF616;
 Wed, 29 Jul 2020 19:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596050569;
 bh=FGTqORHllUubxttiPoV6COY60GPcNImdo4SkTGJHLYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g61+GWI+FkcGlehy36P3De/2gJ59Ilq/geZRJFhSF143bm8/cjoSwxcQPXzNs7M68
 rXVXunmKxnMCdPu+JA+By3iGOTKvqDWFszx0XFXKknm8f3T+cDYkaR9roYgByQxnaX
 9VOos7/BUqv3l1L3hEQimcPzhTVyaAPsz/eCuv272OGvqKG+TGCJar1JZeUzXUEd6N
 TZnhmC96Nv4XBHCW7mE2Ph8z4RonFUkSNjMv6ta8DRGohPjYx5TLBVKiKvu42QD/aY
 Jk5G1DlukyAtlX5AfdReD+VqixUTTeTDdgr755kp+x9L4aVRUumpRh1+iUfiI9hRlO
 yWVdY3eVtkPOw==
Date: Wed, 29 Jul 2020 21:22:45 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 07/16] hw/block/nvme: add request mapping helper
Message-ID: <20200729192245.GA271829@apples.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-8-its@irrelevant.dk>
 <20200729155245.GF14876@localhost.localdomain>
 <d89a0ffd19977bc932003c6991270ab6d304c9d1.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d89a0ffd19977bc932003c6991270ab6d304c9d1.camel@redhat.com>
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
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 29 21:31, Maxim Levitsky wrote:
> On Thu, 2020-07-30 at 00:52 +0900, Minwoo Im wrote:
> > Klaus,
> > 
> > On 20-07-20 13:37:39, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > > 
> > > Introduce the nvme_map helper to remove some noise in the main nvme_rw
> > > function.
> > > 
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > ---
> > >  hw/block/nvme.c | 13 ++++++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index f1e04608804b..68c33a11c144 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -413,6 +413,15 @@ static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> > >      return status;
> > >  }
> > >  
> > > +static uint16_t nvme_map(NvmeCtrl *n, NvmeCmd *cmd, size_t len,
> > > +                         NvmeRequest *req)
> > 
> > Can we specify what is going to be mapped in this function? like
> > nvme_map_dptr?
> I also once complained about the name, and I do like this idea!
> 

Hehe. I will change it ;)

Note that when I post support for metadata, it will have to change
again! Because then the function will be mapping both DPTR and MPTR.
But lets discuss naming when we get to that ;)

