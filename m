Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F9343B745
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPOF-0003Uq-Mz
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfPIX-00058D-Kj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfPIW-0003eG-0u
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635265655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1BwCNiCEmjJbXnUyM65A+Gm/QfW1LS3fue08EhwbZzY=;
 b=PKGB1CvCE0DsQMitdOYwAi7wHdhUpwtZHi1MhsyGuP6yTZ7LyxSnvVzw0MYMWJfzrhYUGT
 wrNNxGiR2UrOgA6e+YBIv727PvXT6qC/IXoN28Z6tRSAfTvaA3NwK+78/p8SK5wxOcFMeW
 +UOuDSD9rYiUbJbApe74eLMM2F6igUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ko1pLVmeOYWamVToUJXSuA-1; Tue, 26 Oct 2021 12:27:34 -0400
X-MC-Unique: ko1pLVmeOYWamVToUJXSuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBFC11397B02;
 Tue, 26 Oct 2021 16:27:32 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE64419E7E;
 Tue, 26 Oct 2021 16:27:30 +0000 (UTC)
Date: Tue, 26 Oct 2021 17:27:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgsca1kWfxJEGPK@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <fea06711-f4dd-9932-5b2d-06a408c7adf6@linaro.org>
 <YXgC2N+sc76WNhLE@stefanha-x1.localdomain>
 <fbb0c0b9-ba15-c714-553a-9059fefcd854@linaro.org>
MIME-Version: 1.0
In-Reply-To: <fbb0c0b9-ba15-c714-553a-9059fefcd854@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="75R08v/ewMXwvh1a"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--75R08v/ewMXwvh1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 08:32:11AM -0700, Richard Henderson wrote:
> On 10/26/21 6:30 AM, Stefan Hajnoczi wrote:
> > On Mon, Oct 25, 2021 at 10:19:04AM -0700, Richard Henderson wrote:
> > > On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
> > > > Compiler optimizations can cache TLS values across coroutine yield
> > > > points, resulting in stale values from the previous thread when a
> > > > coroutine is re-entered by a new thread.
> > > ...
> > > >    include/qemu/tls.h | 142 +++++++++++++++++++++++++++++++++++++++=
++++++
> > >=20
> > > Better as qemu/coroutine-tls.h, since it is needed for no other purpo=
se.
> > >=20
> > > > +#define QEMU_DEFINE_TLS(type, var) \
> > > > +    __thread type qemu_tls_##var; \
> > > > +    type get_##var(void) { return qemu_tls_##var; } \
> > > > +    void set_##var(type v) { qemu_tls_##var =3D v; }
> > >=20
> > > You might as well make the variable static, since it may only be refe=
renced
> > > by these two functions.
> >=20
> > Oops, that's a bug. It should be declared extern. QEMU_DEFINE_TLS() is
> > meant for use in header files.
>=20
> No, QEMU_DECLARE_TLS was for use in header files, and it of course does n=
ot
> globally declare the tls variable at all.  Only the definition here requi=
res
> the tls variable.

You are right, thanks for pointing this out.

>=20
> > Nice. That makes me wonder if it's possible to write a portable version=
:
> >=20
> >    static inline TYPE get_##VAR(void) \
> >    { volatile TYPE *p =3D &co_tls_##VAR; return *p; }
> >=20
> > But the trouble is we need &co_tls_##VAR to be "volatile" and I don't
> > think there is a way to express that?
>=20
> No, there's not.
>=20
> Anyway, with those four hosts we get coverage of almost all users.  I'll
> note that both arm32 and s390x use the constant pool in computing these t=
ls
> addresses, so they'll need to keep using your functional version.  So we'=
ll
> still have testing of that path as well.

Okay, thanks!

Stefan

--75R08v/ewMXwvh1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4LHEACgkQnKSrs4Gr
c8jLZAf/Y/Wlbz8DBfahzqUNPwhhRSQPLnzBTM9+h30jgE5jYivCinMqceW6tTog
LHP+wxpxu5kQFPXdBNTHUsrjvRx0gbQt5FlB3UTQMb/qQo39RIGN4+nPC7ptATrm
gutcMX9sb4AqFdcFs5AsEtnz+0Q5R+Ruu4ldhO7Iy6VMoaJH8HeJxnm4JFk3Qixp
jeG6KItQfWMxtUsG0GWmlDsMPIbWOnd1pikQjdEvnROkWTXwCDhqdcIESqyO0jCT
0OOgJkwFKNG8b1rJw3InGMHjZeLJcf4W04xSdQDGGmHlFnFEp/GBxO1lsfTLwTFZ
R2gLoEJbpN7E20Tq8c5/+vNxyUBRWQ==
=24GV
-----END PGP SIGNATURE-----

--75R08v/ewMXwvh1a--


