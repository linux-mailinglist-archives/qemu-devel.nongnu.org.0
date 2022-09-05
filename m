Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DD5ACE2C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:55:07 +0200 (CEST)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7so-0002JU-6E
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1oV7pB-0008IZ-Sy; Mon, 05 Sep 2022 04:51:29 -0400
Received: from sosiego.soundray.org ([2a01:4f8:c2c:a9a0::1]:49734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1oV7p9-00087b-2n; Mon, 05 Sep 2022 04:51:21 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1662367873;
 bh=/kyngnqCDp/8IzHNee3Ct9C3kPMhB7/ZOSxJz0bs7hI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=bI0KuZA/dnDSSRjfMEo/KZullXJVw/+4cZfEWDz5tImj1pQj2AyTvr4hdh9Lw531c
 MJKQZtUA4NiySg6pTCVoPbnzuKkOKnpibc+XrIQt1RvtP/Gb+6bXxUEdOe7RaZ2oBA
 oakQRhp1ICLBf80J6UodnX3xh/V/SWnt+/SBYnvA=
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Christian
 Schoenebeck <qemu_oss@crudebyte.com>, Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Linus
 Heckemann <git@sphalerite.org>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,  Qemu-block <qemu-block@nongnu.org>
Subject: Re: [PATCH] 9pfs: use GHashMap for fid table
In-Reply-To: <df5c1e4b-9581-61e6-b0be-eb43d9620edf@amsat.org>
 <2843062.aF7IraYCKC@silver> <YxWhA8M4Ul8z2KUj@redhat.com>
References: <20220903150327.2780127-1-git@sphalerite.org>
 <df5c1e4b-9581-61e6-b0be-eb43d9620edf@amsat.org>
 <2843062.aF7IraYCKC@silver> <YxWhA8M4Ul8z2KUj@redhat.com>
Date: Mon, 05 Sep 2022 10:51:10 +0200
Message-ID: <ygao7vu5hmp.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a01:4f8:c2c:a9a0::1;
 envelope-from=git@sphalerite.org; helo=sosiego.soundray.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all, thanks for your reviews.

> @@ -4226,7 +4232,7 @@ int v9fs_device_realize_common(V9fsState *s, const =
V9fsTransport *t,
>      s->ctx.fmode =3D fse->fmode;
>      s->ctx.dmode =3D fse->dmode;
>=20
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids =3D g_hash_table_new(NULL, NULL);
>      qemu_co_rwlock_init(&s->rename_lock);
>=20
>      if (s->ops->init(&s->ctx, errp) < 0) {

I noticed that the hash table may be leaked as is. I'll address this in
the next submission.


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> [Style nitpicking]

Applied these changes and will include them in the next version of the patc=
h.

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > @@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32=
_t
> > fid) {
> >      V9fsFidState *f;
> >=20
> > -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > +    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
> >          /* If fid is already there return NULL */
> > -        BUG_ON(f->clunked);
> > -        if (f->fid =3D=3D fid) {
> > -            return NULL;
> > -        }
> > +        return NULL;
>
> Probably retaining BUG_ON(f->clunked) here?

I decided not to since this was a sanity check that was happening for
_each_ fid, but only up to the one we were looking for. This seemed
inconsistent and awkward to me, so I dropped it completely (and the
invariant that no clunked fids remain in the table still seems to hold
-- it's fairly trivial to check, in that the clunked flag is only set
in two places, both of which also remove the map entry). My preference
would be to leave it out, but I'd also be fine with restoring it for
just the one we're looking for, or maybe moving the check to when we're
iterating over the whole table, e.g. in v9fs_reclaim_fd. Thoughts?

> > @@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s, int3=
2_t
> > fid) {
> >      V9fsFidState *fidp;
> >=20
> > -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> > -        if (fidp->fid =3D=3D fid) {
> > -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> > -            fidp->clunked =3D true;
> > -            return fidp;
> > -        }
> > +    fidp =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> > +    if (fidp) {
> > +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> > +        fidp->clunked =3D true;
> > +        return fidp;
>
> We can't get rid of the double lookup here, can we? Surprisingly I don't =
find=20
> a lookup function on the iterator based API.

It seems you're not the only one who had that idea:
https://gitlab.gnome.org/GNOME/glib/-/issues/613

In this case, I think an extended remove function which returns the
values that were present would be even nicer. But neither exists at this
time (and that issue is pretty old), I guess we're stuck with this for
now.


Daniel P. Berrang=C3=A9 writes:
> In $SUBJECT it is called GHashTable, not GHashMap

Indeed, good catch. Will fix in the next version.

Linus

