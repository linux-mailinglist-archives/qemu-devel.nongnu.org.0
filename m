Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7838F901
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:50:18 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llO5B-0005iq-IK
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llO3j-0004sx-8d; Mon, 24 May 2021 23:48:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33251 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llO3g-0000mV-NN; Mon, 24 May 2021 23:48:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fq0Rg2rHjz9sT6; Tue, 25 May 2021 13:48:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621914511;
 bh=9Xyj4pBPHcI+erXmFD5ruuXT47q0j/AUmkPrNwq/5kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jb2EVX4botOXObSxgWCEwhGhTa4OP2BfqzmLts3DfSL9Evc2oqMM19++H70VNwG7w
 3mGE0LBAn2mExVX0GB7NEJ7AS7R4hDsnlzK1V5UFTpHTQds/Uk0PtnFGm8LPQNeMgD
 Ays6RGVSlB18ZVkOifcLbPqe8DAI9KNrwNqfWlWU=
Date: Tue, 25 May 2021 13:15:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 4/9] target/ppc: overhauled and moved logic of storing
 fpscr
Message-ID: <YKxr3TXsYbh58/M4@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-5-bruno.larsen@eldorado.org.br>
 <1d9a521f-4f1a-e91b-fe1a-4f0e14cebd6c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0oIf8qj+/4br9YxR"
Content-Disposition: inline
In-Reply-To: <1d9a521f-4f1a-e91b-fe1a-4f0e14cebd6c@linaro.org>
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0oIf8qj+/4br9YxR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 07:01:20PM -0700, Richard Henderson wrote:
> On 5/21/21 1:17 PM, Bruno Larsen (billionai) wrote:
> > +    uint32_t mask =3D 1u << bit;
> > +    if (env->fpscr & mask) {
> > +        ppc_store_fpscr(env, env->fpscr & ~mask);
>=20
> Oops, missed this during review but:
>=20
>   fpscr & ~(target_ulong)mask;
>=20
> Otherwise we clear high bits of fpscr incorrectly.

Oops, good point.  I've removed the previous version from ppc-for-6.1,
and I'll wait for a respin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0oIf8qj+/4br9YxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCsa9sACgkQbDjKyiDZ
s5Km7Q//WVnTKQ56XeFOpg3mJUIRg7LRXLCegO8mNK+DNcPO51kdx0fQn6W+yrEy
NC284fA4v0eghTJByDHOhldiZUgCa8xKileSz6/ecwOhr9LSkpWRJHwxMlVmf4Ux
+19NH+3sb8Y0mpF0nPcp4pgBuzYnIzb7oi9DpCBOr91b44w5yCwNvunvU3OQEpo+
5rkS2YM5arb3k6QHGxOL7WaI1ApisgrilAeDxI4lv9obiLeJxpQkIEWmbzhaSdRM
pmzuNvydPXKMmUdWFOs/CXPj177q5dDiZ6BXeuWznFq31E64GAwbngNZThP1RDlW
kbqzTV7oqBJs+ftlBzQHJAokuzgI5Y9x+1q1MZOFGTqTR/mxTlktmaME4zcT0JTR
OH/1m9em/wPznIUQnalHuWeOvv5hYgfvad8c4Txoiy0lGgXGEkHzZSTKTlTdVMHH
/mk5BpM+WASLzdqCkblbmkd5SrFa6VJAQ7XnEjotTAXbKIHjZg5EGU0Op7+Ga8xB
zNRdLoLMM1UU8ZPn/IL8mnpTBU6Z/BOiyOKDQY7QaJGp+1TP615IbHP15p+NMJ5j
PTLzbWHUDkkvmnFymtCnQdZj6b7hauKY4nsp+P7Drw/jgQic2ggr2bH/lDYaUFkH
qqhjVdwAHj2ol8Httv8FOWDKuLzUPBZ8pSS/Mjaqp9GM7BJwuAA=
=rmXo
-----END PGP SIGNATURE-----

--0oIf8qj+/4br9YxR--

