Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CFF4D673F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:09:43 +0100 (CET)
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSilp-0004Rp-PE
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSikx-0003ks-DX
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:08:47 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSiku-0002MR-D9
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:08:46 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-w_lohQNkP0K3Q6PuAkkHqQ-1; Fri, 11 Mar 2022 12:08:41 -0500
X-MC-Unique: w_lohQNkP0K3Q6PuAkkHqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7941091DA0;
 Fri, 11 Mar 2022 17:08:40 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E943B8752F;
 Fri, 11 Mar 2022 17:08:39 +0000 (UTC)
Date: Fri, 11 Mar 2022 18:08:38 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 5/6] 9pfs: fix 'Twalk' to only send error if no
 component walked
Message-ID: <20220311180838.3a8c9f74@bahia>
In-Reply-To: <3685932.ieBdHTVF6f@silver>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <1785989.mTmxrQOLcC@silver> <20220311173541.06d6e96e@bahia>
 <3685932.ieBdHTVF6f@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Mar 2022 17:44:54 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 11. M=C3=A4rz 2022 17:35:41 CET Greg Kurz wrote:
> > On Thu, 10 Mar 2022 10:13:33 +0100
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Mittwoch, 9. M=C3=A4rz 2022 18:57:39 CET Christian Schoenebeck wro=
te:
> > > > Current implementation of 'Twalk' request handling always sends an
> > > > 'Rerror'
> > > >=20
> > > > response if any error occured. The 9p2000 protocol spec sais though=
:
> > > >   "
> > > >   If the first element cannot be walked for any reason, Rerror is
> > > >   returned.
> > > >   Otherwise, the walk will return an Rwalk message containing nwqid=
 qids
> > > >   corresponding, in order, to the files that are visited by the nwq=
id
> > > >   successful elementwise walks; nwqid is therefore either nwname or=
 the
> > > >=20
> > > > index of the first elementwise walk that failed.
> > > >=20
> > > >   "
> > > >  =20
> > > >   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
> > > >=20
> > > > For that reason we are no longer leaving from an error path in func=
tion
> > > > v9fs_walk(), unless really no path component could be walked
> > > > successfully or if the request has been interrupted.
> > > >=20
> > > > Local variable 'nvalid' counts and reflects the number of path
> > > > components
> > > > successfully processed by background I/O thread, whereas local vari=
able
> > > > 'name_idx' subsequently counts and reflects the number of path
> > > > components
> > > > eventually accepted successfully by 9p server controller portion.
> > > >=20
> > > > New local variable 'any_err' is an aggregate variable reflecting wh=
ether
> > > > any error occurred at all, while already existing variable 'err' on=
ly
> > > > reflects the last error.
> > > >=20
> > > > Despite QIDs being delivered to client in a more relaxed way now, i=
t is
> > > > important to note though that fid still must remain uneffacted if a=
ny
> > > > error
> > >=20
> > > Typo: should be "unaffected".
> > >=20
> > > > occurred.
> > > >=20
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > >=20
> > > >  hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
> > > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > > index 6cdc566866..8ccd180608 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaq=
ue)
> > > >=20
> > > >  {
> > > > =20
> > > >      int name_idx, nvalid;
> > > >      g_autofree V9fsQID *qids =3D NULL;
> > > >=20
> > > > -    int i, err =3D 0;
> > > > +    int i, err =3D 0, any_err =3D 0;
> > > >=20
> > > >      V9fsPath dpath, path;
> > > >      P9ARRAY_REF(V9fsPath) pathes =3D NULL;
> > > >      uint16_t nwnames;
> > > >=20
> > > > @@ -1832,6 +1832,7 @@ static void coroutine_fn v9fs_walk(void *opaq=
ue)
> > > >=20
> > > >       * driver code altogether inside the following block.
> > > >       */
> > > >     =20
> > > >      v9fs_co_run_in_worker({
> > > >=20
> > > > +        nvalid =3D 0;
> > > >=20
> > > >          if (v9fs_request_cancelled(pdu)) {
> > > >         =20
> > > >              err =3D -EINTR;
> > > >              break;
> > > >=20
> > > > @@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaq=
ue)
> > > >=20
> > > >              break;
> > > >         =20
> > > >          }
> > > >          stbuf =3D fidst;
> > > >=20
> > > > -        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
> > > > +        for (; nvalid < nwnames; nvalid++) {
> > > >=20
> > > >              if (v9fs_request_cancelled(pdu)) {
> > > >             =20
> > > >                  err =3D -EINTR;
> > > >                  break;
> > > >=20
> > > > @@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *op=
aque)
> > > >=20
> > > >      /*
> > > >     =20
> > > >       * Handle all the rest of this Twalk request on main thread ..=
.
> > > >       */
> > > >=20
> > > > -    if (err < 0) {
> > > > +    if ((err < 0 && !nvalid) || err =3D=3D -EINTR) {
> > > >=20
> > > >          goto out;
> > > >     =20
> > > >      }
> > > >=20
> > > > +    any_err |=3D err;
> > > >=20
> > > >      err =3D stat_to_qid(pdu, &fidst, &qid);
> > > >=20
> > > > -    if (err < 0) {
> > > > +    if (err < 0 && !nvalid) {
> > > >=20
> > > >          goto out;
> > > >     =20
> > > >      }
> > > >      stbuf =3D fidst;
> > > >=20
> > > > @@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *op=
aque)
> > > >=20
> > > >      v9fs_path_copy(&dpath, &fidp->path);
> > > >      v9fs_path_copy(&path, &fidp->path);
> > > >=20
> > > > -    for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> > > > +    for (name_idx =3D 0; name_idx < nvalid; name_idx++) {
> > > >=20
> > > >          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> > > >         =20
> > > >              strcmp("..", wnames[name_idx].data))
> > > >         =20
> > > >          {
> > > >         =20
> > > >              stbuf =3D stbufs[name_idx];
> > > >              err =3D stat_to_qid(pdu, &stbuf, &qid);
> > > >              if (err < 0) {
> > > >=20
> > > > -                goto out;
> > > > +                break;
> > > >=20
> > > >              }
> > > >              v9fs_path_copy(&path, &pathes[name_idx]);
> > > >              v9fs_path_copy(&dpath, &path);
> > > >         =20
> > > >          }
> > > >          memcpy(&qids[name_idx], &qid, sizeof(qid));
> > > >     =20
> > > >      }
> > > >=20
> > > > +    any_err |=3D err;
> > > > +    if (any_err) {
> > >=20
> > > Not sure if there is ever the case err > 0, but as we are already
> > > comparing
> > > for "if (err < 0)" everywhere, we should probably also do the same
> > > comparison for the aggregate error variable here, right?
> >=20
> > It seems that you could drop any_err and just check name_idx !=3D nwnam=
es ?
>=20
> Mmm, what about the special case 'Twalk nwnames=3D0' (i.e. fid cloning), =
that=20
> implementation would then skip errors, no?
>=20

Ouch you're right... honestly, v9fs_walk() is really a mess and it
is getting harder to fix. What about having a totally separate
path for the cloning case (as a preparatory patch) ?

> > >     if (any_err < 0) {
> > >    =20
> > >         ...
> > > >=20
> > > > +        if (!name_idx) {
> > > > +            /* don't send any QIDs, send Rlerror instead */
> > > > +            goto out;
> > > > +        } else {
> > > > +            /* send QIDs (not Rlerror), but fid MUST remain unaffe=
cted
> > > > */
> > > > +            goto send_qids;
> > > > +        }
> > > > +    }
> > > >=20
> > > >      if (fid =3D=3D newfid) {
> > > >     =20
> > > >          if (fidp->fid_type !=3D P9_FID_NONE) {
> > > >         =20
> > > >              err =3D -EINVAL;
> > > >=20
> > > > @@ -1919,8 +1931,9 @@ static void coroutine_fn v9fs_walk(void *opaq=
ue)
> > > >=20
> > > >          newfidp->uid =3D fidp->uid;
> > > >          v9fs_path_copy(&newfidp->path, &path);
> > > >     =20
> > > >      }
> > > >=20
> > > > -    err =3D v9fs_walk_marshal(pdu, nwnames, qids);
> > > > -    trace_v9fs_walk_return(pdu->tag, pdu->id, nwnames, qids);
> > > > +send_qids:
> > > > +    err =3D v9fs_walk_marshal(pdu, name_idx, qids);
> > > > +    trace_v9fs_walk_return(pdu->tag, pdu->id, name_idx, qids);
> > > >=20
> > > >  out:
> > > >      put_fid(pdu, fidp);
> > > >      if (newfidp) {
>=20
>=20


