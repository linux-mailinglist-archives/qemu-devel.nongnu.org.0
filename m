Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9715F51E6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 11:43:42 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og0wH-000825-EW
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 05:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1og0rd-0005hI-LK; Wed, 05 Oct 2022 05:38:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1og0rW-0000mm-3V; Wed, 05 Oct 2022 05:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=h4/lB2S9xHgfcWNSk4RFK0PdPURdsw+Nhtl8LArSgJE=; b=eaaEIjcwSAj+eyNZsHNpYKncWP
 HKu61OnWnd8u++lNwwJRQduvcJmEMe/UC/C5SaFszsCzCmkeyxqIoAJh2EYL0zzsQblDTMfpNb3Xa
 XAjrx6iNjS3Kz5csYz/5rC1GLSrF2O4PpivZAguiACjj6Dopubq5ra5STCMcSMtPLg3XYWDqkOp7T
 T9WCAcBE779NW7xD54uxhW+13hDgB4XhUz9DahgBahiQxxHRbmWZxEXGgcNBrHvMTwl2BpadyPSH+
 KM955wWEouzbvl4kYX3Z66E4GmZQAiM4STuMvlvPAEq+5ZhMRJi4aaUnrKiwBjyU1wouK91C4pAbo
 2tg9Vrterh+73Wm8vSdJtm/p9c9A3+PPi9Ir+eq1Ozp74lP8H9Scnrjs0U1lEqaNBvQ4C9nUNz9wL
 tEXytOOwmcYEPS6Sw50a11/aum/X5IzklTVHOf/RoiTYFfOEH518kFCHEKnR8zR/jDaDsMvfhkv1e
 EXOSTI2uuUF9mbijV5dX7FytC5chQk1ruDdkMiltYyxHOzswLiplcMKGqBtYtusgY+5c5Rt2wDhpv
 cLGMpLo5oJ8I35yiubmLaGjDMEnAQ6Qka1sD+x9txpzf+H3Q2att572mgEQWEgWWB7t4+e+F29JaU
 ypZd5sOFozcDnC9wBU63FmvEi+adnCBDvN14ElphA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Linus Heckemann <git@sphalerite.org>
Cc: Greg Kurz <groug@kaod.org>, Qemu-block <qemu-block@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6] 9pfs: use GHashTable for fid table
Date: Wed, 05 Oct 2022 11:38:39 +0200
Message-ID: <3864477.uoRi9OHyCq@silver>
In-Reply-To: <19360658.4YNXD89StS@silver>
References: <20221004104121.713689-1-git@sphalerite.org>
 <19360658.4YNXD89StS@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Dienstag, 4. Oktober 2022 14:54:16 CEST Christian Schoenebeck wrote:
> On Dienstag, 4. Oktober 2022 12:41:21 CEST Linus Heckemann wrote:
> > The previous implementation would iterate over the fid table for
> > lookup operations, resulting in an operation with O(n) complexity on
> > the number of open files and poor cache locality -- for every open,
> > stat, read, write, etc operation.
> >=20
> > This change uses a hashtable for this instead, significantly improving
> > the performance of the 9p filesystem. The runtime of NixOS's simple
> > installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> > decreased by a factor of about 10.
> >=20
> > Signed-off-by: Linus Heckemann <git@sphalerite.org>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > Message-Id: <20220908112353.289267-1-git@sphalerite.org>
> > [CS: - Retain BUG_ON(f->clunked) in get_fid().
> >=20
> >      - Add TODO comment in clunk_fid(). ]
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
>=20
> In general: LGTM now, but I will definitely go for some longer test runs
> before queuing this patch. Some minor side notes below ...

So I was running a compilation marathon on 9p as root fs this night, first=
=20
couple hours went smooth, but then after about 12 hours 9p became unusable=
=20
with error:

  Too many open files

The question is, is that a new issue introduced by this patch? I.e. does it=
=20
break the reclaim fd code? Or is that rather unrelated to this patch, and a=
=20
problem we already had?

Linus, could you look at this? It would probably make sense to force gettin=
g=20
into this situation much earlier like:

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index aebadeaa03..0c104b81e1 100644
=2D-- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4330,6 +4330,6 @@ static void __attribute__((__constructor__))=20
v9fs_set_fd_limit(void)
         error_report("Failed to get the resource limit");
         exit(1);
     }
=2D    open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
+    open_fd_hw =3D rlim.rlim_cur - MIN(50, rlim.rlim_cur / 3);
     open_fd_rc =3D rlim.rlim_cur / 2;
 }

I can't remember that we had this issue before, so there might still be=20
something wrong with this GHashTable patch here.

> > Christian Schoenebeck writes:
> > > Not a big deal, but I start thinking whether to keep BUG_ON() here as
> > > well.
> > > That would require using g_hash_table_lookup() here instead of
> > > g_hash_table_contains(). Not that I would insist.
> >=20
> > Done.
> >=20
> > > checkpatch.pl
> >=20
> > Fixed.
> >=20
> > > OK, I get it that you squashed your previous patch and that you ended=
 up
> > > with this comment instead. But if you read the old comment version he=
re,
> > > you'll notice that it describes the actual problem more accurately:
> > > especially that v9fs_reopen_fid() and put_fid() are the 2 functions t=
hat
> > > may cause the coroutine to "yield" here. That's an important informat=
ion
> > > to be retained in this comment here as it's not obvious.
> >=20
> > Reworded to mention these functions explicitly.
> >=20
> > >  I would not move this to the 2nd loop. I would still set the
> > >=20
> > > FID_NON_RECLAIMABLE flag here, for the same reasons that you are bump=
ing
> > > the refcount already in the first loop below.
> >=20
> > Good point! Fixed.
> >=20
> > >  ... that's not the same behaviour as before, is it? Old behaviour was
> > >  to
> > >  put>
> > >=20
> > > the respective (last) fid only on error. And this would now put all
> > > fids.
> >=20
> > Indeed it isn't the old behaviour, but I believe it's correct: since
> > before we only incremented the reference counter for each one when we
> > started reopening it. Now, we increment _all_ their refcounts, so we
> > need to put all of them back as well.
>=20
> Yeah, commented in v9fs_mark_fids_unreclaim() changes below ...
>=20
> > >  Wasn't there something like GLIST_FOREACH()? Then you wouldn't need =
to
> > >  add
> > >=20
> > > that variable.
> >=20
> > glib does provide g_list_foreach, but that requires a function
> > pointer. I'm not aware of a macro for this. I could change this to use
> > a QLIST (for which we do have a macro) instead of a GList if you
> > insist, but I'd default to leaving this as is.
>=20
> That's better handled by a future cleanup patch. Right now I find it
> prioritized to get this performance fix merged ASAP, as it provides a
> significant improvement for a lot of people.
>=20
> I have seen GLIST_FOREACH macros (without function pointer) in other
> projects, but I guess that macro was defined locally by those projects.
>=20
> > Thanks for your repeated reviews and patience!
> >=20
> > Linus
> >=20
> >  hw/9pfs/9p.c | 195 +++++++++++++++++++++++++++++----------------------
> >  hw/9pfs/9p.h |   2 +-
> >  2 files changed, 113 insertions(+), 84 deletions(-)
> >=20
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index aebadeaa03..729d3181e0 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -256,7 +256,8 @@ static size_t v9fs_string_size(V9fsString *str)
> >=20
> >  }
> > =20
> >  /*
> >=20
> > - * returns 0 if fid got re-opened, 1 if not, < 0 on error */
> > + * returns 0 if fid got re-opened, 1 if not, < 0 on error
> > + */
> >=20
> >  static int coroutine_fn v9fs_reopen_fid(V9fsPDU *pdu, V9fsFidState *f)
> >  {
> > =20
> >      int err =3D 1;
> >=20
> > @@ -282,33 +283,32 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU
> > *pdu, int32_t fid) V9fsFidState *f;
> >=20
> >      V9fsState *s =3D pdu->s;
> >=20
> > -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > +    f =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> > +    if (f) {
> >=20
> >          BUG_ON(f->clunked);
> >=20
> > -        if (f->fid =3D=3D fid) {
> > -            /*
> > -             * Update the fid ref upfront so that
> > -             * we don't get reclaimed when we yield
> > -             * in open later.
> > -             */
> > -            f->ref++;
> > -            /*
> > -             * check whether we need to reopen the
> > -             * file. We might have closed the fd
> > -             * while trying to free up some file
> > -             * descriptors.
> > -             */
> > -            err =3D v9fs_reopen_fid(pdu, f);
> > -            if (err < 0) {
> > -                f->ref--;
> > -                return NULL;
> > -            }
> > -            /*
> > -             * Mark the fid as referenced so that the LRU
> > -             * reclaim won't close the file descriptor
> > -             */
> > -            f->flags |=3D FID_REFERENCED;
> > -            return f;
> > +        /*
> > +         * Update the fid ref upfront so that
> > +         * we don't get reclaimed when we yield
> > +         * in open later.
> > +         */
> > +        f->ref++;
> > +        /*
> > +         * check whether we need to reopen the
> > +         * file. We might have closed the fd
> > +         * while trying to free up some file
> > +         * descriptors.
> > +         */
> > +        err =3D v9fs_reopen_fid(pdu, f);
> > +        if (err < 0) {
> > +            f->ref--;
> > +            return NULL;
> >=20
> >          }
> >=20
> > +        /*
> > +         * Mark the fid as referenced so that the LRU
> > +         * reclaim won't close the file descriptor
> > +         */
> > +        f->flags |=3D FID_REFERENCED;
> > +        return f;
> >=20
> >      }
> >      return NULL;
> > =20
> >  }
> >=20
> > @@ -317,12 +317,11 @@ static V9fsFidState *alloc_fid(V9fsState *s, int3=
2_t
> > fid) {
> >=20
> >      V9fsFidState *f;
> >=20
> > -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > +    f =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> > +    if (f) {
> >=20
> >          /* If fid is already there return NULL */
> >          BUG_ON(f->clunked);
> >=20
> > -        if (f->fid =3D=3D fid) {
> > -            return NULL;
> > -        }
> > +        return NULL;
> >=20
> >      }
> >      f =3D g_new0(V9fsFidState, 1);
> >      f->fid =3D fid;
> >=20
> > @@ -333,7 +332,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > fid) * reclaim won't close the file descriptor
> >=20
> >       */
> >     =20
> >      f->flags |=3D FID_REFERENCED;
> >=20
> > -    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> > +    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
> >=20
> >      v9fs_readdir_init(s->proto_version, &f->fs.dir);
> >      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> >=20
> > @@ -424,12 +423,12 @@ static V9fsFidState *clunk_fid(V9fsState *s, int3=
2_t
> > fid) {
> >=20
> >      V9fsFidState *fidp;
> >=20
> > -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> > -        if (fidp->fid =3D=3D fid) {
> > -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> > -            fidp->clunked =3D true;
> > -            return fidp;
> > -        }
> > +    /* TODO: Use g_hash_table_steal_extended() instead? */
> > +    fidp =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> > +    if (fidp) {
> > +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> > +        fidp->clunked =3D true;
> > +        return fidp;
> >=20
> >      }
> >      return NULL;
> > =20
> >  }
> >=20
> > @@ -439,10 +438,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
> >=20
> >      int reclaim_count =3D 0;
> >      V9fsState *s =3D pdu->s;
> >      V9fsFidState *f;
> >=20
> > +    GHashTableIter iter;
> > +    gpointer fid;
> > +
> > +    g_hash_table_iter_init(&iter, s->fids);
> > +
> >=20
> >      QSLIST_HEAD(, V9fsFidState) reclaim_list =3D
> >     =20
> >          QSLIST_HEAD_INITIALIZER(reclaim_list);
> >=20
> > -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &f)) {
> >=20
> >          /*
> >         =20
> >           * Unlink fids cannot be reclaimed. Check
> >           * for them and skip them. Also skip fids
> >=20
> > @@ -514,72 +518,86 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
> >=20
> >      }
> > =20
> >  }
> >=20
> > +/*
> > + * This is used when a path is removed from the directory tree. Any
> > + * fids that still reference it must not be closed from then on, since
> > + * they cannot be reopened.
> > + */
> >=20
> >  static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath
> >=20
> > *path) {
> > -    int err;
> > +    int err =3D 0;
>=20
> Not really necessary as `err` was and is never used unitialized, but OK.
>=20
> >      V9fsState *s =3D pdu->s;
> >=20
> > -    V9fsFidState *fidp, *fidp_next;
> > +    V9fsFidState *fidp;
> > +    gpointer fid;
> > +    GHashTableIter iter;
> > +    /*
> > +     * The most common case is probably that we have exactly one
> > +     * fid for the given path, so preallocate exactly one.
> > +     */
> > +    g_autoptr(GArray) to_reopen =3D g_array_sized_new(FALSE, FALSE,
> > +            sizeof(V9fsFidState *), 1);
> > +    gint i;
> >=20
> > -    fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
> > -    if (!fidp) {
> > -        return 0;
> > -    }
> > +    g_hash_table_iter_init(&iter, s->fids);
> >=20
> >      /*
> >=20
> > -     * v9fs_reopen_fid() can yield : a reference on the fid must be he=
ld
> > -     * to ensure its pointer remains valid and we can safely pass it to
> > -     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
> > -     * we must keep a reference on the next fid as well. So the logic
> > here
> > -     * is to get a reference on a fid and only put it back during the
> > next
> > -     * iteration after we could get a reference on the next fid. Start
> > with -     * the first one.
> > +     * We iterate over the fid table looking for the entries we need
> > +     * to reopen, and store them in to_reopen. This is because
> > +     * v9fs_reopen_fid() and put_fid() yield. This allows the fid table
> > +     * to be modified in the meantime, invalidating our iterator.
> >=20
> >       */
> >=20
> > -    for (fidp->ref++; fidp; fidp =3D fidp_next) {
> > +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
> >=20
> >          if (fidp->path.size =3D=3D path->size &&
> >         =20
> >              !memcmp(fidp->path.data, path->data, path->size)) {
> >=20
> > -            /* Mark the fid non reclaimable. */
> > -            fidp->flags |=3D FID_NON_RECLAIMABLE;
> > -
> > -            /* reopen the file/dir if already closed */
> > -            err =3D v9fs_reopen_fid(pdu, fidp);
> > -            if (err < 0) {
> > -                put_fid(pdu, fidp);
> > -                return err;
> > -            }
> > -        }
> > -
> > -        fidp_next =3D QSIMPLEQ_NEXT(fidp, next);
> > -
> > -        if (fidp_next) {
> >=20
> >              /*
> >=20
> > -             * Ensure the next fid survives a potential clunk request
> > during
> > -             * put_fid() below and v9fs_reopen_fid() in the next
> > iteration.
> > +             * Ensure the fid survives a potential clunk
> > request during
> > +             * v9fs_reopen_fid or put_fid.
> >=20
> >               */
> >=20
> > -            fidp_next->ref++;
> > +            fidp->ref++;
> > +            fidp->flags |=3D FID_NON_RECLAIMABLE;
> > +            g_array_append_val(to_reopen, fidp);
> >=20
> >          }
> >=20
> > +    }
> >=20
> > -        /* We're done with this fid */
> > -        put_fid(pdu, fidp);
> > +    for (i =3D 0; i < to_reopen->len; i++) {
> > +        fidp =3D g_array_index(to_reopen, V9fsFidState*, i);
> > +        /* reopen the file/dir if already closed */
> > +        err =3D v9fs_reopen_fid(pdu, fidp);
> > +        if (err < 0) {
> > +            goto out;
>=20
> Looks like a simple `break;` here and dropping the `out:` label below is
> sufficient. But I can do that on my end.
>=20
> > +        }
> >=20
> >      }
> >=20
> > -    return 0;
> > + out:
> > +    for (i =3D 0; i < to_reopen->len; i++) {
> > +        put_fid(pdu, g_array_index(to_reopen, V9fsFidState*, i));
> > +    }
> > +    return err;
> >=20
> >  }
>=20
> ... so yeah, I think that simple put_fid() loop is fine. Probably I
> overlooked the 2nd put_fid() call in the original code. So basically the
> old =3D=3D new behaviour was and is: the sum of refcount increments/decre=
ments
> after returning from this function is exactly neutral/zero for each fid,
> without any exception.
>=20
> >  static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
> >  {
> > =20
> >      V9fsState *s =3D pdu->s;
> >      V9fsFidState *fidp;
> >=20
> > +    GList *freeing;
> > +    /*
> > +     * Get a list of all the values (fid states) in the table, which
> > +     * we then...
> > +     */
> > +    g_autoptr(GList) fids =3D g_hash_table_get_values(s->fids);
> >=20
> > -    /* Free all fids */
> > -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> > -        /* Get fid */
> > -        fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
> > -        fidp->ref++;
> > +    /* ... remove from the table, taking over ownership. */
> > +    g_hash_table_steal_all(s->fids);
> >=20
> > -        /* Clunk fid */
> > -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> > +    /*
> > +     * This allows us to release our references to them asynchronously
> > without
> > +     * iterating over the hash table and risking iterator
> > invalidation
> > +     * through concurrent modifications.
> > +     */
> > +    for (freeing =3D fids; freeing; freeing =3D freeing->next) {
> > +        fidp =3D freeing->data;
> > +        fidp->ref++;
> >=20
> >          fidp->clunked =3D true;
> >=20
> > -
> >=20
> >          put_fid(pdu, fidp);
> >     =20
> >      }
> > =20
> >  }
> >=20
> > @@ -3205,6 +3223,8 @@ static int coroutine_fn v9fs_complete_rename(V9fs=
PDU
> > *pdu, V9fsFidState *fidp, V9fsFidState *tfidp;
> >=20
> >      V9fsState *s =3D pdu->s;
> >      V9fsFidState *dirfidp =3D NULL;
> >=20
> > +    GHashTableIter iter;
> > +    gpointer fid;
> >=20
> >      v9fs_path_init(&new_path);
> >      if (newdirfid !=3D -1) {
> >=20
> > @@ -3238,11 +3258,13 @@ static int coroutine_fn
> > v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp, if (err < 0) {
> >=20
> >          goto out;
> >     =20
> >      }
> >=20
> > +
> >=20
> >      /*
> >     =20
> >       * Fixup fid's pointing to the old name to
> >       * start pointing to the new name
> >       */
> >=20
> > -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> > +    g_hash_table_iter_init(&iter, s->fids);
> > +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
> >=20
> >          if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
> >         =20
> >              /* replace the name */
> >              v9fs_fix_path(&tfidp->path, &new_path,
> >=20
> > strlen(fidp->path.data)); @@ -3320,6 +3342,8 @@ static int coroutine_fn
> > v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir, V9fsPath oldpath,
> > newpath;
> >=20
> >      V9fsState *s =3D pdu->s;
> >      int err;
> >=20
> > +    GHashTableIter iter;
> > +    gpointer fid;
> >=20
> >      v9fs_path_init(&oldpath);
> >      v9fs_path_init(&newpath);
> >=20
> > @@ -3336,7 +3360,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU
> > *pdu, V9fsPath *olddir, * Fixup fid's pointing to the old name to
> >=20
> >       * start pointing to the new name
> >       */
> >=20
> > -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> > +    g_hash_table_iter_init(&iter, s->fids);
> > +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
> >=20
> >          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
> >         =20
> >              /* replace the name */
> >              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data)=
);
> >=20
> > @@ -4226,7 +4251,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> > V9fsTransport *t, s->ctx.fmode =3D fse->fmode;
> >=20
> >      s->ctx.dmode =3D fse->dmode;
> >=20
> > -    QSIMPLEQ_INIT(&s->fid_list);
> > +    s->fids =3D g_hash_table_new(NULL, NULL);
> >=20
> >      qemu_co_rwlock_init(&s->rename_lock);
> >     =20
> >      if (s->ops->init(&s->ctx, errp) < 0) {
> >=20
> > @@ -4286,6 +4311,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
> >=20
> >      if (s->ctx.fst) {
> >     =20
> >          fsdev_throttle_cleanup(s->ctx.fst);
> >     =20
> >      }
> >=20
> > +    if (s->fids) {
> > +        g_hash_table_destroy(s->fids);
> > +        s->fids =3D NULL;
> > +    }
> >=20
> >      g_free(s->tag);
> >      qp_table_destroy(&s->qpd_table);
> >      qp_table_destroy(&s->qpp_table);
> >=20
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > index 994f952600..10fd2076c2 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -339,7 +339,7 @@ typedef struct {
> >=20
> >  struct V9fsState {
> > =20
> >      QLIST_HEAD(, V9fsPDU) free_list;
> >      QLIST_HEAD(, V9fsPDU) active_list;
> >=20
> > -    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;
> > +    GHashTable *fids;
> >=20
> >      FileOperations *ops;
> >      FsContext ctx;
> >      char *tag;
> >=20
> > --
> > 2.36.2




