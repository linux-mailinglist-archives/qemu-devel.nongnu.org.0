Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F98E31D3CC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 02:35:27 +0100 (CET)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCBkU-0005My-OA
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 20:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZS-0003zS-SA; Tue, 16 Feb 2021 20:24:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36501 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZO-00062f-Uy; Tue, 16 Feb 2021 20:24:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgKqM1P1Sz9sVt; Wed, 17 Feb 2021 12:23:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613525023;
 bh=nRqr8Qz2yjKqSo6vFTLMRqyJFgPv1McS4UOraBRKIdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YrOWSO2wAdogAfD3AUKsj4SYMNQV7716b9FG/f9wlUSleX8pouN5JBl+wiLOwYU2U
 CTRuT8VYk9Arl/puxA0hd3JHuHcfF2Y8lHDqmVPuzKPE0opR6jAt7nGyhwtqsK+3DX
 /edZ1lxFCP/PQqOLB9EaVGTvw28cA5Q64Wl7CH7c=
Date: Wed, 17 Feb 2021 12:23:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 6/7] spapr_drc.c: add hotunplug timeout for CPUs
Message-ID: <YCxwEkS7EGsLhdqI@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5UDpDBpch/5BwQdg"
Content-Disposition: inline
In-Reply-To: <20210211225246.17315-7-danielhb413@gmail.com>
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5UDpDBpch/5BwQdg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 07:52:45PM -0300, Daniel Henrique Barboza wrote:
> There is a reliable way to make a CPU hotunplug fail in the pseries
> machine. Hotplug a CPU A, then offline all other CPUs inside the guest
> but A. When trying to hotunplug A the guest kernel will refuse to do
> it, because A is now the last online CPU of the guest. PAPR has no
> 'error callback' in this situation to report back to the platform,
> so the guest kernel will deny the unplug in silent and QEMU will never
> know what happened. The unplug pending state of A will remain until
> the guest is shutdown or rebooted.
>=20
> Previous attempts of fixing it (see [1] and [2]) were aimed at trying to
> mitigate the effects of the problem. In [1] we were trying to guess which
> guest CPUs were online to forbid hotunplug of the last online CPU in the =
QEMU
> layer, avoiding the scenario described above because QEMU is now failing
> in behalf of the guest. This is not robust because the last online CPU of
> the guest can change while we're in the middle of the unplug process, and
> our initial assumptions are now invalid. In [2] we were accepting that our
> unplug process is uncertain and the user should be allowed to spam the IRQ
> hotunplug queue of the guest in case the CPU hotunplug fails.
>=20
> This patch presents another alternative, using the timeout infrastructure
> introduced in the previous patch. CPU hotunplugs in the pSeries machine w=
ill
> now timeout after 15 seconds. This is a long time for a single CPU unplug
> to occur, regardless of guest load - although the user is *strongly* enco=
uraged
> to *not* hotunplug devices from a guest under high load - and we can be s=
ure
> that something went wrong if it takes longer than that for the guest to r=
elease
> the CPU (the same can't be said about memory hotunplug - more on that in =
the
> next patch).
>=20
> Timing out the unplug operation will reset the unplug state of the CPU and
> allow the user to try it again, regardless of the error situation that
> prevented the hotunplug to occur. Of all the not so pretty fixes/mitigati=
ons
> for CPU hotunplug errors in pSeries, timing out the operation is an admis=
sion
> that we have no control in the process, and must assume the worst case if
> the operation doesn't succeed in a sensible time frame.
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03353.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04400.html
>=20
> Reported-by: Xujun Ma <xuma@redhat.com>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1911414
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c             |  4 ++++
>  hw/ppc/spapr_drc.c         | 17 +++++++++++++++++
>  include/hw/ppc/spapr_drc.h |  3 +++
>  3 files changed, 24 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b066df68cb..ecce8abf14 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3724,6 +3724,10 @@ void spapr_core_unplug_request(HotplugHandler *hot=
plug_dev, DeviceState *dev,
>      if (!spapr_drc_unplug_requested(drc)) {
>          spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
> +    } else {
> +        error_setg(errp, "core-id %d unplug is still pending, %d seconds=
 "
> +                   "timeout remaining",
> +                   cc->core_id, spapr_drc_unplug_timeout_remaining_sec(d=
rc));

Reporting this information is a nice touch.

>      }
>  }
> =20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index c88bb524c5..c143bfb6d3 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -398,6 +398,12 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
> =20
>      drc->unplug_requested =3D true;
> =20
> +    if (drck->unplug_timeout_seconds !=3D 0) {
> +        timer_mod(drc->unplug_timeout_timer,
> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
> +                  drck->unplug_timeout_seconds * 1000);
> +    }
> +
>      if (drc->state !=3D drck->empty_state) {
>          trace_spapr_drc_awaiting_quiesce(spapr_drc_index(drc));
>          return;
> @@ -406,6 +412,16 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
>      spapr_drc_release(drc);
>  }
> =20
> +int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
> +{
> +    if (drc->unplug_requested && timer_pending(drc->unplug_timeout_timer=
)) {
> +        return (qemu_timeout_ns_to_ms(drc->unplug_timeout_timer->expire_=
time) -
> +                qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL)) / 1000;

Hmm.  Reaching into the timer's internal fields isn't ideal.  I wonder
if we should add a helper in the timer code for reporting this information.

> +    }
> +
> +    return 0;
> +}
> +
>  bool spapr_drc_reset(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> @@ -706,6 +722,7 @@ static void spapr_drc_cpu_class_init(ObjectClass *k, =
void *data)
>      drck->drc_name_prefix =3D "CPU ";
>      drck->release =3D spapr_core_release;
>      drck->dt_populate =3D spapr_core_dt_populate;
> +    drck->unplug_timeout_seconds =3D 15;
>  }
> =20
>  static void spapr_drc_pci_class_init(ObjectClass *k, void *data)
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index b2e6222d09..26599c385a 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -211,6 +211,8 @@ typedef struct SpaprDrcClass {
> =20
>      int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
>                         void *fdt, int *fdt_start_offset, Error **errp);
> +
> +    int unplug_timeout_seconds;
>  } SpaprDrcClass;
> =20
>  typedef struct SpaprDrcPhysical {
> @@ -246,6 +248,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask);
>   */
>  void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
>  void spapr_drc_unplug_request(SpaprDrc *drc);
> +int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc);
> =20
>  /*
>   * Reset all DRCs, causing pending hot-plug/unplug requests to complete.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5UDpDBpch/5BwQdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAscBIACgkQbDjKyiDZ
s5LzdA//bRpWlULVWPiXCGgO4WqXeasB3exGaGlCAyobFLt4rgOBlOSGD/TPHxTq
GSjDI8Y4ZctUXRXSoui4DL7bFTMm2Ki3hj9V5oy6A26H8XxSPEybXTsCBX6cSGfb
cvdp+0wtH1p752bEoFuRMlhjR6oH3WMh5erqFoMGA8Pvg6eW8ci6vzko32Vh6QiW
V/pv9XSEbTXUzzlJHKMYiSE0lqFpf/hxzTqsohOadZ8H7KOn0d0QMx1eUKB31EvH
AWMDHgkxko06g/ujnKsFQXV1ILJlPzHoTNHtzg/EqWzY15rBC5hck1aHVJrRX2Vg
A4EkQQDuqGOY0a0VA0KnShPrBL+A2AjSHOTC+9rcJHOuOrjFvCCksG728xKC76P7
1KoFA7ul+w/5f0athWXKFRhKRnVKD7KquycZgi08LC5ise5zP6Mwxg8RcnL0ugaM
Sl77cajBRsSZ/6BVvdWOXNVuzxyAzJ5fxJB8H312gEIR5wtX9xWSPJCbNpwsaVfp
i8lqz44h7b+BGg6eyKZG8k6DtvJWdLs5FQgG6UdogVWtvDygjYhsTjFTuHKdKo9l
MsLDtgS7OqwoynYqtjhDaWQPDUDYfROIHcX5gInjdCw2SCN7dBInBs7P1KHobT55
ukPeQyEInOdqySqTTazs7ROfxx5mEmkBBrEPCPa6ThDVNZyBEA8=
=p85b
-----END PGP SIGNATURE-----

--5UDpDBpch/5BwQdg--

