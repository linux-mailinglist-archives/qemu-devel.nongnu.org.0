Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123622F6FD8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:10:37 +0100 (CET)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0DdM-00062w-0k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaH-00041V-ED; Thu, 14 Jan 2021 20:07:26 -0500
Received: from ozlabs.org ([203.11.71.1]:51195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaC-0003QD-K4; Thu, 14 Jan 2021 20:07:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31b5gvsz9sWQ; Fri, 15 Jan 2021 12:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672835;
 bh=eaYFwc8RdkFmGFkFyfRgABPBdKcxnIf27kRaX1DU0Sw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROueVhlu/h0ecAdufQaFhc2qDoenJ7bUYQ9M7zS/5o8YjQYY2ZDik7+j0cucFwZbm
 LNoODx8FdKeajUGkofq96SWAKCuoHttD5fBIMQjT2IiyUI00yEzvq7RjdQ3eHCccki
 tuCCMDgOYxe5CFgScEGOCRgNVLLJYZXyb4Mij2zA=
Date: Fri, 15 Jan 2021 11:43:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 2/7] spapr_hcall.c: make
 do_client_architecture_support static
Message-ID: <20210115004321.GR435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ep5m4srWGXPl6O+g"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-3-danielhb413@gmail.com>
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


--Ep5m4srWGXPl6O+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:23PM -0300, Daniel Henrique Barboza wrote:
> The function is called only inside spapr_hcall.c.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Nice catch - that's a hangover from an earlier version where it was
called elswhere.  Applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr_hcall.c   | 1 +
>  include/hw/ppc/spapr.h | 5 -----
>  2 files changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index e5dfc1ba7a..7b5cd3553c 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1632,6 +1632,7 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint=
32_t max_compat,
>      return best_compat;
>  }
> =20
> +static
>  target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>                                              SpaprMachineState *spapr,
>                                              target_ulong vec,
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 4d37c2a93b..a2d1fb21c6 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -583,11 +583,6 @@ void spapr_register_hypercall(target_ulong opcode, s=
papr_hcall_fn fn);
>  target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
>                               target_ulong *args);
> =20
> -target_ulong do_client_architecture_support(PowerPCCPU *cpu,
> -                                            SpaprMachineState *spapr,
> -                                            target_ulong addr,
> -                                            target_ulong fdt_bufsize);
> -
>  /* Virtual Processor Area structure constants */
>  #define VPA_MIN_SIZE           640
>  #define VPA_SIZE_OFFSET        0x4

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ep5m4srWGXPl6O+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA5SkACgkQbDjKyiDZ
s5Ix9xAAyF2Ny9Mr8AhBAm3yo7WUqMv4m9Iu+waJrMCxOIxJ6WLdr+LKaD8Z7lxM
EtuCpT+vta32Vkv5W8hC/tleKSPakC3U2pk++VDhA7q0OKgATAH2Znn8Pc2xVzNf
CzmTd8kzzKydFYp6mo70z3uCeN8QMTGrRZxL71jibe99OXSR2JVVhGgvXB0AbcSH
x32LI8n10i5quoldwHGLRC18cjZzBi1JVZhtEVQmYBLfDCSgleoa7uAHEjXEdyIB
VJ/Je0VrCP091p0tlovpch0ZSHSiHbtQsafi1u5m0zg5AWLEfEMszFykRq4eTqbE
J1omH90MrPVnG6MwW30BC+gzaUBgVn3DMBdqIo/ueefKNgBgIaRhkQ2tYHzi3YGQ
RARVzytg1c0TMHENHmGijKpLEZsPwoxhnlxuU6UOgvPdsrZlup+C7Acg5MeYdlJ1
BO6elbaxBFOBKWwFaj9ZM3yiuIJ+6+1gzloP5ZdemL7STJK9Lg/44hUHNgITFyGU
Nyl7z//df9M8fbXUITe7WE/2UUa7ocaVmTJhwxizHPevdzkFgpMqMIHyHniQdPgR
zpU1DpSkyipzm8uxgkI5cz8IoREWp8nbqxd1T9i1ksoCL1ytCluSVi8tUhWup+o2
j/JfIigAykaLIKpTaYyq8gX6BXDNcd0noT7pXgUK0Ef4EqBXNHM=
=nGe3
-----END PGP SIGNATURE-----

--Ep5m4srWGXPl6O+g--

