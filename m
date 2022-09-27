Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AC5ECCA2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:10:47 +0200 (CEST)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFyf-0007Ay-KT
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odFwN-0005YK-KO; Tue, 27 Sep 2022 15:08:23 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odFwI-0000hJ-VE; Tue, 27 Sep 2022 15:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=JqV0ci4o7Uevg2fRqRxEF0bvuo+8+lR0nXEmaFCgzhQ=; b=BNnszWwkPQFb3OXQNS3nCNRBab
 /s+U+HYH/KiTB2PREXzgvop0wLU/QrF8DgfIgfR8w7sP0y3c9k/QhC/6rPlq8zkNMbYrl7tamTBtP
 3aaiM3Y1/UahRQch8lSoHlp++EikvIUEONHt6JLSFfizOQqGPugOpAeMe1SqBa1h1Rv9KaCbJS/wj
 zqpEFz7Lp2D7h4EGuRvfxJCm+QL8x+OIuGTNjhBaIF6U9UkjAQkFDo3VIEJhVab/tnVrbMcLRd9q9
 PkVNwqH1dMC16q9dUmZLqAy09X7YoKRFEyNeytKf0AoVyIvUglZqFWJefX/Fo5AZHcTqYe51Payel
 wbj/s8C/YUz9nZhci6CPlj26AY78dO8O3jZbGbEPDACY8FhMTGrnEWqkOWeqqJITDcoRfTpSHlI8N
 rb9xF0KDQzxuOfpwHotpTtnnCM27yhkkUlCzasgnHC1RNcEU6wsD+MzDCCfbAImrac5nQuwmz/i9A
 tQNHq4lW4waXOqZIbR6k/LYxRdxSnhXJqLfPyuXIHAd/C4JsubaaOE4429Mb0BL28lQ0uLqy8C4nK
 APQ7fGzaXg8PfrJqNT59TD4YKYHz/GztG7/Iv/czS7xYO07wi3Sl9NIWWrzmDP079AWgCtsOLZg8j
 HHNjopAZCySKb1+q9XtRCSJZhfoiREDvGJ8TVMCX0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5] 9pfs: use GHashTable for fid table
Date: Tue, 27 Sep 2022 21:07:35 +0200
Message-ID: <2752428.l2UPH2nvWZ@silver>
In-Reply-To: <20220927142503.1694674-1-git@sphalerite.org>
References: <20220927142503.1694674-1-git@sphalerite.org>
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

On Dienstag, 27. September 2022 16:25:03 CEST Linus Heckemann wrote:
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
> This squashes the separately submitted patch "9pfs: avoid iterator
> invalidation in v9fs_mark_fids_unreclaim"
> (20220926124207.1325763-1-git@sphalerite.org) into the previous
> version of this change.
>=20
> I've skipped v4, because the former is arguably a poorly submitted v4.
>=20
> I've also addressed Christian Schoenebeck's comments on the former:
>=20
> * (v9fs_mark_fids_unreclaim) switched to g_autoptr for the array
>   storing the fids intermediately in preparation for reopening
>=20
> * (v9fs_mark_fids_unreclaim) restored the accidentally removed
>   FID_NON_RECLAIMABLE mark
>=20
> * (v9fs_mark_fids_unreclaim) moved fid reference release into a third
>   loop, which is run even if an error is encountered during a reopen
>   operation, in order to avoid leaking references to fids.
>=20
> * (v9fs_reset) implemented logic to avoid the same iterator
>   invalidation problem
>=20
> I've also added a comment explaining the exact role of
> v9fs_mark_fids_unreclaim, since it's not entirely obvious at a glance.
>=20
>=20
>  hw/9pfs/9p.c | 188 ++++++++++++++++++++++++++++-----------------------
>  hw/9pfs/9p.h |   2 +-
>  2 files changed, 106 insertions(+), 84 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..0e485cb631 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -282,33 +282,32 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU
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
> @@ -317,12 +316,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) {
>      V9fsFidState *f;
>=20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
>          /* If fid is already there return NULL */
> -        BUG_ON(f->clunked);

Not a big deal, but I start thinking whether to keep BUG_ON() here as well.=
=20
That would require using g_hash_table_lookup() here instead of=20
g_hash_table_contains(). Not that I would insist.

> -        if (f->fid =3D=3D fid) {
> -            return NULL;
> -        }
> +        return NULL;
>      }
>      f =3D g_new0(V9fsFidState, 1);
>      f->fid =3D fid;
> @@ -333,7 +329,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) * reclaim won't close the file descriptor
>       */
>      f->flags |=3D FID_REFERENCED;
> -    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> +    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
>=20
>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -424,12 +420,12 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t
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
> @@ -439,10 +435,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
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
> @@ -514,72 +515,82 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
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
> sizeof(V9fsFidState*), 1);

Line length. I'm missing the QEMU code style bot that used to bark on this.=
 :)

    ./scripts/checkpatch.pl your.patch

or

    ./scripts/checkpatch.pl -f hw/9pfs/9p.c

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
> +     * reopening them happens asynchronously, allowing the fid table
> +     * to be modified in the meantime, invalidating our iterator.
>       */

OK, I get it that you squashed your previous patch and that you ended up wi=
th=20
this comment instead. But if you read the old comment version here, you'll=
=20
notice that it describes the actual problem more accurately: especially tha=
t=20
v9fs_reopen_fid() and put_fid() are the 2 functions that may cause the=20
coroutine to "yield" here. That's an important information to be retained i=
n=20
this comment here as it's not obvious.

> -    for (fidp->ref++; fidp; fidp =3D fidp_next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
>          if (fidp->path.size =3D=3D path->size &&
>              !memcmp(fidp->path.data, path->data, path->size)) {
> -            /* Mark the fid non reclaimable. */
> -            fidp->flags |=3D FID_NON_RECLAIMABLE;

I would not move this to the 2nd loop. I would still set the=20
=46ID_NON_RECLAIMABLE flag here, for the same reasons that you are bumping =
the=20
refcount already in the first loop below.

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
> +            g_array_append_val(to_reopen, fidp);
>          }
> +    }
>=20
> -        /* We're done with this fid */
> -        put_fid(pdu, fidp);
> +    for (i=3D0; i < to_reopen->len; i++) {
> +        fidp =3D g_array_index(to_reopen, V9fsFidState*, i);
> +        fidp->flags |=3D FID_NON_RECLAIMABLE;

So setting the flag would go back to the 1st loop.

> +        /* reopen the file/dir if already closed */
> +        err =3D v9fs_reopen_fid(pdu, fidp);
> +        if (err < 0) {
> +            goto out;

There is something wrong here ...

> +        }
>      }
>=20
> -    return 0;
> + out:
> +    for (i=3D0; i < to_reopen->len; i++) {
> +        put_fid(pdu, g_array_index(to_reopen, V9fsFidState*, i));

=2E.. that's not the same behaviour as before, is it? Old behaviour was to =
put=20
the respective (last) fid only on error. And this would now put all fids.

> +    }
> +    return err;
>  }
>=20
>  static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>  {
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *fidp;
> +    GList *freeing;

Wasn't there something like GLIST_FOREACH()? Then you wouldn't need to add=
=20
that variable.

> +    /* Get a list of all the values (fid states) in the table, which we
> then... */

Line length.

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

Line length.

> +    for (freeing =3D fids; freeing; freeing =3D freeing->next) {

GLIST_FOREACH()? I mean if we don't have that macro somewhere, be it. Might=
 be=20
something for a future, separate cleanup patch then.

> +        fidp =3D freeing->data;
> +        fidp->ref++;
>          fidp->clunked =3D true;
> -
>          put_fid(pdu, fidp);
>      }
>  }
> @@ -3205,6 +3216,8 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> *pdu, V9fsFidState *fidp, V9fsFidState *tfidp;
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *dirfidp =3D NULL;
> +    GHashTableIter iter;
> +    gpointer fid;
>=20
>      v9fs_path_init(&new_path);
>      if (newdirfid !=3D -1) {
> @@ -3238,11 +3251,13 @@ static int coroutine_fn v9fs_complete_rename(V9fs=
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
> strlen(fidp->path.data)); @@ -3320,6 +3335,8 @@ static int coroutine_fn
> v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir, V9fsPath oldpath,
> newpath;
>      V9fsState *s =3D pdu->s;
>      int err;
> +    GHashTableIter iter;
> +    gpointer fid;
>=20
>      v9fs_path_init(&oldpath);
>      v9fs_path_init(&newpath);
> @@ -3336,7 +3353,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU
> *pdu, V9fsPath *olddir, * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
>          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4226,7 +4244,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> V9fsTransport *t, s->ctx.fmode =3D fse->fmode;
>      s->ctx.dmode =3D fse->dmode;
>=20
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids =3D g_hash_table_new(NULL, NULL);
>      qemu_co_rwlock_init(&s->rename_lock);
>=20
>      if (s->ops->init(&s->ctx, errp) < 0) {
> @@ -4286,6 +4304,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
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



