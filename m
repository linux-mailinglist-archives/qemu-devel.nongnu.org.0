Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B373E522D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:28:24 +0200 (CEST)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJNH-0007D8-J2
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDu-0008Fm-LE; Tue, 10 Aug 2021 00:18:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDr-0002RE-9L; Tue, 10 Aug 2021 00:18:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSS1Tfqz9t9y; Tue, 10 Aug 2021 14:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569096;
 bh=bJblPjglavyO4C/eDskg/g4hw/+kMjsz0C+CTgbD7pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OlmJnSsxHg/PLo+G5lD85sRLjSRw5yRsfnLUq3s3jHIOyfDfxVGoHUA8D1RLNjsep
 PXVT81XNJRTZnFpw8nMvxiZmgHX/lo6FtcD1eGC9XuuZkCvxRt6gMuQ1mUUL7T6x6d
 CwIw3xmvoMUxN330sySKZIO/IYjwPa3fwG0Fo8lg=
Date: Tue, 10 Aug 2021 13:50:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 09/19] PPC64/TCG: Implement 'rfebb' instruction
Message-ID: <YRH3dJG5iKPGvrel@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-10-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DoKDLrotvCPMoA3v"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-10-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DoKDLrotvCPMoA3v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:47AM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> An Event-Based Branch (EBB) allows applications to change the NIA when a
> event-based exception occurs. Event-based exceptions are enabled by
> setting the Branch Event Status and Control Register (BESCR). If the
> event-based exception is enabled when the exception occurs, an EBB
> happens.
>=20
> The EBB will:
>=20
> - set the Global Enable (GE) bit of BESCR to 0;
> - set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to the
>   effective address of the NIA that would have executed if the EBB
>   didn't happen;
> - Instruction fetch and execution will continue in the effective address
>   contained in the Event-Based Branch Handler Register (EBBHR).
>=20
> The EBB Handler will process the event and then execute the Return From
> Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
> redirects execution to the address pointed in EBBRR. This process is
> described in the PowerISA v3.1, Book II, Chapter 6 [1].
>=20
> This patch implements the rfebb instruction. Descriptions of all
> relevant BESCR bits are also added - this patch is only using BESCR_GE,
> but next patches will use the remaining bits.
>=20
> Note that we're implementing the extended rfebb mnemonic (BESCR_GE is
> being always set to 1). The basic rfebb instruction would accept an
> operand that would be used to set GE.
>=20
> [1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h       | 12 ++++++++++++
>  target/ppc/translate.c | 21 +++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index afd9cd402b..ae431e65be 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -358,6 +358,18 @@ typedef struct ppc_v3_pate_t {
>  #define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
>  #define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
> =20
> +/* EBB/BESCR bits */
> +/* Global Enable */
> +#define BESCR_GE PPC_BIT(0)
> +/* External Event-based Exception Enable */
> +#define BESCR_EE PPC_BIT(30)
> +/* Performance Monitor Event-based Exception Enable */
> +#define BESCR_PME PPC_BIT(31)
> +/* External Event-based Exception Occurred */
> +#define BESCR_EEO PPC_BIT(62)
> +/* Performance Monitor Event-based Exception Occurred */
> +#define BESCR_PMEO PPC_BIT(63)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 62356cfadf..afc254a03f 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -2701,6 +2701,26 @@ static void gen_darn(DisasContext *ctx)
>          }
>      }
>  }
> +
> +/* rfebb */
> +static void gen_rfebb(DisasContext *ctx)

Oof.. not necessarily a nack, but it would be nice to implement any
new instructions using the disastree path rather than the old ppc
specific decode logic.

> +{
> +    TCGv target =3D tcg_temp_new();
> +    TCGv bescr =3D tcg_temp_new();
> +
> +    gen_load_spr(target, SPR_EBBRR);
> +    tcg_gen_mov_tl(cpu_nip, target);
> +
> +    gen_load_spr(bescr, SPR_BESCR);
> +    tcg_gen_ori_tl(bescr, bescr, BESCR_GE);
> +    gen_store_spr(SPR_BESCR, bescr);
> +
> +    ctx->base.is_jmp =3D DISAS_EXIT;
> +
> +    tcg_temp_free(target);
> +    tcg_temp_free(bescr);
> +}
> +
>  #endif
> =20
>  /***                             Integer rotate                         =
   ***/
> @@ -7724,6 +7744,7 @@ GEN_HANDLER(popcntd, 0x1F, 0x1A, 0x0F, 0x0000F801, =
PPC_POPCNTWD),
>  GEN_HANDLER(cntlzd, 0x1F, 0x1A, 0x01, 0x00000000, PPC_64B),
>  GEN_HANDLER_E(cnttzd, 0x1F, 0x1A, 0x11, 0x00000000, PPC_NONE, PPC2_ISA30=
0),
>  GEN_HANDLER_E(darn, 0x1F, 0x13, 0x17, 0x001CF801, PPC_NONE, PPC2_ISA300),
> +GEN_HANDLER_E(rfebb, 0x13, 0x12, 0x04, 0x03FFF001, PPC_NONE, PPC2_ISA207=
S),
>  GEN_HANDLER_E(prtyd, 0x1F, 0x1A, 0x05, 0x0000F801, PPC_NONE, PPC2_ISA205=
),
>  GEN_HANDLER_E(bpermd, 0x1F, 0x1C, 0x07, 0x00000001, PPC_NONE, PPC2_PERM_=
ISA206),
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DoKDLrotvCPMoA3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER93QACgkQbDjKyiDZ
s5JN0Q//XCIBy1Aeqrmotg1CCwajWkoI8i+zpkhaXxf3hMoIMXBKkwoW0Nrji6CX
DWJKZtBgN8AtlEVe4NJQOifZXyqPoagXZHWBsOZHWeL3LTFrK6powYAcxZwNHOIJ
5y5WUTYGvogRZpDKfKIsN/xOuvzfURwT0h6Ah0+TG0AYgCeEqiSIRVatDewiGMi1
0uBKzHsuZ/PbJK/QHAw6hox2eG/PEC8pUtMg0WjQK+2Vt9+9s+NTdfC26Arfg9o7
0Bhq6L+0EDa9QmBQAXveHpWCrbh3JRRWoIC3bMrVH9gG+ac5DSjB/NwUI8OvT5aj
QKR0H2Jb7YhGqtbynymmAkjtxMIEhdTxgk/2HUfE0iAUtXUnq+XbUmIDzqhzUnR3
1fBG3MdaN10uZP+dcrVNoGABXuTvf1chsiPsvB9ZXcP3cl8UdQWaKEbAq2dPgwYG
6fQ/jm/6e9FZJV46IB/zLYjn52Fe4LznbJgX5rKKly7bWpWGrZNILkdSVwvEoCPM
7o6+AXYuL0A4Fp6gOCi1p8ViMpDi72lQgKpD/mgJ4kl1A4rShw9eiYFgs7Hmk+MN
LniBD5GqZXnujuvQnImxB4BTMtRYJx0nwkBHpuwedsWLPfNTM62nN/WrHgkYV9o8
T0OPRjSQdK9JbmJNMmPlZaO4+B8mP1FC/VIXmX+Iu01dKLGROxg=
=W+1n
-----END PGP SIGNATURE-----

--DoKDLrotvCPMoA3v--

