Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6997011E45B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 14:08:37 +0100 (CET)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifkgO-00011G-9b
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 08:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ifkeW-0007nJ-Qo
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:06:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ifkeV-0007lH-8x
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:06:40 -0500
Received: from 17.mo7.mail-out.ovh.net ([188.165.35.227]:56843)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ifkeV-0007ia-0j
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:06:39 -0500
Received: from player696.ha.ovh.net (unknown [10.109.143.249])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7F4C5140421
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 14:06:36 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id A5481D51B97D;
 Fri, 13 Dec 2019 13:06:31 +0000 (UTC)
Subject: Re: [PATCH 12/13] ppc/pnv: Introduce PnvChipClass::xscom_pcba() method
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <157623836852.360005.1112241220707384093.stgit@bahia.lan>
 <157623843543.360005.13996472463887521794.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <07d68959-4f71-56cd-75e7-2035d770535b@kaod.org>
Date: Fri, 13 Dec 2019 14:06:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157623843543.360005.13996472463887521794.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10149987662132841299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelledggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.35.227
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/2019 13:00, Greg Kurz wrote:
> The XSCOM bus is implemented with a QOM interface, which is mostly
> generic from a CPU type standpoint, except for the computation of
> addresses on the Pervasize Connect Bus (PCB) network. This is handled

Pervasive

> by the pnv_xscom_pcba() function with a switch statement based on
> the chip_type class level attribute of the CPU chip.
>=20
> This can be achieved using QOM. Also the address argument is masked wit=
h
> PNV_XSCOM_SIZE - 1, which is for POWER8 only. Addresses may have differ=
ent
> sizes with other CPU types. Have each CPU chip type handle the appropri=
ate
> computation with a QOM xscom_pcba() method.

PnvXscom model ? :)

> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/ppc/pnv.c         |   23 +++++++++++++++++++++++
>  hw/ppc/pnv_xscom.c   |   14 +-------------
>  include/hw/ppc/pnv.h |    1 +
>  3 files changed, 25 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 0447b534b8c5..cc40b90e9cd2 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1121,6 +1121,12 @@ static void pnv_chip_power8_realize(DeviceState =
*dev, Error **errp)
>                                  &chip8->homer.regs);
>  }
> =20
> +static uint32_t pnv_chip_power8_xscom_pcba(PnvChip *chip, uint64_t add=
r)
> +{
> +    addr &=3D (PNV_XSCOM_SIZE - 1);
> +    return ((addr >> 4) & ~0xfull) | ((addr >> 3) & 0xf);
> +}
> +
>  static void pnv_chip_power8e_class_init(ObjectClass *klass, void *data=
)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -1138,6 +1144,7 @@ static void pnv_chip_power8e_class_init(ObjectCla=
ss *klass, void *data)
>      k->dt_populate =3D pnv_chip_power8_dt_populate;
>      k->pic_print_info =3D pnv_chip_power8_pic_print_info;
>      k->xscom_core_base =3D pnv_chip_power8_xscom_core_base;
> +    k->xscom_pcba =3D pnv_chip_power8_xscom_pcba;
>      dc->desc =3D "PowerNV Chip POWER8E";
> =20
>      device_class_set_parent_realize(dc, pnv_chip_power8_realize,
> @@ -1161,6 +1168,7 @@ static void pnv_chip_power8_class_init(ObjectClas=
s *klass, void *data)
>      k->dt_populate =3D pnv_chip_power8_dt_populate;
>      k->pic_print_info =3D pnv_chip_power8_pic_print_info;
>      k->xscom_core_base =3D pnv_chip_power8_xscom_core_base;
> +    k->xscom_pcba =3D pnv_chip_power8_xscom_pcba;
>      dc->desc =3D "PowerNV Chip POWER8";
> =20
>      device_class_set_parent_realize(dc, pnv_chip_power8_realize,
> @@ -1184,6 +1192,7 @@ static void pnv_chip_power8nvl_class_init(ObjectC=
lass *klass, void *data)
>      k->dt_populate =3D pnv_chip_power8_dt_populate;
>      k->pic_print_info =3D pnv_chip_power8_pic_print_info;
>      k->xscom_core_base =3D pnv_chip_power8_xscom_core_base;
> +    k->xscom_pcba =3D pnv_chip_power8_xscom_pcba;
>      dc->desc =3D "PowerNV Chip POWER8NVL";
> =20
>      device_class_set_parent_realize(dc, pnv_chip_power8_realize,
> @@ -1340,6 +1349,12 @@ static void pnv_chip_power9_realize(DeviceState =
*dev, Error **errp)
>                                  &chip9->homer.regs);
>  }
> =20
> +static uint32_t pnv_chip_power9_xscom_pcba(PnvChip *chip, uint64_t add=
r)
> +{
> +    addr &=3D (PNV9_XSCOM_SIZE - 1);
> +    return addr >> 3;
> +}
> +
>  static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -1357,6 +1372,7 @@ static void pnv_chip_power9_class_init(ObjectClas=
s *klass, void *data)
>      k->dt_populate =3D pnv_chip_power9_dt_populate;
>      k->pic_print_info =3D pnv_chip_power9_pic_print_info;
>      k->xscom_core_base =3D pnv_chip_power9_xscom_core_base;
> +    k->xscom_pcba =3D pnv_chip_power9_xscom_pcba;
>      dc->desc =3D "PowerNV Chip POWER9";
> =20
>      device_class_set_parent_realize(dc, pnv_chip_power9_realize,
> @@ -1422,6 +1438,12 @@ static void pnv_chip_power10_realize(DeviceState=
 *dev, Error **errp)
>                                              (uint64_t) PNV10_LPCM_BASE=
(chip));
>  }
> =20
> +static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t ad=
dr)
> +{
> +    addr &=3D (PNV10_XSCOM_SIZE - 1);
> +    return addr >> 3;
> +}
> +
>  static void pnv_chip_power10_class_init(ObjectClass *klass, void *data=
)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -1439,6 +1461,7 @@ static void pnv_chip_power10_class_init(ObjectCla=
ss *klass, void *data)
>      k->dt_populate =3D pnv_chip_power10_dt_populate;
>      k->pic_print_info =3D pnv_chip_power10_pic_print_info;
>      k->xscom_core_base =3D pnv_chip_power10_xscom_core_base;
> +    k->xscom_pcba =3D pnv_chip_power10_xscom_pcba;
>      dc->desc =3D "PowerNV Chip POWER10";
> =20
>      device_class_set_parent_realize(dc, pnv_chip_power10_realize,
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index 5ae9dfbb88ad..b681c72575b2 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -57,19 +57,7 @@ static void xscom_complete(CPUState *cs, uint64_t hm=
er_bits)
> =20
>  static uint32_t pnv_xscom_pcba(PnvChip *chip, uint64_t addr)
>  {
> -    addr &=3D (PNV_XSCOM_SIZE - 1);
> -
> -    switch (PNV_CHIP_GET_CLASS(chip)->chip_type) {
> -    case PNV_CHIP_POWER8E:
> -    case PNV_CHIP_POWER8:
> -    case PNV_CHIP_POWER8NVL:
> -        return ((addr >> 4) & ~0xfull) | ((addr >> 3) & 0xf);
> -    case PNV_CHIP_POWER9:
> -    case PNV_CHIP_POWER10:
> -        return addr >> 3;
> -    default:
> -        g_assert_not_reached();
> -    }
> +    return PNV_CHIP_GET_CLASS(chip)->xscom_pcba(chip, addr);
>  }
> =20
>  static uint64_t xscom_read_default(PnvChip *chip, uint32_t pcba)
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 7a134a15d3b5..4972e93c2619 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -138,6 +138,7 @@ typedef struct PnvChipClass {
>      void (*dt_populate)(PnvChip *chip, void *fdt);
>      void (*pic_print_info)(PnvChip *chip, Monitor *mon);
>      uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
> +    uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
>  } PnvChipClass;
> =20
>  #define PNV_CHIP_TYPE_SUFFIX "-" TYPE_PNV_CHIP
>=20


