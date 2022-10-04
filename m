Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535E5F4402
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:15:05 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhlI-00056B-I7
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofhRN-0002ER-P5; Tue, 04 Oct 2022 08:54:29 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofhRK-0000X6-Vh; Tue, 04 Oct 2022 08:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=7nicvJ+7yEkILsn5bZnpWTnAXHKCWKZFa0gJXrh7NxA=; b=w0W1OXYgeAw1/igrxcHwkYoqKr
 SVA+gGRb9sYJP31hF0E3v/yXrM3lYHWVXDEGyc+AXUtkW6c7I6G7LFnGbthBHTOrz88Y3HKvnjDZr
 MlzAKNWVNsJVrbiFD0En5GtxLgO9MDUyq+LF81HIrwqIgtoYWb9L635jX7mqyZyZd+BDIZJ8zea+W
 a33EqdiIOZogZPugZiR8aVIeKs5dhkTL0mu7Mf9S+PRq2RFtvTc/BctqByH5ReyuVAiit2dq2PMgR
 8b/86bAoHUoRbe9LaSbDxC84p+bC/D9XPxvGubd8znkKRliv0vvp4ErufnX+5QU1wyesiApMc9W3z
 pX+Ns2kwGj5rV4ysFBiyqVHka9h0oxxS9Wen5gQLYTF+PMjsTjGBKABWK8fBRK1U/qC2DkV/AuhQb
 JU7e7L5fQY4qtcmP4HnT9WoH2ky+N8w9t8mMWbaEoW0f8Iw5tCQyuZF0+ydlvVgkolr8fWez6mEaB
 3CmbdiFw1tZq/O5LZhXTAeOSvPoYDdlJGbtWxuI+wYKO13+OkE/cs6Za3CYQhHpq+OHODT4Zugxv5
 a4O5cvUQcuS+tPjYd7tMZmKALKQRfHGWogAGlZqkhMAIInlV4XQ6HpwdbNT4yemCUINvhTWJ1j3rP
 KQFzJ1KT1YTuNtNXU5xx5/cuojn1djCkusy9IndMg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Qemu-block <qemu-block@nongnu.org>,
 Linus Heckemann <git@sphalerite.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6] 9pfs: use GHashTable for fid table
Date: Tue, 04 Oct 2022 14:54:16 +0200
Message-ID: <19360658.4YNXD89StS@silver>
In-Reply-To: <20221004104121.713689-1-git@sphalerite.org>
References: <20221004104121.713689-1-git@sphalerite.org>
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

On Dienstag, 4. Oktober 2022 12:41:21 CEST Linus Heckemann wrote:
> The previous implementation would iterate over the fid table for
> lookup operations, resulting in an operation with O(n) complexity on
> the number of open files and poor cache locality -- for every open,
> stat, read, write, etc operation.
>=20
> This change uses a hashtable for this instead, significantly improving
> the performance of the 9p filesystem. The runtime of NixOS's simple
> installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> decreased by a factor of about 10.
>=20
> Signed-off-by: Linus Heckemann <git@sphalerite.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Message-Id: <20220908112353.289267-1-git@sphalerite.org>
> [CS: - Retain BUG_ON(f->clunked) in get_fid().
>      - Add TODO comment in clunk_fid(). ]
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

In general: LGTM now, but I will definitely go for some longer test runs=20
before queuing this patch. Some minor side notes below ...

> Christian Schoenebeck writes:
> > Not a big deal, but I start thinking whether to keep BUG_ON() here as
> > well.
> > That would require using g_hash_table_lookup() here instead of
> > g_hash_table_contains(). Not that I would insist.
>=20
> Done.
>=20
> > checkpatch.pl
>=20
> Fixed.
>=20
> > OK, I get it that you squashed your previous patch and that you ended up
> > with this comment instead. But if you read the old comment version here,
> > you'll notice that it describes the actual problem more accurately:
> > especially that v9fs_reopen_fid() and put_fid() are the 2 functions that
> > may cause the coroutine to "yield" here. That's an important information
> > to be retained in this comment here as it's not obvious.
>=20
> Reworded to mention these functions explicitly.
>=20
> >  I would not move this to the 2nd loop. I would still set the
> >=20
> > FID_NON_RECLAIMABLE flag here, for the same reasons that you are bumping
> > the refcount already in the first loop below.
>=20
> Good point! Fixed.
>=20
> >  ... that's not the same behaviour as before, is it? Old behaviour was =
to
> >  put>=20
> > the respective (last) fid only on error. And this would now put all fid=
s.
>=20
> Indeed it isn't the old behaviour, but I believe it's correct: since
> before we only incremented the reference counter for each one when we
> started reopening it. Now, we increment _all_ their refcounts, so we
> need to put all of them back as well.

Yeah, commented in v9fs_mark_fids_unreclaim() changes below ...

> >  Wasn't there something like GLIST_FOREACH()? Then you wouldn't need to
> >  add
> >=20
> > that variable.
>=20
> glib does provide g_list_foreach, but that requires a function
> pointer. I'm not aware of a macro for this. I could change this to use
> a QLIST (for which we do have a macro) instead of a GList if you
> insist, but I'd default to leaving this as is.

That's better handled by a future cleanup patch. Right now I find it=20
prioritized to get this performance fix merged ASAP, as it provides a=20
significant improvement for a lot of people.

I have seen GLIST_FOREACH macros (without function pointer) in other projec=
ts,=20
but I guess that macro was defined locally by those projects.

> Thanks for your repeated reviews and patience!
>=20
> Linus
>=20
>=20
>  hw/9pfs/9p.c | 195 +++++++++++++++++++++++++++++----------------------
>  hw/9pfs/9p.h |   2 +-
>  2 files changed, 113 insertions(+), 84 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..729d3181e0 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -256,7 +256,8 @@ static size_t v9fs_string_size(V9fsString *str)
>  }
>=20
>  /*
> - * returns 0 if fid got re-opened, 1 if not, < 0 on error */
> + * returns 0 if fid got re-opened, 1 if not, < 0 on error
> + */
>  static int coroutine_fn v9fs_reopen_fid(V9fsPDU *pdu, V9fsFidState *f)
>  {
>      int err =3D 1;
> @@ -282,33 +283,32 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU
> *pdu, int32_t fid) V9fsFidState *f;
>      V9fsState *s =3D pdu->s;
>=20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    f =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (f) {
>          BUG_ON(f->clunked);
> -        if (f->fid =3D=3D fid) {
> -            /*
> -             * Update the fid ref upfront so that
> -             * we don't get reclaimed when we yield
> -             * in open later.
> -             */
> -            f->ref++;
> -            /*
> -             * check whether we need to reopen the
> -             * file. We might have closed the fd
> -             * while trying to free up some file
> -             * descriptors.
> -             */
> -            err =3D v9fs_reopen_fid(pdu, f);
> -            if (err < 0) {
> -                f->ref--;
> -                return NULL;
> -            }
> -            /*
> -             * Mark the fid as referenced so that the LRU
> -             * reclaim won't close the file descriptor
> -             */
> -            f->flags |=3D FID_REFERENCED;
> -            return f;
> +        /*
> +         * Update the fid ref upfront so that
> +         * we don't get reclaimed when we yield
> +         * in open later.
> +         */
> +        f->ref++;
> +        /*
> +         * check whether we need to reopen the
> +         * file. We might have closed the fd
> +         * while trying to free up some file
> +         * descriptors.
> +         */
> +        err =3D v9fs_reopen_fid(pdu, f);
> +        if (err < 0) {
> +            f->ref--;
> +            return NULL;
>          }
> +        /*
> +         * Mark the fid as referenced so that the LRU
> +         * reclaim won't close the file descriptor
> +         */
> +        f->flags |=3D FID_REFERENCED;
> +        return f;
>      }
>      return NULL;
>  }
> @@ -317,12 +317,11 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) {
>      V9fsFidState *f;
>=20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    f =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (f) {
>          /* If fid is already there return NULL */
>          BUG_ON(f->clunked);
> -        if (f->fid =3D=3D fid) {
> -            return NULL;
> -        }
> +        return NULL;
>      }
>      f =3D g_new0(V9fsFidState, 1);
>      f->fid =3D fid;
> @@ -333,7 +332,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) * reclaim won't close the file descriptor
>       */
>      f->flags |=3D FID_REFERENCED;
> -    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> +    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
>=20
>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -424,12 +423,12 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t
> fid) {
>      V9fsFidState *fidp;
>=20
> -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> -        if (fidp->fid =3D=3D fid) {
> -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> -            fidp->clunked =3D true;
> -            return fidp;
> -        }
> +    /* TODO: Use g_hash_table_steal_extended() instead? */
> +    fidp =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (fidp) {
> +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> +        fidp->clunked =3D true;
> +        return fidp;
>      }
>      return NULL;
>  }
> @@ -439,10 +438,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>      int reclaim_count =3D 0;
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *f;
> +    GHashTableIter iter;
> +    gpointer fid;
> +
> +    g_hash_table_iter_init(&iter, s->fids);
> +
>      QSLIST_HEAD(, V9fsFidState) reclaim_list =3D
>          QSLIST_HEAD_INITIALIZER(reclaim_list);
>=20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &f)) {
>          /*
>           * Unlink fids cannot be reclaimed. Check
>           * for them and skip them. Also skip fids
> @@ -514,72 +518,86 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>      }
>  }
>=20
> +/*
> + * This is used when a path is removed from the directory tree. Any
> + * fids that still reference it must not be closed from then on, since
> + * they cannot be reopened.
> + */
>  static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath
> *path) {
> -    int err;
> +    int err =3D 0;

Not really necessary as `err` was and is never used unitialized, but OK.

>      V9fsState *s =3D pdu->s;
> -    V9fsFidState *fidp, *fidp_next;
> +    V9fsFidState *fidp;
> +    gpointer fid;
> +    GHashTableIter iter;
> +    /*
> +     * The most common case is probably that we have exactly one
> +     * fid for the given path, so preallocate exactly one.
> +     */
> +    g_autoptr(GArray) to_reopen =3D g_array_sized_new(FALSE, FALSE,
> +            sizeof(V9fsFidState *), 1);
> +    gint i;
>=20
> -    fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
> -    if (!fidp) {
> -        return 0;
> -    }
> +    g_hash_table_iter_init(&iter, s->fids);
>=20
>      /*
> -     * v9fs_reopen_fid() can yield : a reference on the fid must be held
> -     * to ensure its pointer remains valid and we can safely pass it to
> -     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
> -     * we must keep a reference on the next fid as well. So the logic he=
re
> -     * is to get a reference on a fid and only put it back during the ne=
xt
> -     * iteration after we could get a reference on the next fid. Start w=
ith
> -     * the first one.
> +     * We iterate over the fid table looking for the entries we need
> +     * to reopen, and store them in to_reopen. This is because
> +     * v9fs_reopen_fid() and put_fid() yield. This allows the fid table
> +     * to be modified in the meantime, invalidating our iterator.
>       */
> -    for (fidp->ref++; fidp; fidp =3D fidp_next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
>          if (fidp->path.size =3D=3D path->size &&
>              !memcmp(fidp->path.data, path->data, path->size)) {
> -            /* Mark the fid non reclaimable. */
> -            fidp->flags |=3D FID_NON_RECLAIMABLE;
> -
> -            /* reopen the file/dir if already closed */
> -            err =3D v9fs_reopen_fid(pdu, fidp);
> -            if (err < 0) {
> -                put_fid(pdu, fidp);
> -                return err;
> -            }
> -        }
> -
> -        fidp_next =3D QSIMPLEQ_NEXT(fidp, next);
> -
> -        if (fidp_next) {
>              /*
> -             * Ensure the next fid survives a potential clunk request
> during
> -             * put_fid() below and v9fs_reopen_fid() in the next
> iteration.
> +             * Ensure the fid survives a potential clunk
> request during
> +             * v9fs_reopen_fid or put_fid.
>               */
> -            fidp_next->ref++;
> +            fidp->ref++;
> +            fidp->flags |=3D FID_NON_RECLAIMABLE;
> +            g_array_append_val(to_reopen, fidp);
>          }
> +    }
>=20
> -        /* We're done with this fid */
> -        put_fid(pdu, fidp);
> +    for (i =3D 0; i < to_reopen->len; i++) {
> +        fidp =3D g_array_index(to_reopen, V9fsFidState*, i);
> +        /* reopen the file/dir if already closed */
> +        err =3D v9fs_reopen_fid(pdu, fidp);
> +        if (err < 0) {
> +            goto out;

Looks like a simple `break;` here and dropping the `out:` label below is=20
sufficient. But I can do that on my end.

> +        }
>      }
>=20
> -    return 0;
> + out:
> +    for (i =3D 0; i < to_reopen->len; i++) {
> +        put_fid(pdu, g_array_index(to_reopen, V9fsFidState*, i));
> +    }
> +    return err;
>  }

=2E.. so yeah, I think that simple put_fid() loop is fine. Probably I overl=
ooked=20
the 2nd put_fid() call in the original code. So basically the old =3D=3D ne=
w=20
behaviour was and is: the sum of refcount increments/decrements after=20
returning from this function is exactly neutral/zero for each fid, without =
any=20
exception.

>=20
>  static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>  {
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *fidp;
> +    GList *freeing;
> +    /*
> +     * Get a list of all the values (fid states) in the table, which
> +     * we then...
> +     */
> +    g_autoptr(GList) fids =3D g_hash_table_get_values(s->fids);
>=20
> -    /* Free all fids */
> -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> -        /* Get fid */
> -        fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
> -        fidp->ref++;
> +    /* ... remove from the table, taking over ownership. */
> +    g_hash_table_steal_all(s->fids);
>=20
> -        /* Clunk fid */
> -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> +    /*
> +     * This allows us to release our references to them asynchronously
> without
> +     * iterating over the hash table and risking iterator
> invalidation
> +     * through concurrent modifications.
> +     */
> +    for (freeing =3D fids; freeing; freeing =3D freeing->next) {
> +        fidp =3D freeing->data;
> +        fidp->ref++;
>          fidp->clunked =3D true;
> -
>          put_fid(pdu, fidp);
>      }
>  }
> @@ -3205,6 +3223,8 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> *pdu, V9fsFidState *fidp, V9fsFidState *tfidp;
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *dirfidp =3D NULL;
> +    GHashTableIter iter;
> +    gpointer fid;
>=20
>      v9fs_path_init(&new_path);
>      if (newdirfid !=3D -1) {
> @@ -3238,11 +3258,13 @@ static int coroutine_fn v9fs_complete_rename(V9fs=
PDU
> *pdu, V9fsFidState *fidp, if (err < 0) {
>          goto out;
>      }
> +
>      /*
>       * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
>          if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &new_path,
> strlen(fidp->path.data)); @@ -3320,6 +3342,8 @@ static int coroutine_fn
> v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir, V9fsPath oldpath,
> newpath;
>      V9fsState *s =3D pdu->s;
>      int err;
> +    GHashTableIter iter;
> +    gpointer fid;
>=20
>      v9fs_path_init(&oldpath);
>      v9fs_path_init(&newpath);
> @@ -3336,7 +3360,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU
> *pdu, V9fsPath *olddir, * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
>          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4226,7 +4251,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> V9fsTransport *t, s->ctx.fmode =3D fse->fmode;
>      s->ctx.dmode =3D fse->dmode;
>=20
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids =3D g_hash_table_new(NULL, NULL);
>      qemu_co_rwlock_init(&s->rename_lock);
>=20
>      if (s->ops->init(&s->ctx, errp) < 0) {
> @@ -4286,6 +4311,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
>      if (s->ctx.fst) {
>          fsdev_throttle_cleanup(s->ctx.fst);
>      }
> +    if (s->fids) {
> +        g_hash_table_destroy(s->fids);
> +        s->fids =3D NULL;
> +    }
>      g_free(s->tag);
>      qp_table_destroy(&s->qpd_table);
>      qp_table_destroy(&s->qpp_table);
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 994f952600..10fd2076c2 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -339,7 +339,7 @@ typedef struct {
>  struct V9fsState {
>      QLIST_HEAD(, V9fsPDU) free_list;
>      QLIST_HEAD(, V9fsPDU) active_list;
> -    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;
> +    GHashTable *fids;
>      FileOperations *ops;
>      FsContext ctx;
>      char *tag;
> --
> 2.36.2




