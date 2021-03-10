Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F50333465
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:32:00 +0100 (CET)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqVr-0005Gr-PP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqC4-00063y-LJ; Tue, 09 Mar 2021 23:11:34 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:38359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqC2-00050h-P3; Tue, 09 Mar 2021 23:11:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJYC6D1Pz9sVS; Wed, 10 Mar 2021 15:11:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349487;
 bh=+8/CZbY679IWcjpoppt29IyZpYE5N74xAfnyTu5q9gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kY1IhKqAaSPGPkYyozO9IWQsR2JH6HGz8qcWjJapEyYdjxqbABYKvDP+bPNbuH4GM
 COuPZCUKwrt7kC227GDsV63ojji+TRQGVxdK9s9odwK2aHqjLlZeaxge5qR1yfTz3p
 Axd9JxZFZAryN8LMnilX28WcJQZ6mQf5DgnmmsIg=
Date: Wed, 10 Mar 2021 15:11:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
Message-ID: <YEhG55fkPxHpQPfW@yekko.fritz.box>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <YEcHxEvVPPO85BGE@yekko.fritz.box>
 <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/GrUe9PVAN5JEkEo"
Content-Disposition: inline
In-Reply-To: <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/GrUe9PVAN5JEkEo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 06:28:44PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 09/03/2021 16:29, David Gibson wrote:
>=20
>=20
> > > > > +struct ClientArchitectureSupportClass {
> > > > > +    InterfaceClass parent;
> > > > > +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
> > > > > +    void (*quiesce)(void);
> > > >=20
> > > > Is there actually any real connection of quiesce behaviour to cas
> > > > behaviour?  Basically, I'm wondering if this is not so much about
> > > > client-architecture-support fundamentally as just about
> > > > machine-specific parts of the VOF behaviour.  Which would be fine, =
but
> > > > suggests a different name for the interface.
> > >=20
> > > The most canonical way would be having 2 interfaces.
> >=20
> > Why?  I don't see any reason these shouldn't be a single interface, it
> > just has a bad name.
>=20
> I renamed it to SpaprVofInterface for now.

It doesn't really have anything to do with PAPR, though.  Well, I
guess the CAS part does, but quiesce doesn't.  I'd suggest
"VofMachineInterface" - it represents where VOF needs to interact with
machine type specifics.

> > [snip]
> > > > > +typedef int size_t;
> > > > > +typedef void client(void);
> > > > > +
> > > > > +/* globals */
> > > > > +extern void _prom_entry(void); /* OF CI entry point (i.e. this f=
irmware) */
> > > > > +
> > > > > +void do_boot(unsigned long addr, unsigned long r3, unsigned long=
 r4);
> > > > > +
> > > > > +/* libc */
> > > > > +int strlen(const char *s);
> > > > > +int strcmp(const char *s1, const char *s2);
> > > > > +void *memcpy(void *dest, const void *src, size_t n);
> > > > > +int memcmp(const void *ptr1, const void *ptr2, size_t n);
> > > > > +void *memmove(void *dest, const void *src, size_t n);
> > > > > +void *memset(void *dest, int c, size_t size);
> > > > > +
> > > > > +/* Prom */
> > > > > +typedef unsigned long prom_arg_t;
> > > > > +int call_prom(const char *service, int nargs, int nret, ...);
> > > >=20
> > > > AIUI this isn't so much about calling the PROM, since this *is* the
> > > > PROM code, but rather about calling the parts that are implemented =
on
> > > > the qemu side.  Different names might clarify that.
> > >=20
> > > "call_ci"?
> >=20
> > Works for me.
>=20
> call_ci() it is then.
>=20
> About builtins such as memcmp() - turns out these are not really builtins=
 as
> they are not inlined and gcc/ld still want to link against libc which is
> trickier for such firmware (not quite sure how to do this and keep it sma=
ll
> and not pull other libc stuff in), gcc just knows about them a bit more.
> This is different from, for example, __builtin_ctz which is inlined. So I=
 am
> keeping my libc.o for now.
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/GrUe9PVAN5JEkEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBIRucACgkQbDjKyiDZ
s5JvPRAAj0eDUrB0QYJ+8IZKV7S1TLp318uj+cJhehoIGbe2uCuSECGyQoNapIUA
fc6ErdP98GIR6dAKQC4J2kzisGzrg65qUJJT334+m0ONrs+4oSiD60hLzXvPVRId
erlwrkbyoDPgDZLGEkDX/y6Xx2wUJ8Q68HJZK4pWvZDb7dNQn07aWh3iz2qKhPqh
WhUsFyUzZvyPulILbb60JNpv2uDTZkcmflfAQqrkRcbqLLDD2oBtu1+TkSQJMBnT
GT6b7POkw2ArE8Zcd21P8G7zjPTbAqo1yS8QEorGMt9fO4qffyBl3Pl37Zrjxstr
7vrKeZ7LTIWgk+jzmAGuk2ltifHXrIenWHoCLk6L/Sy1kG8JRBMb/4ScYSbtpgnf
S2IsdQnMNAIeaLVan17qaIP/9rYjSLO+RcM2BQAWkCcet36DRyafzEblaAn4rzfH
R+nRroLahikGN6jCbGGVwzh3DpGg5VJomcRgLsKJ9ws7uuAMm9T9qseWvkSQ2AGp
EObkd7Iu65IS9mVwdIreknWepURePYPJ2dCZF8k0yOuds4ZJryiipPEOheNDfk6u
YQ8GqnGYb38+aa81qrfija/JrjKsTmrp33+hxG/Whhq0Oslw/nM0Bi5oA0+rnTLD
w1N4r23YzcMSVpntDKyKIC4YRy/UHLTc2aBoFlIVKYMKQyVSNkQ=
=WSAC
-----END PGP SIGNATURE-----

--/GrUe9PVAN5JEkEo--

