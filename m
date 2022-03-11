Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F54D667D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:37:16 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiGQ-0002wC-Tu
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSiF5-00027J-Ra
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:35:51 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:59863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSiF3-00015E-3r
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:35:51 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-M8YBJNXzNa28QizWCpqlZg-1; Fri, 11 Mar 2022 11:35:44 -0500
X-MC-Unique: M8YBJNXzNa28QizWCpqlZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B094801AFE;
 Fri, 11 Mar 2022 16:35:43 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3740865AE;
 Fri, 11 Mar 2022 16:35:42 +0000 (UTC)
Date: Fri, 11 Mar 2022 17:35:41 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 5/6] 9pfs: fix 'Twalk' to only send error if no
 component walked
Message-ID: <20220311173541.06d6e96e@bahia>
In-Reply-To: <1785989.mTmxrQOLcC@silver>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <1ad002a1fbc2f8e48384673b0545a164afff7ce9.1646850707.git.qemu_oss@crudebyte.com>
 <1785989.mTmxrQOLcC@silver>
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

On Thu, 10 Mar 2022 10:13:33 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 9. M=C3=A4rz 2022 18:57:39 CET Christian Schoenebeck wrote:
> > Current implementation of 'Twalk' request handling always sends an 'Rer=
ror'
> > response if any error occured. The 9p2000 protocol spec sais though:
> >=20
> >   "
> >   If the first element cannot be walked for any reason, Rerror is retur=
ned.
> >   Otherwise, the walk will return an Rwalk message containing nwqid qid=
s
> >   corresponding, in order, to the files that are visited by the nwqid
> >   successful elementwise walks; nwqid is therefore either nwname or the
> > index of the first elementwise walk that failed.
> >   "
> >=20
> >   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
> >=20
> > For that reason we are no longer leaving from an error path in function
> > v9fs_walk(), unless really no path component could be walked successful=
ly or
> > if the request has been interrupted.
> >=20
> > Local variable 'nvalid' counts and reflects the number of path componen=
ts
> > successfully processed by background I/O thread, whereas local variable
> > 'name_idx' subsequently counts and reflects the number of path componen=
ts
> > eventually accepted successfully by 9p server controller portion.
> >=20
> > New local variable 'any_err' is an aggregate variable reflecting whethe=
r any
> > error occurred at all, while already existing variable 'err' only refle=
cts
> > the last error.
> >=20
> > Despite QIDs being delivered to client in a more relaxed way now, it is
> > important to note though that fid still must remain uneffacted if any e=
rror
>=20
> Typo: should be "unaffected".
>=20
> > occurred.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >  hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 6cdc566866..8ccd180608 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> >  {
> >      int name_idx, nvalid;
> >      g_autofree V9fsQID *qids =3D NULL;
> > -    int i, err =3D 0;
> > +    int i, err =3D 0, any_err =3D 0;
> >      V9fsPath dpath, path;
> >      P9ARRAY_REF(V9fsPath) pathes =3D NULL;
> >      uint16_t nwnames;
> > @@ -1832,6 +1832,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> >       * driver code altogether inside the following block.
> >       */
> >      v9fs_co_run_in_worker({
> > +        nvalid =3D 0;
> >          if (v9fs_request_cancelled(pdu)) {
> >              err =3D -EINTR;
> >              break;
> > @@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> >              break;
> >          }
> >          stbuf =3D fidst;
> > -        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
> > +        for (; nvalid < nwnames; nvalid++) {
> >              if (v9fs_request_cancelled(pdu)) {
> >                  err =3D -EINTR;
> >                  break;
> > @@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *opaque=
)
> >      /*
> >       * Handle all the rest of this Twalk request on main thread ...
> >       */
> > -    if (err < 0) {
> > +    if ((err < 0 && !nvalid) || err =3D=3D -EINTR) {
> >          goto out;
> >      }
> >=20
> > +    any_err |=3D err;
> >      err =3D stat_to_qid(pdu, &fidst, &qid);
> > -    if (err < 0) {
> > +    if (err < 0 && !nvalid) {
> >          goto out;
> >      }
> >      stbuf =3D fidst;
> > @@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *opaque=
)
> >      v9fs_path_copy(&dpath, &fidp->path);
> >      v9fs_path_copy(&path, &fidp->path);
> >=20
> > -    for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> > +    for (name_idx =3D 0; name_idx < nvalid; name_idx++) {
> >          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> >              strcmp("..", wnames[name_idx].data))
> >          {
> >              stbuf =3D stbufs[name_idx];
> >              err =3D stat_to_qid(pdu, &stbuf, &qid);
> >              if (err < 0) {
> > -                goto out;
> > +                break;
> >              }
> >              v9fs_path_copy(&path, &pathes[name_idx]);
> >              v9fs_path_copy(&dpath, &path);
> >          }
> >          memcpy(&qids[name_idx], &qid, sizeof(qid));
> >      }
> > +    any_err |=3D err;
> > +    if (any_err) {
>=20
>=20
> Not sure if there is ever the case err > 0, but as we are already compari=
ng=20
> for "if (err < 0)" everywhere, we should probably also do the same compar=
ison=20
> for the aggregate error variable here, right?
>=20

It seems that you could drop any_err and just check name_idx !=3D nwnames ?

>     if (any_err < 0) {
>         ...
>=20
> > +        if (!name_idx) {
> > +            /* don't send any QIDs, send Rlerror instead */
> > +            goto out;
> > +        } else {
> > +            /* send QIDs (not Rlerror), but fid MUST remain unaffected=
 */
> > +            goto send_qids;
> > +        }
> > +    }
> >      if (fid =3D=3D newfid) {
> >          if (fidp->fid_type !=3D P9_FID_NONE) {
> >              err =3D -EINVAL;
> > @@ -1919,8 +1931,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
> >          newfidp->uid =3D fidp->uid;
> >          v9fs_path_copy(&newfidp->path, &path);
> >      }
> > -    err =3D v9fs_walk_marshal(pdu, nwnames, qids);
> > -    trace_v9fs_walk_return(pdu->tag, pdu->id, nwnames, qids);
> > +send_qids:
> > +    err =3D v9fs_walk_marshal(pdu, name_idx, qids);
> > +    trace_v9fs_walk_return(pdu->tag, pdu->id, name_idx, qids);
> >  out:
> >      put_fid(pdu, fidp);
> >      if (newfidp) {
>=20
>=20


