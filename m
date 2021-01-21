Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A6D2FDE0F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 01:42:29 +0100 (CET)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2O3Q-0006Fl-Dt
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 19:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l2O1l-0005ct-B9; Wed, 20 Jan 2021 19:40:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47387 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l2O1i-0007BC-5Z; Wed, 20 Jan 2021 19:40:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DLk7r4vDmz9sW4; Thu, 21 Jan 2021 11:40:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611189624;
 bh=cCHV8ljxRrtiMCKoWvYtUXB0LhRqV0L4TIMun7ofGrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fsfO3Zhyiqr+1rYEIEpwRqtE9+dRr0YI0hneDgb4MqDfxtlhB+27bkDDWDUtvXhot
 GpN913J0827pPMwSs7ECmMMNAwIzFNyiFs6tv1q8EXU423YEferHwpvQxHf4yEDKkM
 sa3C4qgy3dXndbu3xguPRcR+teRFUupQU18WtrN8=
Date: Thu, 21 Jan 2021 11:27:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 1/2] spapr.c: use g_auto* with 'nodename' in CPU DT
 functions
Message-ID: <20210121002756.GB5174@yekko.fritz.box>
References: <20210120232305.241521-1-danielhb413@gmail.com>
 <20210120232305.241521-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <20210120232305.241521-2-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 08:23:04PM -0300, Daniel Henrique Barboza wrote:
> Next patch will use the 'nodename' string in spapr_core_dt_populate()
> after the point it's being freed today.
>=20
> Instead of moving 'g_free(nodename)' around, let's do a QoL change in
> both CPU DT functions where 'nodename' is being freed, and use
> g_autofree to avoid the 'g_free()' call altogether.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied, thanks.

> ---
>  hw/ppc/spapr.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6c47466fc2..cc1b709615 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -790,7 +790,6 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineStat=
e *spapr)
>      CPUState *cs;
>      int n_cpus;
>      int cpus_offset;
> -    char *nodename;
>      int i;
> =20
>      cpus_offset =3D fdt_add_subnode(fdt, 0, "cpus");
> @@ -818,6 +817,7 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineStat=
e *spapr)
>          PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>          int index =3D spapr_get_vcpu_id(cpu);
>          DeviceClass *dc =3D DEVICE_GET_CLASS(cs);
> +        g_autofree char *nodename =3D NULL;
>          int offset;
> =20
>          if (!spapr_is_thread0_in_vcore(spapr, cpu)) {
> @@ -826,7 +826,6 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineStat=
e *spapr)
> =20
>          nodename =3D g_strdup_printf("%s@%x", dc->fw_name, index);
>          offset =3D fdt_add_subnode(fdt, cpus_offset, nodename);
> -        g_free(nodename);
>          _FDT(offset);
>          spapr_dt_cpu(cs, fdt, offset, spapr);
>      }
> @@ -3743,12 +3742,11 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMa=
chineState *spapr,
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      DeviceClass *dc =3D DEVICE_GET_CLASS(cs);
>      int id =3D spapr_get_vcpu_id(cpu);
> -    char *nodename;
> +    g_autofree char *nodename =3D NULL;
>      int offset;
> =20
>      nodename =3D g_strdup_printf("%s@%x", dc->fw_name, id);
>      offset =3D fdt_add_subnode(fdt, 0, nodename);
> -    g_free(nodename);
> =20
>      spapr_dt_cpu(cs, fdt, offset, spapr);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAIyooACgkQbDjKyiDZ
s5IihxAA1DeijRLRQj8u7cWNVtqHTgy5RldWxPCXceavO8x1Nu0UvGifeW/dpOn2
EBiCt3kZxZ0DFRPO+58qy/k7JVJVPBsbLltskmv/nirCTY2a1QbtDEwB5KJiX3B0
7iiCYhr3zP/3WdbzFqmz0T8O7h6VFMXM0z4rs2c6qQYByCVtnyK9pQXnuhRLWLf+
4dQ5l3NLiV1xmZTZO6qyCUifzmmoZWPXVo6tYxAPHEEIBDhEtGKko/RLWDjYknCb
uNoL3OowPX2UUJOaRZ4+TA35ntj9ZVcWe8EyHpGm1YBX0DxyqByvKCts5iQtzuaO
pPAOcu4ZwvnYoUrGo5ly9Lh95yyewBqaoqJUXtf2Hn0iNlWBlzqxoMw5RDY3j8YH
kHraKXHarvYUMGkVlI9M+KNH7VvqZlKmYmAU5NlENB5kGEiyATQKubKlIBXfokvR
rmmxRMnUtffn37m26iRF51azMlI7uQhRccrrpNUuwsO6zYIfQQWGCbatgaw0oKp3
Rfk0EsEXys/lW58DNzKxKohlPLyNX6BNPGtYMulgi1vhdXyQuaqxAFWZbOjtXFqC
OBxYlHA15o9nzPVBSpWQmVUm91mp+1FurXGJ18JLmVktmksdPKzaB47TnFC9bJBn
UqBEy1miGxoWh1Txp7Dlm9M6KrQc8rdRO5ln9EPJpVgV2YytwnU=
=iRrF
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

