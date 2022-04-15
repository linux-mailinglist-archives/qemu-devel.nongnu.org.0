Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F15502FF5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 23:13:59 +0200 (CEST)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfTGQ-0004L5-7A
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 17:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nfSTx-0007VV-4N; Fri, 15 Apr 2022 16:23:53 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:34308 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nfSTv-0008Hk-B3; Fri, 15 Apr 2022 16:23:52 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CD6C24596E;
 Fri, 15 Apr 2022 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1650054227;
 x=1651868628; bh=pHayoYghf46HiFS0t8q//LqHX42B96xPJk5DkcCd9R0=; b=
 Fi8aCESpkKoudovTWuuJgLdGDbEA4HS4hpX+OqEYVi47UUXgkDZ384kEPc3WtdI1
 gCpk4K8E/h1cY9zf1+PPC4opeapGmaKmdnQhOXZWbmnvHr2xUx/UcdwwSuFlBy2z
 GaXoVGXT1fPbFh58ejDRl0EZ21/gPEYNeYDdJENHL3g=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmRroUDXYT0n; Fri, 15 Apr 2022 23:23:47 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D559542A70;
 Fri, 15 Apr 2022 23:23:46 +0300 (MSK)
Received: from localhost.localdomain (10.178.113.54) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 15 Apr 2022 23:23:45 +0300
Date: Fri, 15 Apr 2022 23:23:43 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: fix control flow statement
Message-ID: <20220415202343.cwfkilna4lqhcfhd@localhost.localdomain>
References: <20220415192721.tkbokbl65rrwkbew@localhost.localdomain>
 <YlnI8EONxaX/fnPZ@kbusch-mbp.dhcp.thefacebook.com>
 <YlnKjTc4FRkfsOv9@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YlnKjTc4FRkfsOv9@apples>
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Apr 2022 17:12:18 -0400
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
Cc: Keith Busch <kbusch@kernel.org>, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 15, 2022 at 21:42:05, Klaus Jensen wrote:
> On Apr 15 13:35, Keith Busch wrote:
> > On Fri, Apr 15, 2022 at 10:27:21PM +0300, Dmitry Tikhov wrote:
> > > Since there is no else after nvme_dsm_cb invocation, metadata associated
> > > with non-zero block range is currently zeroed. Also this behaviour leads
> > > to segfault since we schedule iocb->bh two times. First when entering
> > > nvme_dsm_cb with iocb->idx == iocb->nr and second on call stack unwinding
> > > by calling blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback
> > > because of missing else statement.
> > > 
> > > Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
> > > ---
> > >  hw/nvme/ctrl.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > index 03760ddeae..7ebd2aa326 100644
> > > --- a/hw/nvme/ctrl.c
> > > +++ b/hw/nvme/ctrl.c
> > > @@ -2372,11 +2372,12 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
> > >          }
> > >  
> > >          nvme_dsm_cb(iocb, 0);
> > > +    } else {
> > > +        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
> > > +                                            nvme_m2b(ns, nlb), BDRV_REQ_MAY_UNMAP,
> > > +                                            nvme_dsm_cb, iocb);
> > >      }
> > 
> > Instead of the 'else', just insert an early 'return;' after nvme_dsm_cb() like
> > the earlier condition above here. Otherwise, looks good, and thanks for the
> > fix.
> 
> Dmitry,
> 
> Agree with Keith - also, please add
> 
>   Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
> 
> Thanks again!

Ok, will do. Can i change patch subject text or it should stay
the same between submissions?

