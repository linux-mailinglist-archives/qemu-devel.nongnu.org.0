Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305332ED8C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:59:25 +0100 (CET)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBvI-0001Hi-GN
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lIBu7-0000r5-BA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:58:11 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lIBu4-00035f-R6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=OCjB31jRrF5NsAhYCmtmSA4VIvxUrAeSy4dF2aX7weE=; b=sLqe1Pbih/jz/xyAuBvBPoFBsX
 Lqub8NbECl/fgrEO6t0p8MGw4E3LjqSvZr9JAECvlajv5y/Uo2kMqiwkQMD9wMqoUm5LdAL2/0+9W
 YAIvLJgUjywZYz8PZWHay/zlxE1hE78v82QKGq/6VbrIDwq/0Rvd6QgkjiG8wf86dbwR6/2lGnWsk
 ZNgu2d3QvoKVByDO9AODxqmXULSOnSD4t9XT5Fl65AClkz2JUzYurx86WwpGwpwrikgRar/swPShS
 A39YnSYDuiGwWrV5WHBIbEEylC9mV+KwbWlnYxxKRzGBJz+zVwZnJ4/IhLebDiHG3N4gaV/OSkHhS
 iuTL5m1jDcdUUOOc23ZV4myulZ8ZpYdD1nsYL/P2pGDkRw5/t2A6Lg4b6mcJIsbXVqsHVa37Ka1uG
 ksFQQH/IzYjpKrFWycZ1XViULV3wifpJ+gftrEeNrn4UlNmqjXHKh/593oAhcp1+gEKny7tLtqIbn
 4FG66iZLGLUYu2V0yOMDeGkm9lY9R0qwQuBQpEdz2Y+bK5syOlCFmdnj4Ix88flGk/WN4Wd7rwN6X
 v6vx9zkwB+37l8LEnByiWzwFEW0aijr1Uzc250bspwl7JG8q3630cucZQZ/c7J2XjgvD0j3RkwFKc
 YeUIo62xMLePakdih9RxwtNQbQzqhGiEQ44BEdmA8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Dominique Martinet <asmadeus@codewreck.org>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs-list <virtio-fs@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, v9fs-developer@lists.sourceforge.net,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Date: Fri, 05 Mar 2021 15:57:17 +0100
Message-ID: <32960057.KqypvAduHN@silver>
In-Reply-To: <YD+iPTKnOlF/HwlV@codewreck.org>
References: <20200918213436.GA3520@redhat.com> <1805660.C9YIKG4Ep7@silver>
 <YD+iPTKnOlF/HwlV@codewreck.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 3. M=E4rz 2021 15:50:37 CET Dominique Martinet wrote:
> Christian Schoenebeck wrote on Wed, Mar 03, 2021 at 03:04:21PM +0100:
> > > We can definitely increase the default, for all transports in my
> > > opinion.
> > > As a first step, 64 or 128k?
> >=20
> > Just to throw some numbers first; when linearly reading a 12 GB file on
> > guest (i.e. "time cat test.dat > /dev/null") on a test machine, these a=
re
> > the results that I get (cache=3Dmmap):
> >=20
> > msize=3D16k: 2min7s (95 MB/s)
> > msize=3D64k: 17s (706 MB/s)
> > msize=3D128k: 12s (1000 MB/s)
> > msize=3D256k: 8s (1500 MB/s)
> > msize=3D512k: 6.5s (1846 MB/s)
> >=20
> > Personally I would raise the default msize value at least to 128k.
>=20
> Thanks for the numbers.
> I'm still a bit worried about too large chunks, let's go with 128k for
> now -- I'll send a couple of patches increasing the tcp max/default as
> well next week-ish.

Ok, sounds good!

> > Personally I don't find raw I/O the worst performance issue right now. =
As
> > you can see from the numbers above, if 'msize' is raised and I/O being
> > performed with large chunk sizes (e.g. 'cat' automatically uses a chunk
> > size according to the iounit advertised by stat) then the I/O results a=
re
> > okay.
> >=20
> > What hurts IMO the most in practice is the sluggish behaviour regarding
> > dentries ATM. The following is with cache=3Dmmap (on guest side):
> >=20
> > $ time ls /etc/ > /dev/null
> > real    0m0.091s
> > user    0m0.000s
> > sys     0m0.044s
> > $ time ls -l /etc/ > /dev/null
> > real    0m0.259s
> > user    0m0.008s
> > sys     0m0.016s
> > $ ls -l /etc/ | wc -l
> > 113
> > $
>=20
> Yes, that is slow indeed.. Unfortunately cache=3Dnone/mmap means only open
> dentries are pinned, so that means a load of requests everytime.
>=20
> I was going to suggest something like readdirplus or prefetching
> directory entries attributes in parallel/background, but since we're not
> keeping any entries around we can't even do that in that mode.
>=20
> > With cache=3Dloose there is some improvement; on the first "ls" run (wh=
en
> > its
> > not in the dentry cache I assume) the results are similar. The subseque=
nt
> > runs then improve to around 50ms for "ls" and around 70ms for "ls -l".
> > But that's still far from numbers I would expect.
>=20
> I'm surprised cached mode is that slow though, that is worth
> investigating.
> With that time range we are definitely sending more requests to the
> server than I would expect for cache=3Dloose, some stat revalidation
> perhaps? I thought there wasn't any.

Yes, it looks like more 9p requests are sent than actually required for=20
readdir. But I haven't checked yet what's going on there in detail. That's=
=20
definitely on my todo list, because this readdir/stat/direntry issue ATM=20
really hurts the most IMO.

> I don't like cache=3Dloose/fscache right now as the reclaim mechanism
> doesn't work well as far as I'm aware (I've heard reports of 9p memory
> usage growing ad nauseam in these modes), so while it's fine for
> short-lived VMs it can't really be used for long periods of time as
> is... That's been on my todo for a while too, but unfortunately no time
> for that.

Ok, that's new to me. But I fear the opposite is currently worse; with=20
cache=3Dmmap and running a VM for a longer time: 9p requests get slower and=
=20
slower, e.g. at a certain point you're waiting like 20s for one request. I=
=20
haven't investigated the cause here either yet. It may very well be an issu=
e=20
on QEMU side: I have some doubts in the fid reclaim algorithm on 9p server=
=20
side which is using just a linked list. Maybe that list is growing to=20
ridiculous sizes and searching the list with O(n) starts to hurt after a=20
while.

With cache=3Dloose I don't see such tremendous slowdowns even on long runs,=
=20
which might indicate that this symptom might indeed be due to a problem on=
=20
QEMU side.

> Ideally if that gets fixed, it really should be the default with some
> sort of cache revalidation like NFS does (if that hasn't changed, inode
> stats have a lifetime after which they get revalidated on access, and
> directory ctime changes lead to a fresh readdir) ; but we can't really
> do that right now if it "leaks".
>=20
> Some cap to the number of open fids could be appreciable as well
> perhaps, to spare server resources and keep internal lists short.

I just reviewed the fid reclaim code on 9p servers side to some extent beca=
use=20
of a security issue on 9p server side in this area recently, but I haven't=
=20
really thought through nor captured the authors' original ideas behind it=20
entirely yet. I still have some question marks here. Maybe Greg feels the=20
same.

Probably when support for macOS is added (also on my todo list), then the=20
amount of open fids needs to be limited anyway. Because macOS is much more=
=20
conservative and does not allow a large number of open files by default.

> Anyway, there definitely is room for improvement; if you need ideas I
> have plenty but my time is more than limited right now and for the
> forseeable future... 9p work is purely on my freetime and there isn't
> much at the moment :(
>=20
> I'll make time as necessary for reviews & tests but that's about as much
> as I can promise, sorry and good luck!

I fear that applies to all developers right now. To my knowledge there is n=
ot=20
a single developer either paid and/or able to spend reasonable large time=20
slices on 9p issues.

=46rom my side: my plans are to hunt down the worst 9p performance issues i=
n=20
order of their impact, but like anybody else, when I find some free time=20
slices for that.

#patience #optimistic

Best regards,
Christian Schoenebeck



