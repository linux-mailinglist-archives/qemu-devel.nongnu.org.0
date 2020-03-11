Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB7181D86
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:15:24 +0100 (CET)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC40x-0008R9-DA
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jC3zw-00081O-R2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jC3zu-0001Jx-1L
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:14:20 -0400
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:58417)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jC3zt-0000q8-NQ
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:14:17 -0400
Received: from player756.ha.ovh.net (unknown [10.108.42.119])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 624E887B1B
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 17:14:15 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id A6F49F7B8D3E;
 Wed, 11 Mar 2020 16:14:13 +0000 (UTC)
Date: Wed, 11 Mar 2020 17:14:08 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 10/11] 9pfs: T_readdir latency optimization
Message-ID: <20200311171408.3b3a2dfa@bahia.home>
In-Reply-To: <2408892.h2sFNKg3ST@silver>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
 <1651612.bE1MAdl4rA@silver> <20200310193336.37029536@bahia.home>
 <2408892.h2sFNKg3ST@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 1033013165250746688
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvvddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.173
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

On Wed, 11 Mar 2020 02:18:04 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 10. M=C3=A4rz 2020 19:33:36 CET Greg Kurz wrote:
> > > This patch is also too big for my preference, but I don't see a viabl=
e way
> > > to split it further into separate patches. I already separated all the
> > > patches I could. If you have suggestions, very much appreciated!
> >=20
> > Well, the patch could be split in two or three parts at least:
> >=20
> > (1) introduce the new function that reads multiple entries in codir.c
> >=20
> > (2) use it from 9p.c
> >=20
> > (3) remove unused stuff if anything remains
> >=20
> > This doesn't seem to change much but the smaller diffstats
> > for each individual patch make them less scary :) and with
> > (1) applied only it is easier to compare what the old code
> > in 9p.c and the new one in codir.c do.
> >=20
> > > The reason for this is that in order to fix these issues with current
> > > T_readdir implementation, it requires to separate what's currently one
> > > task
> > > (i.e. one function) into two separate tasks (i.e. two functions). The=
re is
> > > no sensible way to do that.
> >=20
> > Yeah, I won't ask for finer grain.
>=20
> Me confused. Does that mean your split suggestion was just theoretical, o=
r do=20
> you need it?
>=20

I need it and I won't ask for more splitting. Promised ! :)

> > > But don't be too scared about this patch; if you look just at the diff
> > > directly then yes, the diff is not very human readable. However if you
> > > apply the patch and look at the resulting code, you'll notice that th=
ere
> > > are actually only 2 functions (v9fs_do_readdir() in 9p.c and
> > > do_readdir_lowlat() in codir.c) which require careful reviewing and t=
hat
> > > their resulting code is actually very, very straight forward, and not
> > > long either.
> >=20
> > These are personal opinions. Careful reviewing can take a lot of time :)
>=20
> Well, depends on what precisely you mean with opinion. :) That this patch=
=20
> actually reduces code complexity is a fact (less branches, less locks, le=
ss=20
> dispatches, less side effects, less error/cleanup handlers). These are=20
> objectively measurable quantities.
>=20

You're likely right but that wasn't my point.

> But yes, nevertheless reviewing it costs time.
>=20

That is my point: even if the resulting code is a lot better than the
old one in several aspects, it is still a non-trivial change to review
on my side.

> > > Current code on master is much more tricky and error prone due to the=
 huge
> > > amount of potential branches, individual error/cleanup handlers, high
> > > amount of thread dispatching and much more. In the patched version all
> > > these code complexities and error sources are removed.
> >=20
> > Come on :) The 9pfs code has been a can of worms from the beginning.
> > It produced more than the average amount of security-related bugs,
> > and most sadly, due to the overall lack of interest, it bitrotted
> > and missed a lot of cool improvements like an appropriate support of
> > unlinked files, QOM-ification of fsdev, conversion of proxy fsdev to
> > vhost-user, hot plug/unplug support, live migration support and
> > "much more"... The performance aspect of things is a full time job
>=20
> No, the performance issues are actually very managable in case of 9pfs.
> I already addressed readdir with this patch (by far the worst performance=
=20

They're very manageable if someone cares and spends time. Thanks again
for doing this.

> issue), and then there would just be one more severe performance issue:=20
> walkdir.
>=20

That doesn't surprise me. It is a big function that may end up doing a
lot of dispatching.

> My intention is not to squeeze out the last fractional percent of perform=
ance=20
> for 9pfs, but you certainly agree that a simple "ls" blocking for more th=
an 1=20
> second is something that should be fixed, and fortunately the amount of=20

I never observed such timeouts with my personal toy use of 9p but
you did and this motivated you to step in, which is very welcome.

> changes involved are far less than I originally feared they would.
>=20

Fortunately is the word :)

> > I never had the opportunity to even consider. So yes, your changes
> > are likely beneficial but the code base is still extremely fragile
> > and sensible to huge changes... not breaking things that happen
> > to work, even in a sub-optimal way, is essentially what I care for
> > these days.
>=20
> And I think I'm also very careful not breaking anything. I carefully cons=
ider=20
> what to touch and what not. I wrote test cases and I am actively testing =
my=20
> changes with real installations and snapshots as well.
>=20

Everyone thinks he's also very careful :)

> I think the cause of disagreements we have are solely our use cases of 9p=
fs:=20
> your personal use case does not seem to require any performance considera=
tions=20
> or multi-user aspects, whereas my use case requires at least some minimum=
=20
> performance grade for utilizing 9pfs for server applications.
>=20

Your point about the personal use case is right indeed but our disagreement=
s,
if any, aren't uniquely related to that. It's more about maintainership and
available time really. I'm 100% benevolent "Odd fixer" now and I just try
to avoid being forced into fixing things after my PR is merged. If you want
to go faster, then you're welcome to upgrade to maintainer and send PRs.
This would make sense since you care for 9p, you showed a good understanding
of the code and you provided beneficial contributions so far :)

> > > > Oh, so we'd still have the current implementation being used, even
> > > > with this patch applied... This would be okay for a RFC patch but
> > > > in the end I'd really like to merge something that also converts
> > > > v9fs_do_readdir_with_stat().
> > >=20
> > > Yes, I know, but I would not recommend mixing these things at this po=
int,
> > > because it would be an entire effort on its own.
> > >=20
> > > v9fs_do_readdir_with_stat() is used for 9P2000.u, while v9fs_do_readd=
ir()
> > > is used for 9P2000.L. They're behaving very differently, so it would =
not
> > > only require me to update v9fs_do_readdir_with_stat() and v9fs_read()=
, I
> > > would also need to write their own test cases (plural, since there are
> > > none at all yet) and benchmarks, and of course somebody what need to
> > > review all that additional amount of code, and who would actually test
> > > it? I am actively testing my 9P2000.L changes, but I am not actually
> > > using 9P2000.u, so I could not guarantee for the same quality.
> > >=20
> > > Considering the current commitment situation regarding 9pfs, we can o=
nly
> > > bring things forward with compromises. Hence I suggest I concentrate =
on
> > > fixing the worst performance issues on 9P2000.L side first, and later=
 on
> > > if there are really people interested in seeing these improvements on
> > > 9P2000.u side and willing to at least help out with testing, then I c=
an
> > > definitely also adjust 9P2000.u side accordingly as well.
> > >=20
> > > But to also make this clear: this patch 10 is not introducing any
> > > behaviour
> > > change for 9P2000.u side.
> >=20
> > Ok, fair enough to leave 9p2000.U behind for now but I had to ask :)
> > /me is even wondering if we should start deprecating 9p2000.U since
> > most clients can use 9p2000.L now...
>=20
> I probably wouldn't. On macOS for instance there's only 9p2000.u. In the =
end=20

Hmm... the only thing I've heard about is:

https://github.com/benavento/mac9p

and unless I'm missing something, this seems to only have a socket based
transport... the server in QEMU is for virtio-9p and Xen 9p devices only.
Unless mac9p seriously plans to implement a driver for either of those,
I'm still not convinced it is worth keeping .U around... and BTW, our
deprecation policy imposes a 2 QEMU versions cooling period before
actually removing the code. This would leave ample time for someone
to speak up.

> 9p2000.L is Linux specific. By deprecating 9p2000.u that would mean a shi=
ft=20
> towards only supporting Linux guests.
>=20
> > > Mmm... maybe later on, as a cleanup patch or something. Current versi=
on is
> > > tested. I would like to avoid to make things more complicated than th=
ey
> > > already are (i.e. accidental introduction of some bug just due to thi=
s).
> >=20
> > It seems we might agree on not breaking things that work ;-)
>=20
> Of course! All the things I work on 9pfs are just fixes. But that's proba=
bly=20
> where we start to disagree. :)
>=20

:)

> > > > > > +static int do_readdir_lowlat(V9fsPDU *pdu, V9fsFidState *fidp,
> > > > > > +                             struct V9fsDirEnt **entries,
> > > > > > +                             int32_t maxsize, bool dostat)
> > > > > > +{
> > > > > > +    V9fsState *s =3D pdu->s;
> > > > > > +    V9fsString name;
> > > > > > +    int len, err =3D 0;
> > > > > > +    int32_t size =3D 0;
> > > > > > +    off_t saved_dir_pos;
> > > > > > +    struct dirent *dent;
> > > > > > +    struct V9fsDirEnt *e =3D NULL;
> > > > > > +    V9fsPath path;
> > > > > > +    struct stat stbuf;
> > > > > > +
> > > > > > +    *entries =3D NULL;
> > > > > > +    v9fs_path_init(&path);
> > > > > > +
> > > > > > +    /*
> > > > > > +     * TODO: Here should be a warn_report_once() if lock faile=
d.
> > > > > > +     *
> > > > > > +     * With a good 9p client we should not get into concurrency
> > > > > > here,
> > > > > > +     * because a good client would not use the same fid for
> > > > > > concurrent
> > > > > > +     * requests. We do the lock here for safety reasons though.
> > > > > > However
> > > > > > +     * the client would then suffer performance issues, so bet=
ter
> > > > > > log
> > > > > > that
> > > > > > +     * issue here.
> > > > > > +     */
> > > >=20
> > > > This should probably be done with qemu_mutex_trylock() in a loop
> > > > directly
> > > > in v9fs_readdir_lock().
> > >=20
> > > No definitely not in the loop. That's intentionally *one* lock *outsi=
de*
> > > of
> >=20
> > Not sure we're talking about the same loop here...
> >=20
> > I'm just suggesting that v9fs_readdir_lock() could be something like:
> >=20
> > static inline void v9fs_readdir_lock(V9fsDir *dir)
> > {
> >     while (qemu_mutex_trylock(&dir->readdir_mutex)) {
> >         warn_report_once("blah");
> >     }
> > }
>=20
> Ah yeah, in fact I got you wrong on this one. I thought you meant to move=
 the=20
> lock within do_readdir_lowlat(). About your actual suggestion above ...
>=20
> > > the loop. The normal case is not requiring a lock at all, like the co=
mment
> > > describes. Doing multiple locks inside the loop unnecessaririly reduc=
es
> > > performance for no reason.
> > >=20
> > > About *_trylock() instead of v9fs_readdir_lock(): might be a candidat=
e to
> >=20
> > Hmm... are you suggesting that do_readdir_lowlat() should return if it
> > can't take the lock ?
>=20
> ... yep, that's what I had in mind for it later on. I would not mind runn=
ing=20
> trylock in a loop like you suggested; if it fails, log a warning and retu=
rn.
> Because if the lock fails, then client is buggy. User can read the warnin=
g in=20
> the logs and report the bug for client to be fixed. Not worth to handle t=
hat=20
> case in any fancy way by server.
>=20

The locking is just a safety net because readdir(3) isn't necessarily
thread safe. It was never my intention to add an error path for that.
And thinking again, sending concurrent Treaddir requests on the same
fid is certainly a weird thing to do but is it really a bug ?

> > > > > > + * Retrieves the requested (max. amount of) directory entries =
from
> > > > > > the
> > > > > > fs
> > > > > > + * driver. This function must only be called by the main IO th=
read
> > > > > > (top
> > > > > > half). + * Internally this function call will be dispatched to a
> > > > > > background
> > > > > > IO thread + * (bottom half) where it is eventually executed by =
the
> > > > > > fs
> > > > > > driver. + *
> > > > > > + * The old readdir implementation above just retrieves always =
one
> > > > > > dir
> > > > > > entry + * per call. The problem of that implementation above is=
 that
> > > > > > latency is + * added for (retrieval of) each directory entry, w=
hich
> > > > > > in
> > > > > > practice lead to + * latencies of several hundred ms for readdi=
r of
> > > > > > only one directory. + * + * This is avoided in this function by
> > > > > > letting
> > > > > > the fs driver retrieve all + * required directory entries with =
only
> > > > > > call of this function and hence with + * only a single fs driver
> > > > > > request.
> > > >=20
> > > > True but these kind of considerations rather belong to the changelo=
g...
> > > > otherwise, we'll have to not forget to kill these lines when the "o=
ld
> > > > readdir implementation" is no more.
> > >=20
> > > Mmm... I do think this overall latency issue should be clarified some=
where
> > > as
> > The issue itself is best described in a changelog, but...
> >=20
> > > a comment. Where exactly is not that important to me. For instance it
> > > could
> > > also be described on v9fs_co_run_in_worker() macro definition in coth=
.h
> > > instead, as general rule of thumb when dispatching stuff.
> >=20
> > ... if you have useful recommendations that don't involve referring to a
> > piece of code that might go away, a comment in coth.h is certainly a go=
od
> > idea.
>=20
> Ok, I'll move it to coth.h then.
>=20
> > > The thing is: for >10 years several developers obviously did not real=
ize
> > > the severe negative performance impact of frivolously dispatching tas=
ks
> > > to
> > I won't dare to comment on some people I don't know not doing the obvio=
us
> > right things at the time... what I do know is that for >10 years, nobody
> > cared for this code. Period. You're lucky it is still functional ;-)
>=20
> This was not about judging individuals, just to express that the latency=
=20
> impact of dispatching does not seem to be obvious for people, and trying =
to=20

Maybe because it isn't that obvious...

> avoid similar mistakes by placing appropriate comment(s).
>=20
> > > > > > +                                        struct V9fsDirEnt
> > > > > > **entries,
> > > > > > +                                        int32_t maxsize, bool
> > > > > > dostat)
> > > >=20
> > > > s/maxsize/max_count since this is the wording use in the caller.
> > >=20
> > > Wouldn't do that. This is the driver side, not the 9p protocol request
> > > handler. As you might have relized before, "max_count" is semantically
> > > completely wrong. This variable does not count integral entries, it is
> > > rather a maximum size (in bytes) of the destination buffer being fill=
ed.
> > >=20
> > > On 9p request handler side it is ok to use "max_count" instead, becau=
se
> > > the
> > > protocol definition uses exactly this term for the request parameter,=
 but
> > > on driver side it's IMO inappropriate.
> >=20
> > I agree the max_count wording sucks and I don't care that much to
> > name variables according to protocol definitions, but I do care
> > to use the same name in caller/callee when it makes sense, for a
> > better grep or cscope experience.
>=20
> So you insist on that max_count change?
>=20

Rather the opposite. Kill max_count and make it maxsize, in a preparatory
patch with the reasons you've exposed.

> Best regards,
> Christian Schoenebeck
>=20
>=20

Cheers,

--
Greg

