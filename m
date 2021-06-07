Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1E39D3A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:52:37 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6JY-0006Jw-5Y
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hr-0003bl-CX; Sun, 06 Jun 2021 23:50:51 -0400
Received: from ozlabs.org ([203.11.71.1]:58991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hk-0002bw-4o; Sun, 06 Jun 2021 23:50:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt21JF7z9sVt; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=gDAAwAXQ1NBX53bStlrsM17dD9tCq0jYWdU0IZPd8I0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8lLXbuLRdBg3qa3/iR1sgV+sm45fAC2XZ7DgMTl9PVTA7BDMRgccNUyTX7oZcLET
 Oa3ErbomVVPSZ4w7iGIAhgHkZiXerhhZ+i5MuCwSpE0anF7wd79g0KbWtl3O9ORbhJ
 Yt4okLAO6yACuIVuqt+xl6UEZVPDs30IwUYfA9lI=
Date: Mon, 7 Jun 2021 12:24:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/2] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
Message-ID: <YL2DUyScuuTWHaQ+@yekko>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ozjBXDsE+w4eyMHm"
Content-Disposition: inline
In-Reply-To: <20210604200353.1206897-3-danielhb413@gmail.com>
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ozjBXDsE+w4eyMHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 05:03:53PM -0300, Daniel Henrique Barboza wrote:
> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
> error path, signalling that the hotunplug process wasn't successful.
> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
> to signal this error to the management layer.
>=20
> We also have another error path in spapr_memory_unplug_rollback() for
> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
> in the hotunplug error path, but it will reconfigure them.  Let's send
> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
> case of older kernels.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c     |  2 +-
>  hw/ppc/spapr_drc.c | 15 +++++++++------
>  2 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c23bcc4490..29aa2f467d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3639,7 +3639,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState=
 *spapr, DeviceState *dev)
>       */
>      qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the gue=
st "
>                                   "for device %s", dev->id);
> -    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    qapi_event_send_device_unplug_error(dev->id, qapi_error);
>  }
> =20
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a2f2634601..0e1a8733bc 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -17,6 +17,8 @@
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-events-machine.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>  #include "hw/ppc/spapr.h" /* for RTAS return codes */
> @@ -160,6 +162,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>           * means that the kernel is refusing the removal.
>           */
>          if (drc->unplug_requested && drc->dev) {
> +            const char qapi_error_fmt[] =3D "Device hotunplug rejected b=
y the "
> +                                          "guest for device %s";
> +            g_autofree char *qapi_error =3D NULL;
> +
>              if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_LMB) {
>                  spapr =3D SPAPR_MACHINE(qdev_get_machine());
> =20
> @@ -167,13 +173,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>              }
> =20
>              drc->unplug_requested =3D false;
> -            error_report("Device hotunplug rejected by the guest "
> -                         "for device %s", drc->dev->id);
> +            error_report(qapi_error_fmt, drc->dev->id);
> =20
> -            /*
> -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> -             * it is implemented.
> -             */
> +            qapi_error =3D g_strdup_printf(qapi_error_fmt, drc->dev->id);
> +            qapi_event_send_device_unplug_error(drc->dev->id, qapi_error=
);
>          }
> =20
>          return RTAS_OUT_SUCCESS; /* Nothing to do */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ozjBXDsE+w4eyMHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9g1MACgkQbDjKyiDZ
s5Ig5Q/7BZxH7bbaahtMEdfC739VyBfvpyYA5My42M4lZrxxtgLhXhVRuj6dgMXy
RvqYXHnYbTIJDJQybxTivc9WASSX2C33xsCvl3pp8m3nodRFmVvyPiB0D2wJu4fE
eIlIEg1C5e7zlE4a6896FYUeKkJYSHLOjt//xvkTnJqQkdlYutsKuOQjUKX+Rx8+
xshjxVvcNgDwd8Dzii2kQuszv7NEUbySsu1vYb9p8O9kl49paeqSHyWevHrSiJSY
hjEVRXnFnGWvoUfy13kyECG3rXdZKl0nyj8RCDR+D1TNE1TqRqiMSJIEJA+SIB0Y
0IdEhuPrLzZjmkZM7T7bc84tR7V6LTMfGeMCFp09R8hXWXc09tvobrAV5e2Jd8Xt
mhk4SngPJt4So3n07LIuiGroNCDH1fy6JFO2jU/j58aS7wCqcVGdKOQpEFnmMCI+
iQ+NcXYfKY9MQ3Sf957xRia1WjHfbzZeoHG4B8uEQK//5Q0C51G3ij/+OavJ+uXP
ywR+Q/q4wDNhhWkq+EhDT9C76wda4XMyBCbhgnDZAbyfii0wHAtxLcAzFw/qHCo5
52a6NJrN9hRB40YRyZ7Dk9MyoG5qY2Hi9Op7d0248K3WyPsHytOq+UdNzwtI4GMh
35YvbeBu57vtVVnDSD4b6IeaUnzCA3vVW0dsxcsLrP/TSuqUrFg=
=SU7w
-----END PGP SIGNATURE-----

--ozjBXDsE+w4eyMHm--

