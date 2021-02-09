Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C1F31485F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 06:51:57 +0100 (CET)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9LwK-0008HL-E4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 00:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9Luh-0007Ta-ME; Tue, 09 Feb 2021 00:50:16 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48781 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9Lue-0001eJ-U4; Tue, 09 Feb 2021 00:50:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DZX6R1vx4z9sVb; Tue,  9 Feb 2021 16:50:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612849807;
 bh=XZ275/00ERClkwhX7qJi8XtsZUxbnREpejVQ0Fo01AU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nDNwk4rCf2Jm1te2pdK8EssI5Zx0v1dhmn/rhN7mws+dCcDqTI7Q8lXonzItwn/ZF
 SVHY/XM6F3rjUTBignRRNuJr7eNOrDEixwyuBWuDlaCPh5kSMXDC+fG6q8i516otHI
 6UMhoZ16M5XNS9gkQFn/ZNet9J3eSf7JHD9Ri5Xc=
Date: Tue, 9 Feb 2021 16:10:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/5] target/ppc: Drop use of gdb_get_float64() and ldfq_p()
Message-ID: <20210209051005.GE40668@yekko.fritz.box>
References: <20210208113428.7181-1-peter.maydell@linaro.org>
 <20210208113428.7181-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline
In-Reply-To: <20210208113428.7181-4-peter.maydell@linaro.org>
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 11:34:26AM +0000, Peter Maydell wrote:
> We used to make a distinction between 'float64'/'float32' types and
> the 'uint64_t'/'uint32_t' types, requiring special conversion
> operations to go between them.  We've now dropped this distinction as
> unnecessary, and the 'float*' types remain primarily for
> documentation purposes when used in places like the function
> prototypes of TCG helper functions.
>=20
> This means that there's no need for a special gdb_get_float64()
> function to write a float64 value to the GDB protocol buffer; we can
> just use gdb_get_reg64().
>=20
> Similarly, for reading a value out of the GDB buffer into a float64
> we can use ldq_p() and need not use ldfq_p().
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/gdbstub.c            | 8 ++++----
>  target/ppc/translate_init.c.inc | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 01459dd31d2..c28319fb974 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -130,7 +130,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *buf, int n)
>          gdb_get_regl(buf, env->gpr[n]);
>      } else if (n < 64) {
>          /* fprs */
> -        gdb_get_float64(buf, *cpu_fpr_ptr(env, n - 32));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
>      } else {
>          switch (n) {
>          case 64:
> @@ -184,7 +184,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GBy=
teArray *buf, int n)
>          gdb_get_reg64(buf, env->gpr[n]);
>      } else if (n < 64) {
>          /* fprs */
> -        gdb_get_float64(buf, *cpu_fpr_ptr(env, n - 32));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
>      } else if (n < 96) {
>          /* Altivec */
>          gdb_get_reg64(buf, n - 64);
> @@ -241,7 +241,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>          env->gpr[n] =3D ldtul_p(mem_buf);
>      } else if (n < 64) {
>          /* fprs */
> -        *cpu_fpr_ptr(env, n - 32) =3D ldfq_p(mem_buf);
> +        *cpu_fpr_ptr(env, n - 32) =3D ldq_p(mem_buf);
>      } else {
>          switch (n) {
>          case 64:
> @@ -291,7 +291,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, ui=
nt8_t *mem_buf, int n)
>          env->gpr[n] =3D ldq_p(mem_buf);
>      } else if (n < 64) {
>          /* fprs */
> -        *cpu_fpr_ptr(env, n - 32) =3D ldfq_p(mem_buf);
> +        *cpu_fpr_ptr(env, n - 32) =3D ldq_p(mem_buf);
>      } else {
>          switch (n) {
>          case 64 + 32:
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 9867d0a6e4a..7bd111d905e 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -9907,7 +9907,7 @@ static int gdb_get_float_reg(CPUPPCState *env, GByt=
eArray *buf, int n)
>  {
>      uint8_t *mem_buf;
>      if (n < 32) {
> -        gdb_get_float64(buf, *cpu_fpr_ptr(env, n));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
>          mem_buf =3D gdb_get_reg_ptr(buf, 8);
>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          return 8;
> @@ -9925,7 +9925,7 @@ static int gdb_set_float_reg(CPUPPCState *env, uint=
8_t *mem_buf, int n)
>  {
>      if (n < 32) {
>          ppc_maybe_bswap_register(env, mem_buf, 8);
> -        *cpu_fpr_ptr(env, n) =3D ldfq_p(mem_buf);
> +        *cpu_fpr_ptr(env, n) =3D ldq_p(mem_buf);
>          return 8;
>      }
>      if (n =3D=3D 32) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAiGSsACgkQbDjKyiDZ
s5L8nQ/8DY1ptm7WvMR2mTa5TEj4wU3i6zB2P8FHupYTBz2tgHgPfdUzhmy5cHnb
r/6omfgeKNRtxrhdcbmH4XY1N+7TlO3b9N8UPDbgXRb3Kle1ETKizatzAbUxSU/h
glc2yzi97PPa0851jdVR/oZ9zYWsEntHGXbo70OLMzXvNtMswV5ogx3ITVT2CCpW
fj46WoY9Xfp8F+pm+scm/UszGE00FiPKB6vV92MBpdYJQrVxy9YOGmJOc7WizKHE
g6NfrYWhP5j+F7C6kyWfsnw3k1ehU9qnXwC87eDGw5reM6Fyfn7ycxDU8+b+iTB0
oQSIOg2VbFipV48cG8ZtN6/E5brOuftbHSOfmSkrWO51HMAh9WghFe0IIbuEZm1R
os48eykgDrweLbLay9ZWMqTgWO9UXit/vhnwDADqxTBW504ZRTkyPJrgQnOl2y79
jdLrhqFCcJU5ACMBVwaaoJAUoZyRyuFHdlwisYTRbiT51jU3ZpdzbhAsXFCBuZtj
kblci2YXwsfU7FIrJCylg4MLfQ/5L0dxwcnC/OzJEdJ8bGzYWVmK4KLY8D3/BVrl
bn2n8Rq0pBu0o/V7I9beXfOAmJp5znCZgo8/qobklVscdYRbdcDOcMoUNmCg5HYl
lUT6xD9plMc7iSBg38nguqlPwAdZMBShvZjpxXoHJwYSCPVjl3k=
=MUb0
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--

