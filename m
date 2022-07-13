Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606B572D93
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:46:11 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVCM-0007Ff-6c
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oBV5q-0003Jt-RW; Wed, 13 Jul 2022 01:39:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oBV5m-0003Ns-At; Wed, 13 Jul 2022 01:39:25 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4LjRJN2yYxz4ySb; Wed, 13 Jul 2022 15:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1657690756;
 bh=Q34b5c40O/eJ0DG3UhjilEfaFsBD2+aIpCR5vuUuW+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RxGS1bw5TgdJ6SsNZJ1e5mix9vBKYVSH0r7P5+VSpEJAnkVsPfIztTOfsO3U4HGRG
 h1BRBFW1RKj+5gs9ntkayhxoazaR7fVL0aMR2As+MvroninhixtBVgc8MKLiEgXijS
 1pyMpU60aje2ZrFE9OWAm0s1ZIv9xkp5YZHKTIIY=
Date: Wed, 13 Jul 2022 12:21:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, groug@kaod.org
Subject: Re: [RFC PATCH] target/ppc: don't print TB in ppc_cpu_dump_state if
 it's not initialized
Message-ID: <Ys4sIPFmV3CAizpL@yekko>
References: <20220712192505.127375-1-matheus.ferst@eldorado.org.br>
 <59ca7363-455a-0181-afc0-63a391cdd19d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CuqBqrVdtbbKLEJV"
Content-Disposition: inline
In-Reply-To: <59ca7363-455a-0181-afc0-63a391cdd19d@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CuqBqrVdtbbKLEJV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 06:13:44PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 7/12/22 16:25, Matheus Ferst wrote:
> > When using "-machine none", env->tb_env is not allocated, causing the
> > segmentation fault reported in issue #85 (launchpad bug #811683). To
> > avoid this problem, check if the pointer !=3D NULL before calling the
> > methods to print TBU/TBL/DECR.
> >=20
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
> > Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > ---
> > This patch fixes the reported problem, but may be an incomplete solution
> > since many other places dereference env->tb_env without checking for
> > NULL. AFAICS, "-machine none" is the only way to trigger this problem,
> > and I'm not familiar with the use-cases for this option.
>=20
> The "none"  machine type is mainly used by libvirt to do instrospection
> of the available options/capabilities of the QEMU binary. It starts a QEMU
> process like the following:
>=20
> ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults \
>       -nographic -machine none,accel=3Dkvm:tcg -daemonize
>=20
> And then it uses QMP to probe the binary.
>=20
> Aside from this libvirt usage I am not aware of anyone else using -machine
> none extensively.

Right.  -machine none basically cannot work as a real machine for
POWER (maybe some other CPUs as well).  At least the more modern POWER
CPUs simply cannot boot without a bunch of supporting board/system
level elements, and there's not really a sane way to encode those into
individual emulated devices at present (maybe ever).

One of those things is that POWER expects the timebases to be
synchronized across all CPUs in the system, which obviously can't be
done locally to a single CPU chip.  It requires system level
operations, which is why it's handled by the machine type

[Example: a typical sequence which might be handled in hardware by
 low-level firmware would be to use machine-specific board-level
 registers to suspend the clock pulse to the CPUs which drives the
 timebase, then write the same value to the TB on each CPU, then
 (atomically) restart the clock pulse using board registers again]
=20
> > Should we stop assuming env->tb_env !=3D NULL and add checks everywhere?
> > Or should we find a way to provide Time Base/Decrementer for
> > "-machine none"?
> > ---
>=20
> Are there other cases where env->tb_env can be NULL, aside from the case
> reported in the bug?

If there are, I'd say that's a bug in the machine type.  Setting up
(and synchronizing) the timebase is part of the machine's job.

> I don't mind the bug fix, but I'm not fond of the idea of adding addition=
al
> checks because of this particular issue. I mean, the bug is using  the 'p=
rep'
> machine that Thomas removed year ago in b2ce76a0730. If there's no other
> foreseeable problem, that we care about, with env->tb_env being NULL, IMO
> let's fix the bug and move on.
>=20
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
>=20
>=20
> >   target/ppc/cpu_init.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index 86ad28466a..7e96baac9f 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -7476,18 +7476,18 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, =
int flags)
> >                    "%08x iidx %d didx %d\n",
> >                    env->msr, env->spr[SPR_HID0], env->hflags,
> >                    cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> > -#if !defined(NO_TIMER_DUMP)
> > -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> > +    if (env->tb_env) {
> > +        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> >   #if !defined(CONFIG_USER_ONLY)
> > -                 " DECR " TARGET_FMT_lu
> > +                     " DECR " TARGET_FMT_lu
> >   #endif
> > -                 "\n",
> > -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> > +                     "\n",
> > +                     cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> >   #if !defined(CONFIG_USER_ONLY)
> > -                 , cpu_ppc_load_decr(env)
> > -#endif
> > -        );
> > +                     , cpu_ppc_load_decr(env)
> >   #endif
> > +            );
> > +    }
> >       for (i =3D 0; i < 32; i++) {
> >           if ((i & (RGPL - 1)) =3D=3D 0) {
> >               qemu_fprintf(f, "GPR%02d", i);
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CuqBqrVdtbbKLEJV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLOLBoACgkQgypY4gEw
YSJyCw/+K1EJuFwxJ5fMBMtGaZ83ifYr8+YhlEdrTPUOC4LoISOFRmB+KsJJ0y4B
Vy/bwIIZ/RxV73DPSpBXSS1gXqJMS1LWrczxltvD5l0XE93l+NliQmsmMAzjxH3+
G77KDURalamyJDUlDwt7k30u+ze1Kz2WiE3PgZEnV0Pe1x7ISRoZQXewTpmJdwzO
E3/AzOW7TKBnXdpjjpKXPC/fgDe2OUoGT7vVJk9I9jtECuoR72/K0taEFQd/PmdT
Aoic0IpglIISX7cfi/W5Cly0OmTh6I0SoP+ctvwreWI992mJZq5+qfj8btnAP4Cr
4CZ01dRoG6goilEi0yVebCqDmDOa+2ZoybK1/rTZ4FONF7+4ZSMYOfzjYbJw35X4
Rbds+iWx4JfhiZSSs6Kd93Uc/K9Izup9U/A7zagqFxebzKaIFNLcSdztrjXpEDDX
g8KUKIh2xF/e2TOBk5AAqCrjAvoxAro3Gyiv5MLpuaP5nmYIuZeZ8cyivWb63UG6
wlix95tdvOTFVTUcCJ1qVUeWyKSSLGhM5pyqV3S3J9pEt4mkbVvp+ZyYHa4MPm84
p3lQOLEZeHaCxB5YXdu53P6h9YI+m7CbPiVM1eySXlyNkgz6+7mlBR6irf0nJX63
1FSEquro0q3vxLNJNBILTsuvBv06dCNWJNnJgrv/Ew6pUoZYQg4=
=+PIU
-----END PGP SIGNATURE-----

--CuqBqrVdtbbKLEJV--

