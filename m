Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F006C3BF46B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:05:53 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LIO-000395-Sh
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFU-0001Pf-2I; Thu, 08 Jul 2021 00:02:52 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFR-0004eK-Ns; Thu, 08 Jul 2021 00:02:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL2gk4py4z9sXh; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625716962;
 bh=OV+aBCPkXB+wOFETC2qfDiEyh+Q/QhjQ4gVf7lfFGk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d6uCNKfSuexV9E5XLM4ImVK1ikxfRXslJQghlTcjbyBhSaT+gHa6oECfkKE36o5EG
 8LlulQ9goWINYXXaePIZfILpmoxAQakRKbfuUpzavCj6ePHozQ2/CfqtHXe/QQxTsK
 alDnAqbdl+hys0B9zvxSG7ME5gcICQWd7z2oIArU=
Date: Thu, 8 Jul 2021 13:54:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D
 cache flush bits
Message-ID: <YOZ3CTrKsz5T00nJ@yekko>
References: <20210615044107.1481608-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EkDWLDRJpC1DYcef"
Content-Disposition: inline
In-Reply-To: <20210615044107.1481608-1-npiggin@gmail.com>
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


--EkDWLDRJpC1DYcef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 02:41:07PM +1000, Nicholas Piggin wrote:
> There are several new L1D cache flush bits added to the hcall which refle=
ct
> hardware security features for speculative cache access issues.
>=20
> These behaviours are now being specified as negative in order to simplify
> patched kernel compatibility with older firmware (a new problem found in
> existing systems would automatically be vulnerable).
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

After our discussion, I'm convinced that the small behaviour change
for old machine types is safe.  I've added an explanatory note to the
commit message and merged to ppc-for-6.1.

> ---
>  hw/ppc/spapr_hcall.c   | 2 ++
>  include/hw/ppc/spapr.h | 3 +++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index f25014afda..dfd9df469d 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1299,6 +1299,8 @@ static target_ulong h_get_cpu_characteristics(Power=
PCCPU *cpu,
>          behaviour |=3D H_CPU_BEHAV_L1D_FLUSH_PR;
>          break;
>      case SPAPR_CAP_FIXED:
> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
>          break;
>      default: /* broken */
>          assert(safe_cache =3D=3D SPAPR_CAP_BROKEN);
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f05219f75e..0f25d081a8 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -398,10 +398,13 @@ struct SpaprMachineState {
>  #define H_CPU_CHAR_THR_RECONF_TRIG              PPC_BIT(6)
>  #define H_CPU_CHAR_CACHE_COUNT_DIS              PPC_BIT(7)
>  #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST           PPC_BIT(9)
> +
>  #define H_CPU_BEHAV_FAVOUR_SECURITY             PPC_BIT(0)
>  #define H_CPU_BEHAV_L1D_FLUSH_PR                PPC_BIT(1)
>  #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR           PPC_BIT(2)
>  #define H_CPU_BEHAV_FLUSH_COUNT_CACHE           PPC_BIT(5)
> +#define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY          PPC_BIT(7)
> +#define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS        PPC_BIT(8)
> =20
>  /* Each control block has to be on a 4K boundary */
>  #define H_CB_ALIGNMENT     4096

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EkDWLDRJpC1DYcef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmdwUACgkQbDjKyiDZ
s5KD4BAApL2/SFXQLtWbtbocBkwgT4/DZNRhilyK1iMzLbeB647eDmu3IlLEBWnj
+t2JvMe46MQlVihjPcc1Qg6e8LmnR53J6MCQqv9A6eq+APtwGDw/qw6ieU276t+S
Jr4cTmZ04/Mvf8RtadBebFNteowJl59ERqJxpGgvhMUQXJTc+PWaDm/fR5RXusDF
E+oxPNQmBWDYO3pY/uP0AzAUwOt5I/S7CglIAI/wlYcLuMWAtku2A/nQk3ILwpFH
uh6/QKpBR8q65bsJhd4K3cB91WmsC7ioIhh40EYgezt0mUSijjLmO+mMJ3uJq0ek
z/PF3nrkcgzhuoiPjZ/SAUYKO7gseJQHc1BwSavlEmA46eAc730p3AYuOqBixZxP
OyD23isPuXY0dcaA3q6cmI3IICAxWcfHSA3E1gqI/lQP18caqqrGsJs+r8aTq1rf
ITzJn8Y++Fcm8ZJ1LnCgkr8NXGyuIP0naShA384dmpLJFK92/wp5+BEAaP8HXNLS
1xac+vBG2I8pNNsh8Nc+9senFta2nW/fTizObTPYzUcT3llWcpRMZ2pUdkIKCRyg
Jl7vb5whHDsEREJ0hYAKBoKYqKTMWZm0AMiOUGjXNN+B3vwIifeMsunN98Bh7A+4
s2XMMKri/HJ5E/P3s4XrB3JBK4Tp4T5YpBgMlNAiUZDt+IuOefg=
=Zi30
-----END PGP SIGNATURE-----

--EkDWLDRJpC1DYcef--

