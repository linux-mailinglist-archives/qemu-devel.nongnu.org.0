Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB55571A23
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:36:27 +0200 (CEST)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBF7q-0004r0-UT
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBF1B-0008M7-B7
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBF18-0003pD-Bh
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657628964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BpvMbALqdqaBIgxojtJX59yg0Rt4dx3WrrwylHYSEGQ=;
 b=dh4wwuJsSaPwyqCYAHMZkIYWP7M3wSg8Fm2hNhs0kL4d0WmatvnzjIBs4pjPO+v2xoX0Ug
 6sXhu+PzdHi1cgKtMVwM7Ezbs0S5XCJJIuV5VSqYEBl/P61HNmh+Ohbfk4M7H/XRBp4l12
 ufwBqpvrXCV3le4cmsTZx8EWM+IX9ME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-RTBE_L5HO-eUMPsmT2zJIw-1; Tue, 12 Jul 2022 08:29:21 -0400
X-MC-Unique: RTBE_L5HO-eUMPsmT2zJIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 310693C138A4;
 Tue, 12 Jul 2022 12:29:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD2B2492C3B;
 Tue, 12 Jul 2022 12:29:20 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:29:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 7/8] VirtIOBlock: protect rq with its own lock
Message-ID: <Ys1pH+z38M4PHu3f@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-8-eesposit@redhat.com>
 <YsRObmNTP471U9zU@stefanha-x1.localdomain>
 <2a1e8343-df7d-b98a-1d3b-2bd4345adf3e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+f0sBFDDU8Lq5JSq"
Content-Disposition: inline
In-Reply-To: <2a1e8343-df7d-b98a-1d3b-2bd4345adf3e@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--+f0sBFDDU8Lq5JSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:33:28AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 05/07/2022 um 16:45 schrieb Stefan Hajnoczi:
> > On Thu, Jun 09, 2022 at 10:37:26AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> @@ -946,17 +955,20 @@ static void virtio_blk_reset(VirtIODevice *vdev)
> >>       * stops all Iothreads.
> >>       */
> >>      blk_drain(s->blk);
> >> +    aio_context_release(ctx);
> >> =20
> >>      /* We drop queued requests after blk_drain() because blk_drain() =
itself can
> >>       * produce them. */
> >> +    qemu_mutex_lock(&s->req_mutex);
> >>      while (s->rq) {
> >>          req =3D s->rq;
> >>          s->rq =3D req->next;
> >> +        qemu_mutex_unlock(&s->req_mutex);
> >>          virtqueue_detach_element(req->vq, &req->elem, 0);
> >>          virtio_blk_free_request(req);
> >> +        qemu_mutex_lock(&s->req_mutex);
> >=20
> > Why is req_mutex dropped temporarily? At this point we don't really need
> > the req_mutex (all I/O should be stopped and drained), but maybe we
> > should do:
>=20
> Agree that maybe it is not useful to drop the mutex temporarily.
>=20
> Regarding why req_mutex is not needed, yes I guess it isn't. Should I
> get rid of this hunk at all, and maybe leave a comment like "no
> synchronization needed, due to drain + ->stop_ioeventfd()"?
>=20
> >=20
> >   WITH_QEMU_MUTEX(&s->req_mutex) {
> >       req =3D s->rq;
> >       s->rq =3D NULL;
> >   }
> >=20
> >   ...process req list...
>=20
> Not sure what you mean here, we are looping on s->rq, so do we need to
> protect also that? and why setting it to NULL? Sorry I am a little bit
> lost here.

During reset we need to free the s->rq list and set the head pointer to
NULL.

If we want to access s->rq under s->req_mutex for consistency, then we
can fetch the list head into a local variable, drop the lock, and then
process the list (new items will not be added to the list anymore).

FWIW I think accessing s->rq under req_mutex for consistency is fine.
That makes the code easier to understand (no special case) and reduces
the danger of copy-pasting code into a context where a lock is required.

Stefan

--+f0sBFDDU8Lq5JSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNaR8ACgkQnKSrs4Gr
c8j+HAf+JZkzU5hnJ4qYI77eNCS0qETd9d/uVN7FG7Zg0dL6r0Vy/hrRi8iczitC
ayqZdES3v6Kzzs/4EXtqKaSguobCK1SBZz/nmiekku9lrgTG4CaTKY4fgWi6+jV7
uyFI6K0yumpK4I1+u6T2PIX4ceMqbGl64nBEEoBrBM4shMUxyOfn45uiPVwz2htR
lnDTY6281BFlvFJKNnvGr8Oj4tmPWcxX+bsp7CYxtigGAEM9/ivdSe/6zUyLOpLd
NkdwiVqs78xfnEFi99hGGvTNrOAipeZ6LfI653D+MxxyyZdjkYWbPw7ByQDwm6h+
DazHwJ0n/+2+SH1DewvFobK+7zhJQw==
=8RZa
-----END PGP SIGNATURE-----

--+f0sBFDDU8Lq5JSq--


