Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257058C222
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 05:41:45 +0200 (CEST)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKteB-0007v9-H9
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 23:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZg-0003tp-UZ; Sun, 07 Aug 2022 23:37:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZe-0006aG-3i; Sun, 07 Aug 2022 23:37:04 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1MM85Tpxz4xTr; Mon,  8 Aug 2022 13:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659929812;
 bh=scNs2rf0zMcjH6OvkHFKskzjEQt18UPLv2MReegkzxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7Rm9LsVDDzvrO1wwzLGMQccjzJ+ghdB/HZtt4k2LEd/UPjzYT5sfMMqVRVTJtCw7
 Ly8q6E+jcIWn/8vchw07M3hzbMF2JhxtU2h6wlJEiWqifmRh2Y7iEdrIbHFLHxcDcd
 0Nek/bm91pJV+G1YEqnULKy0suxllbAneRTtsC/0=
Date: Mon, 8 Aug 2022 13:26:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Message-ID: <YvCCbNOkX4ZtaoWl@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GmX6NQmz0DhX3MSg"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-11-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GmX6NQmz0DhX3MSg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:38AM -0300, Daniel Henrique Barboza wrote:
> The pSeries machine never bothered with the common machine->fdt
> attribute. We do all the FDT related work using spapr->fdt_blob.
>=20
> We're going to introduce HMP commands to read and save the FDT, which
> will rely on setting machine->fdt properly to work across all machine
> archs/types.
>=20
> Let's set machine->fdt in the two places where we manipulate the FDT:
> spapr_machine_reset() and CAS. spapr->fdt_blob is left untouched: what
> we want is a way to access the FDT from HMP, not replace
> spapr->fdt_blob.

Given there is now an fdt field in the generic MACHINE structure, we
should be able to remove the one in spapr->fdt_blob, yes?

>=20
> Cc: C=E9dric Le Goater <clg@kaod.org>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c       | 6 ++++++
>  hw/ppc/spapr_hcall.c | 8 ++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dc..94c90f0351 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *mach=
ine)
>      spapr->fdt_initial_size =3D spapr->fdt_size;
>      spapr->fdt_blob =3D fdt;
> =20
> +    /*
> +     * Set the common machine->fdt pointer to enable support
> +     * for 'dumpdtb' and 'info fdt' commands.
> +     */
> +    machine->fdt =3D fdt;
> +
>      /* Set up the entry state */
>      first_ppc_cpu->env.gpr[5] =3D 0;
> =20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index a8d4a6bcf0..0079bc6fdc 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>      spapr->fdt_initial_size =3D spapr->fdt_size;
>      spapr->fdt_blob =3D fdt;
> =20
> +    /*
> +     * Set the machine->fdt pointer again since we just freed
> +     * it above (by freeing spapr->fdt_blob). We set this
> +     * pointer to enable support for 'dumpdtb' and 'info fdt'
> +     * HMP commands.
> +     */
> +    MACHINE(spapr)->fdt =3D fdt;
> +
>      return H_SUCCESS;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GmX6NQmz0DhX3MSg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwgmQACgkQgypY4gEw
YSL7nQ/+L6S04fbDHXWHQB1vrYDHwkqPl/fwSCHb34UQrI4+CrfTa/eSpJa9Xi4g
BKk3BaWxvL8PSrUXYMpfXtP1hbtp3hTlRLjXNE7rhVwcJwKPmaGTPsQ8ELDDhi3R
9aHZzacMFbu9C1O5Xm3aN/RLzbuGCCc4qfCt1KBEhh0o3u6Rkf/QE93MsZz9it2o
nv/s2hdq96JToDAm6NNuLu/63ctXFrJWCr4val9T6u3MnfyEF46cUMjnZSLW4g2/
enppcVQroZzosAk0zOUWEN98IKxHqnnM0h0CVsfw8sADv44qa/ajQjpS4O+obr2N
2yKuLihtBCpSSFTcLV9hNjV1REfa6kYry08t2X+5kW0LBqMJNpeZvjLdtEBdbzs5
muzh1TGUjp9ASAZw0HO43wvhiImsubJnt15MiedA4KW/dKlHRcXmmNbAHFrem7IQ
Dl27jmh3MfBhbTb3a+unyPMePyibAlIZNGugsTVyO7B3X/pU4ookMJis+/u7ri+P
ltAdvGeDXjR62T7KEjRHrC30iwKQwMNnElI+QFvWUhoKaza9HwFZ15+wePriauBP
M4rPKK1VMru4S6yKVqhRllgHH/mI1MblXulP3+LESdYeTSvLfzUCxE2EqqR6cyYQ
3Vna3LBEhbLjPKvRmwh8FIj/0J2y+AsXHTsG+VTHt5dnDhtIr9E=
=AhJb
-----END PGP SIGNATURE-----

--GmX6NQmz0DhX3MSg--

