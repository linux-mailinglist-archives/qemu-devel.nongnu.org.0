Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE85AD359
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:59:50 +0200 (CEST)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBhd-0004ow-Uc
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oVB4J-000597-OA
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:19:12 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:56434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oVB4H-0002Dz-HH
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:19:11 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-2oCdOIYjPW6EfeIxmT90WQ-1; Mon, 05 Sep 2022 08:18:52 -0400
X-MC-Unique: 2oCdOIYjPW6EfeIxmT90WQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3CF3811E80;
 Mon,  5 Sep 2022 12:18:51 +0000 (UTC)
Received: from bahia (unknown [10.39.193.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE105C15BB3;
 Mon,  5 Sep 2022 12:18:50 +0000 (UTC)
Date: Mon, 5 Sep 2022 14:18:49 +0200
From: Greg Kurz <groug@kaod.org>
To: Linus Heckemann <git@sphalerite.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Christian
 Schoenebeck <qemu_oss@crudebyte.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, qemu-devel@nongnu.org, Qemu-block
 <qemu-block@nongnu.org>
Subject: Re: [PATCH] 9pfs: use GHashMap for fid table
Message-ID: <20220905141849.0548001a@bahia>
In-Reply-To: <ygao7vu5hmp.fsf@localhost>
References: <20220903150327.2780127-1-git@sphalerite.org>
 <df5c1e4b-9581-61e6-b0be-eb43d9620edf@amsat.org>
 <2843062.aF7IraYCKC@silver> <YxWhA8M4Ul8z2KUj@redhat.com>
 <ygao7vu5hmp.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Linus,

Thanks for this promising change !

On Mon, 05 Sep 2022 10:51:10 +0200
Linus Heckemann <git@sphalerite.org> wrote:

> Hi all, thanks for your reviews.
>=20
> > @@ -4226,7 +4232,7 @@ int v9fs_device_realize_common(V9fsState *s, cons=
t V9fsTransport *t,
> >      s->ctx.fmode =3D fse->fmode;
> >      s->ctx.dmode =3D fse->dmode;
> >=20
> > -    QSIMPLEQ_INIT(&s->fid_list);
> > +    s->fids =3D g_hash_table_new(NULL, NULL);
> >      qemu_co_rwlock_init(&s->rename_lock);
> >=20
> >      if (s->ops->init(&s->ctx, errp) < 0) {
>=20
> I noticed that the hash table may be leaked as is. I'll address this in
> the next submission.
>=20

Pay attention that this rollback should be added to
v9fs_device_unrealize_common() which is assumed to be
idempotent and is already called on the error path of
v9fs_device_realize_common().

>=20
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> > [Style nitpicking]
>=20
> Applied these changes and will include them in the next version of the pa=
tch.
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > > @@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int=
32_t
> > > fid) {
> > >      V9fsFidState *f;
> > >=20
> > > -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > > +    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
> > >          /* If fid is already there return NULL */
> > > -        BUG_ON(f->clunked);
> > > -        if (f->fid =3D=3D fid) {
> > > -            return NULL;
> > > -        }
> > > +        return NULL;
> >
> > Probably retaining BUG_ON(f->clunked) here?
>=20
> I decided not to since this was a sanity check that was happening for
> _each_ fid, but only up to the one we were looking for. This seemed
> inconsistent and awkward to me, so I dropped it completely (and the
> invariant that no clunked fids remain in the table still seems to hold
> -- it's fairly trivial to check, in that the clunked flag is only set
> in two places, both of which also remove the map entry). My preference
> would be to leave it out, but I'd also be fine with restoring it for
> just the one we're looking for, or maybe moving the check to when we're
> iterating over the whole table, e.g. in v9fs_reclaim_fd. Thoughts?
>=20

Well... finding at least one clunked fid state in this table is
definitely a bug so I'll keep the BUG_ON() anyway.

> > > @@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s, in=
t32_t
> > > fid) {
> > >      V9fsFidState *fidp;
> > >=20
> > > -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> > > -        if (fidp->fid =3D=3D fid) {
> > > -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> > > -            fidp->clunked =3D true;
> > > -            return fidp;
> > > -        }
> > > +    fidp =3D g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> > > +    if (fidp) {
> > > +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> > > +        fidp->clunked =3D true;
> > > +        return fidp;
> >
> > We can't get rid of the double lookup here, can we? Surprisingly I don'=
t find=20
> > a lookup function on the iterator based API.
>=20
> It seems you're not the only one who had that idea:
> https://gitlab.gnome.org/GNOME/glib/-/issues/613
>=20
> In this case, I think an extended remove function which returns the
> values that were present would be even nicer. But neither exists at this
> time (and that issue is pretty old), I guess we're stuck with this for
> now.

g_hash_table_steal_extended() [1] actually allows to do just that. Since the
hash table is allocated with g_hash_table_new() and doesn't care for destroy
functions, the code change would be something like:

@@ -424,12 +419,10 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t =
fid)
 {
     V9fsFidState *fidp;
=20
-    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
-        if (fidp->fid =3D=3D fid) {
-            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
-            fidp->clunked =3D true;
-            return fidp;
-        }
+    if (g_hash_table_steal_extended(s->fids, GINT_TO_POINTER(fid), NULL,
+                                    (gpointer *)&fidp)) {
+        fidp->clunked =3D true;
+        return fidp;
     }
     return NULL;
 }

[1] https://developer-old.gnome.org/glib/stable/glib-Hash-Tables.html#g-has=
h-table-steal-extended

Cheers,

--
Greg

>=20
>=20
> Daniel P. Berrang=C3=A9 writes:
> > In $SUBJECT it is called GHashTable, not GHashMap
>=20
> Indeed, good catch. Will fix in the next version.
>=20
> Linus


