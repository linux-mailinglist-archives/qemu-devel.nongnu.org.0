Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30820186626
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 09:13:39 +0100 (CET)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDksT-00050F-Qu
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 04:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDkTq-0005aa-SS
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 03:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDkTp-0001d2-K1
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 03:48:10 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47690)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDkTm-0000s1-Ht; Mon, 16 Mar 2020 03:48:06 -0400
Received: from apples.localdomain (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id 3AE0CBF5E1;
 Mon, 16 Mar 2020 07:48:05 +0000 (UTC)
Date: Mon, 16 Mar 2020 00:48:01 -0700
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v5 14/26] nvme: make sure ncqr and nsqr is valid
Message-ID: <20200316074801.3ckjre3i7gzn2cdl@apples.localdomain>
References: <20200204095208.269131-1-k.jensen@samsung.com>
 <CGME20200204095224eucas1p10807239f5dc4aa809650c85186c426a8@eucas1p1.samsung.com>
 <20200204095208.269131-15-k.jensen@samsung.com>
 <2c5efa159da9d0a5f128ca85374e457134b55f31.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c5efa159da9d0a5f128ca85374e457134b55f31.camel@redhat.com>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb 12 12:30, Maxim Levitsky wrote:
> On Tue, 2020-02-04 at 10:51 +0100, Klaus Jensen wrote:
> > 0xffff is not an allowed value for NCQR and NSQR in Set Features on
> > Number of Queues.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 30c5b3e7a67d..900732bb2f38 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1133,6 +1133,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >          blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
> >          break;
> >      case NVME_NUMBER_OF_QUEUES:
> > +        if ((dw11 & 0xffff) == 0xffff || ((dw11 >> 16) & 0xffff) == 0xffff) {
> > +            return NVME_INVALID_FIELD | NVME_DNR;
> > +        }
> Very minor nitpick: since this spec requirement is not obvious, a quote/reference to the spec
> would be nice to have here. 
> 

Added.

> > +
> >          trace_nvme_dev_setfeat_numq((dw11 & 0xFFFF) + 1,
> >              ((dw11 >> 16) & 0xFFFF) + 1, n->params.num_queues - 1,
> >              n->params.num_queues - 1);
> 
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Best regards,
> 	Maxim Levitsky
> 

