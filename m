Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99520F9A8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 18:41:18 +0200 (CEST)
Received: from localhost ([::1]:36166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqJJt-0001JL-0S
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 12:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jqJIl-0000ZE-R7
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 12:40:07 -0400
Received: from 17.mo7.mail-out.ovh.net ([188.165.35.227]:39090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jqJIj-0006gk-GK
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 12:40:07 -0400
Received: from player728.ha.ovh.net (unknown [10.110.115.113])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 54C6816EF97
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 18:40:02 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 9CC7413D3178C;
 Tue, 30 Jun 2020 16:40:00 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fe997039-0a2a-4543-8ac8-686910461166,321FFE8278D843C460097280AF09A0BF63DC926D)
 smtp.auth=groug@kaod.org
Date: Tue, 30 Jun 2020 18:39:57 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v6 4/5] 9pfs: T_readdir latency optimization
Message-ID: <20200630183957.38b63719@bahia.lan>
In-Reply-To: <33906767.5Uf7ihArhA@silver>
References: <cover.1587309014.git.qemu_oss@crudebyte.com>
 <3959658.0YslYoXCm0@silver> <20200629183902.75d6fb0b@bahia.lan>
 <33906767.5Uf7ihArhA@silver>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7701436838296656192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrtddtgdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheekhfdtheegheehjeeludefkefhvdelfedvieehhfekhfdufffhueeuvdfftdfhnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.35.227; envelope-from=groug@kaod.org;
 helo=17.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 12:40:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jun 2020 17:16:40 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 29. Juni 2020 18:39:02 CEST Greg Kurz wrote:
> > On Wed, 03 Jun 2020 19:16:08 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Sonntag, 19. April 2020 17:06:17 CEST Christian Schoenebeck wrote:
> > > > Make top half really top half and bottom half really bottom half:
> > > > 
> > > > Each T_readdir request handling is hopping between threads (main
> > > > I/O thread and background I/O driver threads) several times for
> > > > every individual directory entry, which sums up to huge latencies
> > > > for handling just a single T_readdir request.
> > > > 
> > > > Instead of doing that, collect now all required directory entries
> > > > (including all potentially required stat buffers for each entry) in
> > > > one rush on a background I/O thread from fs driver by calling the
> > > > previously added function v9fs_co_readdir_many() instead of
> > > > v9fs_co_readdir(), then assemble the entire resulting network
> > > > response message for the readdir request on main I/O thread. The
> > > > fs driver is still aborting the directory entry retrieval loop
> > > > (on the background I/O thread inside of v9fs_co_readdir_many())
> > > > as soon as it would exceed the client's requested maximum R_readdir
> > > > response size. So this will not introduce a performance penalty on
> > > > another end.
> > > > 
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > > 
> > > >  hw/9pfs/9p.c | 122 +++++++++++++++++++++++----------------------------
> > > >  1 file changed, 55 insertions(+), 67 deletions(-)
> > > 
> > > Ping. Anybody?
> > > 
> > > I would like to roll out this patch set soon and this is the only patch in
> > > this series missing a review yet.
> > 
> > Hi Christian,
> 
> Hi Greg,
> 
> > Sorry for getting back to this only now :-\
> > 
> > So I still have some concerns about the locking of the directory stream
> > pointer a fid. It was initially introduced to avoid concurrent accesses
> > by multiple threads to the corresponding internal glibc object, as
> > recommended in the readdir(3) manual page. Now, this patch considerably
> > extends the critical section to also contain calls to telldir() and all
> > the _many_ readdir()... so I'm not sure exactly what's the purpose of
> > that mutex right now. Please provide more details.
> 
> The intention of this lock is to prevent concurrent r/w (i.e. telldir()/
> readdir()) of the dir stream position by two or more active readdir requests 
> handled in parallel, provided that they would use the same FID. Due to the 
> latter requirement for this to become relevant, we already agreed that this is 
> not something that would usually happen with a Linux 9p client, but there is 
> nothing from protocol point of view that would prohibit this to be done by a 
> client, so the resulting undefined behaviour should be prevented, which this 
> lock does.
> 

Makes sense. The dir stream position is no different from glibc's internal
dirent in that respect: it shouldn't be used by concurrent threads.

> What's your precise concern?
> 

My overall concern is still the same. The patches are big and I've
been away for too long, so I need some more discussion to reassemble
my thoughts and the puzzle :)

But now that I'm starting to understand why it's a good thing to
extend the critical section, I realize it should be extended
even more: we also have calls to seekdir() and rewindir() in
v9fs_readdir() and friends that could _theoretically_ cause the
very same kind of undefined behavior you're mentioning.

I think the change is important enough that it deserves its
own patch. I expect that moving the locking to the top-level
handler might also simplify the existing code, and thus your
series as well.

Please let me come up with a patch first.

> Best regards,
> Christian Schoenebeck
> 
> 

Cheers,

--
Greg

