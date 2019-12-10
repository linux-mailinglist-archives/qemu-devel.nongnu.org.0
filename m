Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13E117E90
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 04:53:00 +0100 (CET)
Received: from localhost ([::1]:50012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieWa4-0002ff-1h
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 22:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ieWXw-0000IY-TZ
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 22:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ieWXu-00074A-Ip
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 22:50:48 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58771 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ieWXt-00072t-Hu; Mon, 09 Dec 2019 22:50:46 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47X5gh3jrdz9sPc; Tue, 10 Dec 2019 14:50:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575949840;
 bh=HpSUAim7ayl4xBR1wqQLXCLzt2HUnqj1vp8QNzgTHbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MRMYcNv2HSoAaQ5JVah2UVa2nsr8ZcuZRAZO8v2vITrnQ9jYSrRUAybtdwt3tsoac
 /Y++qbjwJlgtI9nUiWK3AkNaTKXpi8DFCI1RIIADpaC85fmJpvqYpkvOhqyI85xrfP
 Xm5PMYLza0Sfe/iBszp0EVzU8k/n8jEgV/KVUnZI=
Date: Tue, 10 Dec 2019 14:34:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/5] ppc/pnv: Introduce a POWER10 PnvChip and a powernv10
 machine
Message-ID: <20191210033454.GE207300@umbus.fritz.box>
References: <20191205184454.10722-1-clg@kaod.org>
 <20191205184454.10722-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline
In-Reply-To: <20191205184454.10722-3-clg@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2019 at 07:44:51PM +0100, C=E9dric Le Goater wrote:
> This is an empty shell with the XSCOM bus and cores. The chip controllers
> will come later.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/pnv.h       |  33 ++++++++
>  include/hw/ppc/pnv_xscom.h |  19 +++++
>  hw/ppc/pnv.c               | 158 +++++++++++++++++++++++++++++++++++--
>  hw/ppc/pnv_core.c          |  10 +++
>  hw/ppc/pnv_xscom.c         |  23 ++++--
>  5 files changed, 232 insertions(+), 11 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 3a7bc3c57e0d..bfa61edfbabd 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -43,6 +43,7 @@ typedef enum PnvChipType {
>      PNV_CHIP_POWER8,      /* AKA Venice */
>      PNV_CHIP_POWER8NVL,   /* AKA Naples */
>      PNV_CHIP_POWER9,      /* AKA Nimbus */
> +    PNV_CHIP_POWER10,     /* AKA TBD */
>  } PnvChipType;
> =20
>  typedef struct PnvChip {
> @@ -105,6 +106,14 @@ typedef struct Pnv9Chip {
>  #define PNV9_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
>  #define PNV9_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
> =20
> +#define TYPE_PNV10_CHIP "pnv10-chip"
> +#define PNV10_CHIP(obj) OBJECT_CHECK(Pnv10Chip, (obj), TYPE_PNV10_CHIP)
> +
> +typedef struct Pnv10Chip {
> +    /*< private >*/
> +    PnvChip      parent_obj;
> +} Pnv10Chip;
> +
>  typedef struct PnvChipClass {
>      /*< private >*/
>      SysBusDeviceClass parent_class;
> @@ -144,6 +153,10 @@ typedef struct PnvChipClass {
>  #define PNV_CHIP_POWER9(obj) \
>      OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER9)
> =20
> +#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v1.0")
> +#define PNV_CHIP_POWER10(obj) \
> +    OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER10)
> +
>  /*
>   * This generates a HW chip id depending on an index, as found on a
>   * two socket system with dual chip modules :
> @@ -203,6 +216,16 @@ PnvChip *pnv_get_chip(uint32_t chip_id);
>  #define PNV_FDT_ADDR          0x01000000
>  #define PNV_TIMEBASE_FREQ     512000000ULL
> =20
> +static inline bool pnv_chip_is_power10(const PnvChip *chip)
> +{
> +    return PNV_CHIP_GET_CLASS(chip)->chip_type =3D=3D PNV_CHIP_POWER10;
> +}
> +
> +static inline bool pnv_is_power10(PnvMachineState *pnv)
> +{
> +    return pnv_chip_is_power10(pnv->chips[0]);
> +}

It's not in scope for this series, but now that we have P8/9/10
specific chip object types and powernv8/powernv9, we should be able to
remove the ugly chip_type field, and just do object class checks on
the chip and or machine objects themselves.

> +
>  /*
>   * BMC helpers
>   */
> @@ -293,4 +316,14 @@ IPMIBmc *pnv_bmc_create(void);
>  #define PNV9_HOMER_SIZE              0x0000000000300000ull
>  #define PNV9_HOMER_BASE(chip)                                           \
>      (0x203ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV9_HOMER_S=
IZE)
> +
> +/*
> + * POWER10 MMIO base addresses - 16TB stride per chip
> + */
> +#define PNV10_CHIP_BASE(chip, base)   \
> +    ((base) + ((uint64_t) (chip)->chip_id << 44))
> +
> +#define PNV10_XSCOM_SIZE             0x0000000400000000ull
> +#define PNV10_XSCOM_BASE(chip)       PNV10_CHIP_BASE(chip, 0x00603fc0000=
0000ull)
> +
>  #endif /* PPC_PNV_H */
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 67641ed27800..790eb3d8f3b0 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -70,6 +70,9 @@ typedef struct PnvXScomInterfaceClass {
>  #define PNV_XSCOM_OCC_BASE        0x0066000
>  #define PNV_XSCOM_OCC_SIZE        0x6000
> =20
> +/*
> + * Layout of the XSCOM PCB addresses (POWER 9)
> + */
>  #define PNV9_XSCOM_EC_BASE(core) \
>      ((uint64_t)(((core) & 0x1F) + 0x20) << 24)
>  #define PNV9_XSCOM_EC_SIZE        0x100000
> @@ -87,6 +90,22 @@ typedef struct PnvXScomInterfaceClass {
>  #define PNV9_XSCOM_XIVE_BASE      0x5013000
>  #define PNV9_XSCOM_XIVE_SIZE      0x300
> =20
> +/*
> + * Layout of the XSCOM PCB addresses (POWER 10)
> + */
> +#define PNV10_XSCOM_EQ_CHIPLET(core)  (0x20 + ((core) >> 2))
> +#define PNV10_XSCOM_EQ(chiplet)       ((chiplet) << 24)
> +#define PNV10_XSCOM_EC(proc)                    \
> +    ((0x2 << 16) | ((1 << (3 - (proc))) << 12))
> +
> +#define PNV10_XSCOM_EQ_BASE(core)     \
> +    ((uint64_t) PNV10_XSCOM_EQ(PNV10_XSCOM_EQ_CHIPLET(core)))
> +#define PNV10_XSCOM_EQ_SIZE        0x100000
> +
> +#define PNV10_XSCOM_EC_BASE(core) \
> +    ((uint64_t) PNV10_XSCOM_EQ_BASE(core) | PNV10_XSCOM_EC(core & 0x3))
> +#define PNV10_XSCOM_EC_SIZE        0x100000
> +
>  extern void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp=
);
>  extern int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
> =20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index fa656858b24a..d99cd72840be 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -317,6 +317,23 @@ static void pnv_chip_power9_dt_populate(PnvChip *chi=
p, void *fdt)
>      pnv_dt_lpc(chip, fdt, 0);
>  }
> =20
> +static void pnv_chip_power10_dt_populate(PnvChip *chip, void *fdt)
> +{
> +    int i;
> +
> +    pnv_dt_xscom(chip, fdt, 0);
> +
> +    for (i =3D 0; i < chip->nr_cores; i++) {
> +        PnvCore *pnv_core =3D chip->cores[i];
> +
> +        pnv_dt_core(chip, pnv_core, fdt);
> +    }
> +
> +    if (chip->ram_size) {
> +        pnv_dt_memory(fdt, chip->chip_id, chip->ram_start, chip->ram_siz=
e);
> +    }
> +}
> +
>  static void pnv_dt_rtc(ISADevice *d, void *fdt, int lpc_off)
>  {
>      uint32_t io_base =3D d->ioport_id;
> @@ -467,6 +484,7 @@ static void *pnv_dt_create(MachineState *machine)
>  {
>      const char plat_compat8[] =3D "qemu,powernv8\0qemu,powernv\0ibm,powe=
rnv";
>      const char plat_compat9[] =3D "qemu,powernv9\0ibm,powernv";
> +    const char plat_compat10[] =3D "qemu,powernv10\0ibm,powernv";
>      PnvMachineState *pnv =3D PNV_MACHINE(machine);
>      void *fdt;
>      char *buf;
> @@ -484,7 +502,10 @@ static void *pnv_dt_create(MachineState *machine)
>      _FDT((fdt_setprop_cell(fdt, 0, "#size-cells", 0x2)));
>      _FDT((fdt_setprop_string(fdt, 0, "model",
>                               "IBM PowerNV (emulated by qemu)")));
> -    if (pnv_is_power9(pnv)) {
> +    if (pnv_is_power10(pnv)) {
> +        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat10,
> +                          sizeof(plat_compat10))));
> +    } else if (pnv_is_power9(pnv)) {
>          _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat9,
>                            sizeof(plat_compat9))));
>      } else {
> @@ -528,8 +549,8 @@ static void *pnv_dt_create(MachineState *machine)
>          pnv_dt_bmc_sensors(pnv->bmc, fdt);
>      }
> =20
> -    /* Create an extra node for power management on Power9 */
> -    if (pnv_is_power9(pnv)) {
> +    /* Create an extra node for power management on Power9 and Power10 */
> +    if (pnv_is_power9(pnv) || pnv_is_power10(pnv)) {
>          pnv_dt_power_mgt(fdt);
>      }
> =20
> @@ -578,6 +599,12 @@ static ISABus *pnv_chip_power9_isa_create(PnvChip *c=
hip, Error **errp)
>      return pnv_lpc_isa_create(&chip9->lpc, false, errp);
>  }
> =20
> +static ISABus *pnv_chip_power10_isa_create(PnvChip *chip, Error **errp)
> +{
> +    error_setg(errp, "No ISA bus!");
> +    return NULL;
> +}
> +
>  static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
>  {
>      return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
> @@ -618,6 +645,13 @@ static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *b=
mc, uint32_t irq)
>      object_property_set_bool(obj, true, "realized", &error_fatal);
>  }
> =20
> +static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
> +{
> +    /*
> +     * No interrupt controller yet
> +     */;
> +}
> +
>  static void pnv_init(MachineState *machine)
>  {
>      PnvMachineState *pnv =3D PNV_MACHINE(machine);
> @@ -822,6 +856,11 @@ static uint32_t pnv_chip_core_pir_p9(PnvChip *chip, =
uint32_t core_id)
>      return (chip->chip_id << 8) | (core_id << 2);
>  }
> =20
> +static uint32_t pnv_chip_core_pir_p10(PnvChip *chip, uint32_t core_id)
> +{
> +    return (chip->chip_id << 8) | (core_id << 2);
> +}
> +
>  static void pnv_chip_power9_intc_create(PnvChip *chip, PowerPCCPU *cpu,
>                                          Error **errp)
>  {
> @@ -859,6 +898,27 @@ static void pnv_chip_power9_intc_destroy(PnvChip *ch=
ip, PowerPCCPU *cpu)
>      pnv_cpu->intc =3D NULL;
>  }
> =20
> +static void pnv_chip_power10_intc_create(PnvChip *chip, PowerPCCPU *cpu,
> +                                        Error **errp)
> +{
> +    PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
> +
> +    /* Will be defined when the interrupt controller is */
> +    pnv_cpu->intc =3D NULL;
> +}
> +
> +static void pnv_chip_power10_intc_reset(PnvChip *chip, PowerPCCPU *cpu)
> +{
> +    ;
> +}
> +
> +static void pnv_chip_power10_intc_destroy(PnvChip *chip, PowerPCCPU *cpu)
> +{
> +    PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
> +
> +    pnv_cpu->intc =3D NULL;
> +}
> +
>  /*
>   * Allowed core identifiers on a POWER8 Processor Chip :
>   *
> @@ -886,6 +946,9 @@ static void pnv_chip_power9_intc_destroy(PnvChip *chi=
p, PowerPCCPU *cpu)
>   */
>  #define POWER9_CORE_MASK   (0xffffffffffffffull)
> =20
> +
> +#define POWER10_CORE_MASK  (0xffffffffffffffull)
> +
>  static void pnv_chip_power8_instance_init(Object *obj)
>  {
>      Pnv8Chip *chip8 =3D PNV8_CHIP(obj);
> @@ -1246,6 +1309,56 @@ static void pnv_chip_power9_class_init(ObjectClass=
 *klass, void *data)
>                                      &k->parent_realize);
>  }
> =20
> +static void pnv_chip_power10_instance_init(Object *obj)
> +{
> +    /*
> +     * No controllers yet
> +     */
> +    ;
> +}
> +
> +static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
> +{
> +    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
> +    PnvChip *chip =3D PNV_CHIP(dev);
> +    Error *local_err =3D NULL;
> +
> +    /* XSCOM bridge is first */
> +    pnv_xscom_realize(chip, PNV10_XSCOM_SIZE, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV10_XSCOM_BASE(chip));
> +
> +    pcc->parent_realize(dev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +}
> +
> +static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PnvChipClass *k =3D PNV_CHIP_CLASS(klass);
> +
> +    k->chip_type =3D PNV_CHIP_POWER10;
> +    k->chip_cfam_id =3D 0x120da04900008000ull; /* P10 DD1.0 (with NX) */
> +    k->cores_mask =3D POWER10_CORE_MASK;
> +    k->core_pir =3D pnv_chip_core_pir_p10;
> +    k->intc_create =3D pnv_chip_power10_intc_create;
> +    k->intc_reset =3D pnv_chip_power10_intc_reset;
> +    k->intc_destroy =3D pnv_chip_power10_intc_destroy;
> +    k->isa_create =3D pnv_chip_power10_isa_create;
> +    k->dt_populate =3D pnv_chip_power10_dt_populate;
> +    k->pic_print_info =3D pnv_chip_power10_pic_print_info;
> +    dc->desc =3D "PowerNV Chip POWER10";
> +
> +    device_class_set_parent_realize(dc, pnv_chip_power10_realize,
> +                                    &k->parent_realize);
> +}
> +
>  static void pnv_chip_core_sanitize(PnvChip *chip, Error **errp)
>  {
>      PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
> @@ -1327,10 +1440,12 @@ static void pnv_chip_core_realize(PnvChip *chip, =
Error **errp)
>                                   &error_fatal);
> =20
>          /* Each core has an XSCOM MMIO region */
> -        if (!pnv_chip_is_power9(chip)) {
> -            xscom_core_base =3D PNV_XSCOM_EX_BASE(core_hwid);
> -        } else {
> +        if (pnv_chip_is_power10(chip)) {
> +            xscom_core_base =3D PNV10_XSCOM_EC_BASE(core_hwid);
> +        } else if (pnv_chip_is_power9(chip)) {
>              xscom_core_base =3D PNV9_XSCOM_EC_BASE(core_hwid);
> +        } else {
> +            xscom_core_base =3D PNV_XSCOM_EX_BASE(core_hwid);
>          }
> =20
>          pnv_xscom_add_subregion(chip, xscom_core_base,
> @@ -1558,6 +1673,14 @@ static void pnv_machine_power9_class_init(ObjectCl=
ass *oc, void *data)
>      mc->alias =3D "powernv";
>  }
> =20
> +static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +    mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER10";
> +    mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v1.0");
> +}
> +
>  static void pnv_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -1595,7 +1718,19 @@ static void pnv_machine_class_init(ObjectClass *oc=
, void *data)
>          .parent        =3D TYPE_PNV9_CHIP,          \
>      }
> =20
> +#define DEFINE_PNV10_CHIP_TYPE(type, class_initfn) \
> +    {                                              \
> +        .name          =3D type,                     \
> +        .class_init    =3D class_initfn,             \
> +        .parent        =3D TYPE_PNV10_CHIP,          \
> +    }
> +
>  static const TypeInfo types[] =3D {
> +    {
> +        .name          =3D MACHINE_TYPE_NAME("powernv10"),
> +        .parent        =3D TYPE_PNV_MACHINE,
> +        .class_init    =3D pnv_machine_power10_class_init,
> +    },
>      {
>          .name          =3D MACHINE_TYPE_NAME("powernv9"),
>          .parent        =3D TYPE_PNV_MACHINE,
> @@ -1635,6 +1770,17 @@ static const TypeInfo types[] =3D {
>          .abstract      =3D true,
>      },
> =20
> +    /*
> +     * P10 chip and variants
> +     */
> +    {
> +        .name          =3D TYPE_PNV10_CHIP,
> +        .parent        =3D TYPE_PNV_CHIP,
> +        .instance_init =3D pnv_chip_power10_instance_init,
> +        .instance_size =3D sizeof(Pnv10Chip),
> +    },
> +    DEFINE_PNV10_CHIP_TYPE(TYPE_PNV_CHIP_POWER10, pnv_chip_power10_class=
_init),
> +
>      /*
>       * P9 chip and variants
>       */
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index 5ab75bde6cc5..2651044278ed 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -247,6 +247,7 @@ static void pnv_core_realize(DeviceState *dev, Error =
**errp)
>      }
> =20
>      snprintf(name, sizeof(name), "xscom-core.%d", cc->core_id);
> +    /* TODO: check PNV_XSCOM_EX_SIZE for p10 */
>      pnv_xscom_region_init(&pc->xscom_regs, OBJECT(dev), pcc->xscom_ops,
>                            pc, name, PNV_XSCOM_EX_SIZE);
> =20
> @@ -308,6 +309,14 @@ static void pnv_core_power9_class_init(ObjectClass *=
oc, void *data)
>      pcc->xscom_ops =3D &pnv_core_power9_xscom_ops;
>  }
> =20
> +static void pnv_core_power10_class_init(ObjectClass *oc, void *data)
> +{
> +    PnvCoreClass *pcc =3D PNV_CORE_CLASS(oc);
> +
> +    /* TODO: Use the P9 XSCOMs for now on P10 */
> +    pcc->xscom_ops =3D &pnv_core_power9_xscom_ops;
> +}
> +
>  static void pnv_core_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
> @@ -337,6 +346,7 @@ static const TypeInfo pnv_core_infos[] =3D {
>      DEFINE_PNV_CORE_TYPE(power8, "power8_v2.0"),
>      DEFINE_PNV_CORE_TYPE(power8, "power8nvl_v1.0"),
>      DEFINE_PNV_CORE_TYPE(power9, "power9_v2.0"),
> +    DEFINE_PNV_CORE_TYPE(power10, "power10_v1.0"),
>  };
> =20
>  DEFINE_TYPES(pnv_core_infos)
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index f01d788a6545..b3d3b6e3507d 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -69,10 +69,16 @@ static uint32_t pnv_xscom_pcba(PnvChip *chip, uint64_=
t addr)
>  {
>      addr &=3D (PNV_XSCOM_SIZE - 1);
> =20
> -    if (pnv_chip_is_power9(chip)) {
> -        return addr >> 3;
> -    } else {
> +    switch (PNV_CHIP_GET_CLASS(chip)->chip_type) {
> +    case PNV_CHIP_POWER8E:
> +    case PNV_CHIP_POWER8:
> +    case PNV_CHIP_POWER8NVL:
>          return ((addr >> 4) & ~0xfull) | ((addr >> 3) & 0xf);
> +    case PNV_CHIP_POWER9:
> +    case PNV_CHIP_POWER10:
> +        return addr >> 3;
> +    default:
> +        g_assert_not_reached();
>      }
>  }
> =20
> @@ -307,6 +313,7 @@ static int xscom_dt_child(Object *child, void *opaque)
> =20
>  static const char compat_p8[] =3D "ibm,power8-xscom\0ibm,xscom";
>  static const char compat_p9[] =3D "ibm,power9-xscom\0ibm,xscom";
> +static const char compat_p10[] =3D "ibm,power10-xscom\0ibm,xscom";
> =20
>  int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset)
>  {
> @@ -315,7 +322,10 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_=
offset)
>      ForeachPopulateArgs args;
>      char *name;
> =20
> -    if (pnv_chip_is_power9(chip)) {
> +    if (pnv_chip_is_power10(chip)) {
> +        reg[0] =3D cpu_to_be64(PNV10_XSCOM_BASE(chip));
> +        reg[1] =3D cpu_to_be64(PNV10_XSCOM_SIZE);
> +    } else if (pnv_chip_is_power9(chip)) {
>          reg[0] =3D cpu_to_be64(PNV9_XSCOM_BASE(chip));
>          reg[1] =3D cpu_to_be64(PNV9_XSCOM_SIZE);
>      } else {
> @@ -332,7 +342,10 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_=
offset)
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "#size-cells", 1)));
>      _FDT((fdt_setprop(fdt, xscom_offset, "reg", reg, sizeof(reg))));
> =20
> -    if (pnv_chip_is_power9(chip)) {
> +    if (pnv_chip_is_power10(chip)) {
> +        _FDT((fdt_setprop(fdt, xscom_offset, "compatible", compat_p10,
> +                          sizeof(compat_p10))));
> +    } else if (pnv_chip_is_power9(chip)) {
>          _FDT((fdt_setprop(fdt, xscom_offset, "compatible", compat_p9,
>                            sizeof(compat_p9))));
>      } else {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3vEl4ACgkQbDjKyiDZ
s5IMzQ/+Mrw2sJECek0n4o0j5LELGncDDb2EwLpJItfr3bqFNhCAvZSsRc/4k1Vf
1FSmv9qaW2/xYZ/17PkhEjWfAmGlqft9X/G5sIkiyo7YdNOjQ5pu/TgAlA+pLWIa
bOBOimXiXGgpN+8plWMsmBcDz0A2mi3wdkrqA8qT56de6MVBi8uFygL10GfSUF0c
3E/G2GWy+vvk2JU9+SkXFl8FWI1P/+9k9GNExr5QFyoYlI5sEOBSy5BKQ/UqPeT2
O6dJknQ82+Q7IlN0x/dV20J/ITg3p4PRGEex89tTSlRMODV6x9qWpwYCOwataShr
4uMS+cwazegu0dFpOj9Lt7Zkb62BHhKjo/hjctmrrWeJl3L7VPO7bPby4rlTM0eb
QqK4O0/Xnx/rq5lesD1ivdKLy1L6n7gAEvKf6K/rXDQ25gAqKNLo63eiWHxhHgJw
CpVDtzg0XLbG/j/jCoIjLLomlNwz2ML9jxZKxUdM4TtAAY0yql8smyci4EmztK0X
bFfjxOl+iFBIMMNvQlMuWu/7b/rVdHjn1wu8KsO6/DHYEgas3fMkj48btVLS+pc6
cT3ABfYSEURAE53emRU84lZSggFfXuhR1bycN+V1fLrt9AgqfG5B2LYiKbelik3s
W9gLGPwGTd07OnINvOc7PG7Lcxk+LbA4TreZ6zkss1uJsuN+y0A=
=HhTB
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--

