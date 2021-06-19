Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC493AD90F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:37:14 +0200 (CEST)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXPc-00029h-ND
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1luXLH-0006ag-QP; Sat, 19 Jun 2021 05:32:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59189 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1luXLE-0000CK-Kw; Sat, 19 Jun 2021 05:32:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G6Vv03lLhz9sVm; Sat, 19 Jun 2021 19:32:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624095148;
 bh=UjENjczhXaXaMkeUTDuTsLDvLmh5D8iBpY7VGrcf0BI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BI4gaKb3gngZYYqLRdafANxrR1jiNZYJUaNOtvqyvrgQMIl5iwTXZ+0QSbxXd2qBY
 i9uzFtnvolXMFEB5E6kUpYNVqIygGAiGfPPgacmg6unz2lghXRCZtuDH+dOaGxsqPg
 MdemmE9TDyLuS/Iu0TzsBya8qByetD81/kXQsCVw=
Date: Sat, 19 Jun 2021 19:26:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D
 cache flush bits
Message-ID: <YM24TwDm3SlCDiVu@yekko>
References: <20210615044107.1481608-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ucnoZn0b5OF/T7u2"
Content-Disposition: inline
In-Reply-To: <20210615044107.1481608-1-npiggin@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--ucnoZn0b5OF/T7u2
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

I don't really understand all the consequences of that.  What I need
to know here, is if it's safe to unconditionally enable these bits,
even for older machine types.

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
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

--ucnoZn0b5OF/T7u2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDNuE4ACgkQbDjKyiDZ
s5ICAxAA1fdlZ/4o2LDqqSA1kXHztxbOY1/L1kZ9PJzuT7/nThNEYxH5WfHMnbwY
SNZq0lrEDGnalOA6J+jzJUQbRpOK3PvgXipM9X778zn5X3CWC2bEWUUnwAjkI7CM
V9TDsItu2uusINGiZiarR5lzrJY59mDqYvqY9Mxk8IjHi5yUVNHUpMpY3ldgum1W
SQt+9p/k4x3Pt4VVzp6p5sblm7jcZ6c3VLg+STPQhGuDnfiqXF0whZIk09RrGSIt
InQ4mBTLr+EALbUzvGsfK27gw5TNsrhK1pkWyoHO40eYHlnUYSXIB/vKYpjSOhOd
35GU2c41J4vTpw5bBl9L3T/kwJ+0AD5mRgvVsHI/FOuA9+xMpgWgJNNCPDIBT5L5
1XCIVYc4uS2Bjf8d+42IU/nhc8y0SPRLHKZ16arpTBlIIz+sh1MA0lCeaBUro3b5
8ynOkXc/pRLtgSfch0c/wbsB8UTl7gXOGvi0y2CLjXc56c2qnFeUNrgDJuOgsmAL
6rMAD7YtpF1s4p36GopCdnGyQj5iiD92bhdyPXvyGoIxTeZj4NYSCBj2ZkS/jvaS
/PlGY6EyFh+ySKIwHIjL0k+S6iXCB9/4rqxj3KAeAGX2nH3HXnuV8DmKyNoDP44r
pajd8MLgc5cr5VqM3U2HibzDrRWf/9GhWzb4sXx7MAb8ideTE34=
=e7tV
-----END PGP SIGNATURE-----

--ucnoZn0b5OF/T7u2--

