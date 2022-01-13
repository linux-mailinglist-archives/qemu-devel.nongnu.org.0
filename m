Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A848D9A0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:18:44 +0100 (CET)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n80w7-0000tZ-FL
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n80tt-0007sG-7L
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n80tr-0004HM-KP
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642083382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpP/Tl3BXWSPmPc665aLCaLz5BqPijvjlZmuc11ngKs=;
 b=JZkHTMdOzZV0GxZT4Pgdzqb6bbsaTz7hNWZVGQ8nwfiPF1XMiQG3hBxJUikKO7N/WjUp+c
 9ogcVGjmHfrYBsh6lmgrd+EDMbW+xIp/bEUzWaql9PegBqhoD1GwgRGAQHUZhbriVfj5gz
 PCg2PGQ7Z8vhWzTXCH7sVRqdXWtGM0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-2V6mHjMROeKaXeEkqE7jmw-1; Thu, 13 Jan 2022 09:16:16 -0500
X-MC-Unique: 2V6mHjMROeKaXeEkqE7jmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 652BEAFA61;
 Thu, 13 Jan 2022 14:16:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9497B14E;
 Thu, 13 Jan 2022 14:16:13 +0000 (UTC)
Date: Thu, 13 Jan 2022 14:16:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniella Lee <daniellalee111@gmail.com>
Subject: Re: [PATCH] Fix null pointer dereference in util/fdmon-epoll.c
Message-ID: <YeA0LKIAFTCpRB31@stefanha-x1.localdomain>
References: <20220111121059.3345034-1-daniellalee111@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220111121059.3345034-1-daniellalee111@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rGFbusPqPukRizi8"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 pai.po.sec@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--rGFbusPqPukRizi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 08:10:59PM +0800, Daniella Lee wrote:
> Orginal qemu commit hash: de3f5223fa4cf8bfc5e3fe1fd495ddf468edcdf7
> In util/fdmon-epoll.c, function fdmon_epoll_update, variable "old_node"=
=20
> maybe NULL with the condition, while it is directly used in the statement=
 and=20
> may lead to null pointer dereferencen problem.
> Variable "r" in the condition is the return value of epoll_ctl function,
> and will return -1 when failed.
> Therefore, the patch added a check and initialized the variable "r".
>=20
>=20
> Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
> ---
>  util/fdmon-epoll.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Hi Daniella,
Thanks for the patch! How is the new_node =3D=3D NULL && old_node =3D=3D NU=
LL
case reached?

The caller is util/aio-posix.c:aio_set_fd_handler():

  AioHandler *node;
  AioHandler *new_node =3D NULL;
  ...
  node =3D find_aio_handler(ctx, fd);

  /* Are we deleting the fd handler? */
  if (!io_read && !io_write && !io_poll) {
      if (node =3D=3D NULL) {
          qemu_lockcnt_unlock(&ctx->list_lock);
          return; /* old_node =3D=3D NULL && new_node =3D=3D NULL */
      }
      ... /* old_node !=3D NULL && new_node =3D=3D NULL */
  } else {
      ...
      new_node =3D g_new0(AioHandler, 1);
      ...
  }
  /* (old_node !=3D NULL && new_node =3D=3D NULL) || (new_node !=3D NULL) *=
/
  ...
  ctx->fdmon_ops->update(ctx, node, new_node);

aio_set_fd_handler() returns early instead of calling ->update() when
old_node =3D=3D NULL && new_node =3D=3D NULL. It looks like the NULL pointe=
r
dereference cannot happen and semantically it doesn't make sense to call
->update(ctx, NULL, NULL) since there is nothing to update so it's
unlikely to be called this way in the future.

Have I missed something?

Thanks,
Stefan

> diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
> index e11a8a022e..3c8b0de694 100644
> --- a/util/fdmon-epoll.c
> +++ b/util/fdmon-epoll.c
> @@ -38,10 +38,12 @@ static void fdmon_epoll_update(AioContext *ctx,
>          .data.ptr =3D new_node,
>          .events =3D new_node ? epoll_events_from_pfd(new_node->pfd.event=
s) : 0,
>      };
> -    int r;
> +    int r =3D -1;
> =20
>      if (!new_node) {
> -        r =3D epoll_ctl(ctx->epollfd, EPOLL_CTL_DEL, old_node->pfd.fd, &=
event);
> +        if (old_node) {
> +            r =3D epoll_ctl(ctx->epollfd, EPOLL_CTL_DEL, old_node->pfd.f=
d, &event);
> +        }
>      } else if (!old_node) {
>          r =3D epoll_ctl(ctx->epollfd, EPOLL_CTL_ADD, new_node->pfd.fd, &=
event);
>      } else {
> --=20
> 2.17.1
>=20

--rGFbusPqPukRizi8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHgNCwACgkQnKSrs4Gr
c8h+3Qf/ZkKXx7+noDPr9s+fOAUr6Pbj7+jgz/rapM9zQ4yv1x9Tl01N8c9uy9RZ
qK25D3EPEToV3+PRDNZTcF+uOpZ8shIVh/FgRS05WsWKoj/uK65AdPAem5PVvONe
MQIs/zx3AVmPORkyrJWkr9Bc/LhS0xodVAWsDzWDIhAF0Gi7TVIXKdaesygjR1xD
sCJLKXkNnPUAzuNGvgqbPCG0rrGeb59MQCV297xtZwqA356Qg3B3vOrIAu/5N7qp
sYTFG5NZpZIqmAz9pwXWL/dNzF3IrGoC2dVEYpE2lONVkHXuQi/+bS2QsZv+5QuB
JUkAtb5jIRQey0hM7f6Tml22vWVr4Q==
=7UcW
-----END PGP SIGNATURE-----

--rGFbusPqPukRizi8--


