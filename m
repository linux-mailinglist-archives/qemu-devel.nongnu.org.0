Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E35198BC5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 07:39:16 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ9cJ-0000wT-2h
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 01:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jJ9bL-0000K4-Lj
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jJ9bK-0001Xh-I5
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:38:15 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jJ9bH-0001Vx-3I; Tue, 31 Mar 2020 01:38:11 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 00638BF48F;
 Tue, 31 Mar 2020 05:38:08 +0000 (UTC)
Date: Tue, 31 Mar 2020 07:38:05 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v6 01/42] nvme: rename trace events to nvme_dev
Message-ID: <20200331053805.rqfok6siw4uy3aw7@apples.localdomain>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-2-its@irrelevant.dk>
 <8050d18ab4502a36e3f39282b497ea905be82f1a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8050d18ab4502a36e3f39282b497ea905be82f1a.camel@redhat.com>
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

On Mar 25 12:36, Maxim Levitsky wrote:
> On Mon, 2020-03-16 at 07:28 -0700, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Change the prefix of all nvme device related trace events to 'nvme_dev'
> > to not clash with trace events from the nvme block driver.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Acked-by: Keith Busch <kbusch@kernel.org>
> > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  hw/block/nvme.c       | 188 +++++++++++++++++++++---------------------
> >  hw/block/trace-events | 172 +++++++++++++++++++-------------------
> >  2 files changed, 180 insertions(+), 180 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index d28335cbf377..3e4b18956ed2 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1035,32 +1035,32 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
> >      switch (offset) {
> >      case 0xc:   /* INTMS */
> >          if (unlikely(msix_enabled(&(n->parent_obj)))) {
> > -            NVME_GUEST_ERR(nvme_ub_mmiowr_intmask_with_msix,
> > +            NVME_GUEST_ERR(nvme_dev_ub_mmiowr_intmask_with_msix,
> >                             "undefined access to interrupt mask set"
> >                             " when MSI-X is enabled");
> >              /* should be ignored, fall through for now */
> >          }
> >          n->bar.intms |= data & 0xffffffff;
> >          n->bar.intmc = n->bar.intms;
> > -        trace_nvme_mmio_intm_set(data & 0xffffffff,
> > +        trace_nvme_dev_mmio_intm_set(data & 0xffffffff,
> >                                   n->bar.intmc);
> Indention.
> 

Fixed.

> >          nvme_irq_check(n);
> >          break;
> >      case 0x10:  /* INTMC */
> >          if (unlikely(msix_enabled(&(n->parent_obj)))) {
> > -            NVME_GUEST_ERR(nvme_ub_mmiowr_intmask_with_msix,
> > +            NVME_GUEST_ERR(nvme_dev_ub_mmiowr_intmask_with_msix,
> >                             "undefined access to interrupt mask clr"
> >                             " when MSI-X is enabled");
> >              /* should be ignored, fall through for now */
> >          }
> >          n->bar.intms &= ~(data & 0xffffffff);
> >          n->bar.intmc = n->bar.intms;
> > -        trace_nvme_mmio_intm_clr(data & 0xffffffff,
> > +        trace_nvme_dev_mmio_intm_clr(data & 0xffffffff,
> >                                   n->bar.intmc);
> Indention.
> 

Fixed.

> 
> 
> Other that indention nitpicks, no changes vs V5,
> so my reviewed-by kept correctly.
> 
> Best regards,
> 	Maxim Levitsky
> 

