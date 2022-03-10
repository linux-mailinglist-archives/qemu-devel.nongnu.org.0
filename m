Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E14D4340
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:16:30 +0100 (CET)
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEuL-0002os-Gg
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSErZ-0001du-Sl
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:13:38 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSErY-0002Hf-6J
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=UtA3BuMUgM/1+K9+nlBhJNFDYrl07g82EWcRfMwTQOE=; b=Pe1KEs9uJR9iA7KwhM3+78os1e
 VNtIVsckloVhWVjyoJNrtkDoqZIAS7ygH5GNU7NFvZ/0XlgmAbPhQIn1gSZ2EFK+aqlg52jzydvJV
 0M4+T2Qc3TLXD4rNdiKYrzCuQ7PUdZ7HkTl9RpW8Xg/0xuSlnOR3SDLbb2sOHguU0ynXPKi1JOIIW
 b6tHz5claF0FDD/7WQWHSmXqiN4ayqfI/czaqCmezZBoj2zp4SE854JK0Jx6bPVUAgc9IRtfwFLGA
 8nOmLuOgMmf9HJ7VFpKhN3HsugCKPL5jYrB73sbu3xUExVZC7I9ytKFmGlwYuWQ6Kx3KHaZ3KTpIg
 /OFd+49+HtDvDsUDbZMjJfvp1vvRB64cHqWK11vIp1JNHkrGGEeWHw45edPB2E9ZQrkkdETPFpJSe
 0qxvGJKiSS5G+wdinBpESOMk/LC39OCNUi/95gvqxTmOdLYMA7gxpitbPmi/2t8B/zlK+wyzB1GTO
 rq7F9qDVt6fKC+hYsUL9AZCDboRM5oeAyfttt/j5ppJQmDPNdHU2yEKcXPdveYQxBfFMoD62RTej4
 +THf4D8HLyoK67be9rdqFhfwRTHhKkBKbjZDogUAWONlvArT1FuWyS0NmDVSLE4qF4QLp7F3z6LdP
 RTVmGUFdOa9ggGAalwmFosixOSPEH53o8pGCkc+VA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] 9pfs: fix 'Twalk' to only send error if no component
 walked
Date: Thu, 10 Mar 2022 10:13:33 +0100
Message-ID: <1785989.mTmxrQOLcC@silver>
In-Reply-To: <1ad002a1fbc2f8e48384673b0545a164afff7ce9.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <1ad002a1fbc2f8e48384673b0545a164afff7ce9.1646850707.git.qemu_oss@crudebyte.com>
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

On Mittwoch, 9. M=E4rz 2022 18:57:39 CET Christian Schoenebeck wrote:
> Current implementation of 'Twalk' request handling always sends an 'Rerro=
r'
> response if any error occured. The 9p2000 protocol spec sais though:
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
> Local variable 'nvalid' counts and reflects the number of path components
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
> important to note though that fid still must remain uneffacted if any err=
or

Typo: should be "unaffected".

> occurred.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 6cdc566866..8ccd180608 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>  {
>      int name_idx, nvalid;
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
> +        nvalid =3D 0;
>          if (v9fs_request_cancelled(pdu)) {
>              err =3D -EINTR;
>              break;
> @@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>              break;
>          }
>          stbuf =3D fidst;
> -        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
> +        for (; nvalid < nwnames; nvalid++) {
>              if (v9fs_request_cancelled(pdu)) {
>                  err =3D -EINTR;
>                  break;
> @@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      /*
>       * Handle all the rest of this Twalk request on main thread ...
>       */
> -    if (err < 0) {
> +    if ((err < 0 && !nvalid) || err =3D=3D -EINTR) {
>          goto out;
>      }
>=20
> +    any_err |=3D err;
>      err =3D stat_to_qid(pdu, &fidst, &qid);
> -    if (err < 0) {
> +    if (err < 0 && !nvalid) {
>          goto out;
>      }
>      stbuf =3D fidst;
> @@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      v9fs_path_copy(&dpath, &fidp->path);
>      v9fs_path_copy(&path, &fidp->path);
>=20
> -    for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> +    for (name_idx =3D 0; name_idx < nvalid; name_idx++) {
>          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
>              strcmp("..", wnames[name_idx].data))
>          {
>              stbuf =3D stbufs[name_idx];
>              err =3D stat_to_qid(pdu, &stbuf, &qid);
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
> +    if (any_err) {


Not sure if there is ever the case err > 0, but as we are already comparing=
=20
for "if (err < 0)" everywhere, we should probably also do the same comparis=
on=20
for the aggregate error variable here, right?

    if (any_err < 0) {
        ...

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



