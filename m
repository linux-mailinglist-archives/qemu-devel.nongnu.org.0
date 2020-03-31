Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B3198BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 07:43:13 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ9g8-0007vH-GP
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 01:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jJ9dd-0003uF-Bt
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:40:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jJ9db-0002Vq-QZ
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:40:37 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jJ9dZ-0002TQ-9F; Tue, 31 Mar 2020 01:40:33 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 2D587BF48F;
 Tue, 31 Mar 2020 05:40:32 +0000 (UTC)
Date: Tue, 31 Mar 2020 07:40:29 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v6 10/42] nvme: refactor device realization
Message-ID: <20200331054029.4uretg7luhtjfixg@apples.localdomain>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-11-its@irrelevant.dk>
 <90747b4189423d1f29917e8980b91373f6eb6523.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90747b4189423d1f29917e8980b91373f6eb6523.camel@redhat.com>
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

On Mar 25 12:40, Maxim Levitsky wrote:
> On Mon, 2020-03-16 at 07:28 -0700, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > This patch splits up nvme_realize into multiple individual functions,
> > each initializing a different subset of the device.
> > 
> > Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
> > Acked-by: Keith Busch <kbusch@kernel.org>
> > ---
> >  hw/block/nvme.c | 178 ++++++++++++++++++++++++++++++------------------
> >  hw/block/nvme.h |  23 ++++++-
> >  2 files changed, 134 insertions(+), 67 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 7dfd8a1a392d..665485045066 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1340,57 +1337,100 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> >          n->params.max_ioqpairs = n->params.num_queues - 1;
> >      }
> >  
> > -    if (!n->params.max_ioqpairs) {
> > -        error_setg(errp, "max_ioqpairs can't be less than 1");
> > +    if (params->max_ioqpairs < 1 ||
> > +        params->max_ioqpairs > PCI_MSIX_FLAGS_QSIZE) {
> > +        error_setg(errp, "nvme: max_ioqpairs must be ");
> Looks like the error message is not complete now.

Fixed!

> 
> Small nitpick: To be honest this not only refactoring in the device realization since you also (rightfully)
> removed the duplicated cmbsz/cmbloc so I would add a mention for this in the commit message.
> But that doesn't matter that much, so
> 

You are right. I've added it as a separate patch.

> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Best regards,
> 	Maxim Levitsky
> 


