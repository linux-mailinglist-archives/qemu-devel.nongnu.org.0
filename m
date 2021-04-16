Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51936187E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:02:18 +0200 (CEST)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXFgP-0003sQ-De
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXFdE-0001eM-3h; Thu, 15 Apr 2021 23:59:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43493 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXFdA-0002jR-Ml; Thu, 15 Apr 2021 23:58:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM2WW6Jddz9sVv; Fri, 16 Apr 2021 13:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618545527;
 bh=lPmvv/NsV2jRysvKcWXqpxXoZPkNJRt60sfUA6yxBhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQ6V80R3CFdEVPkeu066iP0KfFCXOyM88XOxudQ2xto6B68iC8sBoWnbUfgf6BuMa
 /sLQGzhJ4sa+gWTcpbcFjTMHOJ9yp/eTfxnxLDfoCYO+4MTZ+EuPzaVDKeSNGuEWKP
 t6FXpYU7FOBUcvPOF/ISbb0LRvr2uG8XMQx0BVgc=
Date: Fri, 16 Apr 2021 13:44:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Message-ID: <YHkIHYx77a2XHMQN@yekko.fritz.box>
References: <20210414145947.30155-1-bruno.larsen@eldorado.org.br>
 <74b629d5-0b7f-e53c-2d2c-29de23c564b7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BB+Jx1xYgp9s9LWI"
Content-Disposition: inline
In-Reply-To: <74b629d5-0b7f-e53c-2d2c-29de23c564b7@linaro.org>
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br, qemu-devel@nongnu.org,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BB+Jx1xYgp9s9LWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 01:09:19PM -0700, Richard Henderson wrote:
> On 4/14/21 7:59 AM, Bruno Larsen (billionai) wrote:
> > All the code related to gdb has been moved from translate_init.c.inc
> > file to the gdbstub.c file, where it makes more sense.
> >=20
> > This new version puts the prototypes in internal.h, to not expose
> > them unnecessarily.
> >=20
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >   target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++++++
> >   target/ppc/internal.h           |   5 +
> >   target/ppc/translate_init.c.inc | 254 +------------------------------
> >   3 files changed, 264 insertions(+), 253 deletions(-)
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

>=20
> > +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
> > +{
> > +
> > +    if (pcc->insns_flags & PPC_FLOAT) {
>=20
> Watch the extra blank lines.

Fixed in my tree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BB+Jx1xYgp9s9LWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5CBsACgkQbDjKyiDZ
s5L8+hAA0G6tHPJAqRPcUKPstIwJHXg7OTf5w1fTeZgKp4edvjIJW2KUPGaUEn2/
eJOgpoNaHlB9ggrRmv7tebErB6eyIv7/6FFpkrTi2V0cCMNiRJMFAFaGrJTaFOTu
KD2teBRkbVtYmFt7PvINV4iwM5CqndG/kMUFZZXcBDGJiMI9J+pNoRI95tmpOEEe
q4J6oWkExL1iEJ9YQR1ykrrC0TI3FqbZIHPjvlkWlfU8mdE8JM/8YHAz1Woxn6yz
5t7rz09w7ikdGGm1e0ixmHyAGaVlcZvhDq0cwdHegjezmKjfkNBgWL5f4ochhxCI
KrUIpipO4xSq5dIKR+uR+NKcP4TQ954KsXTowgiO3ETr/VeA4pVcZdnccX14BAdD
jgkXL0CBhjPIagBKHY18sWt8X0XL9eBRZsd7vQ/UHszR3nAaF2dwQUMSpy1eSsNP
QOfJJkJEjXatZ/NwMVdIwHKxjbWFvOJvgEhtprqxGf06Bj/HR2CP5q6XQzfwXpQi
cYy47gzT07F7AqJRHrYgcg1QWdict13IpSDakQQPpeksS+fVoUbF1GmRZMkLhgcr
p4bBeVCI3rTz/8w5eZ7S3OJWnFGpsz9pysbSJgUYw6/fM1oOHnuJTpT7jJiGy+GR
OeNuoaJ2tKmqvluV+bpfoMmiPI4mLJlZ1TiMOg1tegtZ9YDHOU8=
=sEo5
-----END PGP SIGNATURE-----

--BB+Jx1xYgp9s9LWI--

