Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED44D67B0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:38:04 +0100 (CET)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSjDG-0002Ag-OS
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:38:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSjCF-0001Ux-Rh
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:36:59 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSjCB-0003CA-C7
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=OlKyidNxhhzn3dOH6hsEqu5x2JFJ6ait63jygVMeaQQ=; b=ui+8NP5NKKNxKXq2sSB3hCM4Ue
 GfKsB8ynvA4rhCMtz909eiHQ9TcIklIqxmc8ciy6EftuT7npBrqjL6CIncSiz0I4fpAXkiygi8+/F
 KiEqv0uhvAxnnVrLx/1tsylaU4ejIDGds7O9Q6w8EIAA0DSOdxd+wR+i/N8cYwvmcRj0wjFm2AanS
 n9B2pi8IwiLgsNTZSG/87s64qaw7cbi3fLFc3HR5H2l/8X+o9WCvKTNjpMN1jpBRwcTNqWAU7+oOy
 8XOl/ZdBAP2pk5q5Sv0rwrnD9uKm9q4YDncFbhUP3dqlG0mV6PdKksZDxa60AOKs9gHyXOCr2emuo
 343D+6lbj68GYNVwAn+vE8mPO/NxQTWJ1sOE7BSNYdlZZKwA0iH7T0XASgxPRJoRRMepB69om5T5z
 A3I+RpCvBepVSybI67LDYRKCxFaXRswW2a7OT02bJZY+4uXcR2tRnKYJxPzLDgQb++nntcuHXbzVb
 GqI0e4sd18XYBr2uc4z3xtHj4mb+cDovfVGUtxsMGm1Y4T51YzLb+dtgGA+syIShh3L4kk41vU+3U
 JS/mS04u7fXYb2p29Iz+K8NhW8Gh56Cvvqb3Cq9xZd8WL5zRfwMi3OgGKlVAPywteWu5D6DkC/1kf
 5c6nfxxUrST1G25lZkCDcCVJAqs0K7uBfDRmNqAtM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] 9pfs: fix 'Twalk' to only send error if no component
 walked
Date: Fri, 11 Mar 2022 18:36:51 +0100
Message-ID: <5565587.G5MRNFoPhR@silver>
In-Reply-To: <20220311180838.3a8c9f74@bahia>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <3685932.ieBdHTVF6f@silver> <20220311180838.3a8c9f74@bahia>
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

On Freitag, 11. M=E4rz 2022 18:08:38 CET Greg Kurz wrote:
> On Fri, 11 Mar 2022 17:44:54 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 11. M=E4rz 2022 17:35:41 CET Greg Kurz wrote:
> > > On Thu, 10 Mar 2022 10:13:33 +0100
> > >=20
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > On Mittwoch, 9. M=E4rz 2022 18:57:39 CET Christian Schoenebeck wrot=
e:
> > > > > Current implementation of 'Twalk' request handling always sends an
> > > > > 'Rerror'
> > > > >=20
> > > > > response if any error occured. The 9p2000 protocol spec sais thou=
gh:
> > > > >   "
> > > > >   If the first element cannot be walked for any reason, Rerror is
> > > > >   returned.
> > > > >   Otherwise, the walk will return an Rwalk message containing nwq=
id
> > > > >   qids
> > > > >   corresponding, in order, to the files that are visited by the
> > > > >   nwqid
> > > > >   successful elementwise walks; nwqid is therefore either nwname =
or
> > > > >   the
> > > > >=20
> > > > > index of the first elementwise walk that failed.
> > > > >=20
> > > > >   "
> > > > >  =20
> > > > >   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
> > > > >=20
> > > > > For that reason we are no longer leaving from an error path in
> > > > > function
> > > > > v9fs_walk(), unless really no path component could be walked
> > > > > successfully or if the request has been interrupted.
> > > > >=20
> > > > > Local variable 'nvalid' counts and reflects the number of path
> > > > > components
> > > > > successfully processed by background I/O thread, whereas local
> > > > > variable
> > > > > 'name_idx' subsequently counts and reflects the number of path
> > > > > components
> > > > > eventually accepted successfully by 9p server controller portion.
> > > > >=20
> > > > > New local variable 'any_err' is an aggregate variable reflecting
> > > > > whether
> > > > > any error occurred at all, while already existing variable 'err'
> > > > > only
> > > > > reflects the last error.
> > > > >=20
> > > > > Despite QIDs being delivered to client in a more relaxed way now,=
 it
> > > > > is
> > > > > important to note though that fid still must remain uneffacted if
> > > > > any
> > > > > error
> > > >=20
> > > > Typo: should be "unaffected".
> > > >=20
> > > > > occurred.
> > > > >=20
> > > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > ---
> > > > >=20
> > > > >  hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
> > > > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > > > >=20
> > > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > > > index 6cdc566866..8ccd180608 100644
> > > > > --- a/hw/9pfs/9p.c
> > > > > +++ b/hw/9pfs/9p.c
> > > > > @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void
> > > > > *opaque)
> > > > >=20
> > > > >  {
> > > > > =20
> > > > >      int name_idx, nvalid;
> > > > >      g_autofree V9fsQID *qids =3D NULL;
> > > > >=20
> > > > > -    int i, err =3D 0;
> > > > > +    int i, err =3D 0, any_err =3D 0;
> > > > >=20
> > > > >      V9fsPath dpath, path;
> > > > >      P9ARRAY_REF(V9fsPath) pathes =3D NULL;
> > > > >      uint16_t nwnames;
> > > > >=20
> > > > > @@ -1832,6 +1832,7 @@ static void coroutine_fn v9fs_walk(void
> > > > > *opaque)
> > > > >=20
> > > > >       * driver code altogether inside the following block.
> > > > >       */
> > > > >     =20
> > > > >      v9fs_co_run_in_worker({
> > > > >=20
> > > > > +        nvalid =3D 0;
> > > > >=20
> > > > >          if (v9fs_request_cancelled(pdu)) {
> > > > >         =20
> > > > >              err =3D -EINTR;
> > > > >              break;
> > > > >=20
> > > > > @@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void
> > > > > *opaque)
> > > > >=20
> > > > >              break;
> > > > >         =20
> > > > >          }
> > > > >          stbuf =3D fidst;
> > > > >=20
> > > > > -        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
> > > > > +        for (; nvalid < nwnames; nvalid++) {
> > > > >=20
> > > > >              if (v9fs_request_cancelled(pdu)) {
> > > > >             =20
> > > > >                  err =3D -EINTR;
> > > > >                  break;
> > > > >=20
> > > > > @@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void
> > > > > *opaque)
> > > > >=20
> > > > >      /*
> > > > >     =20
> > > > >       * Handle all the rest of this Twalk request on main thread =
=2E..
> > > > >       */
> > > > >=20
> > > > > -    if (err < 0) {
> > > > > +    if ((err < 0 && !nvalid) || err =3D=3D -EINTR) {
> > > > >=20
> > > > >          goto out;
> > > > >     =20
> > > > >      }
> > > > >=20
> > > > > +    any_err |=3D err;
> > > > >=20
> > > > >      err =3D stat_to_qid(pdu, &fidst, &qid);
> > > > >=20
> > > > > -    if (err < 0) {
> > > > > +    if (err < 0 && !nvalid) {
> > > > >=20
> > > > >          goto out;
> > > > >     =20
> > > > >      }
> > > > >      stbuf =3D fidst;
> > > > >=20
> > > > > @@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void
> > > > > *opaque)
> > > > >=20
> > > > >      v9fs_path_copy(&dpath, &fidp->path);
> > > > >      v9fs_path_copy(&path, &fidp->path);
> > > > >=20
> > > > > -    for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> > > > > +    for (name_idx =3D 0; name_idx < nvalid; name_idx++) {
> > > > >=20
> > > > >          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> > > > >         =20
> > > > >              strcmp("..", wnames[name_idx].data))
> > > > >         =20
> > > > >          {
> > > > >         =20
> > > > >              stbuf =3D stbufs[name_idx];
> > > > >              err =3D stat_to_qid(pdu, &stbuf, &qid);
> > > > >              if (err < 0) {
> > > > >=20
> > > > > -                goto out;
> > > > > +                break;
> > > > >=20
> > > > >              }
> > > > >              v9fs_path_copy(&path, &pathes[name_idx]);
> > > > >              v9fs_path_copy(&dpath, &path);
> > > > >         =20
> > > > >          }
> > > > >          memcpy(&qids[name_idx], &qid, sizeof(qid));
> > > > >     =20
> > > > >      }
> > > > >=20
> > > > > +    any_err |=3D err;
> > > > > +    if (any_err) {
> > > >=20
> > > > Not sure if there is ever the case err > 0, but as we are already
> > > > comparing
> > > > for "if (err < 0)" everywhere, we should probably also do the same
> > > > comparison for the aggregate error variable here, right?
> > >=20
> > > It seems that you could drop any_err and just check name_idx !=3D nwn=
ames
> > > ?
> >=20
> > Mmm, what about the special case 'Twalk nwnames=3D0' (i.e. fid cloning),
> > that
> > implementation would then skip errors, no?
>=20
> Ouch you're right... honestly, v9fs_walk() is really a mess and it
> is getting harder to fix. What about having a totally separate
> path for the cloning case (as a preparatory patch) ?

You suggested that before, somehow I did not get to simpler code when tryin=
g=20
that, rather the opposite. But you definitely have a better eye on identify=
ing=20
redundant pathes than me.

There are some things that can still be wiped away, like the path vs. dpath=
=20
variables, but I thought to do that a bit later.

Best regards,
Christian Schoenebeck



