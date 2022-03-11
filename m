Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B074D66C7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:48:26 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiRF-0001Rt-IZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSiNu-0008Vr-Rx
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:45:03 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSiNs-0002AV-KK
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=eRYlw2O01WNhakOSsNcC6rNZx0vXjm03Cidhn9ZGbgk=; b=h7iMmPqJEGEh1dgA+TXS6elVfi
 BJlUx6BW+G9ZsP0aj8i32Wo+SvuL0r3wHUGx220viKVlztl8xP2AsC5brXCUpGhDYcddez+1emrRp
 GkvxvT31cYoBiD1yBv5Bn+7nqV1SRN4OELp4ub/RxrFJ5PZowzfUpbZ5wv3dWWYv7njhbVVLD7NFs
 Enu32eBzzCvIO0ae1pijbL+HqSoLQ3hbkgUWHfwcrbn3DMIod9MEhB+iJ45fN0YSu9nXflfaSHtx2
 0lQTlDL74/o6MamAlis9tBBDLuHAtTpZrZSCUSgj9kSyEccqbp0puetMXmb95EIeyg2myOI8y0a7p
 cT/Q9pRUIq2dcAapb5scurq/I1B3jEbtQvd6SlbqwJIt6Izk8NX1eBfymMs+vAAeub3jB7WxZpuf8
 QrSLwl0+lfsc6kKJXWqKCpuJd52KCVUuivLnMu4JWkciOR9EQP9PPGNov4ax+kYDrxDwbKkZgUokY
 EHP0DWUMunYPV+CUpIKRJQtEmFDaC+P0hFvKw0W6rzN5tolz989oTXaxj85F4jQPn2A4op7Cmta83
 l5QLndChPHUA11uJJnEmcQ5jKKaH+HKmV78Xjy9ybJjKnWxX0C3ujDtr1MaMYQYgRLXAhDOqhUgzX
 EHiJWQMyinTmucEBWj+sRVmBjU3SYr1IfC0VlIP+o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] 9pfs: fix 'Twalk' to only send error if no component
 walked
Date: Fri, 11 Mar 2022 17:44:54 +0100
Message-ID: <3685932.ieBdHTVF6f@silver>
In-Reply-To: <20220311173541.06d6e96e@bahia>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <1785989.mTmxrQOLcC@silver> <20220311173541.06d6e96e@bahia>
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

On Freitag, 11. M=E4rz 2022 17:35:41 CET Greg Kurz wrote:
> On Thu, 10 Mar 2022 10:13:33 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 9. M=E4rz 2022 18:57:39 CET Christian Schoenebeck wrote:
> > > Current implementation of 'Twalk' request handling always sends an
> > > 'Rerror'
> > >=20
> > > response if any error occured. The 9p2000 protocol spec sais though:
> > >   "
> > >   If the first element cannot be walked for any reason, Rerror is
> > >   returned.
> > >   Otherwise, the walk will return an Rwalk message containing nwqid q=
ids
> > >   corresponding, in order, to the files that are visited by the nwqid
> > >   successful elementwise walks; nwqid is therefore either nwname or t=
he
> > >=20
> > > index of the first elementwise walk that failed.
> > >=20
> > >   "
> > >  =20
> > >   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
> > >=20
> > > For that reason we are no longer leaving from an error path in functi=
on
> > > v9fs_walk(), unless really no path component could be walked
> > > successfully or if the request has been interrupted.
> > >=20
> > > Local variable 'nvalid' counts and reflects the number of path
> > > components
> > > successfully processed by background I/O thread, whereas local variab=
le
> > > 'name_idx' subsequently counts and reflects the number of path
> > > components
> > > eventually accepted successfully by 9p server controller portion.
> > >=20
> > > New local variable 'any_err' is an aggregate variable reflecting whet=
her
> > > any error occurred at all, while already existing variable 'err' only
> > > reflects the last error.
> > >=20
> > > Despite QIDs being delivered to client in a more relaxed way now, it =
is
> > > important to note though that fid still must remain uneffacted if any
> > > error
> >=20
> > Typo: should be "unaffected".
> >=20
> > > occurred.
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
> > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 6cdc566866..8ccd180608 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > >=20
> > >  {
> > > =20
> > >      int name_idx, nvalid;
> > >      g_autofree V9fsQID *qids =3D NULL;
> > >=20
> > > -    int i, err =3D 0;
> > > +    int i, err =3D 0, any_err =3D 0;
> > >=20
> > >      V9fsPath dpath, path;
> > >      P9ARRAY_REF(V9fsPath) pathes =3D NULL;
> > >      uint16_t nwnames;
> > >=20
> > > @@ -1832,6 +1832,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > >=20
> > >       * driver code altogether inside the following block.
> > >       */
> > >     =20
> > >      v9fs_co_run_in_worker({
> > >=20
> > > +        nvalid =3D 0;
> > >=20
> > >          if (v9fs_request_cancelled(pdu)) {
> > >         =20
> > >              err =3D -EINTR;
> > >              break;
> > >=20
> > > @@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > >=20
> > >              break;
> > >         =20
> > >          }
> > >          stbuf =3D fidst;
> > >=20
> > > -        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
> > > +        for (; nvalid < nwnames; nvalid++) {
> > >=20
> > >              if (v9fs_request_cancelled(pdu)) {
> > >             =20
> > >                  err =3D -EINTR;
> > >                  break;
> > >=20
> > > @@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *opaq=
ue)
> > >=20
> > >      /*
> > >     =20
> > >       * Handle all the rest of this Twalk request on main thread ...
> > >       */
> > >=20
> > > -    if (err < 0) {
> > > +    if ((err < 0 && !nvalid) || err =3D=3D -EINTR) {
> > >=20
> > >          goto out;
> > >     =20
> > >      }
> > >=20
> > > +    any_err |=3D err;
> > >=20
> > >      err =3D stat_to_qid(pdu, &fidst, &qid);
> > >=20
> > > -    if (err < 0) {
> > > +    if (err < 0 && !nvalid) {
> > >=20
> > >          goto out;
> > >     =20
> > >      }
> > >      stbuf =3D fidst;
> > >=20
> > > @@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *opaq=
ue)
> > >=20
> > >      v9fs_path_copy(&dpath, &fidp->path);
> > >      v9fs_path_copy(&path, &fidp->path);
> > >=20
> > > -    for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> > > +    for (name_idx =3D 0; name_idx < nvalid; name_idx++) {
> > >=20
> > >          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> > >         =20
> > >              strcmp("..", wnames[name_idx].data))
> > >         =20
> > >          {
> > >         =20
> > >              stbuf =3D stbufs[name_idx];
> > >              err =3D stat_to_qid(pdu, &stbuf, &qid);
> > >              if (err < 0) {
> > >=20
> > > -                goto out;
> > > +                break;
> > >=20
> > >              }
> > >              v9fs_path_copy(&path, &pathes[name_idx]);
> > >              v9fs_path_copy(&dpath, &path);
> > >         =20
> > >          }
> > >          memcpy(&qids[name_idx], &qid, sizeof(qid));
> > >     =20
> > >      }
> > >=20
> > > +    any_err |=3D err;
> > > +    if (any_err) {
> >=20
> > Not sure if there is ever the case err > 0, but as we are already
> > comparing
> > for "if (err < 0)" everywhere, we should probably also do the same
> > comparison for the aggregate error variable here, right?
>=20
> It seems that you could drop any_err and just check name_idx !=3D nwnames=
 ?

Mmm, what about the special case 'Twalk nwnames=3D0' (i.e. fid cloning), th=
at=20
implementation would then skip errors, no?

> >     if (any_err < 0) {
> >    =20
> >         ...
> > >=20
> > > +        if (!name_idx) {
> > > +            /* don't send any QIDs, send Rlerror instead */
> > > +            goto out;
> > > +        } else {
> > > +            /* send QIDs (not Rlerror), but fid MUST remain unaffect=
ed
> > > */
> > > +            goto send_qids;
> > > +        }
> > > +    }
> > >=20
> > >      if (fid =3D=3D newfid) {
> > >     =20
> > >          if (fidp->fid_type !=3D P9_FID_NONE) {
> > >         =20
> > >              err =3D -EINVAL;
> > >=20
> > > @@ -1919,8 +1931,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > >=20
> > >          newfidp->uid =3D fidp->uid;
> > >          v9fs_path_copy(&newfidp->path, &path);
> > >     =20
> > >      }
> > >=20
> > > -    err =3D v9fs_walk_marshal(pdu, nwnames, qids);
> > > -    trace_v9fs_walk_return(pdu->tag, pdu->id, nwnames, qids);
> > > +send_qids:
> > > +    err =3D v9fs_walk_marshal(pdu, name_idx, qids);
> > > +    trace_v9fs_walk_return(pdu->tag, pdu->id, name_idx, qids);
> > >=20
> > >  out:
> > >      put_fid(pdu, fidp);
> > >      if (newfidp) {



