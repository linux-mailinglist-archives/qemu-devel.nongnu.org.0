Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650F4C3CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:00:46 +0100 (CET)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRme-0001pa-MG
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:00:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhO-0007rx-Ir; Thu, 24 Feb 2022 22:55:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:49561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhF-0001PP-MB; Thu, 24 Feb 2022 22:55:17 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K4bWm1pH0z4xcd; Fri, 25 Feb 2022 14:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645761300;
 bh=03Q+iRxeDN193TX873dGfCMy9COwOCW6aACuPGNfYp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eNeoT7Ad9f+iERYX3NBj8KG2c/aIgyZ2PjKyiO1EPDmnlqvAV3SDinXOI+aBvitMs
 9BiOPWeOY0qGeAlsSnGFCe7vmA633oQAtitsLnQ5QbIO8BQ9Z0WcU0BsANgtlSpk1e
 KWZKVpX0nZ+4YIutklMcL+AJB5bI5q7Kz7TS6jWs=
Date: Fri, 25 Feb 2022 14:17:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 2/4] spapr: TCG: Migrate spapr_cpu->prod
Message-ID: <YhhKMWU4TAuW+W+N@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JUP4xbIZAtuP40kY"
Content-Disposition: inline
In-Reply-To: <20220224185817.2207228-3-farosas@linux.ibm.com>
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JUP4xbIZAtuP40kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 03:58:15PM -0300, Fabiano Rosas wrote:
> I'm seeing some stack traces in the migrated guest going through cede
> and some hangs at the plpar_hcall_norets so let's make sure everything
> related to cede/prod is being migrated just in case.

This is a poor approach in general.  Migration becomes even harder to
maintain than it already is if you don't pare down the set of migrated
data to something minimal and non-redundant.

If you want to migrate prod, you have to give a case for why you
*need* it, not "just in case".

Also, you have to put this in a subsection with a needed function in
order not to break compatibility.

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr_cpu_core.c         | 1 +
>  include/hw/ppc/spapr_cpu_core.h | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index ed84713960..efda7730f1 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -179,6 +179,7 @@ static const VMStateDescription vmstate_spapr_cpu_sta=
te =3D {
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
>      .fields =3D (VMStateField[]) {
> +        VMSTATE_BOOL(prod, SpaprCpuState),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections =3D (const VMStateDescription * []) {
> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_c=
ore.h
> index b560514560..2772689c84 100644
> --- a/include/hw/ppc/spapr_cpu_core.h
> +++ b/include/hw/ppc/spapr_cpu_core.h
> @@ -45,7 +45,7 @@ typedef struct SpaprCpuState {
>      uint64_t vpa_addr;
>      uint64_t slb_shadow_addr, slb_shadow_size;
>      uint64_t dtl_addr, dtl_size;
> -    bool prod; /* not migrated, only used to improve dispatch latencies =
*/
> +    bool prod;
>      struct ICPState *icp;
>      struct XiveTCTX *tctx;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JUP4xbIZAtuP40kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIYSioACgkQgypY4gEw
YSLO3xAApE1ZodofiOtrcenrWE395fJL58rZ/Ymh1yQ0y5TQp0IJ6usP913hnT1y
GTgeyXw/+dpkBqVakdh1k0Jba/g+dxSf62SxIKSB3CL0YEAr42dWgIz4+60oQ4ws
b3/Yylwf26KpmqVCDIy8h5ttnXJ3ERz02K4sjHgCfdocZvfobkdkiTYSgb2ck+De
mW4DmmSPr6Bkm8VYFZI8zPn8svYQDgLF+ELjLUuexFCBJ2owRKNf+cQORbajM3me
sKKCYynWTQVMwKCV1hdXrNJ36ood5MVpEjyJJNy64hf9kMuLxU6CWctQE3wISmwF
HD8379i6aC97EOfDJzAX2RdCZ8EOpthcTVVxw+PBBpbcZV4NiomegtOfI2X3Iw1N
PPGkELG9DAe7S/DJQStySoi9sX0Snl3rR6vbMfTz/92uMMruw5cJsp7ZZv7QbQlE
d+r4X/pSrDoMk9xI2C+o7n+VajafCUiWyyb7DLrkIb52+1Auv9BTJG/EQvrmUX9H
HFDk9SgBye/cYP98luUbXQeqjyLCXDk/s6Ng8oWzE4jmp+/bUlUbomB90zZLMjjd
mi4LrzE598Ubvb54Fp+0eEzqs+hxvChmn5KKEueKItaL2tswHUrUmqI/5/NMR9ag
ndUL0o1U3+dj8aHvcjyrUAbYL+v7q+hgWBqCnIk9qxYG0T5P9Hw=
=o5GC
-----END PGP SIGNATURE-----

--JUP4xbIZAtuP40kY--

