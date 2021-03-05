Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBF32E00A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 04:24:42 +0100 (CET)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI14z-0002lV-FE
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 22:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lI13C-0001dT-DM; Thu, 04 Mar 2021 22:22:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39483 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lI137-0004N0-Pn; Thu, 04 Mar 2021 22:22:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DsCjD3Hlmz9sRR; Fri,  5 Mar 2021 14:22:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614914560;
 bh=MY8ukbqbZWhVk2dr1fXYo28ny5i3M92yQX6YrSht8Uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hSRp7UxtWgj8o1UKgUrCCh/vjU2pxVX0SitNgfDEC2168TOdaNQz0WXHdZA2LQKes
 y3/xo/xalmOKh9ga3MWWAzrucS6xNwhLVojbB1lJErjQXgz7GO5oKoUCO0txwN0pT2
 sTHLYLVkTpst5t7nqYYu5wBsVTwfKj45kUu8wlIA=
Date: Fri, 5 Mar 2021 14:07:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/2] spapr.c: send QAPI event when memory hotunplug
 fails
Message-ID: <YEGgfy4rFtJMCH+A@yekko.fritz.box>
References: <20210302141019.153729-1-danielhb413@gmail.com>
 <20210302141019.153729-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2PepfpBIKgOvCeG"
Content-Disposition: inline
In-Reply-To: <20210302141019.153729-3-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J2PepfpBIKgOvCeG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 11:10:19AM -0300, Daniel Henrique Barboza wrote:
> Recent changes allowed the pSeries machine to rollback the hotunplug
> process for the DIMM when the guest kernel signals, via a
> reconfiguration of the DR connector, that it's not going to release the
> LMBs.
>=20
> Let's also warn QAPI listerners about it. One place to do it would be
> right after the unplug state is cleaned up,
> spapr_clear_pending_dimm_unplug_state(). This would mean that the
> function is now doing more than cleaning up the pending dimm state
> though.
>=20
> This patch does the following changes in spapr.c:
>=20
> - send a QAPI event to inform that we experienced a failure in the
>   hotunplug of the DIMM;
>=20
> - rename spapr_clear_pending_dimm_unplug_state() to
>   spapr_memory_unplug_rollback(). This is a better fit for what the
>   function is now doing, and it makes callers care more about what the
>   function goal is and less about spapr.c internals such as clearing
>   the pending dimm unplug state.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c         | 13 +++++++++++--
>  hw/ppc/spapr_drc.c     |  5 ++---
>  include/hw/ppc/spapr.h |  3 +--
>  3 files changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b579830832..d56418ca29 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -28,6 +28,7 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-events-machine.h"
>  #include "qapi/visitor.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/hostmem.h"
> @@ -3575,14 +3576,14 @@ static SpaprDimmState *spapr_recover_pending_dimm=
_state(SpaprMachineState *ms,
>      return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
>  }
> =20
> -void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> -                                           DeviceState *dev)
> +void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState =
*dev)
>  {
>      SpaprDimmState *ds;
>      PCDIMMDevice *dimm;
>      SpaprDrc *drc;
>      uint32_t nr_lmbs;
>      uint64_t size, addr_start, addr;
> +    g_autofree char *qapi_error =3D NULL;
>      int i;
> =20
>      if (!dev) {
> @@ -3616,6 +3617,14 @@ void spapr_clear_pending_dimm_unplug_state(SpaprMa=
chineState *spapr,
>          drc->unplug_requested =3D false;
>          addr +=3D SPAPR_MEMORY_BLOCK_SIZE;
>      }
> +
> +    /*
> +     * Tell QAPI that something happened and the memory
> +     * hotunplug wasn't successful.
> +     */
> +    qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the gue=
st "
> +                                 "for device %s", dev->id);
> +    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>  }
> =20
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 98b626acf9..8a71b03800 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -1231,12 +1231,11 @@ static void rtas_ibm_configure_connector(PowerPCC=
PU *cpu,
> =20
>      /*
>       * This indicates that the kernel is reconfiguring a LMB due to
> -     * a failed hotunplug. Clear the pending unplug state for the whole
> -     * DIMM.
> +     * a failed hotunplug. Rollback the DIMM unplug process.
>       */
>      if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_LMB &&
>          drc->unplug_requested) {
> -        spapr_clear_pending_dimm_unplug_state(spapr, drc->dev);
> +        spapr_memory_unplug_rollback(spapr, drc->dev);
>      }
> =20
>      if (!drc->fdt) {
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index d6edeaaaff..47cebaf3ac 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -847,8 +847,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
>  int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **er=
rp);
>  void spapr_clear_pending_events(SpaprMachineState *spapr);
>  void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
> -void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> -                                           DeviceState *dev);
> +void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState =
*dev);
>  int spapr_max_server_number(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J2PepfpBIKgOvCeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBBoH8ACgkQbDjKyiDZ
s5LuyQ//UrP2gKAv8TkxTJ8CjJcq7HyUTsFh3eoQjzb9lRYvNnx+XdumV0KiP7F/
27lrHy8nUcA9Iy6B+rZseT/WZ7Ja5iTjbJNFMzxiPioHcvA27QanHCh9KkvcNvHK
e77bEFMepevgCpU6jhwl7xVWMmzacSENAr70hQNR9FbFB/4GnmSZ5UH6/kodHdcB
wLBXsYagKvJSOjpPSXPqWybjfcFzKzMpELVLHThiH4ep6W7lUBj7+imEdz/CIiKC
qxYqk7uexg9lCpE7b5+rAkosA15amIqw+9elCwsBy768WXx7Yq/JRzim8neDpy84
dkdy+jHMxZ2JTZmHgn85eRdSspTqUDs/BW/uOW0tv2/U5MYI3xPWlA0WkEq6kR7+
CXt5mCWSjeEanHkek7PYWgAd7lxC84mV8F/ajDgyuUYB9PRZyL8xSZsKlvXbZ8ZU
d8tdeUxFqfoI6nQz+NWzQfuV6D7eMZg9qLxX5TS57MFRM7xKxwZHcs6OqAEfpm9g
y/1eb9YCnhNxxfQ6kbG+o4SZKDUtBc+CDnTvPSVVIEzFAS6O2/gis6lremToftIP
Lur9c9D3yicYQIlmEqCAAGzV6dix6iPStkW/nYWoiKEzaFgj19y7/wRKKACIsy6F
6XaFcUi8AWF8j3rhM4Hpa2lT33dzvjpE0vzNZUgd3fsrsRYk5kY=
=/yB9
-----END PGP SIGNATURE-----

--J2PepfpBIKgOvCeG--

