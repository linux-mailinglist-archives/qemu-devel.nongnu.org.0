Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACE45E452
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:21:02 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqQrE-00053q-FP
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:21:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqQjr-0002UK-Ps; Thu, 25 Nov 2021 21:13:24 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:50577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqQjo-0006rg-LB; Thu, 25 Nov 2021 21:13:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J0dZL4dGHz4xbs; Fri, 26 Nov 2021 13:13:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637892794;
 bh=Ug1KbDPv7fKwOB7mlcNB6lGkzRtuQF5xwT+SQKxk5aE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMVlqobNAfwCh+m9srFKLO9+Sp11BNkrWjzLZZ0io+LLDRBiuJw6ehwag7xOY0vh6
 r+d3bgEb327S2gmDvASoU9lfLpdM91HdQufS+Wa0lR7I+Pdx696a6obQchRMycWRTC
 lwyro6NVedgIploeAKY7EmjLMxm8vbrxfRKRcX6g=
Date: Fri, 26 Nov 2021 12:11:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Message-ID: <YaA0SIVnltlrarQZ@yekko>
References: <20211125224202.632658-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VisctKliHs4J2dS0"
Content-Disposition: inline
In-Reply-To: <20211125224202.632658-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VisctKliHs4J2dS0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 07:42:02PM -0300, Daniel Henrique Barboza wrote:
> If one tries to use -machine powernv9,accel=3Dkvm in a Power9 host, a
> cryptic error will be shown:
>=20
> qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko, onl=
y "-cpu host" is possible
> qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid =
argument
>=20
> Appending '-cpu host' will throw another error:
>=20
> qemu-system-ppc64: invalid chip model 'host' for powernv9 machine
>=20
> The root cause is that in IBM PowerPC we have different specs for the bar=
e-metal
> and the guests. The bare-metal follows OPAL, the guests follow PAPR. The =
kernel
> KVM modules presented in the ppc kernels implements PAPR. This means that=
 we
> can't use KVM accel when using the powernv machine, which is the emulatio=
n of
> the bare-metal host.
>=20
> All that said, let's give a more informative error in this case.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/pnv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 71e45515f1..e5b87e8730 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
>      DriveInfo *pnor =3D drive_get(IF_MTD, 0, 0);
>      DeviceState *dev;
> =20
> +    if (kvm_enabled()) {
> +        error_report("The powernv machine does not work with KVM acceler=
ation");
> +        exit(EXIT_FAILURE);
> +    }


Hmm.. my only concern here is that powernv could, at least
theoretically, work with KVM PR.  I don't think it does right now,
though.

> +
>      /* allocate RAM */
>      if (machine->ram_size < mc->default_ram_size) {
>          char *sz =3D size_to_str(mc->default_ram_size);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VisctKliHs4J2dS0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGgNEcACgkQbDjKyiDZ
s5LgSg//aSjzY0pNBTrMUFon6xF1CAQ2V6oVbuuThM2zS6VprwxPm4A8Q0IUEBxI
/CEaAocITbDdcoWQ66dDrky1V7ldZC0YjooMf2oTdPd1EdCtsrwzMRNh+Ed4sS3O
r6PZXmTLx2nEEYg9NP+z1Q3BdGRZb0CtxwVkLpgbFwZ00OUqIIwmZjOV/+o40uDh
eW723MX0jixROhDxubS6N89Qc5w5K9b+02gt6JGlYhGFM3Vcc8x/vt8cboRlHvN3
uGOWX67z3Bxy4Qi23a/YRevlMl8qDLR/+0eKCnlavxOjqT7EDeLW+ARJNWbuaoE+
o5YYkbnAXtNdrIRty080viA88gV/TYXWMG+OqDFovWrh8XJYPyPxWhB0S+y3l6oQ
PQ6Q7zgghygoEcY8OR3yfIzVjYPnfP/+OFlGQtSkjL+u6v1UiTWp8F46+1XOg4YI
gb9cyZgJNsejcWxV+DwdxDDFJ/tCtqB/uNW0GKDRMwaZH376HTUCnunzdoJYlnLc
92BPdQ2fxwjKJJgrB6QSi29WoYwSRvHZRBUB673V/mnV0IS13E1jnnZgNVsfTl7B
OcBXAvncea82ZDKMVxxASQ4cf+Yzr61kM9MxOkE+oxEXsG+OPOzjofaJyqbuLdwK
76ovKZ3OrK/YIT3aBQFb+zHuoWPny643Pz3uwKyyDClHsn7CH4w=
=3M49
-----END PGP SIGNATURE-----

--VisctKliHs4J2dS0--

