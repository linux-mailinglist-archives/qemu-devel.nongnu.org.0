Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01C2D51BF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:45:45 +0100 (CET)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCtk-00035Z-B2
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCmA-0006nn-6S; Wed, 09 Dec 2020 22:37:54 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57585 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCm5-0003V1-4j; Wed, 09 Dec 2020 22:37:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs03n72J3z9sWf; Thu, 10 Dec 2020 14:37:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607571461;
 bh=Znl6jTQdyISqOh6lIABzkHqfyAPFnomd6K2Hy4Zp2lc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMbUwuZ02yBtxbfHMjTQe2k6zM39Tr3c6tc5FUoxP/lh0M7dc0wGH55QPUAeMt714
 TmbDhOjWYfFKJCAAE/fRPpKiaIkah89JPMub79VHf3WSaWKoH/EQLHapDX9xEu4H8m
 CNnPi6R76OYhR0fTPOT+rg8diWGAJ3vcYwhw1z54=
Date: Thu, 10 Dec 2020 14:31:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] spapr: Pass sPAPR machine state to some RTAS events
 handling functions
Message-ID: <20201210033106.GJ2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-6-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sdJFN6SSISdF2ksn"
Content-Disposition: inline
In-Reply-To: <20201209170052.1431440-6-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sdJFN6SSISdF2ksn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 06:00:51PM +0100, Greg Kurz wrote:
> Some functions in hw/ppc/spapr_events.c get a pointer to the machine
> state using qdev_get_machine(). Convert them to get it from their
> caller when possible.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr_events.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 1add53547ec3..3f37b49fd8ad 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -480,9 +480,8 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(Spa=
prMachineState *spapr,
>      return entry;
>  }
> =20
> -static bool rtas_event_log_contains(uint32_t event_mask)
> +static bool rtas_event_log_contains(SpaprMachineState *spapr, uint32_t e=
vent_mask)
>  {
> -    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>      SpaprEventLogEntry *entry =3D NULL;
> =20
>      QTAILQ_FOREACH(entry, &spapr->pending_events, next) {
> @@ -509,10 +508,10 @@ static void spapr_init_v6hdr(struct rtas_event_log_=
v6 *v6hdr)
>      v6hdr->company =3D cpu_to_be32(RTAS_LOG_V6_COMPANY_IBM);
>  }
> =20
> -static void spapr_init_maina(struct rtas_event_log_v6_maina *maina,
> +static void spapr_init_maina(SpaprMachineState *spapr,
> +                             struct rtas_event_log_v6_maina *maina,
>                               int section_count)
>  {
> -    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>      struct tm tm;
>      int year;
> =20
> @@ -560,7 +559,7 @@ static void spapr_powerdown_req(Notifier *n, void *op=
aque)
>      entry->extended_length =3D sizeof(*new_epow);
> =20
>      spapr_init_v6hdr(v6hdr);
> -    spapr_init_maina(maina, 3 /* Main-A, Main-B and EPOW */);
> +    spapr_init_maina(spapr, maina, 3 /* Main-A, Main-B and EPOW */);
> =20
>      mainb->hdr.section_id =3D cpu_to_be16(RTAS_LOG_V6_SECTION_ID_MAINB);
>      mainb->hdr.section_length =3D cpu_to_be16(sizeof(*mainb));
> @@ -613,7 +612,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, ui=
nt8_t hp_action,
>      entry->extended_length =3D sizeof(*new_hp);
> =20
>      spapr_init_v6hdr(v6hdr);
> -    spapr_init_maina(maina, 3 /* Main-A, Main-B, HP */);
> +    spapr_init_maina(spapr, maina, 3 /* Main-A, Main-B, HP */);
> =20
>      mainb->hdr.section_id =3D cpu_to_be16(RTAS_LOG_V6_SECTION_ID_MAINB);
>      mainb->hdr.section_length =3D cpu_to_be16(sizeof(*mainb));
> @@ -808,9 +807,9 @@ static uint32_t spapr_mce_get_elog_type(PowerPCCPU *c=
pu, bool recovered,
>      return summary;
>  }
> =20
> -static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
> +static void spapr_mce_dispatch_elog(SpaprMachineState *spapr, PowerPCCPU=
 *cpu,
> +                                    bool recovered)
>  {
> -    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      uint64_t rtas_addr;
> @@ -927,7 +926,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recove=
red)
>          warn_report("Received a fwnmi while migration was in progress");
>      }
> =20
> -    spapr_mce_dispatch_elog(cpu, recovered);
> +    spapr_mce_dispatch_elog(spapr, cpu, recovered);
>  }
> =20
>  static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
> @@ -980,7 +979,7 @@ static void check_exception(PowerPCCPU *cpu, SpaprMac=
hineState *spapr,
>       * interrupts.
>       */
>      for (i =3D 0; i < EVENT_CLASS_MAX; i++) {
> -        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
> +        if (rtas_event_log_contains(spapr, EVENT_CLASS_MASK(i))) {
>              const SpaprEventSource *source =3D
>                  spapr_event_sources_get_source(spapr->event_sources, i);
> =20
> @@ -1007,7 +1006,7 @@ static void event_scan(PowerPCCPU *cpu, SpaprMachin=
eState *spapr,
>      }
> =20
>      for (i =3D 0; i < EVENT_CLASS_MAX; i++) {
> -        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
> +        if (rtas_event_log_contains(spapr, EVENT_CLASS_MASK(i))) {
>              const SpaprEventSource *source =3D
>                  spapr_event_sources_get_source(spapr->event_sources, i);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sdJFN6SSISdF2ksn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/RlnoACgkQbDjKyiDZ
s5KGPA//U2hjY2a+7i094s7vxRo6zR5yVNw2qrB6b0gFnimu93AiVbKYZ9Le/yyh
aCdHo28Z80GM4iq6+EI/57AwNLap5pIuTSFh7Nv+qfjZbxxNrH9dmyExXfblC/au
lKMYoGbeDIjjI7GHfNK6NgHBlM2Klxu9LYBd3/edHua5+C0zTCuQdpgYriXF92rk
JhfY/tBySqJ6ehiKlTUuopFIWWaJxRIgNMnWCD/zBTS+vqSLQzELtQHMq3CjsJfj
bLCgyjZUldwpOd42Ljavj+GSHWBQLLV4xYPyZKLfTWZwr52mdq5PqUtDeR4VsMqf
1GTxjbZVKGFG91NwUQkIj6PWjsnNQ6ESlTXeiUtlXdURegt+J3DHzFiil1yqZdjm
gXUy2aO1Y3OMxWoznR9e3VDA6rdWaCpXYR5a2n7fQCcpqFtl3p6gvumevTQlLcHb
w/WHXGPiTWwYIsdUNGQsXMjTr8tbvNuOW5OkJD+cYZYkN5hnGImU7Pn4Pdr7il3Q
6LjfvQSeGt4k2ra8VCXrnL8Y5H9hhpt+5FLMxv/fsvlpWZgWiru7oJPETsE3YA0/
Che63FOjyx5nZq69odT3RD5gMXF6CEdp43PVrXztt9MnYtW6hfqqB4dQx5Du0JR7
ADz0Kv8bVy8oK8AhV4VRRS+QLRaPe6rAUQSWYat0dPrnA2qG9QA=
=Ik6H
-----END PGP SIGNATURE-----

--sdJFN6SSISdF2ksn--

