Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FD3F2DB8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:10:41 +0200 (CEST)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5EG-0005xR-OV
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH5Ce-00052j-Sd
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:09:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH5Cc-0002ya-En
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:09:00 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-WJOWdI12OBGWmifbhxbeXQ-1; Fri, 20 Aug 2021 10:08:53 -0400
X-MC-Unique: WJOWdI12OBGWmifbhxbeXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A49801AC0;
 Fri, 20 Aug 2021 14:08:51 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A37CC226E9;
 Fri, 20 Aug 2021 14:08:50 +0000 (UTC)
Date: Fri, 20 Aug 2021 16:08:49 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 05/26] ppc/pnv: Distribute RAM among the chips
Message-ID: <20210820160849.4ad703b1@bahia.lan>
In-Reply-To: <20210809134547.689560-6-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-6-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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

On Mon, 9 Aug 2021 15:45:26 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> But always give the first 1GB to chip 0 as skiboot requires it.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/pnv.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 025f01c55744..2f5358b70c95 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -710,6 +710,23 @@ static void pnv_chip_power10_pic_print_info(PnvChip =
*chip, Monitor *mon)
>      pnv_psi_pic_print_info(&chip10->psi, mon);
>  }
> =20
> +/* Always give the first 1GB to chip 0 else we won't boot */
> +static uint64_t pnv_chip_get_ram_size(PnvMachineState *pnv, int chip_id)
> +{
> +    MachineState *machine =3D MACHINE(pnv);
> +    uint64_t ram_per_chip;
> +
> +    assert(machine->ram_size >=3D 1 * GiB);
> +
> +    ram_per_chip =3D machine->ram_size / pnv->num_chips;
> +    if (ram_per_chip >=3D 1 * GiB) {
> +        return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
> +    }
> +

So this is only reached if pnv->num_chips is >=3D 2, since
a single chip would have ram_per_chip =3D=3D machine->ram_size
and thus take the return branch above.

Maybe worth making it clear with an assert() ?

> +    ram_per_chip =3D (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1=
);

Suggesting that because I was looking for a potential divide by zero ^^

> +    return chip_id =3D=3D 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 =
* MiB);
> +}
> +
>  static void pnv_init(MachineState *machine)
>  {
>      const char *bios_name =3D machine->firmware ?: FW_FILE_NAME;
> @@ -717,6 +734,7 @@ static void pnv_init(MachineState *machine)
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>      char *fw_filename;
>      long fw_size;
> +    uint64_t chip_ram_start =3D 0;
>      int i;
>      char *chip_typename;
>      DriveInfo *pnor =3D drive_get(IF_MTD, 0, 0);
> @@ -821,17 +839,16 @@ static void pnv_init(MachineState *machine)
>          char chip_name[32];
>          Object *chip =3D OBJECT(qdev_new(chip_typename));
>          int chip_id =3D i;
> +        uint64_t chip_ram_size =3D  pnv_chip_get_ram_size(pnv, chip_id);
> =20
>          pnv->chips[i] =3D PNV_CHIP(chip);
> =20
> -        /*
> -         * TODO: put all the memory in one node on chip 0 until we find =
a
> -         * way to specify different ranges for each chip
> -         */
> -        if (i =3D=3D 0) {
> -            object_property_set_int(chip, "ram-size", machine->ram_size,
> -                                    &error_fatal);
> -        }
> +        /* Distribute RAM among the chips  */
> +        object_property_set_int(chip, "ram-start", chip_ram_start,
> +                                &error_fatal);
> +        object_property_set_int(chip, "ram-size", chip_ram_size,
> +                                &error_fatal);

Not really related but failing to set either of these looks
like it should never happen so I'd rather pass &error_abort
for debugging purpose.

Anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

> +        chip_ram_start +=3D chip_ram_size;
> =20
>          snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
>          object_property_add_child(OBJECT(pnv), chip_name, chip);


