Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF87C3CF827
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 12:43:41 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5nDw-0002aX-UX
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 06:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5nC3-0001i2-UM
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 06:41:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5nC2-0005sj-Dv
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 06:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626777701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2/B2K9GGTkoQidTk8q2YM3aSYrQvMARCcXbY2BPgJuI=;
 b=C+tLQTg+VDQzYaNDeUQe9wBGMf9LfObXchQVb7kaFjwR/mcUxTjYNCfwvq8fsEoTmZM1Gh
 trR3W5WsJ9PkWzjmMfIKZqiyPso4mfr1rd4zYeNgpWHR5Dba6bpuzjF+9D7va6/CEvADcn
 3rnq/mCa4j4v3tvJXsp6GQXls3jFhH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-nDDmLbqXOC2FOCTT4cDc2g-1; Tue, 20 Jul 2021 06:41:38 -0400
X-MC-Unique: nDDmLbqXOC2FOCTT4cDc2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06B21824F88;
 Tue, 20 Jul 2021 10:41:37 +0000 (UTC)
Received: from localhost (ovpn-114-103.ams2.redhat.com [10.36.114.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 099FC5D6A1;
 Tue, 20 Jul 2021 10:41:35 +0000 (UTC)
Date: Tue, 20 Jul 2021 11:41:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 3/3] linux-aio: limit the batch size using
 `aio-max-batch` parameter
Message-ID: <YPaoXutDKwmekoew@stefanha-x1.localdomain>
References: <20210707150019.201442-1-sgarzare@redhat.com>
 <20210707150019.201442-4-sgarzare@redhat.com>
 <YO2p/Ns7SsV6LE1x@stefanha-x1.localdomain>
 <20210719103553.2732gqgnvc4nuzlh@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210719103553.2732gqgnvc4nuzlh@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aQzcN05yuyQRzqg8"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aQzcN05yuyQRzqg8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 12:35:53PM +0200, Stefano Garzarella wrote:
> On Tue, Jul 13, 2021 at 03:58:04PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Jul 07, 2021 at 05:00:19PM +0200, Stefano Garzarella wrote:
> > > @@ -371,7 +375,7 @@ static int laio_do_submit(int fd, struct qemu_lai=
ocb *laiocb, off_t offset,
> > >      s->io_q.in_queue++;
> > >      if (!s->io_q.blocked &&
> > >          (!s->io_q.plugged ||
> > > -         s->io_q.in_flight + s->io_q.in_queue >=3D MAX_EVENTS)) {
> > > +         s->io_q.in_queue >=3D max_batch)) {
> >=20
> > Is it safe to drop the MAX_EVENTS case?
>=20
> I think it is safe since in ioq_submit() we have this check while
> dequeueing:
>=20
>         QSIMPLEQ_FOREACH(aiocb, &s->io_q.pending, next) {
>             iocbs[len++] =3D &aiocb->iocb;
>             if (s->io_q.in_flight + len >=3D MAX_EVENTS) {
>                 break;
>             }
>         }
>=20
> But in term of performance, I think is better what you're suggesting,
> because if we have fewer slots available than `max_batch`, here we were
> delaying the call to io_submit().
>=20
> >=20
> > Perhaps the following can be used:
> >=20
> >  int64_t max_batch =3D s->aio_context->aio_max_batch ?: DEFAULT_MAX_BAT=
CH;
> >  max_batch =3D MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight + s->io_q.in=
_queue, max_batch);
> >=20
>=20
> Since we will compare `in_queue` with `max_batch`, should we remove it fr=
om
> this expression?
>=20
> I mean:
>=20
>   int64_t max_batch =3D s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATC=
H;
>   max_batch =3D MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight, max_batch);
>=20
> then as it is in this patch:
>=20
>   s->io_q.in_queue++;
>   if (!s->io_q.blocked &&
>       (!s->io_q.plugged ||
>        s->io_q.in_queue >=3D max_batch)) {
>       ioq_submit(s);
>   }

Good.

Stefan

--aQzcN05yuyQRzqg8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD2qF4ACgkQnKSrs4Gr
c8g/7Af/Vrj4d4TUAgzsgFJOWVX/IpeBPlcG80pli94eiPAhwKdbc4v9hwJehYmn
0ROYAkSbhl6XXd97SJ+PR+tm94n8bT2s3NggqyW8voQuwcLQBT0RnuroNIoB2Cg1
2nI7ShdPO12I5FUh4X+PqWvuLNRYuFGVQMHlf6O35Zdb/w2RA8Zar5DS6tLpyTMh
Y+SFtXbXLD4KMQ0O52GaCpiqbITD/+yqJNDCMfd2F8kCLwdKyIbLZvKPnH9cF2d6
8iVCx1ZvQmIhNQUVc0zL2MMrD5mXvkKOWq7y8/HifwVHvmTiuxoQKDT/IsKZfmYS
V1RKr/1/Rk2mFM7vdaSfEanhbuhgHQ==
=jDUQ
-----END PGP SIGNATURE-----

--aQzcN05yuyQRzqg8--


