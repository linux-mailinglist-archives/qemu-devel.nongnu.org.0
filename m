Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08972F6FE0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:13:50 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0DgU-0001FC-2H
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaQ-000491-5A; Thu, 14 Jan 2021 20:07:34 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51857 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaK-0003Sg-Ri; Thu, 14 Jan 2021 20:07:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31c0rW4z9sWR; Fri, 15 Jan 2021 12:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672836;
 bh=UeBsrKgaBOyYJghSEQHogj9TdyuE4V39CkWNm8xg2eU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRu4cX8EJ8DmUAAdup8uK1ATzB3ijutIY8Ka1iWs5vHmiWU/Ek5jt/V7gDYlI5Qub
 UjA1/bt05xO4MNe9VcyqI/91BIFfM0vhghuVCZXENuQjSc/v8ihEiHtaysbzC+B699
 X0jFOwkPyO0svKDV+WzkU7w9l5Uhmh82djohSDqE=
Date: Fri, 15 Jan 2021 11:52:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 6/7] spapr.c: introduce spapr_core_unplug_possible()
Message-ID: <20210115005245.GV435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Avw2VvEbzfULB0h1"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-7-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Avw2VvEbzfULB0h1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:27PM -0300, Daniel Henrique Barboza wrote:
> Next patch is going to add more conditions to allow a CPU core
> hotunplug. Let's put it into a separated function to avoid crowding
> the body of spapr_core_unplug_request().
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

LGTM, except for naming.  I'd expect a function named *_possible() to
return a boolean, where "true" means it *is* possible, rather than a
0-or-negative-error value.

So you could either change the type and sense of the function, or
change the name to, say spapr_core_unplug_check(), which I would
expect to return an error code.

> ---
>  hw/ppc/spapr.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2c403b574e..a2f01c21aa 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3706,22 +3706,35 @@ static void spapr_core_unplug(HotplugHandler *hot=
plug_dev, DeviceState *dev)
>      qdev_unrealize(dev);
>  }
> =20
> -static
> -void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState =
*dev,
> -                               Error **errp)
> +static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCo=
re *cc,
> +                                      Error **errp)
>  {
> -    SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
>      int index;
> -    SpaprDrc *drc;
> -    CPUCore *cc =3D CPU_CORE(dev);
> =20
>      if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index))=
 {
>          error_setg(errp, "Unable to find CPU core with core-id: %d",
>                     cc->core_id);
> -        return;
> +        return -1;
>      }
> +
>      if (index =3D=3D 0) {
>          error_setg(errp, "Boot CPU core may not be unplugged");
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static
> +void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState =
*dev,
> +                               Error **errp)
> +{
> +    ERRP_GUARD();
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
> +    SpaprDrc *drc;
> +    CPUCore *cc =3D CPU_CORE(dev);
> +
> +    if (spapr_core_unplug_possible(hotplug_dev, cc, errp) < 0) {
>          return;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Avw2VvEbzfULB0h1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA510ACgkQbDjKyiDZ
s5K77w//WU2EE80pDLC1Gqkhl6fXCUvyEAJurkDtjjKi0kupL+m3r+5mdOUEF+Ut
GPdJ2v3c7xQ30nELT5S6f+8TqH0vU7dTC2PI3rNlGcj8EPBrxzcOlzq750/4AVdo
kIFbZ/kDtpH1mQBWKMq2h127B6NW2ebExGWnJbIB827X/uxihuep4+xqKasoqWsT
YhJNritRP3i+qV7wW8KAIYGHNtZJ7ldtm1ZoP+ixhd5CuFhCPo5DX3yMT3hELqRf
jpmeCSM3x0QmuBZCwjMwdC8gFRqKh9yLmKrmCLJ/aj5kC3D/351synTNSPSJQUzC
b81QTayZnOH/BhD4nrIl0eclBVSm14tcyyGgUDrYm1rJqFXiknKAw6Q6Ioj9Ay2R
ank1k8BPFpSQys0FzBbjPV1/15iwISpzhFvVOx0G24opabUphBoCv6+TyG+XIi+O
OHtvSPZfGJw7GYlHZg4gMw/emuhlRKNVEXRVVun7WG4cMlELbAXT4+QtZWFpaZKA
kBgNcCz90ZUB2qaxmPdz2DB+wq3tAYHC7+mTioJHk13niFeGYUktpP4/U3gFhuYX
bU3Fv0mHoyynRis20aQk+TF65cMTYGOiGzHl00uRjexXfxxp5FsT3cZOd+Z6ViIn
7CDth8tYKweBeGi9EjzWA+HyAkqrjlUJMmkJLJcIxBf6eLV8e70=
=gEHL
-----END PGP SIGNATURE-----

--Avw2VvEbzfULB0h1--

