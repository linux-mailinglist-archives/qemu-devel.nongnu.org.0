Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A843295A0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:15:11 +0100 (CET)
Received: from localhost ([::1]:56574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuZ1-0007aF-MF
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVq-00068b-Gi; Mon, 01 Mar 2021 21:11:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35069 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVn-0005ZT-4C; Mon, 01 Mar 2021 21:11:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLGb4QVfz9sWF; Tue,  2 Mar 2021 13:11:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614651095;
 bh=xj0DD3BcxhBPf/Nvyjs6Zt9DoP7sZsFBn5yt5li6D1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5FH6QS4yNvtmgIXWpAlkF1+Ihxc7S8dW34z1H4hENZu1gI9Wx34vpbf1j+DvCmxO
 AUFt4n+VnFM6xLBBI/K6rjBMTWAEMiTzOdZ9tXrAd0kHMYz+ckhF5CXo2J8ZIUhapD
 kgyh7RsdmWrXFNstb5TQ7WeWasPZvphlk60eYVPk=
Date: Tue, 2 Mar 2021 13:11:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 5/5] spapr.c: send QAPI event when memory hotunplug fails
Message-ID: <YD2ezRqF16g0GvSb@yekko.fritz.box>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KfCWrOGEGDR5CnmW"
Content-Disposition: inline
In-Reply-To: <20210226163301.419727-6-danielhb413@gmail.com>
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


--KfCWrOGEGDR5CnmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:33:01PM -0300, Daniel Henrique Barboza wrote:
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
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c         | 13 +++++++++++--
>  hw/ppc/spapr_drc.c     |  5 ++---
>  include/hw/ppc/spapr.h |  3 +--
>  3 files changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6ef72ee7bd..cbe5cafb14 100644
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
> +    qapi_error =3D g_strdup_printf("Memory hotunplug failed for device %=
s",
> +                                 dev->id);

Might be worth adjusting the error message to make it clearer that it
was the guest which specifically rejected the unplug.  Other than
that, LGTM.

> +    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>  }
> =20
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8c4997d795..8faaf9f1dd 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -1232,12 +1232,11 @@ static void rtas_ibm_configure_connector(PowerPCC=
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

--KfCWrOGEGDR5CnmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9ns0ACgkQbDjKyiDZ
s5LmCA/9FF1rI1sYe8GjuIcKq75hrv7hGzyqltQryh2kfafuOb/RIUJ2Rsacd0vD
vxp2ESw0Mkc35ltYWk/8rX6lvvRBs6wHOFCcD0xFjFIxo0b1V/cz0tmCE95m4F8n
nJPqw9Gx9M+twnIPdA2+DcoMJqzVDGMy1OR5XADCUhWuW+tBrsm269DVu4J7yPRw
BBwIQyVaNcRLgfTuNKoK7ND0q0M+8jkMIPTMGRdJqybcPgonowU4XYd5GU6cLukd
OQ56PbQkHLeQuJgWWZUixXjV33v+OTAnWKuEBCyCv4+RZ/DbjPt6Fo1eKYXBcxDB
6D2StN3tcm4wPprA5ZGfxDzV6h4e7wP0PYson2uR4VX6S1WadSp93AdNIjVeMpaU
R5VoOsfV6tat2sf+AX/uHcRVaKKQUyloJnBcZ5A31NOn/f2h/MGZ5Afy5i5/pzcM
euDVRZ1ImKMzFNFeDuxQcGPzHC/7E/Koq13zxeGIn473+rd5KU22KhEP/nhbJZGe
sj0gERDxUe4C0LlYjtKiX04npFtkgn/jqQpWiD/FYncS+QbWYCBdiThggORgmXeu
BIXqhYPCnskkIKDTJ/2P0QBJCGOYsTH0TWeMCTnlmgIPynbdiVq06Jd4A+H9n4X9
hVzdHa0iXstpbmkES5tBho6U3JT+5FootWiM6VEnRdayBV5s9b8=
=EwHW
-----END PGP SIGNATURE-----

--KfCWrOGEGDR5CnmW--

