Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6EE4A96
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 13:57:22 +0200 (CEST)
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNyDZ-0005JR-Pf
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 07:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1iNyAr-00028I-Un
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 07:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frederic.konrad@adacore.com>) id 1iNyAq-0005l8-TS
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 07:54:33 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:42346
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
 id 1iNyAq-0005ks-NS; Fri, 25 Oct 2019 07:54:32 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 2C02781399;
 Fri, 25 Oct 2019 13:54:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1n_JiqXbquRh; Fri, 25 Oct 2019 13:54:31 +0200 (CEST)
Received: from localhost.localdomain (unknown [109.190.253.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id 7BB2781392;
 Fri, 25 Oct 2019 13:54:30 +0200 (CEST)
Subject: Re: [PATCH 2/2] hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-devel@nongnu.org
References: <20191025110114.27091-1-philmd@redhat.com>
 <20191025110114.27091-3-philmd@redhat.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <952771de-3f81-5d54-7dae-8aba1780c8f2@adacore.com>
Date: Fri, 25 Oct 2019 13:54:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025110114.27091-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
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
Cc: qemu-trivial@nongnu.org, Jiri Gaisler <jiri@gaisler.se>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 10/25/19 =C3=A0 1:01 PM, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=A0=
:
> The Plug & Play region of the AHB/APB bridge can be accessed
> by various word size, however the implementation is clearly
> restricted to 32-bit:
>=20
>    static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsi=
gned size)
>    {
>        APBPnp *apb_pnp =3D GRLIB_APB_PNP(opaque);
>=20
>        return apb_pnp->regs[offset >> 2];
>    }
>=20
> Set the MemoryRegionOps::impl min/max fields to 32-bit, so
> memory.c::access_with_adjusted_size() can adjust when the
> access is not 32-bit.
>=20
> This is required to run RTEMS on leon3, the grlib scanning
> functions do byte accesses.
>=20
> Reported-by: Jiri Gaisler <jiri@gaisler.se>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   hw/misc/grlib_ahb_apb_pnp.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
> index f3c015d2c3..e230e25363 100644
> --- a/hw/misc/grlib_ahb_apb_pnp.c
> +++ b/hw/misc/grlib_ahb_apb_pnp.c
> @@ -242,6 +242,10 @@ static const MemoryRegionOps grlib_apb_pnp_ops =3D=
 {
>       .read       =3D grlib_apb_pnp_read,
>       .write      =3D grlib_apb_pnp_write,
>       .endianness =3D DEVICE_BIG_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
>   };
>  =20
>   static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp)
>=20

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

Thanks

