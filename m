Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89575B1CDC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:24:54 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWGaT-0002kN-QQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oWGUl-0005Ze-2J
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:19:01 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oWGUh-0006Y1-7h
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:18:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 46EC51264C4AF;
 Thu,  8 Sep 2022 14:18:43 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 8 Sep
 2022 14:18:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00363a97001-90ee-4936-8dff-2d1b246a9d01,
 B02C07B1D5AE2B4A5F5E9DA07B2DFCF1042A4A0C) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 8 Sep 2022 14:18:41 +0200
From: Greg Kurz <groug@kaod.org>
To: Linus Heckemann <git@sphalerite.org>
CC: <qemu-devel@nongnu.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Qemu-block <qemu-block@nongnu.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <f4bug@amsat.org>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>
Subject: Re: [PATCH v3] 9pfs: use GHashTable for fid table
Message-ID: <20220908141841.6a451d85@bahia>
In-Reply-To: <20220908112353.289267-1-git@sphalerite.org>
References: <20220908112353.289267-1-git@sphalerite.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: be34fc12-e487-4e87-9848-d60b70acb178
X-Ovh-Tracer-Id: 15970608704750262566
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtvddghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueeuieejtdelleeutdfhteejffeiteffueevffeffeetvdeifeeujefgudegteeunecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=217.182.185.173; envelope-from=groug@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu,  8 Sep 2022 13:23:53 +0200
Linus Heckemann <git@sphalerite.org> wrote:

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
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> Greg Kurz writes:
> > The comment above should be adapted to the new situation : no need
>=20
> I've removed it completely, since the logic is simple enough that only
> the shortened comment below remains necessary.
>=20
> > With the new logic, this should just be:
>=20
> now is :)
>=20
> > g_hash_table_steal_extended() [1] actually allows to do just that.
>=20
> g_hash_table_steal_extended unfortunately isn't available since it was
> introduced in glib 2.58 and we're maintaining compatibility to 2.56.
>=20

Ha... this could be addressed through conditional compilation, e.g.:

static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
{
    V9fsFidState *fidp;

#if GLIB_CHECK_VERSION(2,56,0)
    if (!g_hash_table_steal_extended(s->fids, GINT_TO_POINTER(fid),
                                     NULL, (gpointer *) &fidp)) {
        return NULL;
    }
#else
    fidp =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
    if (fidp) {
        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
    } else {
        return NULL;
    }
#endif

    fidp->clunked =3D true;
    return fidp;
}

or simply leave a TODO comment so that we don't forget.


> > You could just call g_hash_table_iter_remove(&iter) here
>=20
> Applied this suggestion, thanks!
>=20
>=20
> > Well... finding at least one clunked fid state in this table is
> > definitely a bug so I'll keep the BUG_ON() anyway.
>=20
> Christian Schoenebeck writes:
> > Yeah, I think you are right, it would feel odd. Just drop BUG_ON() for
> > now.
>=20
> I still prefer dropping it, but if we were to keep it I think it should
> be in v9fs_reclaim_fd where we iterate and can thus check the whole
> table.
>=20

IMO the relevant aspect isn't really about checking the whole table, but
rather not to get a clunked fid out of this table and pass it over.

>=20
> Greg Kurz and Philippe Mathieu-Daud=C3=A9 write:
> > [patch versioning]
>=20
> Whoops. I used -v2 on git send-email, which just ignored the option,
> rather than git format-patch, by accident. This one _should_ now be v3!
>=20
>=20

v3 it is and LGTM ! No big deal with the BUG_ON(), given the improvement.

My R-b stands. Thanks Linus !

>  hw/9pfs/9p.c | 140 +++++++++++++++++++++++++--------------------------
>  hw/9pfs/9p.h |   2 +-
>  2 files changed, 70 insertions(+), 72 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..98a475e560 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -282,33 +282,31 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *=
pdu, int32_t fid)
>      V9fsFidState *f;
>      V9fsState *s =3D pdu->s;
> =20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> -        BUG_ON(f->clunked);
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
> +    f =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (f) {
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
> @@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t=
 fid)
>  {
>      V9fsFidState *f;
> =20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
>          /* If fid is already there return NULL */
> -        BUG_ON(f->clunked);
> -        if (f->fid =3D=3D fid) {
> -            return NULL;
> -        }
> +        return NULL;
>      }
>      f =3D g_new0(V9fsFidState, 1);
>      f->fid =3D fid;
> @@ -333,7 +328,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t =
fid)
>       * reclaim won't close the file descriptor
>       */
>      f->flags |=3D FID_REFERENCED;
> -    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> +    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
> =20
>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_=
t fid)
>  {
>      V9fsFidState *fidp;
> =20
> -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> -        if (fidp->fid =3D=3D fid) {
> -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> -            fidp->clunked =3D true;
> -            return fidp;
> -        }
> +    fidp =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (fidp) {
> +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> +        fidp->clunked =3D true;
> +        return fidp;
>      }
>      return NULL;
>  }
> @@ -439,10 +433,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
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
> =20
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &f)) {
>          /*
>           * Unlink fids cannot be reclaimed. Check
>           * for them and skip them. Also skip fids
> @@ -518,23 +517,19 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9=
fsPDU *pdu, V9fsPath *path)
>  {
>      int err;
>      V9fsState *s =3D pdu->s;
> -    V9fsFidState *fidp, *fidp_next;
> +    V9fsFidState *fidp;
> +    gpointer fid;
> +    GHashTableIter iter;
> =20
> -    fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
> -    if (!fidp) {
> -        return 0;
> -    }
> +    g_hash_table_iter_init(&iter, s->fids);
> +
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
> +        /*
> +         * Ensure the fid survives a potential clunk request during
> +         * v9fs_reopen_fid.
> +         */
> +        fidp->ref++;
> =20
> -    /*
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
> -     */
> -    for (fidp->ref++; fidp; fidp =3D fidp_next) {
>          if (fidp->path.size =3D=3D path->size &&
>              !memcmp(fidp->path.data, path->data, path->size)) {
>              /* Mark the fid non reclaimable. */
> @@ -548,16 +543,6 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9f=
sPDU *pdu, V9fsPath *path)
>              }
>          }
> =20
> -        fidp_next =3D QSIMPLEQ_NEXT(fidp, next);
> -
> -        if (fidp_next) {
> -            /*
> -             * Ensure the next fid survives a potential clunk request du=
ring
> -             * put_fid() below and v9fs_reopen_fid() in the next iterati=
on.
> -             */
> -            fidp_next->ref++;
> -        }
> -
>          /* We're done with this fid */
>          put_fid(pdu, fidp);
>      }
> @@ -569,18 +554,20 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>  {
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *fidp;
> +    gpointer fid;
> +    GHashTableIter iter;
> +
> +    g_hash_table_iter_init(&iter, s->fids);
> =20
>      /* Free all fids */
> -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> -        /* Get fid */
> -        fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
>          fidp->ref++;
> =20
>          /* Clunk fid */
> -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
>          fidp->clunked =3D true;
> =20
>          put_fid(pdu, fidp);
> +        g_hash_table_iter_remove(&iter);
>      }
>  }
> =20
> @@ -3205,6 +3192,8 @@ static int coroutine_fn v9fs_complete_rename(V9fsPD=
U *pdu, V9fsFidState *fidp,
>      V9fsFidState *tfidp;
>      V9fsState *s =3D pdu->s;
>      V9fsFidState *dirfidp =3D NULL;
> +    GHashTableIter iter;
> +    gpointer fid;
> =20
>      v9fs_path_init(&new_path);
>      if (newdirfid !=3D -1) {
> @@ -3238,11 +3227,13 @@ static int coroutine_fn v9fs_complete_rename(V9fs=
PDU *pdu, V9fsFidState *fidp,
>      if (err < 0) {
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
>              v9fs_fix_path(&tfidp->path, &new_path, strlen(fidp->path.dat=
a));
> @@ -3320,6 +3311,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU =
*pdu, V9fsPath *olddir,
>      V9fsPath oldpath, newpath;
>      V9fsState *s =3D pdu->s;
>      int err;
> +    GHashTableIter iter;
> +    gpointer fid;
> =20
>      v9fs_path_init(&oldpath);
>      v9fs_path_init(&newpath);
> @@ -3336,7 +3329,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU =
*pdu, V9fsPath *olddir,
>       * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
>          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4226,7 +4220,7 @@ int v9fs_device_realize_common(V9fsState *s, const =
V9fsTransport *t,
>      s->ctx.fmode =3D fse->fmode;
>      s->ctx.dmode =3D fse->dmode;
> =20
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids =3D g_hash_table_new(NULL, NULL);
>      qemu_co_rwlock_init(&s->rename_lock);
> =20
>      if (s->ops->init(&s->ctx, errp) < 0) {
> @@ -4286,6 +4280,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
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


