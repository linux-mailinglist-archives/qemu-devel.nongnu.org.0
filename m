Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76572333B98
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:41:01 +0100 (CET)
Received: from localhost ([::1]:46286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxD1-0005MY-VV
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJxBD-0004qB-DY
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJxB9-0000oN-PL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhDDh/i7wMGLFS0NcwGGn4uu/+99CIoyl6vlC5VXAIM=;
 b=JkLBxapFpazd1CBytSi9kU0LsvYORUqinoFsvLmH4w1WzdTT1qrAFABP4rEopVS7cTNnQ/
 1bIlsJ4eJKZ2auyNBznmrHLgbxiKTuOMBC6bEVFA/5cqvkxwEJu65VfdJB/EMXGzUAIVAo
 b0iStgZT9lCXskRddrOEQ+BsjRLOFRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-ORn7YCxaOQm6Wbs8CZEbZw-1; Wed, 10 Mar 2021 06:38:58 -0500
X-MC-Unique: ORn7YCxaOQm6Wbs8CZEbZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAE3218D6A2C;
 Wed, 10 Mar 2021 11:38:56 +0000 (UTC)
Received: from localhost (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C27060C0F;
 Wed, 10 Mar 2021 11:38:52 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:38:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
Message-ID: <YEivy5SgqspKBOav@stefanha-x1.localdomain>
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
 <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LQz/thhmKlvR5qwm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LQz/thhmKlvR5qwm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 12:37:35AM +0900, Akihiko Odaki wrote:
> 2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 0:17 Stefan Hajnoczi <stefan=
ha@redhat.com>:
> >
> > The live migration compatibility issue is still present. Migrating to
> > another host might not work if the block limits are different.
> >
> > Here is an idea for solving it:
> >
> > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > support a new value called "host". The default behavior remains
> > unchanged for live migration compatibility but now you can use "host" i=
f
> > you know it's okay but don't care about migration compatibility.
> >
> > The downside to this approach is that users must explicitly say
> > something like --drive ...,opt_io_size=3Dhost. But it's still better th=
an
> > the situation we have today where user must manually enter values for
> > their disk.
> >
> > Does this sound okay to everyone?
> >
> > Stefan
>=20
> I wonder how that change affects other block drivers implementing
> bdrv_probe_blocksizes. As far as I know, the values they report are
> already used by default, which is contrary to the default not being
> "host".

The behavior should remain unchanged for existing QEMU command-lines.
The block drivers that report values by default should continue to do
so:

block/file-posix.c: only reports values for s390 DASD devices.

block/nvme.c: reports the NVMe PCI adapter's values.

block/raw-format.c: propagates its child's values unless the "offset"
                    option is incompatible with them.

These block drivers would default to logical_block_size=3Dhost and
physical_block_size=3Dhost, while other block drivers would not.

Stefan

--LQz/thhmKlvR5qwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBIr8sACgkQnKSrs4Gr
c8hIJAf/eM+c46ljk79bMJv16ltz6QISnZK8bvQx6uFpqwKIiahhOz2ZrSuWnQ2e
um9iBmR7VQzr66PIC26ojJ0Ozn9KSg4d8LaT0T8Wl6Q/eHO3EJ5g0i1T15O6x/6c
IOMzfEdbZITENZ4H/vV5X33ZDQe7GE/y3fBUzyxO5Fk3J4U1Rp1FOkGnNv02iw4K
CJca9piVOTtDv1Ub6pI9We1k5RBZ4tSVGMpYx8A4jFZgS8YdSr7el2uWPQxBLI8P
GU68LHqpjjv8LyxpI/TrP484Iwv4jwDbnFvHDsD5ZtWPglGVPwNmQziKdV3swkzU
0IftMN/jvGQOciDLguBtO2ZKEPdv3Q==
=Ujo6
-----END PGP SIGNATURE-----

--LQz/thhmKlvR5qwm--


