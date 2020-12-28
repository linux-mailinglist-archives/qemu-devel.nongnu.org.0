Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363692E34C2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:34:56 +0100 (CET)
Received: from localhost ([::1]:54134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktn3P-0005J7-AK
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy3-0002I1-Dw; Mon, 28 Dec 2020 02:29:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34541 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy0-0000Lk-Aj; Mon, 28 Dec 2020 02:29:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lg4xNyz9sWV; Mon, 28 Dec 2020 18:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140555;
 bh=0gLP76x88pDCjCGsvXd1PSKP1zEiIBJtDKRIgZclNZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ddDR2LCUN4nGkd2u617OR5ttnA57H83t1K40cjxEIlC9YoJ/Z3uFSevasXcjZD//b
 nr+mq6qEKh5MQXffZHyezPN3+3okQ1NCiH8B8iA4VVydhZlhny5/BEt6bp/tiwuKxT
 JpXhA5nJGfPD0/hS+DBpDrP1r2L3flXkH5QuM7ZM=
Date: Mon, 28 Dec 2020 18:08:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 3/7] macio: move heathrow PIC inside macio-oldworld device
Message-ID: <20201228070833.GE6952@yekko.fritz.box>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
 <20201219104229.1964-4-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6e7ZaeXHKrTJCxdu"
Content-Disposition: inline
In-Reply-To: <20201219104229.1964-4-mark.cave-ayland@ilande.co.uk>
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


--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 10:42:25AM +0000, Mark Cave-Ayland wrote:

Really needs a commit message.

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/macio/macio.c         | 20 +++++------
>  hw/ppc/mac_oldworld.c         | 66 +++++++++++++++++------------------
>  include/hw/misc/macio/macio.h |  2 +-
>  3 files changed, 43 insertions(+), 45 deletions(-)
>=20
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index bb601f782c..cfb87da6c9 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -140,7 +140,7 @@ static void macio_oldworld_realize(PCIDevice *d, Erro=
r **errp)
>  {
>      MacIOState *s =3D MACIO(d);
>      OldWorldMacIOState *os =3D OLDWORLD_MACIO(d);
> -    DeviceState *pic_dev =3D DEVICE(os->pic);
> +    DeviceState *pic_dev =3D DEVICE(&os->pic);
>      Error *err =3D NULL;
>      SysBusDevice *sysbus_dev;
> =20
> @@ -150,6 +150,14 @@ static void macio_oldworld_realize(PCIDevice *d, Err=
or **errp)
>          return;
>      }
> =20
> +    /* Heathrow PIC */
> +    if (!qdev_realize(DEVICE(&os->pic), BUS(&s->macio_bus), errp)) {
> +        return;
> +    }
> +    sysbus_dev =3D SYS_BUS_DEVICE(&os->pic);
> +    memory_region_add_subregion(&s->bar, 0x0,
> +                                sysbus_mmio_get_region(sysbus_dev, 0));
> +
>      qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
>                           s->frequency);
>      if (!qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), errp)) {
> @@ -175,11 +183,6 @@ static void macio_oldworld_realize(PCIDevice *d, Err=
or **errp)
>                                  sysbus_mmio_get_region(sysbus_dev, 0));
>      pmac_format_nvram_partition(&os->nvram, os->nvram.size);
> =20
> -    /* Heathrow PIC */
> -    sysbus_dev =3D SYS_BUS_DEVICE(os->pic);
> -    memory_region_add_subregion(&s->bar, 0x0,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> -
>      /* IDE buses */
>      macio_realize_ide(s, &os->ide[0],
>                        qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
> @@ -218,10 +221,7 @@ static void macio_oldworld_init(Object *obj)
>      DeviceState *dev;
>      int i;
> =20
> -    object_property_add_link(obj, "pic", TYPE_HEATHROW,
> -                             (Object **) &os->pic,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             0);
> +    object_initialize_child(OBJECT(s), "pic", &os->pic, TYPE_HEATHROW);
> =20
>      object_initialize_child(OBJECT(s), "cuda", &s->cuda, TYPE_CUDA);
> =20
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index e58e0525fe..44ee99be88 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -98,7 +98,7 @@ static void ppc_heathrow_init(MachineState *machine)
>      MACIOIDEState *macio_ide;
>      ESCCState *escc;
>      SysBusDevice *s;
> -    DeviceState *dev, *pic_dev;
> +    DeviceState *dev, *pic_dev, *grackle_dev;
>      BusState *adb_bus;
>      uint64_t bios_addr;
>      int bios_size;
> @@ -227,10 +227,17 @@ static void ppc_heathrow_init(MachineState *machine)
>          }
>      }
> =20
> +    /* Timebase Frequency */
> +    if (kvm_enabled()) {
> +        tbfreq =3D kvmppc_get_tbfreq();
> +    } else {
> +        tbfreq =3D TBFREQ;
> +    }
> +
>      /* Grackle PCI host bridge */
> -    dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> -    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
> -    s =3D SYS_BUS_DEVICE(dev);
> +    grackle_dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> +    qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
> +    s =3D SYS_BUS_DEVICE(grackle_dev);
>      sysbus_realize_and_unref(s, &error_fatal);
> =20
>      sysbus_mmio_map(s, 0, GRACKLE_BASE);
> @@ -242,14 +249,30 @@ static void ppc_heathrow_init(MachineState *machine)
>      memory_region_add_subregion(get_system_memory(), 0xfe000000,
>                                  sysbus_mmio_get_region(s, 3));
> =20
> -    /* XXX: we register only 1 output pin for heathrow PIC */
> -    pic_dev =3D qdev_new(TYPE_HEATHROW);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(pic_dev), &error_fatal);
> +    pci_bus =3D PCI_HOST_BRIDGE(grackle_dev)->bus;
> +
> +    /* MacIO */
> +    macio =3D pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO);
> +    dev =3D DEVICE(macio);
> +    qdev_prop_set_uint64(dev, "frequency", tbfreq);
> +
> +    escc =3D ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
> +    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
> +    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
> +
> +    pci_realize_and_unref(macio, pci_bus, &error_fatal);
> +
> +    pic_dev =3D DEVICE(object_resolve_path_component(OBJECT(macio), "pic=
"));
> +    for (i =3D 0; i < 4; i++) {
> +        qdev_connect_gpio_out(grackle_dev, i,
> +                              qdev_get_gpio_in(pic_dev, 0x15 + i));
> +    }
> =20
>      /* Connect the heathrow PIC outputs to the 6xx bus */
>      for (i =3D 0; i < smp_cpus; i++) {
>          switch (PPC_INPUT(env)) {
>          case PPC_FLAGS_INPUT_6xx:
> +            /* XXX: we register only 1 output pin for heathrow PIC */
>              qdev_connect_gpio_out(pic_dev, 0,
>                  ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]);
>              break;
> @@ -259,40 +282,14 @@ static void ppc_heathrow_init(MachineState *machine)
>          }
>      }
> =20
> -    /* Timebase Frequency */
> -    if (kvm_enabled()) {
> -        tbfreq =3D kvmppc_get_tbfreq();
> -    } else {
> -        tbfreq =3D TBFREQ;
> -    }
> -
> -    for (i =3D 0; i < 4; i++) {
> -        qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i=
));
> -    }
> -
> -    pci_bus =3D PCI_HOST_BRIDGE(dev)->bus;
> -
>      pci_vga_init(pci_bus);
> =20
>      for (i =3D 0; i < nb_nics; i++) {
>          pci_nic_init_nofail(&nd_table[i], pci_bus, "ne2k_pci", NULL);
>      }
> =20
> +    /* MacIO IDE */
>      ide_drive_get(hd, ARRAY_SIZE(hd));
> -
> -    /* MacIO */
> -    macio =3D pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO);
> -    dev =3D DEVICE(macio);
> -    qdev_prop_set_uint64(dev, "frequency", tbfreq);
> -    object_property_set_link(OBJECT(macio), "pic", OBJECT(pic_dev),
> -                             &error_abort);
> -
> -    escc =3D ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
> -    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
> -    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
> -
> -    pci_realize_and_unref(macio, pci_bus, &error_fatal);
> -
>      macio_ide =3D MACIO_IDE(object_resolve_path_component(OBJECT(macio),
>                                                          "ide[0]"));
>      macio_ide_init_drives(macio_ide, hd);
> @@ -301,6 +298,7 @@ static void ppc_heathrow_init(MachineState *machine)
>                                                          "ide[1]"));
>      macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
> =20
> +    /* MacIO CUDA/ADB */
>      dev =3D DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
>      adb_bus =3D qdev_get_child_bus(dev, "adb.0");
>      dev =3D qdev_new(TYPE_ADB_KEYBOARD);
> diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
> index 22b4e64b2c..707dfab50c 100644
> --- a/include/hw/misc/macio/macio.h
> +++ b/include/hw/misc/macio/macio.h
> @@ -99,7 +99,7 @@ struct OldWorldMacIOState {
>      MacIOState parent_obj;
>      /*< public >*/
> =20
> -    HeathrowState *pic;
> +    HeathrowState pic;
> =20
>      MacIONVRAMState nvram;
>      MACIOIDEState ide[2];

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6e7ZaeXHKrTJCxdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/phHEACgkQbDjKyiDZ
s5Ja7BAAqbwJQ63vP3BmgQWLtnRipPNLDYQ8gEFJFanZEW/zg233uuuDWP/hkjiP
w8Ozyb7Rwh1ggIdE/PrCMx2yV6UA0FuIq/L7oGeZ9HJz3ePtBac4rJgsSBLdXCwv
doz8hFJAyQhkIJNBIipaxAS9PHBl6yGxVvGPg0/wI7SpdkedWczekrIAA77iBCqc
8EKCpjE8X2blFO3ni30GtjQ1EpNafYptCvseFH7gBfuOEsI5f+RsK3tvjX92cx0K
JHL/s7qmUvl37t0YcZoU1UjO58YZfPfVBsoI6Sw1HbKruR1/7SosTjavro85FRxC
mrfLx3Irga+81vE2sKh7J1cytg2QrfwRKvJuESb5MWMeLq8QkG708OTr8C+FI0Ya
FYIlJ07VFaQlm1dtQ+YIu1l3pEdBZGdTexwSaLT1zNSHVXWUS8eDg5D8EtnhtBDc
i9jw1F8SRmIZ1Rlf/phTEChi2UvpoxtVXuGdkbaZvj1tN9yPiFGNIWauD8oanJ6V
lqxX3UMrvXobJZaP4er4t9Rldknktt9OI/usSBc0LF4oRtWAGtwJmb7707WUPx+h
RNKAmJDELazzmAWZZNekrY002NGdzdxUJ6IncdFMmg9IMUqZx30uAH2I7jmM3YeF
jQION1LnRcXm1MceMgITfBAM5aqAhn9PFEAdazdT/+8OoPWcz+0=
=6Xjm
-----END PGP SIGNATURE-----

--6e7ZaeXHKrTJCxdu--

