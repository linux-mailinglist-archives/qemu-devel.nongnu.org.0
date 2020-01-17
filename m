Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F51407E3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 11:26:20 +0100 (CET)
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isOpX-0000aR-0Q
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 05:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1isOno-0007pm-BD
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:24:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1isOnk-0003NQ-Ce
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:24:31 -0500
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:47084)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1isOnk-0003JQ-61
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:24:28 -0500
Received: from player794.ha.ovh.net (unknown [10.108.16.68])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 84C0223DCF4
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:24:25 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id ADA28B52EA1A;
 Fri, 17 Jan 2020 10:24:23 +0000 (UTC)
Date: Fri, 17 Jan 2020 11:24:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 02/11] 9pfs: require msize >= 4096
Message-ID: <20200117112421.4311c21f@bahia.lan>
In-Reply-To: <2330562.Ag4oC6Dxye@silver>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
 <2705438.6bQikqVx44@silver> <20200116190748.6a656af8@bahia.lan>
 <2330562.Ag4oC6Dxye@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10041056846381029696
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdejgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.172.249
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 22:39:19 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 16. Januar 2020 19:07:48 CET Greg Kurz wrote:
> > > The point here was that there must be some kind of absolute minimum msize,
> > 
> > Then the absolute minimum size is 7, the size of the header part that is
> > common to all messages:
> > 
> > size[4] Message tag[2]
> > 
> > > even though the protocol specs officially don't mandate one. And if a
> > > client choses a msize < P9_IOHDRSZ, what useful actions shall it be able
> > > to do?
> > I haven't checked but I guess some messages can fit in 24 bytes.
> > 
> > > That's why I mentioned P9_IOHDRSZ just in case somebody might come up
> > > later
> > > asking to lower that minimum msize value for whatever reason.
> > 
> > That's precisely what I want to avoid. The semantic of P9_IOHDRSZ is
> > that it is the header size of a Twrite message and as such it is used
> > to compute the 'iounit' which the guest later uses to compute a
> > suitable 'count' for Tread/Twrite messages only. It shouldn't be
> > involved in msize considerations IMHO.
> > 
> > > But np, IMO this sentence makes the fundamental requirement for this patch
> > > more clear, but I have no problem dropping this sentence.
> > 
> > Then you can mention 7 has the true minimal size.
> 
> Ok, I'll drop P9_IOHDRSZ completely and mention literal 7 as absolute 
> theoretical minimum instead.
> 
> > > > > Furthermore there are some responses which are not allowed by the 9p
> > > > > protocol to be truncated like e.g. Rreadlink which may yield up to
> > > > 
> > > > No message may be truncated in any way actually. The spec just allows
> > > > an exception with the string part of Rerror.
> > > 
> > > Rreaddir, Rread, Twrite, Rerror can be truncated. So I suggest I'll just
> > > change that to s/some/most/ semantically.
> > 
> > I mean truncate with loss of data. Rreaddir can return less than 'count'
> > but it won't truncate an individual entry. It rewinds to the previous
> > one and returns its offset for the next Treaddir. Same goes with Rread
> > and Twrite, we always return a 'count' that can be used by the client
> > to continue reading or writing.
> 
> Individual entries are not truncated, correct, but data loss: Example, you 
> have this directory and say server's fs would deliver entries by readdir() in 
> this order (from top down):
> 
> 	.
> 	..
> 	a
> 	1234567890
> 	b
> 	c
> 	d
> 
> and say 37 >= msize < 45, then client would receive 3 entries ".", "..", "a" 
> and that's it.
> 

Yes msize < 45 isn't enough to send the Rreaddir for "1234567890"
and since it is forbidden to truncate, we bail out... but we
did not send a truncated message still.

> > Rerror is really the only message where we can deliberately drop
> > data (but we actually don't do that).
> > 
> > > > Maybe just mention that and say we choose 4096 to be able to send
> > > > big Rreadlink messages.
> > > 
> > > That's not the point for this patch. The main purpose is to avoid having
> > > to
> > > maintain individual error prone minimum msize checks all over the code
> > > base. If we would allow very small msizes (much smaller than 4096), then
> > > we would need to add numerous error handlers all over the code base, each
> > > one checking for different values (depending on the specific message
> > > type).
> > 
> > I'm not sure what you mean by 'minimum msize checks all over the code
> > base'... Please provide an example.
> 
> 1. Like done in this patch series: Treaddir has to limit client's 'count'
>    parameter according to msize (by subtracting with msize).
> 

Hmm... this patch does a sanity check on 'count', not on 'msize'... I
mean no matter what msize is, clipping count to msize - 11 gives a
chance to stop processing the entries before overflowing the transport
buffer.

> 2. get_iounit() does this:
> 
> 		iounit = stbuf.f_bsize;
> 		iounit *= (s->msize - P9_IOHDRSZ) / stbuf.f_bsize;
> 
>    without checking anywhere for a potential negative outcome
>    (i.e. when msize < P9_IOHDRSZ)
> 

This function should even have an assert() for that, just to be
sure no one tries to call it before s->msize is even set, which
would clearly be a bug in QEMU. But this can be done in a
follow-up patch.

> 3. Example of directory entry name length with Rreaddir above.
> 

msize being too small to accommodate an Rreaddir with a single
entry is a different problem as we cannot do anything about it
at this point but fail... That's why the minimum msize should
rather be chosen with file names in mind, which are likely to
be longer than any message header. Rreadlink being the one with
the higher potential since it will usually return a string
containing a path name (while Rreaddir entries only contain
a single path element).

> Individual issues that can easily be overlooked but also easily avoided by not 
> allowing small msizes in the first place.
> 

My point is that we're not going to check msize in Tversion in
order to to avoid multiple checks everywhere. We're going to do
it there because it is the only place where it makes sense to
do it.

> Best regards,
> Christian Schoenebeck
> 
> 


