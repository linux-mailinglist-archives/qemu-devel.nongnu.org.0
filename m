Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782313224F6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:44:22 +0100 (CET)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPYb-00024l-He
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWb-0000HR-Gn; Mon, 22 Feb 2021 23:42:17 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40661 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWY-00058R-8c; Mon, 22 Feb 2021 23:42:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl5xX0ljZz9sS8; Tue, 23 Feb 2021 15:42:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614055328;
 bh=4ML2g75WR5MQEzSj/KVlFqM5ZfoWQcQKLXOmQD0AFhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l3Ct+6aWyJwlo/FRFkWC4MXSOCGFc1vwGoSGArOzTdjBCcPNqFIccGCwTzyHpASPC
 2o2ZmRi5NXYB5xiAUKw8uU68Gt1mvglwCgIR6lDFJU+fToITkD3AsKTM95kuMSLmTF
 Nu9wnqqzWG6gKhzE0KFj7N6Dm5RtvnD7TbOHAjPY=
Date: Tue, 23 Feb 2021 15:34:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 1/6] vt82c686: Implement control of serial port io
 ranges via config regs
Message-ID: <YDSFy971Ltt9+FyL@yekko.fritz.box>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <6371141da056b8b0890ca3f43221da138410374b.1614007326.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tKVpaOWe4vn7pK8O"
Content-Disposition: inline
In-Reply-To: <6371141da056b8b0890ca3f43221da138410374b.1614007326.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tKVpaOWe4vn7pK8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:22:06PM +0100, BALATON Zoltan wrote:
> In VIA super south bridge the io ranges of superio components
> (parallel and serial ports and FDC) can be controlled by superio
> config registers to set their base address and enable/disable them.
> This is not easy to implement in QEMU because ISA emulation is only
> designed to set io base address once on creating the device and io
> ranges are registered at creation and cannot easily be disabled or
> moved later.
>=20
> In this patch we hack around that but only for serial ports because
> those have a single io range at port base that's relatively easy to
> handle and it's what guests actually use and set address different
> than the default.
>=20
> We do not attempt to handle controlling the parallel and FDC regions
> because those have multiple io ranges so handling them would be messy
> and guests either don't change their deafult or don't care. We could
> even get away with disabling and not emulating them, but since they
> are already there, this patch leaves them mapped at their default
> address just in case this could be useful for a guest in the future.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

The maintainers of the hw/isa/vt82c686.c should probably be CCed on this.

> ---
>  hw/isa/vt82c686.c | 84 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 5db9b1706c..98bd57a074 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -252,8 +252,24 @@ static const TypeInfo vt8231_pm_info =3D {
>  typedef struct SuperIOConfig {
>      uint8_t regs[0x100];
>      MemoryRegion io;
> +    ISASuperIODevice *superio;
> +    MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
>  } SuperIOConfig;
> =20
> +static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
> +                                    int offs)
> +{
> +    MemoryRegion *subregion, *mr =3D NULL;
> +
> +    QTAILQ_FOREACH(subregion, &parent->subregions, subregions_link) {
> +        if (subregion->addr =3D=3D offs) {
> +            mr =3D subregion;
> +            break;
> +        }
> +    }
> +    return mr;
> +}
> +
>  static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>                                unsigned size)
>  {
> @@ -279,7 +295,53 @@ static void superio_cfg_write(void *opaque, hwaddr a=
ddr, uint64_t data,
>      case 0xfd ... 0xff:
>          /* ignore write to read only registers */
>          return;
> -    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
> +    case 0xe2:
> +    {
> +        data &=3D 0x1f;
> +        if (data & BIT(2)) { /* Serial port 1 enable */
> +            ISADevice *dev =3D sc->superio->serial[0];
> +            if (!memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_i=
o[0]);
> +            }
> +        } else {
> +            MemoryRegion *io =3D isa_address_space_io(sc->superio->seria=
l[0]);
> +            if (memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_del_subregion(io, sc->serial_io[0]);
> +            }
> +        }
> +        if (data & BIT(3)) { /* Serial port 2 enable */
> +            ISADevice *dev =3D sc->superio->serial[1];
> +            if (!memory_region_is_mapped(sc->serial_io[1])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_i=
o[1]);
> +            }
> +        } else {
> +            MemoryRegion *io =3D isa_address_space_io(sc->superio->seria=
l[1]);
> +            if (memory_region_is_mapped(sc->serial_io[1])) {
> +                memory_region_del_subregion(io, sc->serial_io[1]);
> +            }
> +        }
> +        break;
> +    }
> +    case 0xe7: /* Serial port 1 io base address */
> +    {
> +        data &=3D 0xfe;
> +        sc->superio->serial[0]->ioport_id =3D data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[0])) {
> +            memory_region_set_address(sc->serial_io[0], data << 2);
> +        }
> +        break;
> +    }
> +    case 0xe8: /* Serial port 2 io base address */
> +    {
> +        data &=3D 0xfe;
> +        sc->superio->serial[1]->ioport_id =3D data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[1])) {
> +            memory_region_set_address(sc->serial_io[1], data << 2);
> +        }
> +        break;
> +    }
>      default:
>          qemu_log_mask(LOG_UNIMP,
>                        "via_superio_cfg: unimplemented register 0x%x\n", =
idx);
> @@ -385,6 +447,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **e=
rrp)
>      DeviceState *dev =3D DEVICE(d);
>      ISABus *isa_bus;
>      qemu_irq *isa_irq;
> +    ISASuperIOClass *ic;
>      int i;
> =20
>      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> @@ -394,7 +457,9 @@ static void vt82c686b_realize(PCIDevice *d, Error **e=
rrp)
>      isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
>      i8254_pit_init(isa_bus, 0x40, 0, NULL);
>      i8257_dma_init(isa_bus, 0);
> -    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
> +    s->superio_cfg.superio =3D ISA_SUPERIO(isa_create_simple(isa_bus,
> +                                                      TYPE_VT82C686B_SUP=
ERIO));
> +    ic =3D ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
>      mc146818_rtc_init(isa_bus, 2000, NULL);
> =20
>      for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> @@ -412,6 +477,21 @@ static void vt82c686b_realize(PCIDevice *d, Error **=
errp)
>       */
>      memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
>                                  &s->superio_cfg.io);
> +
> +    /* Grab io regions of serial devices so we can control them */
> +    for (i =3D 0; i < ic->serial.count; i++) {
> +        ISADevice *sd =3D s->superio_cfg.superio->serial[i];
> +        MemoryRegion *io =3D isa_address_space_io(sd);
> +        MemoryRegion *mr =3D find_subregion(sd, io, sd->ioport_id);
> +        if (!mr) {
> +            error_setg(errp, "Could not get io region for serial %d", i);
> +            return;
> +        }
> +        s->superio_cfg.serial_io[i] =3D mr;
> +        if (memory_region_is_mapped(mr)) {
> +            memory_region_del_subregion(io, mr);
> +        }
> +    }
>  }
> =20
>  static void via_class_init(ObjectClass *klass, void *data)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tKVpaOWe4vn7pK8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0hcsACgkQbDjKyiDZ
s5K9cA/+JRwHbJi4H689knxtp6E+T/redOxmvF85gumqLRtX9Ry/BkFKOUAfGgXJ
PJ+WUv8wo2vyl3YhX4QigFPzw6Qx6wSDha4kv5c34kY4mb3QcDrx0KKFyPXyFziU
eOeTqotbuSRRIXg98FAt/J54zKdyNrewglRtct1tBIHlWrNVhQRI9/k72rrrqmyG
guQuUwqwiDJxGokNokyW/CHwxkJWfCKF1juBh9XhEpvFJ1e2Jp8nqPbjwt3Wya+5
fJr+CSXFKaIdEfQM3SgZ7g6q0uKCq18RYZQB4d9VumuphNGD3UInPYNaizebl6aX
ijCsNpdKiLOpHhjx2I9pLGhQnh4Ty/ZnUj8PNQP6edX44dACt9Gc3cCqH8OiHAaY
fgYXgmCggcLcPhlkMmZpPzQmN0OWvGvTBg+qITJly3VamPmKw8QQJr3swifRGCYZ
u/JfRkGDmjmAy9d0+enDghBrcfI9hZ2MT/+QSzebEPAOViBBvSwj+BYTczju2Hft
Dl1EhQEMWdl93MwRjK/3njI7qPAk4pS4wkgoKt0RBLtfmtAZmq74CyEfMWglbffy
BQutR6OgfPWoMerHi7PR+MVCq4jNrrIEnOuMlTyLHpeDSX01TL5Wi3cpYH7zr/Nt
GMB7u5/hcKly8pU3SeojS10iXG5GpiqndslBVh1wCD7JzwoLfKA=
=RXst
-----END PGP SIGNATURE-----

--tKVpaOWe4vn7pK8O--

