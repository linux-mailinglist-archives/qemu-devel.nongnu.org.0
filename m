Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17F4D4331
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:11:18 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEpJ-0000Zg-IS
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSElI-0005fv-3X
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:07:08 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSElG-0001Ki-Kk
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bZJ3IVeU5hGyqhHOcQgMQhDgZWys6DbJL6/SGw/mkRI=; b=LZpcAhvLh0ki0jPk21w30lsefZ
 OzfG31FZ3SbHJnJIElDFZsl6YXWmw4eZaM/goQ9w+AGFs/nQZXxBJXeoRcZYqh1sd0/cKAw7da98a
 Y5KEcmmcDkZGEvmKnPBKcOlCDNxdqRa3y+08uWECkKD10MSRlLD0kgqf564ylwBTEYUAzVIqzsDNN
 FrbRihOO3/fUF20sa2Wx1ctslEi7WPahwpqyxsQ6p4NaO0hmGShjjIQ+KfcIgP3tI4tL+sIx/6+qZ
 oTHzn/RPSPMVugoLcXOT8mu0cJeS80OH8WFVU+N0bccEw41/nenhpnFmHzoHmvuC2l+yD/CAAAu9A
 dHBsvzkfcMEkATd1F6nhRKsmPKag0uQH3Uuw0GoNc6IWigJAr2fUY0wGtETMxQ+XPCr7+t/1TcwlS
 KftvLeGQo/yokStouT6L9lJ03crWDnJcZXyOtoA3UB/at5j5AtRYNDR4aD8DupRjQiB0zG3utKj5U
 YKFlJ676ZmMZzRf31xkDvZNiSSnNeQZ4KKGtzpKqe/k4h8Z8Q5dWULUnJWI2Th7OGCs4+nah1Gtz1
 6vZZvc0Rwvvg6KOMboOeJyXFLIOWsqSR10aVBNyV8r8TGFEoa268EPompPPB1AaeEZiuPh3kusJ2D
 O1G7Oom196Ac+E9t/ghw0R2APUGqk8TjQfIYXeRzk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/6] 9pfs: refactor 'name_idx' -> 'nvalid' in v9fs_walk()
Date: Thu, 10 Mar 2022 10:07:04 +0100
Message-ID: <4831323.ZipVpMZSPQ@silver>
In-Reply-To: <00bee0f7a89147c90c672f07b9a1ebcd9180215b.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <00bee0f7a89147c90c672f07b9a1ebcd9180215b.1646850707.git.qemu_oss@crudebyte.com>
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

On Mittwoch, 9. M=E4rz 2022 18:12:17 CET Christian Schoenebeck wrote:
> The local variable 'name_idx' is used in two loops in function v9fs_walk(=
).
> Let the first loop use its own variable 'nvalid' instead, which we will u=
se
> in subsequent patches as the number of (requested) path components
> successfully retrieved/walked by background I/O thread.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a6d6b3f835..6cdc566866 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1764,7 +1764,7 @@ static bool same_stat_id(const struct stat *a, const
> struct stat *b)
>=20
>  static void coroutine_fn v9fs_walk(void *opaque)
>  {
> -    int name_idx;
> +    int name_idx, nvalid;

Or rather renaming this nvalid -> nfetched?

>      g_autofree V9fsQID *qids =3D NULL;
>      int i, err =3D 0;
>      V9fsPath dpath, path;
> @@ -1842,17 +1842,17 @@ static void coroutine_fn v9fs_walk(void *opaque)
>              break;
>          }
>          stbuf =3D fidst;
> -        for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> +        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
>              if (v9fs_request_cancelled(pdu)) {
>                  err =3D -EINTR;
>                  break;
>              }
>              if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> -                strcmp("..", wnames[name_idx].data))
> +                strcmp("..", wnames[nvalid].data))
>              {
>                  err =3D s->ops->name_to_path(&s->ctx, &dpath,
> -                                           wnames[name_idx].data,
> -                                           &pathes[name_idx]);
> +                                           wnames[nvalid].data,
> +                                           &pathes[nvalid]);
>                  if (err < 0) {
>                      err =3D -errno;
>                      break;
> @@ -1861,13 +1861,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
>                      err =3D -EINTR;
>                      break;
>                  }
> -                err =3D s->ops->lstat(&s->ctx, &pathes[name_idx], &stbuf=
);
> +                err =3D s->ops->lstat(&s->ctx, &pathes[nvalid], &stbuf);
>                  if (err < 0) {
>                      err =3D -errno;
>                      break;
>                  }
> -                stbufs[name_idx] =3D stbuf;
> -                v9fs_path_copy(&dpath, &pathes[name_idx]);
> +                stbufs[nvalid] =3D stbuf;
> +                v9fs_path_copy(&dpath, &pathes[nvalid]);
>              }
>          }
>      });



