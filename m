Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F415D2137D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 07:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRVXs-0004xT-QL
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 01:36:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRVWe-0004Py-Mi
	for qemu-devel@nongnu.org; Fri, 17 May 2019 01:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRVWd-00041F-MC
	for qemu-devel@nongnu.org; Fri, 17 May 2019 01:35:24 -0400
Received: from charlie.dont.surf ([128.199.63.193]:39762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hRVWV-0003tA-T5; Fri, 17 May 2019 01:35:17 -0400
Received: from apples.localdomain (ip-5-186-120-196.cgn.fibianet.dk
	[5.186.120.196])
	by charlie.dont.surf (Postfix) with ESMTPSA id 8CB4CBF488;
	Fri, 17 May 2019 05:35:08 +0000 (UTC)
Date: Fri, 17 May 2019 07:35:04 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: "Heitke, Kenneth" <kenneth.heitke@intel.com>
Message-ID: <20190517053504.GA17341@apples.localdomain>
Mail-Followup-To: "Heitke, Kenneth" <kenneth.heitke@intel.com>,
	qemu-block@nongnu.org, keith.busch@intel.com, kwolf@redhat.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
References: <20190405214117.1850-1-kenneth.heitke@intel.com>
	<20190514060225.GA1350@apples.localdomain>
	<1f607df5-b523-e517-c439-392725fd441b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f607df5-b523-e517-c439-392725fd441b@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] nvme: add Get/Set Feature
 Timestamp support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: keith.busch@intel.com, kwolf@redhat.com, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kenneth,

On Thu, May 16, 2019 at 05:24:47PM -0600, Heitke, Kenneth wrote:
> Hi Klaus, thank you for you review. I have one comment inline
> 
> On 5/14/2019 12:02 AM, Klaus Birkelund wrote:
> > On Fri, Apr 05, 2019 at 03:41:17PM -0600, Kenneth Heitke wrote:
> > > Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>
> > > ---
> > >   hw/block/nvme.c       | 120 +++++++++++++++++++++++++++++++++++++++++-
> > >   hw/block/nvme.h       |   3 ++
> > >   hw/block/trace-events |   2 +
> > >   include/block/nvme.h  |   2 +
> > >   4 files changed, 125 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 7caf92532a..e775e89299 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -219,6 +219,30 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
> > >       return NVME_INVALID_FIELD | NVME_DNR;
> > >   }
> > > +static uint16_t nvme_dma_write_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> > > +                                   uint64_t prp1, uint64_t prp2)
> > > +{
> > > +    QEMUSGList qsg;
> > > +    QEMUIOVector iov;
> > > +    uint16_t status = NVME_SUCCESS;
> > > +
> > > +    if (nvme_map_prp(&qsg, &iov, prp1, prp2, len, n)) {
> > > +        return NVME_INVALID_FIELD | NVME_DNR;
> > > +    }
> > > +    if (qsg.nsg > 0) {
> > > +        if (dma_buf_write(ptr, len, &qsg)) {
> > > +            status = NVME_INVALID_FIELD | NVME_DNR;
> > > +        }
> > > +        qemu_sglist_destroy(&qsg);
> > > +    } else {
> > > +        if (qemu_iovec_from_buf(&iov, 0, ptr, len) != len) {
> > 
> > This should be `qemu_iovec_to_buf`.
> > 
> 
> This function is transferring data from the "host" to the device so I
> believe I am using the correct function.
> 

Exactly, but this means that you need to populate `ptr` with data
described by the prps, hence dma_buf_*write* and qemu_iovec_*to*_buf. In
this case `ptr` is set to the address of the uint64_t timestamp, and
that is what we need to write to.

