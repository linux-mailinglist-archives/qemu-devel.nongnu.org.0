Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4035A20F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:32:58 +0200 (CEST)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUt7x-0007Ei-Hd
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lUt5U-0005vv-CV; Fri, 09 Apr 2021 11:30:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lUt5S-0007iU-Ex; Fri, 09 Apr 2021 11:30:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C0B8610E5;
 Fri,  9 Apr 2021 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617982220;
 bh=iUau2GXF6zbdbTyXjG5SQ8atb90nW4e9RQrfxnV2nLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LNWCOFWV2qaZpqXr5W5XoKZFWz/0GiTZka+kuOiHfGRHGsjmDvrzPVI/3//VTDqa4
 LMjWk5g3HCX73WasD25Rl8IW9pjevSNfRACTo/XO+LWv5BZqievPmJtxRJ7ZK1kh0Y
 TiuYlOAdkD1iTAWJCkK94iAtn5Rj9KqnLiHkUlZOVLCdPHIiAvZB+V0/fgJ43/9yob
 mGvdzT4zthOnq9P1/UfDDiijrTRkgB2O6O850u7b6IxbS7DLAGDISJsQIa37FKG5KP
 gLLEpCYDbjHR0TJQbDIEKrUrd+YTdqAmfShgZvTYd+I8JW0+NahGT9lZtMsaoQ8Y2M
 ZsqsJW8QPr4jQ==
Date: Sat, 10 Apr 2021 00:30:17 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <20210409153017.GB32304@redsun51.ssa.fujisawa.hgst.com>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
 <20210409110518.GC2085@localhost>
 <YHBAlXnRdYTU1m1P@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHBAlXnRdYTU1m1P@apples.localdomain>
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, Minwoo Im <minwoo.im.dev@gmail.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 01:55:01PM +0200, Klaus Jensen wrote:
> On Apr  9 20:05, Minwoo Im wrote:
> > On 21-04-09 13:14:02, Gollu Appalanaidu wrote:
> > > NSZE is the total size of the namespace in logical blocks. So the max
> > > addressable logical block is NLB minus 1. So your starting logical
> > > block is equal to NSZE it is a out of range.
> > > 
> > > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > > ---
> > >  hw/block/nvme.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 953ec64729..be9edb1158 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
> > >              uint64_t slba = le64_to_cpu(range[i].slba);
> > >              uint32_t nlb = le32_to_cpu(range[i].nlb);
> > > 
> > > -            if (nvme_check_bounds(ns, slba, nlb)) {
> > > +            if (nvme_check_bounds(ns, slba, nlb) || slba == ns->id_ns.nsze) {
> > 
> > This patch also looks like check the boundary about slba.  Should it be
> > also checked inside of nvme_check_bounds() ?
> 
> The catch here is that DSM is like the only command where the number of
> logical blocks is a 1s-based value. Otherwise we always have nlb > 0, which
> means that nvme_check_bounds() will always "do the right thing".
> 
> My main gripe here is that (in my mind), by definition, a "zero length
> range" does not reference any LBAs at all. So how can it result in LBA Out
> of Range?

So what's the problem? If the request is to discard 0 blocks starting
from the last block, then that's valid. Is this patch actually fixing
anything?

