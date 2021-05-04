Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756AD3723F3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 02:47:49 +0200 (CEST)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjE4-0001JO-Ii
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 20:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB8-0008GC-Sf; Mon, 03 May 2021 20:44:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB5-00064D-PF; Mon, 03 May 2021 20:44:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1M50pjzz9sVt; Tue,  4 May 2021 10:44:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620089073;
 bh=OIgkzkb4HN2zumk4Y/bQ56Hy3gTto8jAruypRvocTjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fECev1ogNhzq+WtaBrHcDTxJvFUZWyfF1d4ZMgMJChnnFujTvK79GHTRZdVaC1y9l
 sNgcOOrDhMzMxzZTBXhe2/WZYaYb7OBQsPix0Y7CGSS0OqwYQVc3hYTQ1CC8w196g6
 2r+7LOkEe0XCMufrvugR6d+OUze+QnpOcz+kdP5k=
Date: Tue, 4 May 2021 10:41:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS bits
Message-ID: <YJCYKBF2YgEl8AEA@yekko>
References: <20210503125833.891752-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="60hPIpsSn0lks61B"
Content-Disposition: inline
In-Reply-To: <20210503125833.891752-1-npiggin@gmail.com>
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


--60hPIpsSn0lks61B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 10:58:33PM +1000, Nicholas Piggin wrote:
> There are several new bits added to the hcall which reflect new issues
> found and new hardware mitigations.
>=20
> This adds the link stack flush behaviour, link stack flush accelerated
> instruction capability, and several L1D flush type behaviours (which are
> now being specified as negative in order to simplify patched kernel
> compatibility with older firmware).

So, to clarify here, the bits your adding aren't advertising any new
behaviour on qemu/KVM's part, they're just new ways of advertising the
same behaviour?

>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_hcall.c   | 5 +++++
>  include/hw/ppc/spapr.h | 6 ++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7275d0bba1..f656620232 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1878,6 +1878,9 @@ static target_ulong h_get_cpu_characteristics(Power=
PCCPU *cpu,
>          behaviour |=3D H_CPU_BEHAV_L1D_FLUSH_PR;
>          break;
>      case SPAPR_CAP_FIXED:
> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
> +        behaviour |=3D H_CPU_BEHAV_NO_STF_BARRIER;
>          break;
>      default: /* broken */
>          assert(safe_cache =3D=3D SPAPR_CAP_BROKEN);
> @@ -1909,9 +1912,11 @@ static target_ulong h_get_cpu_characteristics(Powe=
rPCCPU *cpu,
>          break;
>      case SPAPR_CAP_WORKAROUND:
>          behaviour |=3D H_CPU_BEHAV_FLUSH_COUNT_CACHE;
> +        behaviour |=3D H_CPU_BEHAV_FLUSH_LINK_STACK;
>          if (count_cache_flush_assist) {
>              characteristics |=3D H_CPU_CHAR_BCCTR_FLUSH_ASSIST;
>          }
> +        /* Should have a way to enable BCCTR_LINK_FLUSH_ASSIST */

Do we need a new spapr capability for this link flush thing?

>          break;
>      default: /* broken */
>          assert(safe_indirect_branch =3D=3D SPAPR_CAP_BROKEN);
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 7f40a158f4..883ac1db3c 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -395,10 +395,16 @@ struct SpaprMachineState {
>  #define H_CPU_CHAR_THR_RECONF_TRIG              PPC_BIT(6)
>  #define H_CPU_CHAR_CACHE_COUNT_DIS              PPC_BIT(7)
>  #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST           PPC_BIT(9)
> +#define H_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST      PPC_BIT(11)
> +
>  #define H_CPU_BEHAV_FAVOUR_SECURITY             PPC_BIT(0)
>  #define H_CPU_BEHAV_L1D_FLUSH_PR                PPC_BIT(1)
>  #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR           PPC_BIT(2)
>  #define H_CPU_BEHAV_FLUSH_COUNT_CACHE           PPC_BIT(5)
> +#define H_CPU_BEHAV_FLUSH_LINK_STACK            PPC_BIT(6)
> +#define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY          PPC_BIT(7)
> +#define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS        PPC_BIT(8)
> +#define H_CPU_BEHAV_NO_STF_BARRIER              PPC_BIT(9)
> =20
>  /* Each control block has to be on a 4K boundary */
>  #define H_CB_ALIGNMENT     4096

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--60hPIpsSn0lks61B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQmCgACgkQbDjKyiDZ
s5J4LBAA1f3lkbJKwJTfkB0hnQ/xrxP4D3KXLBfI47EKwQL+7reEg6/07bLmnEVw
5Llz8HByrUzWDNs9XwOmmJ8DrlvQ/h677nSINMyyXgfARVEj6EP248QujRR6SqRy
gXOiYHMzmRvUVth9Ew0ApfRNX3BILWCDEODiH3fDP7CF4Zrg1NAVRW5jgKfI0DdE
KebUOsI+eEhiDDB5jZwHrOW5jPeNfyZBotRbz2TjCQ8YlHTXEt397hqYBCOE+W9b
do+wkMJWWBzul7aQV2YIP0WeqBXCxk932QXNWlsl9MOk2E1ed+Im+6HA9fe/CXF8
P+f+S2LwB0QViH+UgZ8aEgX9PSHxEPadHuQ1y5Z/9IgLWBQ5IvFaZoQyME55JPlX
5Ttg3PyMIz8d8m28VKnCpzrVahFzqD+RWozErPQiLZKlYni7X0+IwFAPl057JV2L
+GBtZ6JpllVq/BJW8DNS38ncV8vK5sm8dnxv8tJXcR8vMkbK4WoYtcJXnDWas8sl
jmmubVLHezUZ+vkrmbXMl+rVFc4qBCu98kSkbw/ZxrQAdm8RyZXWf81zy3cAThN/
TaNV9U+N1jPLKHxd0+K0BgiipVS3Ftyb87bhm3wmVSz7fGbMOQH0iWl2Ro5jLaz0
GCd7LA1nfTGKSZSLY1wmn9zuFN8tRBr4sDy9tlYlOBChONyIz70=
=iJe1
-----END PGP SIGNATURE-----

--60hPIpsSn0lks61B--

