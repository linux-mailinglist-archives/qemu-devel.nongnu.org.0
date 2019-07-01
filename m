Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28973423D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 10:54:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY5Cs-00065A-Ru
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 04:54:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hY5As-0005CR-Ky
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hY5Ar-0001SA-JO
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:52:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hY55y-0007Gi-Le; Tue, 04 Jun 2019 04:47:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 118A6104C1;
	Tue,  4 Jun 2019 08:46:51 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3FC5B689;
	Tue,  4 Jun 2019 08:46:47 +0000 (UTC)
Date: Tue, 4 Jun 2019 10:46:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Heitke, Kenneth" <kenneth.heitke@intel.com>, mreitz@redhat.com,
	keith.busch@intel.com, qemu-block@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Message-ID: <20190604084645.GB14925@linux.fritz.box>
References: <20190520174030.1647-1-kenneth.heitke@intel.com>
	<20190528061836.GB32236@apples.localdomain>
	<20190603111409.GD6523@linux.fritz.box>
	<a58ef975-78f2-9c5c-35c2-b2dd359a4c03@intel.com>
	<20190604082828.GA11013@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604082828.GA11013@apples.localdomain>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 04 Jun 2019 08:46:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH v2] nvme: add Get/Set Feature
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.06.2019 um 10:28 hat Klaus Birkelund geschrieben:
> On Mon, Jun 03, 2019 at 09:30:53AM -0600, Heitke, Kenneth wrote:
> > 
> > 
> > On 6/3/2019 5:14 AM, Kevin Wolf wrote:
> > > Am 28.05.2019 um 08:18 hat Klaus Birkelund geschrieben:
> > > > On Mon, May 20, 2019 at 11:40:30AM -0600, Kenneth Heitke wrote:
> > > > > Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>
> > > 
> > > > > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > > > > index 56c9d4b4b1..d7277e72b7 100644
> > > > > --- a/hw/block/nvme.h
> > > > > +++ b/hw/block/nvme.h
> > > > > @@ -69,6 +69,7 @@ typedef struct NvmeCtrl {
> > > > >       uint16_t    max_prp_ents;
> > > > >       uint16_t    cqe_size;
> > > > >       uint16_t    sqe_size;
> > > > > +    uint16_t    oncs;
> > > > 
> > > > Looks like this unused member snuck its way into the patch. But I see no
> > > > harm in it being there.
> > > 
> > > Good catch. I'll just remove it again from my branch.
> > > 
> > > > > +static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
> > > > > +{
> > > > > +    trace_nvme_setfeat_timestamp(ts);
> > > > > +
> > > > > +    n->host_timestamp = le64_to_cpu(ts);
> > > > > +    n->timestamp_set_qemu_clock_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> > > > > +}
> > > > > +
> > > > > +static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
> > > > > +{
> > > > > +    uint64_t current_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> > > 
> > > Here I wonder why we use QEMU_CLOCK_REALTIME in a device emulation.
> > > Wouldn't QEMU_CLOCK_VIRTUAL make more sense?
> > > 
> > 
> > QEMU_CLOCK_VIRTUAL probably would make more sense. When I was reading
> > through the differences I wasn't really sure what to pick. iven that this is
> > the time within the device's context, the virtual time seems more correct.
> > 
>  
> I thought about this too when I reviewed, but came to the conclusion
> that REALTIME was correct. The timestamp is basically a value that the
> host stores in the controller. When the host uses Get Features to get
> the the current time it would expect it to match the progression for its
> own wall clockright? If I understand REALTIME vs VIRTUAL correctly,
> using VIRTUAL, it would go way out of sync.

Which two things would go out of sync with VIRTUAL?

Not an expert on clocks myself, but I think the main question is what
happens to the clock while the VM is stopped. REALTIME continues running
where as VIRTUAL is stopped. If we expose REALTIME measurements to the
guest, the time passed may look a lot longer than what the guest's clock
actually says. So this is the thing I am worried would go out of sync
with REALTIME.

Or did I read the code wrong and this isn't actually exposed to the
guest?

Kevin

