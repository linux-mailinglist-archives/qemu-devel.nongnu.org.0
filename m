Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1A342F6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 11:15:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY5XJ-00054u-Mt
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 05:15:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hY5WA-0004jX-9F
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hY5W8-0004zj-Uo
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:14:06 -0400
Received: from charlie.dont.surf ([128.199.63.193]:36682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hY5W6-0004w9-GE; Tue, 04 Jun 2019 05:14:02 -0400
Received: from apples.localdomain (soho-cph.cust-cnex.dsd101.net
	[194.62.216.132])
	by charlie.dont.surf (Postfix) with ESMTPSA id 4E955BFCD3;
	Tue,  4 Jun 2019 09:14:00 +0000 (UTC)
Date: Tue, 4 Jun 2019 11:13:58 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190604091358.GB11013@apples.localdomain>
Mail-Followup-To: Kevin Wolf <kwolf@redhat.com>,
	"Heitke, Kenneth" <kenneth.heitke@intel.com>, mreitz@redhat.com,
	keith.busch@intel.com, qemu-block@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
References: <20190520174030.1647-1-kenneth.heitke@intel.com>
	<20190528061836.GB32236@apples.localdomain>
	<20190603111409.GD6523@linux.fritz.box>
	<a58ef975-78f2-9c5c-35c2-b2dd359a4c03@intel.com>
	<20190604082828.GA11013@apples.localdomain>
	<20190604084645.GB14925@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604084645.GB14925@linux.fritz.box>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
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
Cc: qemu-block@nongnu.org, "Heitke, Kenneth" <kenneth.heitke@intel.com>,
	qemu-devel@nongnu.org, mreitz@redhat.com, keith.busch@intel.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 04, 2019 at 10:46:45AM +0200, Kevin Wolf wrote:
> Am 04.06.2019 um 10:28 hat Klaus Birkelund geschrieben:
> > On Mon, Jun 03, 2019 at 09:30:53AM -0600, Heitke, Kenneth wrote:
> > > 
> > > 
> > > On 6/3/2019 5:14 AM, Kevin Wolf wrote:
> > > > Am 28.05.2019 um 08:18 hat Klaus Birkelund geschrieben:
> > > > > On Mon, May 20, 2019 at 11:40:30AM -0600, Kenneth Heitke wrote:
> > > > > > Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>
> > > > 
> > > > > > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > > > > > index 56c9d4b4b1..d7277e72b7 100644
> > > > > > --- a/hw/block/nvme.h
> > > > > > +++ b/hw/block/nvme.h
> > > > > > @@ -69,6 +69,7 @@ typedef struct NvmeCtrl {
> > > > > >       uint16_t    max_prp_ents;
> > > > > >       uint16_t    cqe_size;
> > > > > >       uint16_t    sqe_size;
> > > > > > +    uint16_t    oncs;
> > > > > 
> > > > > Looks like this unused member snuck its way into the patch. But I see no
> > > > > harm in it being there.
> > > > 
> > > > Good catch. I'll just remove it again from my branch.
> > > > 
> > > > > > +static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
> > > > > > +{
> > > > > > +    trace_nvme_setfeat_timestamp(ts);
> > > > > > +
> > > > > > +    n->host_timestamp = le64_to_cpu(ts);
> > > > > > +    n->timestamp_set_qemu_clock_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> > > > > > +}
> > > > > > +
> > > > > > +static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
> > > > > > +{
> > > > > > +    uint64_t current_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> > > > 
> > > > Here I wonder why we use QEMU_CLOCK_REALTIME in a device emulation.
> > > > Wouldn't QEMU_CLOCK_VIRTUAL make more sense?
> > > > 
> > > 
> > > QEMU_CLOCK_VIRTUAL probably would make more sense. When I was reading
> > > through the differences I wasn't really sure what to pick. iven that this is
> > > the time within the device's context, the virtual time seems more correct.
> > > 
> >  
> > I thought about this too when I reviewed, but came to the conclusion
> > that REALTIME was correct. The timestamp is basically a value that the
> > host stores in the controller. When the host uses Get Features to get
> > the the current time it would expect it to match the progression for its
> > own wall clockright? If I understand REALTIME vs VIRTUAL correctly,
> > using VIRTUAL, it would go way out of sync.
> 
> Which two things would go out of sync with VIRTUAL?
> 
> Not an expert on clocks myself, but I think the main question is what
> happens to the clock while the VM is stopped. REALTIME continues running
> where as VIRTUAL is stopped. If we expose REALTIME measurements to the
> guest, the time passed may look a lot longer than what the guest's clock
> actually says. So this is the thing I am worried would go out of sync
> with REALTIME.
> 

OK, fair point.

Thinking about this some more, I agree that VIRTUAL is more correct. An
application should never track elapsed time using real wall clock time,
but some monotonic clock that is oblivious to say NTP adjustments.

Klaus

