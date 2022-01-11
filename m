Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63B48B124
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:43:26 +0100 (CET)
Received: from localhost ([::1]:39878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JJ0-0002cz-3L
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:43:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7JCu-0001kF-1g
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7JCs-0000lf-Gb
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641915426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jJTXI3ChVrEwF2oEUM6i0iPdaCpxWXqHkcXjmMM/mnU=;
 b=QvZARCW0Ie1pcZN0nntxXKV75m3doR+6e/2HcqB6L3dZYmXQvvcJFP2f2GFRrDfO9JRYjy
 Igg+NCmUSxNfvSx0YFE62BxXddmRgHiVhcTXE3og/34wazNh1YITlfi89bQBKyfeJ+uEFI
 8ChbbiK27ehnsNJUbA683ZG6fzi3xzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-ElnxK_aNNtOJvXfyi92Ogw-1; Tue, 11 Jan 2022 10:37:02 -0500
X-MC-Unique: ElnxK_aNNtOJvXfyi92Ogw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2A01966320;
 Tue, 11 Jan 2022 15:37:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EB82B59D4;
 Tue, 11 Jan 2022 15:37:00 +0000 (UTC)
Date: Tue, 11 Jan 2022 15:36:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Message-ID: <Yd2kGwObnurW/oqo@stefanha-x1.localdomain>
References: <20211214143542.14758-1-stefanha@redhat.com>
 <bfa45a4d-4d6e-f2c0-ed62-8bc184196c66@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bfa45a4d-4d6e-f2c0-ed62-8bc184196c66@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+gLWM/KnewIHCFGf"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+gLWM/KnewIHCFGf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 07:57:05PM +0100, Hanna Reitz wrote:
> On 14.12.21 15:35, Stefan Hajnoczi wrote:
> > The BlockBackend root child can change when aio_poll() is invoked. This
> > happens when a temporary filter node is removed upon blockjob
> > completion, for example.
> >=20
> > Functions in block/block-backend.c must be aware of this when using a
> > blk_bs() pointer across aio_poll() because the BlockDriverState refcnt
> > may reach 0, resulting in a stale pointer.
> >=20
> > One example is scsi_device_purge_requests(), which calls blk_drain() to
> > wait for in-flight requests to cancel. If the backup blockjob is active=
,
> > then the BlockBackend root child is a temporary filter BDS owned by the
> > blockjob. The blockjob can complete during bdrv_drained_begin() and the
> > last reference to the BDS is released when the temporary filter node is
> > removed. This results in a use-after-free when blk_drain() calls
> > bdrv_drained_end(bs) on the dangling pointer.
>=20
> By the way, I have a BZ for this, though it=E2=80=99s about block-stream =
instead of
> backup (https://bugzilla.redhat.com/show_bug.cgi?id=3D2036178).=C2=A0 But=
 I=E2=80=99m happy
> to report your patch seems* to fix that problem, too!=C2=A0 (Thanks for f=
ixing my
> BZs! :))
>=20
> *I=E2=80=99ve written a reproducer in iotest form (https://gitlab.com/hre=
itz/qemu/-/blob/stefans-fix-and-a-test/tests/qemu-iotests/tests/stream-erro=
r-on-reset),
> and so far I can only assume it indeed reproduces the report, but I found
> that iotest to indeed be fixed by this patch.=C2=A0 (Which made me very h=
appy.)

Great, I have merged your test case and sent a v3.

Thanks,
Stefan

--+gLWM/KnewIHCFGf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHdpBoACgkQnKSrs4Gr
c8hpzAf/eTrOw6mh7lEe0McrL+zN6/K9vCUNQwlFGIO+YN37zkSg9iCHwKJxwUcU
mm8kjt6jbwCsA+sIZVosbv+FIOU70E5nrHr0QEkMFK6hGkc8Itf3vKwPYyWm9Q4t
IWSe5o5YP2uGSvpMljEDDnKyNO5NTSmZwe6ROYIKyNnCLDk/h4KODoE8sOX1We42
0QmuBs9L1MCiIp9bLhRPz7IKAKdk57ybsaCeC9qUufrwEhRH3nOnJBe+tzcRnFbx
roH1fFkz/mFUBCZbL3Dj8d440/ut9pkoSsKfcPO8nMlNgQ8vetXYhDBvZzfrgB99
6wEwS3Oq9qfg/39RL0pUXank+fhN9Q==
=+fsP
-----END PGP SIGNATURE-----

--+gLWM/KnewIHCFGf--


