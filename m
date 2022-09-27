Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8C5ECD3A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:54:54 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odGfN-0006JZ-IL
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1odGXz-0006UK-3C; Tue, 27 Sep 2022 15:47:15 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:47259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1odGXw-0006MT-1j; Tue, 27 Sep 2022 15:47:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2C18B12C84FA7;
 Tue, 27 Sep 2022 21:47:04 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 27 Sep
 2022 21:47:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005e802bc95-5e80-44dd-8bd5-7725a4e4fdca,
 17CECFEDD6F19F7FBEC765A02DC1A9FAEEB64273) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 27 Sep 2022 21:47:02 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, "Linus
 Heckemann" <git@sphalerite.org>
Subject: Re: [PATCH 1/1] 9pfs: avoid iterator invalidation in
 v9fs_mark_fids_unreclaim
Message-ID: <20220927214702.63ac8a7b@bahia>
In-Reply-To: <3675458.bPJFzOz80O@silver>
References: <20220926124207.1325763-1-git@sphalerite.org>
 <1697950.a32zQFXn7i@silver> <ygav8p9vugm.fsf@localhost>
 <3675458.bPJFzOz80O@silver>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: a2c35e42-d161-46ec-86ea-263b6eaca2b1
X-Ovh-Tracer-Id: 5996542905049848288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueekgfdutdevvdduleehhfdvheekjedukefgkefhieehjeefgeefjeetgfdtkeeknecuffhomhgrihhnpehqvghmuhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhithesshhphhgrlhgvrhhithgvrdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=groug@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Tue, 27 Sep 2022 19:14:33 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 27. September 2022 15:05:13 CEST Linus Heckemann wrote:
> > Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > > Ah, you sent this fix as a separate patch on top. I actually just meant
> > > that you would take my already queued patch as the latest version (just
> > > because I had made some minor changes on my end) and adjust that patch
> > > further as v4.
> > > 
> > > Anyway, there are still some things to do here, so maybe you can send your
> > > patch squashed in the next round ...
> > 
> > I see, will do!
> > 
> > >> @Christian: I still haven't been able to reproduce the issue that this
> > >> commit is supposed to fix (I tried building KDE too, no problems), so
> > >> it's a bit of a shot in the dark. It certainly still runs and I think it
> > >> should fix the issue, but it would be great if you could test it.
> > > 
> > > No worries about reproduction, I will definitely test this thoroughly. ;-)
> > > 
> > >>  hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++----------------
> > >>  1 file changed, 30 insertions(+), 16 deletions(-)
> > >> 
> > >> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > >> index f4c1e37202..825c39e122 100644
> > >> --- a/hw/9pfs/9p.c
> > >> +++ b/hw/9pfs/9p.c
> > >> @@ -522,33 +522,47 @@ static int coroutine_fn
> > >> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) V9fsFidState
> > >> *fidp;
> > >> 
> > >>      gpointer fid;
> > >>      GHashTableIter iter;
> > >> 
> > >> +    /*
> > >> +     * The most common case is probably that we have exactly one
> > >> +     * fid for the given path, so preallocate exactly one.
> > >> +     */
> > >> +    GArray *to_reopen = g_array_sized_new(FALSE, FALSE,
> > >> sizeof(V9fsFidState*), 1); +    gint i;
> > > 
> > > Please use `g_autoptr(GArray)` instead of `GArray *`, that avoids the need
> > > for explicit calls to g_array_free() below.
> > 
> > Good call. I'm not familiar with glib, so I didn't know about this :)
> > 
> > >> -            fidp->flags |= FID_NON_RECLAIMABLE;
> > > 
> > > Why did you remove that? It should still be marked as FID_NON_RECLAIMABLE,
> > > no?
> > Indeed, that was an accident.
> > 
> > >> +            /*
> > >> +             * Ensure the fid survives a potential clunk request during
> > >> +             * v9fs_reopen_fid or put_fid.
> > >> +             */
> > >> +            fidp->ref++;
> > > 
> > > Hmm, bumping the refcount here makes sense, as the 2nd loop may be
> > > interrupted and the fid otherwise disappear in between, but ...
> > > 
> > >> +            g_array_append_val(to_reopen, fidp);
> > >> 
> > >>          }
> > >> 
> > >> +    }
> > >> 
> > >> -        /* We're done with this fid */
> > >> +    for (i=0; i < to_reopen->len; i++) {
> > >> +        fidp = g_array_index(to_reopen, V9fsFidState*, i);
> > >> +        /* reopen the file/dir if already closed */
> > >> +        err = v9fs_reopen_fid(pdu, fidp);
> > >> +        if (err < 0) {
> > >> +            put_fid(pdu, fidp);
> > >> +            g_array_free(to_reopen, TRUE);
> > >> +            return err;
> > > 
> > > ... this return would then leak all remainder fids that you have bumped
> > > the
> > > refcount for above already.
> > 
> > You're right. I think the best way around it, though it feels ugly, is
> > to add a third loop in an "out:".
> 
> Either that, or continuing the loop to the end. Not that this would become 
> much prettier. I must admit I also don't really have a good idea for a clean 
> solution in this case.
> 
> > > Also: I noticed that your changes in virtfs_reset() would need the same
> > > 2-loop hack to avoid hash iterator invalidation, as it would also call
> > > put_fid() inside the loop and be prone for hash iterator invalidation
> > > otherwise.
> > Good point. Will do.
> > 
> > One more thing has occurred to me. I think the reclaiming/reopening
> > logic will misbehave in the following sequence of events:
> > 
> > 1. QEMU reclaims an open fid, losing the file handle
> > 2. The file referred to by the fid is replaced with a different file
> >    (e.g. via rename or symlink) outside QEMU
> > 3. The file is accessed again by the guest, causing QEMU to reopen a
> >    _different file_ from before without the guest having performed any
> >    operations that should cause this to happen.
> > 
> > This is neither introduced nor resolved by my changes. Am I overlooking
> > something that avoids this (be it documentation that directories exposed
> > via 9p should not be touched by the host), or is this a real issue? I'm
> > thinking one could at least detect it by saving inode numbers in
> > V9fsFidState and comparing them when reopening, but recovering from such
> > a situation seems difficult.
> 
> Well, in that specific scenario when rename/move happens outside of QEMU then 
> yes, this might happen unfortunately. The point of this "reclaim fid" stuff is 
> to deal with the fact that there is an upper limit on systems for the max. 
> amount of open file descriptors a process might hold at a time. And on some 
> systems like macOS I think that limit is quite low by default (like 100?).
> 
> There is also another issue pending that affects pure inner-guest behaviour; 
> the infamous use-after-unlink() use pattern:
> https://wiki.qemu.org/Documentation/9p#Implementation_Plans
> https://gitlab.com/qemu-project/qemu/-/issues/103
> 
> It would make sense to look how other file servers deal with the max. amount 
> of file descriptors limit before starting to just fight the symptoms. This 
> whole reclaim fid stuff in general is PITA.
> 

Yes this reclaim code is just a best effort tentative to not
starve file descriptors. But since its implementation is path
based, it gets the per-design limitation that nothing should
modify the backing fs outside of the current 9p session.
Note: just like the use-after-unlink() infamous pattern (I love
the wording), you can get this with a "pure inner-guest behaviour"
using two devices with overlapping backends (shoot in the foot
setup) :-)

Recovering from lost state is impossible but the server should
at least try to detect that and return EIO to the client, pretty
much like any storage device is expected to do if possible.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 


