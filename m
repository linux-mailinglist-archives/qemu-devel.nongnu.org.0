Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6952EA486
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 05:41:05 +0100 (CET)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwe9Y-0005n6-Du
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 23:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwe8D-0005Fe-4y; Mon, 04 Jan 2021 23:39:41 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:43021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwe8A-0001VM-2J; Mon, 04 Jan 2021 23:39:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D90Bn5dBHz9sVr; Tue,  5 Jan 2021 15:39:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609821553;
 bh=c+GcTmZtvIasah9dCh1bO5JOElH4uUSN2cf8fJHU20M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ebirMosc1cWfHrr/epfoNvvu1Nv13mxeZXi2vrxcLunMPwFBxPEaZ0SPtPEPfo05M
 0pVleOAsXTRc0SkuFzJ2Cp82crJeB3rL9ANz+B/S1D6JGWqkWcFPRwNZQ+qFSa3NT9
 CgJZnN7tzy5elGEH1mOCNvfEkAmBobyAg2rKNsug=
Date: Tue, 5 Jan 2021 15:39:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Gustavo Romero <gromero@linux.ibm.com>
Subject: Re: [PATCH v2 1/7] target/ppc: Add infrastructure for prefixed
 instructions
Message-ID: <20210105043904.GA3209@yekko.fritz.box>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
 <20201216090804.58640-2-gromero@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <20201216090804.58640-2-gromero@linux.ibm.com>
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
Cc: peter.maydell@linaro.org, gustavo.romero@protonmail.com,
 qemu-devel@nongnu.org, mroth@lamentation.net,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-ppc@nongnu.org, clg@kaod.org,
 alex.bennee@linaro.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 06:07:58AM -0300, Gustavo Romero wrote:
> From: Michael Roth <mdroth@linux.vnet.ibm.com>
>=20
> Some prefixed instructions (Type 0 and 1, e.g. 8-byte Load/Store or 8LS),
> have a completely seperate namespace for their primary opcodes.
>=20
> Other prefixed instructions (Type 2 and 3, e.g. Modified Load/Store or ML=
S)
> actually re-use existing opcodes to provide a modified variant. We could
> handle these by extending the existing opcode handlers to check for the
> prefix and handle accordingly, but in some cases it is cleaner to define
> seperate handlers for these in their own table entry, and avoids the need
> to add error-handling to existing handlers for cases where they are called
> for a prefixed Type 2/3 instruction but don't implement the handling for
> them. In the future we can re-work things to support both approaches if
> cases arise where that seems warranted.
>=20
> Then we have the normal non-prefixed instructions.
>=20
> To handle all 3 of these cases we extend the table size 3x, with normal
> instructions indexed directly by their primary opcodes, Type 0/1 indexed =
by
> primary opcode + PPC_CPU_PREFIXED_OPCODE_OFFSET, and Type 2/3 indexed by
> primary opcode + PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET.
>=20
> Various exception/SRR handling changes related to prefixed instructions a=
re
> yet to be implemented. For instance, no alignment interrupt is generated =
if
> a prefixed instruction crosses the 64-byte boundary; no SRR bit related to
> prefixed instructions is set on any interrupt, like for FP unavailable
> interrupt, data storage interrupt, etc.
>=20
> For details, please see PowerISA v3.1, particularly the following section=
s:
>=20
> 1.6 Instruction Formats, p. 11
> 1.6.3  Instruction Prefix Formats, p. 22
> 3.3.2  Fixed-Point Load Instructions, p. 51
> 4.6.2  Floating-Point Load Instructions, p. 149
> Chapter 7 Interrupts, p. 1247
>=20
> Signed-off-by: Michael Roth <mroth@lamentation.net>
> [ gromero: - comments clean up and updates
>            - additional comments in the commit log ]
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>

I'm still not seeing any advantage to putting both the plain and
prefixed opcodes into a single table.  Essentially you're taking the
prefix and base opcode and encoding them into a single index.  Which
isn't inherently wrong, except that the only thing you do with that
single index is effectively decode it back into the original two
parts.

More specifically

[snip]
> +static uint32_t opc1_idx(DisasContext *ctx)
> +{
> +    uint32_t table_offset =3D 0;
> +
> +    switch (ctx->prefix_subtype) {
> +    case PREFIX_ST_8LS:
> +    case PREFIX_ST_8MLS:
> +    case PREFIX_ST_8RR:
> +    case PREFIX_ST_8MRR:
> +        table_offset =3D PPC_CPU_PREFIXED_OPCODE_OFFSET;
> +        break;
> +    case PREFIX_ST_MLS:
> +    case PREFIX_ST_MMLS:
> +    case PREFIX_ST_MRR:
> +    case PREFIX_ST_MMRR:
> +    case PREFIX_ST_MMIRR:
> +        table_offset =3D PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET;
> +        break;
> +    }
> +
> +    return table_offset + opc1(ctx->opcode);
> +}

Here, you translate the prefix type into a table offset, but...

> +
>  static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> @@ -8004,14 +8142,40 @@ static void ppc_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cs)
> =20
>      ctx->opcode =3D translator_ldl_swap(env, ctx->base.pc_next,
>                                        need_byteswap(ctx));
> +    /* check for prefix */
> +    ctx->prefix_subtype =3D parse_prefix_subtype(ctx->opcode);
> +    if (ctx->prefix_subtype =3D=3D PREFIX_ST_INVALID) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "invalid/unsupported prefix: "
> +                      "%08x " TARGET_FMT_lx "\n",
> +                      ctx->prefix, ctx->base.pc_next);
> +    } else if (ctx->prefix_subtype !=3D PREFIX_ST_NONE) {
> +        /*
> +         * this is the 4-byte prefix of an instruction, read the
> +         * next 4 and advance the PC
> +         *
> +         * TODO: we can optimize this to do a single load since we
> +         * read in target_long anyways already
> +         *
> +         * double-check endianess cases.
> +         *
> +         * engineering note about endianess changing based on rfid
> +         * or interrupt. does this need to be accounted for here?
> +         */
> +        ctx->prefix =3D ctx->opcode;
> +        ctx->base.pc_next +=3D 4;
> +        ctx->opcode =3D translator_ldl_swap(env, ctx->base.pc_next,
> +                                          need_byteswap(ctx));
> +    } else {
> +        ctx->prefix =3D 0;
> +    }
> =20
> -    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
> +    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) prefix %08x (=
%s)\n",
>                ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
> -              opc3(ctx->opcode), opc4(ctx->opcode),
> +              opc3(ctx->opcode), opc4(ctx->opcode), ctx->prefix,
>                ctx->le_mode ? "little" : "big");
>      ctx->base.pc_next +=3D 4;
>      table =3D cpu->opcodes;
> -    handler =3D table[opc1(ctx->opcode)];
> +    handler =3D table[opc1_idx(ctx)];

Here, at the only caller, you already have some conditionals on prefix
type, so you could equally well just use a different table.

>      if (is_indirect_opcode(handler)) {
>          table =3D ind_table(handler);
>          handler =3D table[opc2(ctx->opcode)];
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index bb66526280..0ea8c2c5c1 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -9563,8 +9563,13 @@ static int insert_in_table(opc_handler_t **table, =
unsigned char idx,
>  }
> =20
>  static int register_direct_insn(opc_handler_t **ppc_opcodes,
> -                                unsigned char idx, opc_handler_t *handle=
r)
> +                                unsigned char idx, opc_handler_t *handle=
r,
> +                                bool prefixed, bool modified)
>  {
> +    if (prefixed) {
> +        idx =3D modified ? idx + PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET
> +                       : idx + PPC_CPU_PREFIXED_OPCODE_OFFSET;
> +    }
>      if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
>          printf("*** ERROR: opcode %02x already assigned in main "
>                 "opcode table\n", idx);
> @@ -9688,7 +9693,8 @@ static int register_insn(opc_handler_t **ppc_opcode=
s, opcode_t *insn)
>              }
>          }
>      } else {
> -        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler=
) < 0) {
> +        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler,
> +                                 insn->prefixed, insn->modified) < 0) {
>              return -1;
>          }
>      }
> @@ -9766,6 +9772,7 @@ static void dump_ppc_insns(CPUPPCState *env)
>      for (opc1 =3D 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
>          table =3D env->opcodes;
>          handler =3D table[opc1];
> +        /* TODO: need to update opcode dump to account for prefixed spac=
e */
>          if (is_indirect_opcode(handler)) {
>              /* opc2 is 5 bits long */
>              for (opc2 =3D 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++=
) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/z7WUACgkQbDjKyiDZ
s5JPwhAAtNAXJFjHbdEqOJfbopqibF9tahuzn7EyCKqi+fsKEYf4h1hsY2GyyrhH
KShgtlKDxZpdfD1kWomvGiAyVlk5YFjMpecDk8iQgLndlA4aX44rveNF0/KbY4w8
/2+4kuyM57E/oVAtg3bKvI0F9xa/6pQCtXq/E4jn14KDbnhVHVZchA/a/mCVsYTw
fFeHXmGNmMr+AiinKNI7TefZeozcnFlY5iocG+51go1k+3W1C72ArGpcs2IcDCdp
oZnO9yRSuydobLtpj1q/AgWAFUj/wsOWAl1I7B9BlL2Q/ZqxipuUPhacldRPE5+U
BKSYBxj3WcW3p9YfKZmKbm3TDyt6IbtSz9uP/CekVlhvGY7V3QR1ZDNMNMmGfUUt
+dQB50r4Ij8pJQSpy4EUMQgSHk6sLm1POGd8Qv0WXpMS+ZYZiuEl2orCzRqlDAy4
q0hG5Su08wAY3SmOPHo1Pg28dDmtkJuk9Spa75Wt0gXowr4Qtdjf6nn4tfFC5PDi
7ry4wMm968phFuHNkODFZ1yT7EbyvFhscFCGsvvPVBqevo70XqVdKNm6K0ybdcYL
jOLktMpVy89YCcwQgzNgkRkZjjRJ+V4w9Ogld6IypU30q7D5lO+N+en6uUZcyI0o
nF9cIkogg6WWGoklmHv5ob1S5OhZ0R4S+NRVCT43YCyi9YmP+qc=
=Kuvl
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

