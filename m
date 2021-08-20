Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A653F2D70
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:53:17 +0200 (CEST)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4xQ-0001Lx-Hz
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH4wG-0000Uw-Fb
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:52:04 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:36933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH4wC-0004a2-Vo
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:52:04 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-JuqF9YfaN-Wjeb_aVBE_EQ-1; Fri, 20 Aug 2021 09:51:54 -0400
X-MC-Unique: JuqF9YfaN-Wjeb_aVBE_EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F7A100E43C;
 Fri, 20 Aug 2021 13:51:53 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FDBB5C1BB;
 Fri, 20 Aug 2021 13:51:52 +0000 (UTC)
Date: Fri, 20 Aug 2021 15:51:51 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 04/26] ppc/pnv: Use a simple incrementing index for the
 chip-id
Message-ID: <20210820155151.05797a87@bahia.lan>
In-Reply-To: <20210809134547.689560-5-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-5-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 15:45:25 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> When the QEMU PowerNV machine was introduced, multi chip support
> modeled a two socket system with dual chip modules as found on some P8
> Tuleta systems (8286-42A). But this is hardly used and not relevant
> for QEMU. Use a simple index instead.
>=20

Makes sense.

> With this change, we can now increase the max socket number to 16 as
> found on high end systems.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/pnv.h | 33 +++++++--------------------------
>  hw/ppc/pnv.c         | 11 ++++++-----
>  2 files changed, 13 insertions(+), 31 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 3fec7c87d82d..aa08d79d24de 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -174,25 +174,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
>  DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                           TYPE_PNV_CHIP_POWER10)
> =20
> -/*
> - * This generates a HW chip id depending on an index, as found on a
> - * two socket system with dual chip modules :
> - *
> - *    0x0, 0x1, 0x10, 0x11
> - *
> - * 4 chips should be the maximum
> - *
> - * TODO: use a machine property to define the chip ids
> - */
> -#define PNV_CHIP_HWID(i) ((((i) & 0x3e) << 3) | ((i) & 0x1))
> -
> -/*
> - * Converts back a HW chip id to an index. This is useful to calculate
> - * the MMIO addresses of some controllers which depend on the chip id.
> - */
> -#define PNV_CHIP_INDEX(chip)                                    \
> -    (((chip)->chip_id >> 2) * 2 + ((chip)->chip_id & 0x3))
> -
>  PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> =20
>  #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
> @@ -256,11 +237,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>  #define PNV_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
>  #define PNV_OCC_COMMON_AREA_BASE    0x7fff800000ull
>  #define PNV_OCC_SENSOR_BASE(chip)   (PNV_OCC_COMMON_AREA_BASE + \
> -    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
> +    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
> =20
>  #define PNV_HOMER_SIZE              0x0000000000400000ull
>  #define PNV_HOMER_BASE(chip)                                            =
\
> -    (0x7ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV_HOMER_SIZE=
)
> +    (0x7ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV_HOMER_SIZE)
> =20
> =20
>  /*
> @@ -279,16 +260,16 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>   */
>  #define PNV_ICP_SIZE         0x0000000000100000ull
>  #define PNV_ICP_BASE(chip)                                              =
\
> -    (0x0003ffff80000000ull + (uint64_t) PNV_CHIP_INDEX(chip) * PNV_ICP_S=
IZE)
> +    (0x0003ffff80000000ull + (uint64_t) (chip)->chip_id * PNV_ICP_SIZE)
> =20
> =20
>  #define PNV_PSIHB_SIZE       0x0000000000100000ull
>  #define PNV_PSIHB_BASE(chip) \
> -    (0x0003fffe80000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * PNV_PSIHB_=
SIZE)
> +    (0x0003fffe80000000ull + (uint64_t)(chip)->chip_id * PNV_PSIHB_SIZE)
> =20
>  #define PNV_PSIHB_FSP_SIZE   0x0000000100000000ull
>  #define PNV_PSIHB_FSP_BASE(chip) \
> -    (0x0003ffe000000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * \
> +    (0x0003ffe000000000ull + (uint64_t)(chip)->chip_id * \
>       PNV_PSIHB_FSP_SIZE)
> =20
>  /*
> @@ -324,11 +305,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>  #define PNV9_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
>  #define PNV9_OCC_COMMON_AREA_BASE    0x203fff800000ull
>  #define PNV9_OCC_SENSOR_BASE(chip)   (PNV9_OCC_COMMON_AREA_BASE +       =
\
> -    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
> +    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
> =20
>  #define PNV9_HOMER_SIZE              0x0000000000400000ull
>  #define PNV9_HOMER_BASE(chip)                                           =
\
> -    (0x203ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV9_HOMER_S=
IZE)
> +    (0x203ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV9_HOMER_SIZE)
> =20
>  /*
>   * POWER10 MMIO base addresses - 16TB stride per chip
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index b122251d1a5d..025f01c55744 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -809,9 +809,10 @@ static void pnv_init(MachineState *machine)
>       * TODO: should we decide on how many chips we can create based
>       * on #cores and Venice vs. Murano vs. Naples chip type etc...,
>       */
> -    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 4) {
> +    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 16) {
>          error_report("invalid number of chips: '%d'", pnv->num_chips);
> -        error_printf("Try '-smp sockets=3DN'. Valid values are : 1, 2 or=
 4.\n");
> +        error_printf(
> +            "Try '-smp sockets=3DN'. Valid values are : 1, 2, 4, 8 and 1=
6.\n");
>          exit(1);
>      }
> =20
> @@ -819,6 +820,7 @@ static void pnv_init(MachineState *machine)
>      for (i =3D 0; i < pnv->num_chips; i++) {
>          char chip_name[32];
>          Object *chip =3D OBJECT(qdev_new(chip_typename));
> +        int chip_id =3D i;
> =20
>          pnv->chips[i] =3D PNV_CHIP(chip);
> =20
> @@ -831,10 +833,9 @@ static void pnv_init(MachineState *machine)
>                                      &error_fatal);
>          }
> =20
> -        snprintf(chip_name, sizeof(chip_name), "chip[%d]", PNV_CHIP_HWID=
(i));
> +        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);

I'd rather pass directly the i variable. It is clear enough this is
the index of the chip in pnv->chips[]. No need for an intermediate
variable IMHO.

Anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

>          object_property_add_child(OBJECT(pnv), chip_name, chip);
> -        object_property_set_int(chip, "chip-id", PNV_CHIP_HWID(i),
> -                                &error_fatal);
> +        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
>          object_property_set_int(chip, "nr-cores", machine->smp.cores,
>                                  &error_fatal);
>          object_property_set_int(chip, "nr-threads", machine->smp.threads=
,


