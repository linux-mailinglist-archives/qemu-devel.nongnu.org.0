Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D22E759C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 03:02:08 +0100 (CET)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuQoR-0005Z0-5v
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 21:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuQn3-0004we-Sq; Tue, 29 Dec 2020 21:00:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54145 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuQn1-0004NI-D4; Tue, 29 Dec 2020 21:00:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D5DyP6nLSz9sVS; Wed, 30 Dec 2020 13:00:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609293629;
 bh=nmIGAleV5HpUUk7woqzE9HDPUIEDLH+ICmbMI9ROLy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ir9EO59/bNdUUfeXf7Pl7xUTKjnT/IFby1uR44WCTuZic6J6PywSDDwlkvp7Wg8v4
 WPxCNNFRCB8j8hxvwFCUY4/WkBWlhwsa9oHo5xUAXRog+CsaXDiQmjeyzbC5qao5y2
 fcAUqGYD8VQaKlurzkVF2voaElWkEMsvVsK7tzgM=
Date: Wed, 30 Dec 2020 12:25:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 2/7] mac_oldworld: move initialisation of grackle
 before heathrow
Message-ID: <20201230012525.GA5490@yekko.fritz.box>
References: <20201229175619.6051-1-mark.cave-ayland@ilande.co.uk>
 <20201229175619.6051-3-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20201229175619.6051-3-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 05:56:14PM +0000, Mark Cave-Ayland wrote:
> In order to move the heathrow PIC to the macio device, the PCI bus needs =
to be
> initialised before the macio device and also before wiring the PIC IRQs.
>=20
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/mac_oldworld.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 2ead34bdf1..e58e0525fe 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -227,6 +227,21 @@ static void ppc_heathrow_init(MachineState *machine)
>          }
>      }
> =20
> +    /* Grackle PCI host bridge */
> +    dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> +    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
> +    s =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +
> +    sysbus_mmio_map(s, 0, GRACKLE_BASE);
> +    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
> +    /* PCI hole */
> +    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> +                                sysbus_mmio_get_region(s, 2));
> +    /* Register 2 MB of ISA IO space */
> +    memory_region_add_subregion(get_system_memory(), 0xfe000000,
> +                                sysbus_mmio_get_region(s, 3));
> +
>      /* XXX: we register only 1 output pin for heathrow PIC */
>      pic_dev =3D qdev_new(TYPE_HEATHROW);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(pic_dev), &error_fatal);
> @@ -251,21 +266,6 @@ static void ppc_heathrow_init(MachineState *machine)
>          tbfreq =3D TBFREQ;
>      }
> =20
> -    /* Grackle PCI host bridge */
> -    dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> -    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
> -    s =3D SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -
> -    sysbus_mmio_map(s, 0, GRACKLE_BASE);
> -    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
> -    /* PCI hole */
> -    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> -                                sysbus_mmio_get_region(s, 2));
> -    /* Register 2 MB of ISA IO space */
> -    memory_region_add_subregion(get_system_memory(), 0xfe000000,
> -                                sysbus_mmio_get_region(s, 3));
> -
>      for (i =3D 0; i < 4; i++) {
>          qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i=
));
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/r1wMACgkQbDjKyiDZ
s5LK0Q/+Li5ZXddoeWlBpks74l/YRs9yFOJbYIRmN0dpnkvX0fhNVM1fNems5Dgs
JLUGmJHFbDboukb9MW+Y2ChdvWkc5Ea5vsFAQnDnj1Ufcet7zvU4z78emh1WP7Dl
EGAp7lHwaTSTtzETsLkiuXiP4IlXJOI/K0clAR3fyq+g23HTmVTafN5aRJaYjMGS
xRMdaBKb6WJvU87tI2CLaO9CFCuNSKbLIxMXNHV5a4Hr6a3WWifUPGmo1lMe5zS4
8qoKjYy3NAsYavOPZQ20IfOXDA+8wQ2H2bQJLIVZILALwAm0V3qRqkLmw5w+B08+
kKUM+hJC5raggSPb7pBz+ctxkqOac8E6f/HA3xUXl7BxS2wl15tTqXVqBoKbvlef
Fdf3GPqy+cA72/qn1kgNQjXM6HteZ6IyhJHLQC7K/HILj6+ujvFF3NPOVi0ClOND
SZbp+l16oVjFGjMxttsphJxe3f5o4Pg3kHAjWrR3fc0npeGkS6wYv2TDnKQwsc01
CnuEIY0UTAUz8zObAe2NtP0v677bjMjs2KdMYrv+zlKOHHoCRHWWIVvGA/YG1Ozi
EobcHvc+sjIOzyeXXqDzFASUBFKxZjo1KysMbTkYZ9So1P2EHyXFXUwIE7LHOueo
zfQ81QgRxY3in5nKzXGF3EzfmrjOSyqlpFUgmsImHFs4IK6jtRU=
=FpWo
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--

