Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD15AD0E5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:59:53 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9pX-0002s7-Q8
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oV9Jd-0004P1-0m; Mon, 05 Sep 2022 06:26:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oV9JU-0006Ob-JH; Mon, 05 Sep 2022 06:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jXFomgTxJPzBLi5apH8KcEVE2UndDdFHxpF+itFrmeg=; b=jXuTKEQ+eYy0NDKrJkbmbpUAKf
 15sDPXFKhQNHa7sTXWMa1kr/vqVD61Pz/ZUWW7ZVnoFSIykF77hHDg/W13VM0trnrmKeN6FoLryLS
 L6F64WAiEOHf4jN//s+0aRoJKagAuMfxHFygcyIZQUOIe7kmCk+ewPY2V5D+tvIzAjBsijp0onlr8
 tjCOK+scpbMptxE7IhVEKyNm5vvSBLMeDVtLioUGISu9HoLF/oitAsKGs6rQbT08kbof90x4uMZ2A
 m+g6pPBiRml7qcj7lrSpOtsIQ4iIulAIBJdGJhc0vlL1KJ4oDTg1iw2BBtx1h4cVopz56DTuDCQld
 uxpLLmcKPv/JFjgflBQaCblcpHICTQH4yD5TfiG35HvumPDoC/9qA2gXvSV31FDIOYaBVm3yVuogQ
 b+0S+Gxuv4JNGTgNb8xAVUzGADjKJcnJ6ts2B16hU1VsXBv5TUeaBkUi/SdvS1pMqYVMYonlnG27/
 EC0ZYHBpeepeZi860Jr0NiOpODQZp0EKhCcKZ2w3kZLyeRrL8CAqwggZPTxjRBqqUfXNkMz50BkxX
 smBdz5WrDOIUB0HLt4eQq044UvB8EdJ3w5MLElbeQ3VULf1YyKRzLq257C1KPxx9q3xkSwPUlSxDZ
 WjnASiwneEhWw+NV2yyn5Z4c17Q+P+Xz1l5SIxFEE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Linus Heckemann <git@sphalerite.org>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Qemu-block <qemu-block@nongnu.org>
Subject: Re: [PATCH] 9pfs: use GHashMap for fid table
Date: Mon, 05 Sep 2022 12:26:37 +0200
Message-ID: <12888102.ax2P7Sasnn@silver>
In-Reply-To: <ygao7vu5hmp.fsf@localhost>
References: <20220903150327.2780127-1-git@sphalerite.org>
 <YxWhA8M4Ul8z2KUj@redhat.com> <ygao7vu5hmp.fsf@localhost>
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

On Montag, 5. September 2022 10:51:10 CEST Linus Heckemann wrote:
> Hi all, thanks for your reviews.
>=20
> > @@ -4226,7 +4232,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> > V9fsTransport *t,>=20
> >      s->ctx.fmode =3D fse->fmode;
> >      s->ctx.dmode =3D fse->dmode;
> >=20
> > -    QSIMPLEQ_INIT(&s->fid_list);
> > +    s->fids =3D g_hash_table_new(NULL, NULL);
> >=20
> >      qemu_co_rwlock_init(&s->rename_lock);
> >     =20
> >      if (s->ops->init(&s->ctx, errp) < 0) {
>=20
> I noticed that the hash table may be leaked as is. I'll address this in
> the next submission.
>=20
> Philippe Mathieu-Daud=E9 <f4bug@amsat.org> writes:
> > [Style nitpicking]
>=20
> Applied these changes and will include them in the next version of the
> patch.
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > > @@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s,
> > > int32_t
> > > fid) {
> > >=20
> > >      V9fsFidState *f;
> > >=20
> > > -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > > +    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
> > >=20
> > >          /* If fid is already there return NULL */
> > >=20
> > > -        BUG_ON(f->clunked);
> > > -        if (f->fid =3D=3D fid) {
> > > -            return NULL;
> > > -        }
> > > +        return NULL;
> >=20
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

Yeah, I think you are right, it would feel odd. Just drop BUG_ON() for now.

> > > @@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s,
> > > int32_t
> > > fid) {
> > >=20
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
> >=20
> > We can't get rid of the double lookup here, can we? Surprisingly I don't
> > find a lookup function on the iterator based API.
>=20
> It seems you're not the only one who had that idea:
> https://gitlab.gnome.org/GNOME/glib/-/issues/613
>=20
> In this case, I think an extended remove function which returns the
> values that were present would be even nicer. But neither exists at this
> time (and that issue is pretty old), I guess we're stuck with this for
> now.

Well, all we would need was such a proposed=20
g_hash_table_lookup_iter(table,key,iter) function. I just had a quick look =
at=20
ghash.c and it looks like that would actually be straightforward to add as =
the=20
iterator structure takes the same direct array index as the already existin=
g=20
g_hash_table_lookup() function. But anyway, that's the current situation, s=
o=20
be it.

> Daniel P. Berrang=E9 writes:
> > In $SUBJECT it is called GHashTable, not GHashMap
>=20
> Indeed, good catch. Will fix in the next version.
>=20
> Linus



