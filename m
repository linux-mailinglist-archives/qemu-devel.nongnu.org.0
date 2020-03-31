Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAEF198BD5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 07:43:54 +0200 (CEST)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ9gn-0000mE-2f
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 01:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jJ9f3-000768-QH
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jJ9f2-0003Ni-Jn
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:42:05 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48026)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jJ9f0-0003MD-CO; Tue, 31 Mar 2020 01:42:02 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 07B5ABF48F;
 Tue, 31 Mar 2020 05:42:01 +0000 (UTC)
Date: Tue, 31 Mar 2020 07:41:57 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v6 19/42] nvme: enforce valid queue creation sequence
Message-ID: <20200331054157.p42lqssgc2c5uurl@apples.localdomain>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-20-its@irrelevant.dk>
 <250f6a203ee6db8f8f6b7232e555758a0a4be3a4.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <250f6a203ee6db8f8f6b7232e555758a0a4be3a4.camel@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mar 25 12:43, Maxim Levitsky wrote:
> On Mon, 2020-03-16 at 07:29 -0700, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Support returning Command Sequence Error if Set Features on Number of
> > Queues is called after queues have been created.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 7 +++++++
> >  hw/block/nvme.h | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 007f8817f101..b40d27cddc46 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -881,6 +881,8 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
> >      cq = g_malloc0(sizeof(*cq));
> >      nvme_init_cq(cq, n, prp1, cqid, vector, qsize + 1,
> >          NVME_CQ_FLAGS_IEN(qflags));
> > +
> > +    n->qs_created = true;
> Very minor nitpick, maybe it is worth mentioning in a comment,
> why this is only needed in CQ creation, as you explained to me.
> 

Added.

> 
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Best regards,
> 	Maxim Levitsky
> 
> 
> 
> 
> 

