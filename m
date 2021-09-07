Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD184021E4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:18:22 +0200 (CEST)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQgn-0006hb-GZ
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQar-0002op-H6; Mon, 06 Sep 2021 22:12:13 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQao-0000uq-V9; Mon, 06 Sep 2021 22:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630980726;
 bh=B5yk7uobyQj92jmtnbSULoVL79aQ6TGCYmpnRJRfhC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fe7o/VDuSgeJ/IXtYVvIjqmqwpV2xhNrnZ6QlvDgxLFtWKxoMWKQdAhZ1gNoQzqtP
 2QF44CehWHkohoUmE4eca07QGKR0La24N+WioXzJsbMfurjM1y96h0jMjt/HauYDru
 Rg+TzWWJ0TPmxH0REbZp2tIzi7CNlYiell5t4JMY=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3TKy1Qkwz9sW8; Tue,  7 Sep 2021 12:12:06 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:27:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 01/15] target/ppc: add user read functions for MMCR0
 and MMCR2
Message-ID: <YTa/6KluMBiMN5n7@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3J9xu6EKgm6n5/Zj"
Content-Disposition: inline
In-Reply-To: <20210903203116.80628-2-danielhb413@gmail.com>
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3J9xu6EKgm6n5/Zj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 05:31:02PM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
> emulation and following PowerISA v3.1.
>=20
> Let's start by handling the user read of UMMCR0 and UMMCR2. According to
> PowerISA 3.1 these registers omit some of its bits from userspace.
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

LGTM except for one nit...

[snip]
> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    /*
> +     * On read, filter out all bits that are not FCnP0 bits.
> +     * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
> +     * problem state programs read/write access to MMCR2,
> +     * only the FCnP0 bits can be accessed. All other bits are
> +     * not changed when mtspr is executed in problem state, and
> +     * all other bits return 0s when mfspr is executed in problem
> +     * state, according to ISA v3.1, section 10.4.6 Monitor Mode
> +     * Control Register 2, p. 1316, third paragraph.
> +     */
> +    gen_load_spr(t0, SPR_POWER_MMCR2);
> +    tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);

A #define for this mask... and #defines with meaningful names for the
various bits it includes would be nice.

> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> +
> +    tcg_temp_free(t0);
> +}
> +
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>  void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3J9xu6EKgm6n5/Zj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2v+gACgkQbDjKyiDZ
s5JLkg//S3SK88unVMQC29AOfo/1aLBFYHcLyshmuwrXqEi+XJXYpUkZ5LwNIT/D
dht0GXRFz+e9w5iZYElAiW+OPnogzVu2FLILyuDjLrslRBNu1ZnhmsojQy7cnpqb
/j1uc9mUvZ9DXYcM885sZSNKPVUDTYp9ifvLnIGi7F6gCPeqxYxIhEZ1uJzGy6YF
lmhpERJb8fZjQTg+YIyP+tZ6rBoItXJUoHqKZkmpsoOmnAWCQhVPzJ/FXY1AhC1C
ncmnar2s5u+j79BwX/QSxnvjA+6OzYmxQH6CxL+fqEWdgq7W6JnaR7JGaT5hE5UB
0LEwZCYz7ZpYgQ12miNoJ3IldCO0acYWLNNvVb8ipgoKpQtqP8p4bS8AXkY7OGJp
J53RZzmRrYmHVky1qpG6Ulizlp3G2ncbN9TQNKH2YWbIhA9q7/mv+xSxhuESeUNm
/7qR3fvTk3Tz2pcTJ/pkY6JESAQIaUjN9J895oMNItx0F5ysml7B3RM2yD0vLJkU
cH0R0RF6hTln9UKBmzPjLPBMMyRXFuNyK7tzI/rRss12JTPMwoRqEiKmTCLRI3xK
D16egzghtm/0kG8WAlnNoTFkKmx1NhEwKzBy1LYHn9Mcb5dvZBnqrEHAHj6aE4iA
6uyEz1MIfT/HaOzcKuYA0ZmdC5E3gAElSl4gUfDTR61m+qXXTEI=
=dob/
-----END PGP SIGNATURE-----

--3J9xu6EKgm6n5/Zj--

