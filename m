Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6283E3E6D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 05:45:12 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCwDv-0006wf-Ok
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 23:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mCwAk-0004i1-NM; Sun, 08 Aug 2021 23:41:55 -0400
Received: from ozlabs.org ([203.11.71.1]:48501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mCwAi-0002Ry-0v; Sun, 08 Aug 2021 23:41:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gjhhg32Qmz9sX5; Mon,  9 Aug 2021 13:41:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628480499;
 bh=yPuzDYllDFLq6WFpkMWpVFcFlplJOeAG0kKecwgN2cI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/3xb3jKFW2i3VKgbR/g/U4oKrkAV2s5tlwTJWOvuzBqaXYPY9QEP/1T4DTqY6rIp
 ts8M2gCrRV2lbmP27HTGr6fTdoa0/egxlq24REkl3xxFTS4hj+5xZrULSsI0LK2j5J
 vQ9VYQdVYQ4/pVHivFcF3Or0t3UCLKY0ujzc7bVk=
Date: Mon, 9 Aug 2021 13:39:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.2 v6 3/7] spapr_drc.c: do not error_report() when
 drc->dev->id == NULL
Message-ID: <YRCje3yeuhVYtr+b@yekko>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-4-danielhb413@gmail.com>
 <878s1dcqxr.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SAKazLzjvBGuUreE"
Content-Disposition: inline
In-Reply-To: <878s1dcqxr.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SAKazLzjvBGuUreE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 07, 2021 at 03:41:52PM +0200, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>=20
> > The error_report() call in drc_unisolate_logical() is not considering
> > that drc->dev->id can be NULL, and the underlying functions error_repor=
t()
> > calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
> > behavior when trying to handle "%s" with NULL arguments.
> >
> > Besides, there is no utility into reporting that an unknown device was
> > rejected by the guest.
> >
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/ppc/spapr_drc.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> > index a2f2634601..a4d9496f76 100644
> > --- a/hw/ppc/spapr_drc.c
> > +++ b/hw/ppc/spapr_drc.c
> > @@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *dr=
c)
> >              }
> > =20
> >              drc->unplug_requested =3D false;
> > -            error_report("Device hotunplug rejected by the guest "
> > -                         "for device %s", drc->dev->id);
> > +
> > +            if (drc->dev->id) {
> > +                error_report("Device hotunplug rejected by the guest "
> > +                             "for device %s", drc->dev->id);
> > +            }
> > =20
> >              /*
> >               * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
>=20
> This differs from PATCH 1 and 2 in that it actually fixes a crash bug.
>=20
> The alternative is something like
>=20
>                error_report("Device hotunplug rejected by the guest "
>                             "for device %s", drc->dev->id ?: "");
>=20
> If the maintainer is okay with dropping the message when the device has
> no ID, then so am I:

I am, given how briefly this message has even existed - and through
all that time it would have crashed if you tried.

> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Folded into my tree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SAKazLzjvBGuUreE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEQo3sACgkQbDjKyiDZ
s5IGGhAAx6l/jvuH8qOKHdpWQTGDMFxEuiWgbAo+GUd/bZAcf4eh9Q8LWSP2mJY5
ZfsxIxFBkmSlWUaG9DOxSaBEupQRrRkeKUPKe3hP5FRghRtzY47JjKJL05dQhDm7
b9SPnPt7oKEUZDS4plHX7dVYNfPux9xO7EAVDzoebGALaGGIOypLjNn5cGdyIojG
TI/NKUFESHfScIrXMiSir1RZoeJtbd9yjzCKAN+8vpdMDtLQpzUyoAN9JXI2XRSX
ypmK8uHs8l24weftaYwKUvV/OlSUdxX/k3pzM3yQJpuxqlMGciTJicVcGI/rNSXF
ncQzTd+Tn33VNM5s++43erl9Ua8whcUW2wsTvA/d4NoaYmX9jSzQCIk1QuZzL1lp
TR66yRg/vwfiMt7BnMYGmHfak/KnBcdTE0Q/SdVMYHqfV0tzLyjiqIXn7gwcQ8E5
JDap2eKQYje0ytLy/qVzGEgzULlEqpZXD+ZAL5NAmrOtxkPDJVn08wYqz1JuF2OV
IAOB1hmHgW7xd7iLZqb2O5CmcSl8GVXygMLxDi7nL8Hsekghs6sMNmhsHasdOXxK
fFlPqdLvhEuMJkQU02sBit2sXhO3mETvxeur9GBT+n25JMnAy72wqfMy0LLINHC8
S2OnPT/T2WaFdh3gA7TmOOV6Cd76gl3hhgqqtX3vkSZwr6uh/K0=
=6F6M
-----END PGP SIGNATURE-----

--SAKazLzjvBGuUreE--

