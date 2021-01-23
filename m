Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97441301244
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 03:30:55 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l38hS-000594-1q
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 21:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l38fk-0004J7-Ty; Fri, 22 Jan 2021 21:29:08 -0500
Received: from ozlabs.org ([203.11.71.1]:55555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l38fh-0005kM-6Z; Fri, 22 Jan 2021 21:29:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DN0S601ydz9sT6; Sat, 23 Jan 2021 13:28:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611368934;
 bh=2vAOtAYdRH9AbMvYaZ+dDKXdbSFsE7hOmo0oL+x9df8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1jd7AqVjyMIm2+n3yjtH5LXAmctdDVkfDzWP03XXdGs+2JOb+wwc9+4tHqs3+rau
 ez5GbKzCS8KfT3bQr9hPGz0PCramzNI79UEUJ3kzJfSWnPLqlAu11tl86GXD42x2kb
 txDDUuJL5Tt7OtA/FQeYsAsVjra1C2eA6BvdG17w=
Date: Sat, 23 Jan 2021 12:46:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] spapr_caps.c: check user input before warning
 about TCG only caps
Message-ID: <20210123014625.GH4400@yekko.fritz.box>
References: <20210120105406.163074-1-danielhb413@gmail.com>
 <20210120105406.163074-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WIIRZ1HQ6FgrlPgb"
Content-Disposition: inline
In-Reply-To: <20210120105406.163074-2-danielhb413@gmail.com>
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


--WIIRZ1HQ6FgrlPgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 07:54:06AM -0300, Daniel Henrique Barboza wrote:
> Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
> cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
> when introducing cap-ccf-assist.
>=20
> These warning messages, although benign to the machine launch, can make
> users a bit confused. E.g:
>=20
> $ sudo ./ppc64-softmmu/qemu-system-ppc64
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cf=
pc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sb=
bc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ib=
s=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cc=
f-assist=3Don
>=20
> We're complaining about "TCG doesn't support requested feature" when the
> user didn't request any of those caps in the command line.
>=20
> Check if these caps were set in the command line before sending an user
> warning.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Oof.  I have real mixed feelings about this.

So, yes, the warnings are annoying, but they're not meaningless.  They
are really indicating that the guest environment is different from the
one you requested (implicitly, via the machine version). The fact that
they are only warnings, not hard errors, is already a compromise
because otherwise there would be no real way to use TCG at all with
current machines.

In short, the warnings are scary because they're *meant* to be scary.
TCG will not, and cannot, supply the Spectre mitigations that are
expected on a current machine type.

I agree that the current behaviour is pretty irritating, but I don't
know that silently pretending TCG can do what's normally expected of
that command line is a great option either.


> ---
>  hw/ppc/spapr_caps.c | 47 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9341e9782a..629c24a96d 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -244,9 +244,15 @@ static void cap_safe_cache_apply(SpaprMachineState *=
spapr, uint8_t val,
>      uint8_t kvm_val =3D  kvmppc_get_cap_safe_cache();
> =20
>      if (tcg_enabled() && val) {
> -        /* TCG only supports broken, allow other values and print a warn=
ing */
> -        warn_report("TCG doesn't support requested feature, cap-cfpc=3D%=
s",
> -                    cap_cfpc_possible.vals[val]);
> +        /*
> +         * TCG only supports broken, allow other values and print a warn=
ing
> +         * in case the user attempted to set a different value in the co=
mmand
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_CFPC] !=3D SPAPR_CAP_BROKEN) {
> +            warn_report("TCG doesn't support requested feature, cap-cfpc=
=3D%s",
> +                        cap_cfpc_possible.vals[val]);
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
>                     "Requested safe cache capability level not supported =
by KVM");
> @@ -269,9 +275,15 @@ static void cap_safe_bounds_check_apply(SpaprMachine=
State *spapr, uint8_t val,
>      uint8_t kvm_val =3D  kvmppc_get_cap_safe_bounds_check();
> =20
>      if (tcg_enabled() && val) {
> -        /* TCG only supports broken, allow other values and print a warn=
ing */
> -        warn_report("TCG doesn't support requested feature, cap-sbbc=3D%=
s",
> -                    cap_sbbc_possible.vals[val]);
> +        /*
> +         * TCG only supports broken, allow other values and print a warn=
ing
> +         * in case the user attempted to set a different value in the co=
mmand
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_SBBC] !=3D SPAPR_CAP_BROKEN) {
> +            warn_report("TCG doesn't support requested feature, cap-sbbc=
=3D%s",
> +                        cap_sbbc_possible.vals[val]);
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
>  "Requested safe bounds check capability level not supported by KVM");
> @@ -297,9 +309,15 @@ static void cap_safe_indirect_branch_apply(SpaprMach=
ineState *spapr,
>      uint8_t kvm_val =3D kvmppc_get_cap_safe_indirect_branch();
> =20
>      if (tcg_enabled() && val) {
> -        /* TCG only supports broken, allow other values and print a warn=
ing */
> -        warn_report("TCG doesn't support requested feature, cap-ibs=3D%s=
",
> -                    cap_ibs_possible.vals[val]);
> +        /*
> +         * TCG only supports broken, allow other values and print a warn=
ing
> +         * in case the user attempted to set a different value in the co=
mmand
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_IBS] !=3D SPAPR_CAP_BROKEN) {
> +            warn_report("TCG doesn't support requested feature, cap-ibs=
=3D%s",
> +                        cap_ibs_possible.vals[val]);
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
>  "Requested safe indirect branch capability level not supported by KVM");
> @@ -483,8 +501,15 @@ static void cap_ccf_assist_apply(SpaprMachineState *=
spapr, uint8_t val,
>      uint8_t kvm_val =3D kvmppc_get_cap_count_cache_flush_assist();
> =20
>      if (tcg_enabled() && val) {
> -        /* TCG doesn't implement anything here, but allow with a warning=
 */
> -        warn_report("TCG doesn't support requested feature, cap-ccf-assi=
st=3Don");
> +        /*
> +         * TCG doesn't implement anything here, but allow with a warning
> +         * in case the user attempted to set a different value in the co=
mmand
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_CCF_ASSIST] !=3D SPAPR_CAP_OF=
F) {
> +            warn_report("TCG doesn't support requested feature, "
> +                        "cap-ccf-assist=3Don");
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          uint8_t kvm_ibs =3D kvmppc_get_cap_safe_indirect_branch();
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WIIRZ1HQ6FgrlPgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmALf+8ACgkQbDjKyiDZ
s5KKOA//XssPJ8/kwFS3qPRD1EszybKC39uU2Ikl3bJpvwUKZEtR0kaOxI25LWbG
a7PsmcQpeYzvkKVsK/yBvz+aK66F92CCaAGV5dRKRZMRTYjMEPnWF26B80lJBgHZ
zxenlo1D9knr1U85IRdSa2kuBfo1EMtyBLeHe3COmfxkejKTxzcTIUhBzoVTR1H5
PCKgz5/aHWwUWS/e8mYW3JxRtGRkcrr8k8F2kZQ7sOq6mqWS81DX7LxU6IwX1S74
4BCkNolvR/UBRQM9cu1Bz0AmNuCzlrWENCss0A8F2B7J5wsrs2CVPhhXj4dZlB3J
jqEnFfGUoFTKpCBPoUNmAQEVBOtIlLbk45qhtSOiRWKNKikoQowe8nxbf/N1JKi0
JFU6K9ZMnNZfXgyf58cicXPjtV8Pcv8cvjOhNgWckEUHTwPn5un691bzgRZXO5zh
GrcV+hy1c6LBU0rVQzN2ecPKZNmeGGLrjnAVBrNxRWwSMFS32o6dSucna0ZqZJh6
xi1TR5OmOMpvIW5F4/fYaMaSLFDMbtPWUjulkopWyb5T/WKmOAQpAKJWJoBYLOk+
9ihRfn2TtIafRS5ZXJ6YZLREOSbYHwIk3j3pBShJtWsIqO7/vDLoD9lGFyzC5p1k
6Gjh08o9LJpKBNe1LSwjohCN88kgvpAm1LrH8Ym25Q5lTbwObso=
=0nL/
-----END PGP SIGNATURE-----

--WIIRZ1HQ6FgrlPgb--

