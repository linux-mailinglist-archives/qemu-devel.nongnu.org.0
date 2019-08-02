Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FA7EE66
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 10:09:08 +0200 (CEST)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htScd-0007au-Bq
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 04:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37713)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1htSc5-00077D-Qs
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1htSc4-0005fx-U2
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:08:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51866)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1htSc2-0005eg-S3; Fri, 02 Aug 2019 04:08:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 218613082137;
 Fri,  2 Aug 2019 08:08:30 +0000 (UTC)
Received: from localhost (ovpn-116-202.ams2.redhat.com [10.36.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B18395D712;
 Fri,  2 Aug 2019 08:08:23 +0000 (UTC)
Date: Fri, 2 Aug 2019 09:08:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <20190802080822.GE4227@stefanha-x1.localdomain>
References: <20190801234031.29561-1-mehta.aaru20@gmail.com>
 <20190801234031.29561-18-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline
In-Reply-To: <20190801234031.29561-18-mehta.aaru20@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 02 Aug 2019 08:08:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v9 17/17] block/io_uring: enable kernel
 submission polling
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 saket.sinha89@gmail.com, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 02, 2019 at 05:10:31AM +0530, Aarushi Mehta wrote:
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
>  block/io_uring.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

How does SQPOLL performance compare?

> diff --git a/block/io_uring.c b/block/io_uring.c
> index 1553cd2e58..2a1d79704a 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -288,6 +288,17 @@ static int ioq_submit(LuringState *s)
>              *sqes = luringcb->sqeq;
>              QSIMPLEQ_REMOVE_HEAD(&s->io_q.submit_queue, next);
>          }
> +        /*
> +         * io_uring_submit() returns sqes in ring for kernel side
> +         * submission polling and sets wakeup flag if needed.
> +         *
> +         * It is not possible for any sqes to have already been
> +         * submitted by the sq_poll as the writes are only made visible
> +         * to the kernel in this function.
> +         *
> +         * For normal I/O, it returns the actual submitted requests
> +         * from io_uring_enter()
> +         */
>          ret = io_uring_submit(&s->ring);
>          trace_luring_io_uring_submit(s, ret);
>          /* Prevent infinite loop if submission is refused */
> @@ -525,7 +536,11 @@ LuringState *luring_init(Error **errp)
>      s = g_new0(LuringState, 1);
>      trace_luring_init_state(s, sizeof(*s));
>      struct io_uring *ring = &s->ring;
> -    rc = io_uring_queue_init(MAX_EVENTS, ring, 0);
> +
> +    rc = io_uring_queue_init(MAX_EVENTS, ring, IORING_SETUP_SQPOLL);
> +    if (rc == -EOPNOTSUPP) {
> +            rc = io_uring_queue_init(MAX_EVENTS, ring, 0);

Please use 4-space indentation.

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1D73YACgkQnKSrs4Gr
c8i9Owf+Kc/jFGuKqyfmkOYVvLg0ZRpfvoAr6e0q+hErdsOHQOWoSg34rPCea7ND
voA1Pt1QCSBcH/1WlM63x2d5HOJNOdEXc/u5Q2jl41XyrF7l9qyUoBTWj0BBT9N8
YLUqG44LvuxFhLYM4+qidsY1dUu5hFPCEeWqNvr5E5ri7M4PceQOECgYD69YlFOi
Iwh7mJzJ1n+ASNC7PulsnsXUW5MW/OcAvBIuIq/eO+Ux+LlKe4oGMDE+A1ujf75y
G4HT7u17gqitOhjlGdyVQVW37Zf8nv4Htuixd/YuuZElSDiu4MqfXrJUFMoa2C1E
Lh9BcJeSq+SLTVJ7zHGHq6T0ZkUGhg==
=L2rb
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--

