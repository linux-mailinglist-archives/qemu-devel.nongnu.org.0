Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3C3F6E72
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:27:28 +0200 (CEST)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkVb-0004hn-UL
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGg-0000kS-Mq; Wed, 25 Aug 2021 00:12:08 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0007UM-3A; Wed, 25 Aug 2021 00:12:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbv26sWz9t2g; Wed, 25 Aug 2021 14:11:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864699;
 bh=HpYYOF+ngB5IOoH+xV8KWhYgPgpSMapgJ0xdSL0X7uk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xz9R0UrENk1GYzZjzjnjSnU7Srqv4R899nbxvHhekx0596WUMjfjHdU51IF/KZjfh
 WFRSt58hOROi8QXsF6tcBLCp3TzDGJ216Af4pwKlG3B/Kvfw8xluLy6fMSwZ9fbsw4
 cCosusm2BZeQ3UcYfk2FXwD1xxB21RWzPOZ+2E3I=
Date: Wed, 25 Aug 2021 13:54:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 6/7] spapr: use DEVICE_UNPLUG_GUEST_ERROR to report
 unplug errors
Message-ID: <YSW+/SQz7Iox+zYa@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C1axIQWPJQ+QtgJG"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-7-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--C1axIQWPJQ+QtgJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:34PM -0300, Daniel Henrique Barboza wrote:
> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
> error path, signalling that the hotunplug process wasn't successful.
> This allow us to send a DEVICE_UNPLUG_GUEST_ERROR in drc_unisolate_logica=
l()
> to signal this error to the management layer.
>=20
> We also have another error path in spapr_memory_unplug_rollback() for
> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
> in the hotunplug error path, but it will reconfigure them. Let's send
> the DEVICE_UNPLUG_GUEST_ERROR event in that code path as well to cover the
> case of older kernels.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c     | 10 +++++++++-
>  hw/ppc/spapr_drc.c |  9 +++++----
>  2 files changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4f1ee90e9e..206c536d3a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -29,6 +29,7 @@
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-machine.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "qapi/visitor.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/hostmem.h"
> @@ -3686,11 +3687,18 @@ void spapr_memory_unplug_rollback(SpaprMachineSta=
te *spapr, DeviceState *dev)
> =20
>      /*
>       * Tell QAPI that something happened and the memory
> -     * hotunplug wasn't successful.
> +     * hotunplug wasn't successful. Keep sending
> +     * MEM_UNPLUG_ERROR even while sending
> +     * DEVICE_UNPLUG_GUEST_ERROR until the deprecation of
> +     * MEM_UNPLUG_ERROR is due.
>       */
>      qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the gue=
st "
>                                   "for device %s", dev->id);
> +
>      qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
> +
> +    qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
> +                                              dev->canonical_path);
>  }
> =20
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a4d9496f76..f8ac0a10df 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -17,6 +17,8 @@
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>  #include "hw/ppc/spapr.h" /* for RTAS return codes */
> @@ -173,10 +175,9 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>                               "for device %s", drc->dev->id);
>              }
> =20
> -            /*
> -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> -             * it is implemented.
> -             */
> +            qapi_event_send_device_unplug_guest_error(!!drc->dev->id,
> +                                                      drc->dev->id,
> +                                                      drc->dev->canonica=
l_path);
>          }
> =20
>          return RTAS_OUT_SUCCESS; /* Nothing to do */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--C1axIQWPJQ+QtgJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvv0ACgkQbDjKyiDZ
s5Kwiw//aAlZJFwxx/3Db32KD/8VcMzLJF9j7x/FMbCmHQkncrlTrsZBKHKBdHMN
8gBmT9jA5wxMMOfRUwNDqRUUAxTDFtCU+wcvpQlTMJYO6fJwDUFVqQy6V+JyCuxn
YHUmGm9Ga9m9V9uRmet2eHblA3JNbpDN+I6q9Zo71OwZKbl6kiiGL8esL5jVqc6a
bn9QMbivQriC6ozaqsKP+9qoFn+ICBmFULs5U0T7xlV+qiDRIpc7uygiV0Xwp/QJ
HYjLxr9WdAWHBYk/2Kgk8N2ITw4R68uNFQDWlDfFrBQwh/xGGZbGFryRJuI7edSP
InrBBhTMqASCQU5OF5GYjOHp6aNEexbQZ7hoolg1XqSwXhV0S68Hhcac65Vkq+lD
C642EnHoVebZ4NbQGphK073auQKaMVtfAbvlTYLD7iRKsjJiBXJBWU0euuHuxZJw
jJyk0sjtvmbqi3UeXEtjbl8ikzZQFeLaQhiQsCuWuw+xdRY4cukOx6T/fJiIoNXM
MVpVdHLkD1nuxFoVwLxaxwTSjeUnXydJZzqMhoURWK02Se5GSOoqF+aJAmaxPY38
PRa0ZXQJnLrEsyqOwP6ohI+ztRSPYdqv7TzqFu6Ulyr5Rh9/z0v4IyKTgOkSEY5p
sFTKY8ajNu2fpPNTIJVCkymTgDkOYmL5+ErPsV+YMEcdeOAUrO4=
=Gcrk
-----END PGP SIGNATURE-----

--C1axIQWPJQ+QtgJG--

