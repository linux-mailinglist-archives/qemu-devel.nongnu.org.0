Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41721232574
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 21:32:27 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0roQ-00053Q-1C
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 15:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0rnB-0004JE-Dm; Wed, 29 Jul 2020 15:31:09 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0rn7-0005Fv-Sh; Wed, 29 Jul 2020 15:31:08 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id DAD25BF616;
 Wed, 29 Jul 2020 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596051060;
 bh=1lgkdDh8czYIJqt8+LvAyeLW+yQcUwWHijgj1c1cHX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NK2h8TJRhFr7VtQgBEWYhjzRUayOlVRj6gPQuZnGTA/kguk7YiBX5gZc2PJBUWcSN
 QprxUdp6llp/8KcQ53IG7WpXcFfolrnFndd4j0vh1e36wCGdMfUpLpE2G48syNuJyo
 E2vWw5vM+STrpLn3Jf4MyDptGI+siG4Agb8QLQrG7VrOmXKpAZj5Ms8ZInUs7MF5P5
 r5EaLqwdR+IWKFIsHqH4MsvBWpbK3DLmvwWYjsKyvSRz2OAkCi7P2rytLpm7fM7GEu
 jrETVlogFUFpWSt22KQd2Wp7pvtitsYPvZ00kGFkzLgWzVTEYxrExzVXacUEklfBnp
 VFtywxCJuAyiw==
Date: Wed, 29 Jul 2020 21:30:58 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 10/16] hw/block/nvme: add check for mdts
Message-ID: <20200729193058.GB271829@apples.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-11-its@irrelevant.dk>
 <20200729160024.GI14876@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200729160024.GI14876@localhost.localdomain>
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

On Jul 30 01:00, Minwoo Im wrote:
> On 20-07-20 13:37:42, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Add 'mdts' device parameter to control the Maximum Data Transfer Size of
> > the controller and check that it is respected.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  hw/block/nvme.c       | 32 ++++++++++++++++++++++++++++++--
> >  hw/block/nvme.h       |  1 +
> >  hw/block/trace-events |  1 +
> >  3 files changed, 32 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 35bc1a7b7e21..10fe53873ae9 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -18,9 +18,10 @@
> >   * Usage: add options:
> >   *      -drive file=<file>,if=none,id=<drive_id>
> >   *      -device nvme,drive=<drive_id>,serial=<serial>,id=<id[optional]>, \
> > - *              cmb_size_mb=<cmb_size_mb[optional]>, \
> > + *              [cmb_size_mb=<cmb_size_mb>,] \
> >   *              [pmrdev=<mem_backend_file_id>,] \
> > - *              max_ioqpairs=<N[optional]>
> > + *              [max_ioqpairs=<N>,] \
> > + *              [mdts=<N>]
> 
> Nitpick:
>   cmb and ioqpairs-things could be in another thread. :)
> 

So, with that I wanted to align the way optional parameters was
described. And I actually messed it up anyway. I'll remove the "fixes"
and just keep the addition of mdts there. 

