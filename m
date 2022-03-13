Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCC4D73C3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 09:49:25 +0100 (CET)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTJum-0007b7-8v
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 04:49:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTJss-0006f7-Cr
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 04:47:28 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTJsq-0005ov-1b
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 04:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TJQ5LYUkPPfF+f64RB30eUocbMGyF++jvOYbCJm67Oo=; b=G9QPr5ZdccsmxoGtXAbbrHAzz8
 srMpkeilnbugUlDni0BwUYHcIfUAoGt4Asym4dKEVHbNfqQdHxH9dGdwLNTeNlo0tvP16X5LvmHU1
 1nEvh5Hac7Bl+JuL54wdpoQX+I4/7wPWv24hgDWQ4emz9HudD/W+niFDmQfbIjYVk2HLssK2npAv+
 gklj2UWXOScMsquLp8HgExuOWX57KJSkZT4j5GeVD7++av4o9FP8mM79flbFy0lGdVRYCSCRB9R0x
 T2Xa/FCCjPMgLaCnCos4x8m8K0nUIRLSEgG1hYNZCBaweus1yfsLki9z+Beeex5qzMWux12ZWarYs
 BU2VP8WrgWYAT9rOt0IC5xj/3hQ9cxPsvG9Z9ZXwwvPlAO9H/28bswxPTuAKPCKqb6OUPb+gjDqMi
 76iFi2VNiiYAFgNgLgzyTDNsZGQ3SkmQV0pWIVC6Piur816FmX+FK3U4SNrnGOG+gJi7H+KwcN4qI
 Vs0mSjkOfrQRYU/+pQLbl32omWemB+rray4aJN1DGJ0by1cYhB5wl5WPePzKIlnInOSo5vGowdEeA
 rvvmRBXFq4Ccx/RuMQFPP0pkmAmqgGZrAP3lNR8VMTHTdUOZdBA/pR1nl2Osckm1LXCDeFmg6hLh9
 WdPIBoDXdvfjGIfKusw8gB+yzE2/GHhbvCpCbnVog=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 5/7] 9pfs: fix 'Twalk' to only send error if no
 component walked
Date: Sun, 13 Mar 2022 09:47:19 +0100
Message-ID: <3225166.u0B6IhRvtP@silver>
In-Reply-To: <59571e9379c3729ad287a5c7fce8ef4876e7fed5.1647083430.git.qemu_oss@crudebyte.com>
References: <cover.1647083430.git.qemu_oss@crudebyte.com>
 <59571e9379c3729ad287a5c7fce8ef4876e7fed5.1647083430.git.qemu_oss@crudebyte.com>
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

On Samstag, 12. M=E4rz 2022 12:06:47 CET Christian Schoenebeck wrote:
> Current implementation of 'Twalk' request handling always sends an 'Rerro=
r'
> response if any error occured. The 9p2000 protocol spec says though:
>=20
>   "
>   If the first element cannot be walked for any reason, Rerror is returne=
d.
>   Otherwise, the walk will return an Rwalk message containing nwqid qids
>   corresponding, in order, to the files that are visited by the nwqid
>   successful elementwise walks; nwqid is therefore either nwname or the
> index of the first elementwise walk that failed.
>   "
>=20
>   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
>=20
> For that reason we are no longer leaving from an error path in function
> v9fs_walk(), unless really no path component could be walked successfully=
 or
> if the request has been interrupted.
>=20
> Local variable 'nwalked' counts and reflects the number of path components
> successfully processed by background I/O thread, whereas local variable
> 'name_idx' subsequently counts and reflects the number of path components
> eventually accepted successfully by 9p server controller portion.
>=20
> New local variable 'any_err' is an aggregate variable reflecting whether =
any
> error occurred at all, while already existing variable 'err' only reflects
> the last error.
>=20
> Despite QIDs being delivered to client in a more relaxed way now, it is
> important to note though that fid still must remain unaffected if any err=
or
> occurred.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 298f4e6548..e8d838f6fd 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>  {
>      int name_idx, nwalked;
>      g_autofree V9fsQID *qids =3D NULL;
> -    int i, err =3D 0;
> +    int i, err =3D 0, any_err =3D 0;
>      V9fsPath dpath, path;
>      P9ARRAY_REF(V9fsPath) pathes =3D NULL;
>      uint16_t nwnames;
> @@ -1832,6 +1832,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>       * driver code altogether inside the following block.
>       */
>      v9fs_co_run_in_worker({
> +        nwalked =3D 0;
>          if (v9fs_request_cancelled(pdu)) {
>              err =3D -EINTR;
>              break;
> @@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>              break;
>          }
>          stbuf =3D fidst;
> -        for (nwalked =3D 0; nwalked < nwnames; nwalked++) {
> +        for (; nwalked < nwnames; nwalked++) {
>              if (v9fs_request_cancelled(pdu)) {
>                  err =3D -EINTR;
>                  break;
> @@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      /*
>       * Handle all the rest of this Twalk request on main thread ...
>       */
> -    if (err < 0) {
> +    if ((err < 0 && !nwalked) || err =3D=3D -EINTR) {
>          goto out;
>      }
>=20
> +    any_err |=3D err;
>      err =3D stat_to_qid(pdu, &fidst, &qid);
> -    if (err < 0) {
> +    if (err < 0 && !nwalked) {
>          goto out;
>      }

That's missing to update 'any_err' variable here, i.e. if nwalked > 0 and=20
stat_to_qid() fails here, then ...

>      stbuf =3D fidst;
> @@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      v9fs_path_copy(&dpath, &fidp->path);
>      v9fs_path_copy(&path, &fidp->path);
>=20
> -    for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> +    for (name_idx =3D 0; name_idx < nwalked; name_idx++) {
>          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
>              strcmp("..", wnames[name_idx].data))
>          {
>              stbuf =3D stbufs[name_idx];
>              err =3D stat_to_qid(pdu, &stbuf, &qid);

=2E.. this stat_to_qid() call ^ here would cause the previous stat_to_qid()=
=20
error to not make into 'any_err' variable.

=46or that reason I will change the 'any_err' code like this at all places:

	any_err |=3D err =3D ...

Because that will make the code significantly less error prone and it will =
be=20
less lines of code as well.

>              if (err < 0) {
> -                goto out;
> +                break;
>              }
>              v9fs_path_copy(&path, &pathes[name_idx]);
>              v9fs_path_copy(&dpath, &path);
>          }
>          memcpy(&qids[name_idx], &qid, sizeof(qid));
>      }
> +    any_err |=3D err;
> +    if (any_err < 0) {
> +        if (!name_idx) {
> +            /* don't send any QIDs, send Rlerror instead */
> +            goto out;
> +        } else {
> +            /* send QIDs (not Rlerror), but fid MUST remain unaffected */
> +            goto send_qids;
> +        }
> +    }
>      if (fid =3D=3D newfid) {
>          if (fidp->fid_type !=3D P9_FID_NONE) {
>              err =3D -EINVAL;
> @@ -1919,8 +1931,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
>          newfidp->uid =3D fidp->uid;
>          v9fs_path_copy(&newfidp->path, &path);
>      }
> -    err =3D v9fs_walk_marshal(pdu, nwnames, qids);
> -    trace_v9fs_walk_return(pdu->tag, pdu->id, nwnames, qids);
> +send_qids:
> +    err =3D v9fs_walk_marshal(pdu, name_idx, qids);
> +    trace_v9fs_walk_return(pdu->tag, pdu->id, name_idx, qids);
>  out:
>      put_fid(pdu, fidp);
>      if (newfidp) {



