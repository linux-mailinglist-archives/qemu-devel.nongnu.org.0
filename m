Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24F2E7E93
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 08:24:49 +0100 (CET)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kusKG-0008VJ-Il
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 02:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kusJ2-0007Zz-Vq; Thu, 31 Dec 2020 02:23:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35163 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kusJ0-0005x1-3D; Thu, 31 Dec 2020 02:23:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D604N2Wq5z9sRf; Thu, 31 Dec 2020 18:23:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609399396;
 bh=WZSO8GD2uX24fvot2sWVbkc9jlN+EQQyPwDbx7hVG7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvdtnjSjkjtlM3sRZX+LFxi5+HTuuXXG7yr3iLlCu833wA9o4Lrva/wAc3gTUb5LV
 j55oTTYQRIq5lpNNBP4jxnom2p83TV3XLBQfzDsDyXOjHp4x0ODVatSPf7mLX0X6k2
 Nj00HBOIfESI9u/wYjscQSyz7L44kppVyBp9U+IE=
Date: Thu, 31 Dec 2020 17:44:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 4/7] mac_newworld: delay wiring of PCI IRQs in New
 World machine
Message-ID: <20201231064411.GA25471@yekko.fritz.box>
References: <20201229175619.6051-1-mark.cave-ayland@ilande.co.uk>
 <20201229175619.6051-5-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20201229175619.6051-5-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 05:56:16PM +0000, Mark Cave-Ayland wrote:
> In order to move the OpenPIC device to the macio device, the PCI bus need=
s to be
> initialised before the macio device and also before wiring the OpenPIC IR=
Qs.
>=20
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/mac_newworld.c | 46 ++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>=20
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index c0accda592..708bb2f1ab 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -139,6 +139,7 @@ static void ppc_core99_init(MachineState *machine)
>      int machine_arch;
>      SysBusDevice *s;
>      DeviceState *dev, *pic_dev;
> +    DeviceState *uninorth_internal_dev =3D NULL, *uninorth_agp_dev =3D N=
ULL;
>      hwaddr nvram_addr =3D 0xFFF04000;
>      uint64_t tbfreq;
>      unsigned int smp_cpus =3D machine->smp.cpus;
> @@ -320,35 +321,24 @@ static void ppc_core99_init(MachineState *machine)
>          sysbus_mmio_map(s, 0, 0xf0800000);
>          sysbus_mmio_map(s, 1, 0xf0c00000);
> =20
> -        for (i =3D 0; i < 4; i++) {
> -            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b=
 + i));
> -        }
> -
>          machine_arch =3D ARCH_MAC99_U3;
>      } else {
>          /* Use values found on a real PowerMac */
>          /* Uninorth AGP bus */
> -        dev =3D qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
> -        s =3D SYS_BUS_DEVICE(dev);
> +        uninorth_agp_dev =3D qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
> +        s =3D SYS_BUS_DEVICE(uninorth_agp_dev);
>          sysbus_realize_and_unref(s, &error_fatal);
>          sysbus_mmio_map(s, 0, 0xf0800000);
>          sysbus_mmio_map(s, 1, 0xf0c00000);
> =20
> -        for (i =3D 0; i < 4; i++) {
> -            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b=
 + i));
> -        }
> -
>          /* Uninorth internal bus */
> -        dev =3D qdev_new(TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
> -        s =3D SYS_BUS_DEVICE(dev);
> +        uninorth_internal_dev =3D qdev_new(
> +                                TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
> +        s =3D SYS_BUS_DEVICE(uninorth_internal_dev);
>          sysbus_realize_and_unref(s, &error_fatal);
>          sysbus_mmio_map(s, 0, 0xf4800000);
>          sysbus_mmio_map(s, 1, 0xf4c00000);
> =20
> -        for (i =3D 0; i < 4; i++) {
> -            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b=
 + i));
> -        }
> -
>          /* Uninorth main bus */
>          dev =3D qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
>          qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
> @@ -364,10 +354,6 @@ static void ppc_core99_init(MachineState *machine)
>          sysbus_mmio_map(s, 0, 0xf2800000);
>          sysbus_mmio_map(s, 1, 0xf2c00000);
> =20
> -        for (i =3D 0; i < 4; i++) {
> -            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b=
 + i));
> -        }
> -
>          machine_arch =3D ARCH_MAC99;
>      }
> =20
> @@ -401,6 +387,26 @@ static void ppc_core99_init(MachineState *machine)
> =20
>      pci_realize_and_unref(macio, pci_bus, &error_fatal);
> =20
> +    for (i =3D 0; i < 4; i++) {
> +        qdev_connect_gpio_out(DEVICE(uninorth_pci), i,
> +                              qdev_get_gpio_in(pic_dev, 0x1b + i));
> +    }
> +
> +    /* TODO: additional PCI buses only wired up for 32-bit machines */
> +    if (PPC_INPUT(env) !=3D PPC_FLAGS_INPUT_970) {
> +        /* Uninorth AGP bus */
> +        for (i =3D 0; i < 4; i++) {
> +            qdev_connect_gpio_out(uninorth_agp_dev, i,
> +                                  qdev_get_gpio_in(pic_dev, 0x1b + i));
> +        }
> +
> +        /* Uninorth internal bus */
> +        for (i =3D 0; i < 4; i++) {
> +            qdev_connect_gpio_out(uninorth_internal_dev, i,
> +                                  qdev_get_gpio_in(pic_dev, 0x1b + i));
> +        }
> +    }
> +
>      /* We only emulate 2 out of 3 IDE controllers for now */
>      ide_drive_get(hd, ARRAY_SIZE(hd));
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/tczoACgkQbDjKyiDZ
s5J7Hw//e4HwtpdWri53PFdRijhu3pRBE1jgFMCiKzvG97jg+fTGVDpWbVFvPa+b
NCVXKm84pqvc2UMUoOUtL9C8JuWhfg1VEOddiNpb94DbYu2HnAe3wKLQx2Y/r42D
KmciGCUCEGx+WFdbWj7vmzDcx2Kt6jTOJtC4nlKDKwUpK3jfogm3d59mnuqOkBkg
iqBxRppGQDJXx6k8/XO3M4FjZOhDEI+n8S1Ik6mnxdOSAmNRxD1f+Wh9zjRoCOgY
UUA3y8Be5MMD/aP0/67ES/nDyqQCjQsRMb75uGtKYv5NqruRnQQKkJBGewDHYE+V
kEIw42Su9/JzngJFBtBBk3kohiemjrenTiBvX17j24PZy8Y28E1ODddnqs5dGQl2
4iiNqqFvopEWphkUv/rsFtGVkVrNwR2X6JxH38UrrTSnHV8VW5VFEWS8JtZ3AqoY
XIlD6f34aZ12XS+hhO6nipU/FZb9dQYqOlj+MrIA+bDiNHo1QlzFS/s/2QrTKqBW
1Mw9l98C9nsnf4OeCS5ZbzTp32N0Xd7pBI4M5do6qCmvIYYB2mrg+SukrHAE3gNU
yUjUMlHdOb0EU7OnYIMEJqj43Ttv5T86XNTPXiZ/JZKR9l/yKHHhR8vZLeZ3c24m
7W0J6IN6Rn09SX0mAjuJhN42rfV6Y7dfyMyoovXemHc/9aMabkw=
=9fgg
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

