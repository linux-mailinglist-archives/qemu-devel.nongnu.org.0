Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331B75ECAA7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:19:59 +0200 (CEST)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEFR-0001qf-Of
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odEAk-0005fw-F5; Tue, 27 Sep 2022 13:15:06 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:57571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odEAi-00070u-6G; Tue, 27 Sep 2022 13:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=syjQOdvDY9EZwnD1ZYJNdZ6c9ZkV/0GRczjLumqWc0A=; b=Qz7H5CxCz7I/vjv3V8yFyr00zK
 GFCfU1SsrDSkW8JIzsRyNy5yM5g9ivY+EIODJF3DTazskAwP9dfOXqGEgL3U7FYHLeKTV2tX+xyPH
 /7FjBRN3mDb5jXarttu5LeJNUwg4tH2GSUNYvK0dExkFzQhTWIM3uyXpVyUsq1vpEgaHW99Ip+pZ/
 sddU/+xaAf99F3IQF0CpU+0vpLtyysZryy9UwKp+gGAFQ9Gv+xCWJSEC/GXx69DQzaComxfLYxfvl
 CCUTslicN3O3EXWgRXV5BaxhmV7X+o/lrQEv5KBrkCLdQL0vIzdmTqoYEb0lB00U42w7MOWexkVHp
 E9oORfGOCQ1fh589VSL0GAQvrUI/l0KQUu7K8LLRyKb3n6GVZNtHQYHzVqEm/dFtI6Nsg+zAwl1jg
 uCgt56IF84++SSxOdsCL+BsJyi5sLs3qTUlzf/DaLsGmHAYpJUvXWP6nmSLF9As1bQQc2sRe/5OqM
 rlDmrT5xHvZMZm1yXv5yzPlpE2P6zNI1z85Znu18rEtuq7x0M8p7ao1alA1l5V60ZPTtw4NdAxbbl
 0xfe9txhy0cYwUQQxSKICO7+AOjwyOmCuv+DII5gesRXaNzo4KMF/fDragHTqLZE6PlNzYHqDVcIb
 ot1bFJcmucAPincpdtXMepjoVQg+CQmxuaU1AZaxU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>
Subject: Re: [PATCH 1/1] 9pfs: avoid iterator invalidation in
 v9fs_mark_fids_unreclaim
Date: Tue, 27 Sep 2022 19:14:33 +0200
Message-ID: <3675458.bPJFzOz80O@silver>
In-Reply-To: <ygav8p9vugm.fsf@localhost>
References: <20220926124207.1325763-1-git@sphalerite.org>
 <1697950.a32zQFXn7i@silver> <ygav8p9vugm.fsf@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Dienstag, 27. September 2022 15:05:13 CEST Linus Heckemann wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > Ah, you sent this fix as a separate patch on top. I actually just meant
> > that you would take my already queued patch as the latest version (just
> > because I had made some minor changes on my end) and adjust that patch
> > further as v4.
> > 
> > Anyway, there are still some things to do here, so maybe you can send your
> > patch squashed in the next round ...
> 
> I see, will do!
> 
> >> @Christian: I still haven't been able to reproduce the issue that this
> >> commit is supposed to fix (I tried building KDE too, no problems), so
> >> it's a bit of a shot in the dark. It certainly still runs and I think it
> >> should fix the issue, but it would be great if you could test it.
> > 
> > No worries about reproduction, I will definitely test this thoroughly. ;-)
> > 
> >>  hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++----------------
> >>  1 file changed, 30 insertions(+), 16 deletions(-)
> >> 
> >> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> >> index f4c1e37202..825c39e122 100644
> >> --- a/hw/9pfs/9p.c
> >> +++ b/hw/9pfs/9p.c
> >> @@ -522,33 +522,47 @@ static int coroutine_fn
> >> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) V9fsFidState
> >> *fidp;
> >> 
> >>      gpointer fid;
> >>      GHashTableIter iter;
> >> 
> >> +    /*
> >> +     * The most common case is probably that we have exactly one
> >> +     * fid for the given path, so preallocate exactly one.
> >> +     */
> >> +    GArray *to_reopen = g_array_sized_new(FALSE, FALSE,
> >> sizeof(V9fsFidState*), 1); +    gint i;
> > 
> > Please use `g_autoptr(GArray)` instead of `GArray *`, that avoids the need
> > for explicit calls to g_array_free() below.
> 
> Good call. I'm not familiar with glib, so I didn't know about this :)
> 
> >> -            fidp->flags |= FID_NON_RECLAIMABLE;
> > 
> > Why did you remove that? It should still be marked as FID_NON_RECLAIMABLE,
> > no?
> Indeed, that was an accident.
> 
> >> +            /*
> >> +             * Ensure the fid survives a potential clunk request during
> >> +             * v9fs_reopen_fid or put_fid.
> >> +             */
> >> +            fidp->ref++;
> > 
> > Hmm, bumping the refcount here makes sense, as the 2nd loop may be
> > interrupted and the fid otherwise disappear in between, but ...
> > 
> >> +            g_array_append_val(to_reopen, fidp);
> >> 
> >>          }
> >> 
> >> +    }
> >> 
> >> -        /* We're done with this fid */
> >> +    for (i=0; i < to_reopen->len; i++) {
> >> +        fidp = g_array_index(to_reopen, V9fsFidState*, i);
> >> +        /* reopen the file/dir if already closed */
> >> +        err = v9fs_reopen_fid(pdu, fidp);
> >> +        if (err < 0) {
> >> +            put_fid(pdu, fidp);
> >> +            g_array_free(to_reopen, TRUE);
> >> +            return err;
> > 
> > ... this return would then leak all remainder fids that you have bumped
> > the
> > refcount for above already.
> 
> You're right. I think the best way around it, though it feels ugly, is
> to add a third loop in an "out:".

Either that, or continuing the loop to the end. Not that this would become 
much prettier. I must admit I also don't really have a good idea for a clean 
solution in this case.

> > Also: I noticed that your changes in virtfs_reset() would need the same
> > 2-loop hack to avoid hash iterator invalidation, as it would also call
> > put_fid() inside the loop and be prone for hash iterator invalidation
> > otherwise.
> Good point. Will do.
> 
> One more thing has occurred to me. I think the reclaiming/reopening
> logic will misbehave in the following sequence of events:
> 
> 1. QEMU reclaims an open fid, losing the file handle
> 2. The file referred to by the fid is replaced with a different file
>    (e.g. via rename or symlink) outside QEMU
> 3. The file is accessed again by the guest, causing QEMU to reopen a
>    _different file_ from before without the guest having performed any
>    operations that should cause this to happen.
> 
> This is neither introduced nor resolved by my changes. Am I overlooking
> something that avoids this (be it documentation that directories exposed
> via 9p should not be touched by the host), or is this a real issue? I'm
> thinking one could at least detect it by saving inode numbers in
> V9fsFidState and comparing them when reopening, but recovering from such
> a situation seems difficult.

Well, in that specific scenario when rename/move happens outside of QEMU then 
yes, this might happen unfortunately. The point of this "reclaim fid" stuff is 
to deal with the fact that there is an upper limit on systems for the max. 
amount of open file descriptors a process might hold at a time. And on some 
systems like macOS I think that limit is quite low by default (like 100?).

There is also another issue pending that affects pure inner-guest behaviour; 
the infamous use-after-unlink() use pattern:
https://wiki.qemu.org/Documentation/9p#Implementation_Plans
https://gitlab.com/qemu-project/qemu/-/issues/103

It would make sense to look how other file servers deal with the max. amount 
of file descriptors limit before starting to just fight the symptoms. This 
whole reclaim fid stuff in general is PITA.

Best regards,
Christian Schoenebeck



