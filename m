Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AFE315C99
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 02:52:32 +0100 (CET)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9egB-0001Xh-40
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 20:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ee4-0000qo-Lo; Tue, 09 Feb 2021 20:50:20 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ee0-0004fA-6A; Tue, 09 Feb 2021 20:50:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db2l21DSlz9sBJ; Wed, 10 Feb 2021 12:50:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612921806;
 bh=PGcOEboFs3cqtQ7YiVHKDzDvB9D1FYugBJHRniUnvUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LxjgWrK95tsrR3UPcVgj8d542Uwj8iMH1+y2LIkEq2Y/e3G5Jw5SvcBBYBs7y1NTt
 W1iH8FmIjNBQOfxeZCFYQXypyXY1RvX4fMVsFo8FPtciy2DcjS0yqb1DinkdGxiiL9
 CVNAb519GrjRndsZjKks/it5r7c4SHn0IXlhhzgU=
Date: Wed, 10 Feb 2021 12:41:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] target/ppc: Add E500 L2CSR0 write helper
Message-ID: <20210210014159.GE4450@yekko.fritz.box>
References: <1612777258-23354-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline
In-Reply-To: <1612777258-23354-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 05:40:58PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> There are several bits in L2CSR0 (exists in the e500mc/e5500/e6500
> core) that should be self-cleared when written:
>=20
> - L2FI  (L2 cache flash invalidate)
> - L2FL  (L2 cache flush)
> - L2LFC (L2 cache lock flash clear)
>=20
> Add a write helper to emulate this behavior.
>=20
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

IIUC, these are essentially write-only bits - they have some side
effect when written on real hardware, but won't ever be read back.  Is
that correct?  Do you have a reference to hardware docs describing
this behaviour?

I'm assuming that because we don't model the L2 cache, it's ok that
your implementation just ignores writing these bits, rather than
performing the cache operations requested?

Is that still true for the flash clear operation?

> ---
>=20
>  target/ppc/cpu.h                |  6 ++++++
>  target/ppc/translate_init.c.inc | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2609e40..e77911a 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1919,6 +1919,7 @@ typedef PowerPCCPU ArchCPU;
>  #define SPR_750FX_HID2        (0x3F8)
>  #define SPR_Exxx_L1FINV0      (0x3F8)
>  #define SPR_L2CR              (0x3F9)
> +#define SPR_Exxx_L2CSR0       (0x3F9)
>  #define SPR_L3CR              (0x3FA)
>  #define SPR_750_TDCH          (0x3FA)
>  #define SPR_IABR2             (0x3FA)
> @@ -1974,6 +1975,11 @@ typedef PowerPCCPU ArchCPU;
>  #define   L1CSR1_ICFI   0x00000002  /* Instruction Cache Flash Invalidat=
e */
>  #define   L1CSR1_ICE    0x00000001  /* Instruction Cache Enable */
> =20
> +/* E500 L2CSR0 */
> +#define E500_L2CSR0_L2FI    (1 << 21)   /* L2 cache flash invalidate */
> +#define E500_L2CSR0_L2FL    (1 << 11)   /* L2 cache flush */
> +#define E500_L2CSR0_L2LFC   (1 << 10)   /* L2 cache lock flash clear */
> +
>  /* HID0 bits */
>  #define HID0_DEEPNAP        (1 << 24)           /* pre-2.06 */
>  #define HID0_DOZE           (1 << 23)           /* pre-2.06 */
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 9867d0a..3ec45cb 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -1735,6 +1735,16 @@ static void spr_write_e500_l1csr1(DisasContext *ct=
x, int sprn, int gprn)
>      tcg_temp_free(t0);
>  }
> =20
> +static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> +                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_=
L2LFC));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
>  static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int =
gprn)
>  {
>      gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
> @@ -5029,6 +5039,12 @@ static void init_proc_e500(CPUPPCState *env, int v=
ersion)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_e500_l1csr1,
>                   0x00000000);
> +    if (version !=3D fsl_e500v1 && version !=3D fsl_e500v2) {
> +        spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
> +                     SPR_NOACCESS, SPR_NOACCESS,
> +                     &spr_read_generic, &spr_write_e500_l2csr0,
> +                     0x00000000);
> +    }
>      spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjOecACgkQbDjKyiDZ
s5IVbBAA2hCOUxrOR/Npn2g3yKTIMvgWOt3r9vUOAslvK6oXeX1+fGGIvwoJY6D9
0BtRoCwDta6mFMPE4eG7oUzYnxC03UfsxBO+IkVXn6yFkDyDsv9F4ZURvCXd9VB1
Q6QOAR8rNcRIhd6trHn0J+gP6vs1Z/tSABEfzOABgnDM7wP46QbS8bXGFeGSBJt/
Bigq/dROeeSTGuW+/rnhxm+MHZoUtMD+HFbTdWf1gxIgljMZ8xWXhQqOfIaTa7os
UciOUx2fpsmi5xC0JqS3EvZU0MmBzigiiIOfvNreg1opt1SGr0QFLJayo/soosk2
EJs+TkaQ2klLX2a2U8u1LKmqgp9OH6PnTjd3UApL1KbfgDzaFxR2vhgj/YMO4OFz
m+WOMUpJVWE6HqoYuuGanDe+XBcf0ydIFALbouv5nmlOYaP6uxqTvmAsTxKyn1Jb
j3A7IUcbUUjm7kSh8WI6TInV6Kpu+vmcKFWby4/nekL6CzLUJH/7FCPad+prLJYU
psPpgiSXVR2bnR4uaeBSxme+E1b+7GTAZftZw9fMLcNPT5OsYohGm3COlLWGEZkh
gLWjEcYz75N0fziiGNa6eDTL/sSR/poY+Fk2qBA3rLoSKwjgaeXfoOq66zNrMU75
RHJfZw6nZ4Hym3B5Jty8CpHXjn+qat9/TaV+2Hlt1k0VSOVkoDk=
=qbKx
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--

