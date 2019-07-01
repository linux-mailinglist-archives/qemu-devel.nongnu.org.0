Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AA110BA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 02:46:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLzrs-00027i-Mp
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 20:46:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hLzq4-0001Nn-4Z
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hLzpz-0002WX-CA
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:44:37 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44175)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hLzpx-0002N3-FA; Wed, 01 May 2019 20:44:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 44vc3F1067z9s9T; Thu,  2 May 2019 10:44:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1556757865;
	bh=itszGOCci5sSlkBd5DEnoWyVACZJRtC4cUTN5l3WrVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUjYNltvFmCurESjHfX27esGuC74p3MyrwcfNi9JnMgNXm/msPzWGngX0krzFocEC
	YcmENDvU4lRQ5C+uJNDxRIwFK/raQqf1fy9ZBBRKbpQCaSlfUFYKwkGwXuWx06Y/dD
	x+Y+DwWps4qAn4EwCgwR8H8X7qeJafkWjj82j7vg=
Date: Thu, 2 May 2019 10:43:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20190502004346.GC13618@umbus.fritz.box>
References: <20190501053522.10967-1-sjitindarsingh@gmail.com>
	<20190501053522.10967-2-sjitindarsingh@gmail.com>
	<11cb0515-7a96-99af-f33b-c752603a189d@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <11cb0515-7a96-99af-f33b-c752603a189d@ozlabs.ru>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH 2/2] ppc: Add dump-stack implementation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 07:48:48PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 01/05/2019 15:35, Suraj Jitindar Singh wrote:
> > The monitor function dump-stack is used to dump the stack for a cpu.
> > This can be useful for debugging purposes when the stack cannot be
> > dumped by another means.
> >=20
> > Add a ppc implementation ppc_cpu_dump_stack().
> > The stack pointer is stored in R1 with the back pointer at offset 0 and
> > the link register at offset 2.
> > Also dump the registers from the stack frame if the marker "regshere" is
> > found.
>=20
> Is this a Linux only marker? ABI does not mentioned this.
>=20
> > This only dumps the kernel stack, stopping if a non-kernel address is
> > found in the stack.
>=20
> Why enforce this limit?

It's also making a Linux specific assumption about addresses.

>=20
> >=20
> > Sample output:
> > (qemu) dump-stack
> > sp: 0xc00000007bfc5690 lr: 0xc0000000000974b8
> > sp: 0xc00000007bfc56f0 lr: 0xc00000000065aab4
> > sp: 0xc00000007bfc5720 lr: 0xc00000000065ab04
> > sp: 0xc00000007bfc5740 lr: 0xc0000000000c29b8
> > sp: 0xc00000007bfc57b0 lr: 0xc0000000000bc9e8
> > sp: 0xc00000007bfc57e0 lr: 0xc0000000000bd584
> > sp: 0xc00000007bfc5800 lr: 0xc0000000000bee14
> > sp: 0xc00000007bfc5ac0 lr: 0xc0000000000c2100
> > sp: 0xc00000007bfc5c60 lr: 0xc000000000029460
> > sp: 0xc00000007bfc5ca0 lr: 0xc00000000010b5e8
> > sp: 0xc00000007bfc5d00 lr: 0xc000000000105f34
> > 	trap : 0x0000000000000700
> > 	pc   : 0xc000000000104490
> > 	msr  : 0x9000000002843003
> > 	lr   : 0xc000000000103ffc
> > 	gpr 0: 0x0000000000000001
> > 	gpr 1: 0xc00000005051f530
> > 	gpr 2: 0xc000000001088200
> > 	gpr 3: 0x0000000000000001
> > 	gpr 4: 0xc000000032d60000
> > 	gpr 5: 0xc0000000014b8f00
> > 	gpr 6: 0x0000000000c835e0
> > 	gpr 7: 0x0000000000000000
> > 	gpr 8: 0x0000000000000000
> > 	gpr 9: 0xc000000032f00000
> > 	gpr10: 0x9000000002803033
> > 	gpr11: 0xc000000000b60f00
> > 	gpr12: 0x0000000000002000
> > 	gpr13: 0xc000000001250000
> > 	gpr14: 0x0000000000000000
> > 	gpr15: 0x0000000000000008
> > 	gpr16: 0x0000000000000000
> > 	gpr17: 0xc00000000114f790
> > 	gpr18: 0x00000000ffffffff
> > 	gpr19: 0xc00000005051f8e8
> > 	gpr20: 0x0000000000000001
> > 	gpr21: 0x0000000000000000
> > 	gpr22: 0x0000000000000001
> > 	gpr23: 0x0000000000000001
> > 	gpr24: 0x0000000000000001
> > 	gpr25: 0xc0000000014b8f70
> > 	gpr26: 0x0000000000000000
> > 	gpr27: 0x0000000000000001
> > 	gpr28: 0x0000000000000001
> > 	gpr29: 0x0000000000000000
> > 	gpr30: 0xc0000000014b8f00
> > 	gpr31: 0xc0000000014b8f00
>=20
> Looks bulky, using the "info registers" format would make sense here.
>=20
>=20
> > sp: 0xc00000005051f530 lr: 0x0000000000000000
> > sp: 0xc00000005051f600 lr: 0xc000000000103ffc
> > sp: 0xc00000005051f670 lr: 0xc0000000000f60a8
> > sp: 0xc00000005051f850 lr: 0xc0000000000f18c0
> > sp: 0xc00000005051fa10 lr: 0xc0000000000f5184
> > sp: 0xc00000005051fae0 lr: 0xc0000000000ddf54
> > sp: 0xc00000005051fb00 lr: 0xc0000000000dab9c
> > sp: 0xc00000005051fb90 lr: 0xc0000000000cbf88
> > sp: 0xc00000005051fd00 lr: 0xc0000000003e7480
> > sp: 0xc00000005051fdb0 lr: 0xc0000000003e7ce4
> > sp: 0xc00000005051fe00 lr: 0xc0000000003e7d88
> > sp: 0xc00000005051fe20 lr: 0xc00000000000b3a4
> > 	trap : 0x0000000000000c01
> > 	pc   : 0x00007fffa6c9d8d0
> > 	msr  : 0x900000000280f033
> > 	lr   : 0x0000000010090f40
> > 	gpr 0: 0x0000000000000036
> > 	gpr 1: 0x00007fffa62fdd70
> > 	gpr 2: 0x00007fffa6d57300
> > 	gpr 3: 0x000000000000000d
> > 	gpr 4: 0x000000002000ae80
> > 	gpr 5: 0x0000000000000000
> > 	gpr 6: 0x0000000000000537
> > 	gpr 7: 0x0000000000000000
> > 	gpr 8: 0x000000000000000d
> > 	gpr 9: 0x0000000000000000
> > 	gpr10: 0x0000000000000000
> > 	gpr11: 0x0000000000000000
> > 	gpr12: 0x0000000000000000
> > 	gpr13: 0x00007fffa6306380
> > 	gpr14: 0x0000000000000000
> > 	gpr15: 0x0000000000000001
> > 	gpr16: 0x0000000039ba6928
> > 	gpr17: 0x0000000000000000
> > 	gpr18: 0x0000000000000000
> > 	gpr19: 0x00007fffa6d702f0
> > 	gpr20: 0x00007fffa62fddf0
> > 	gpr21: 0x0000000000000080
> > 	gpr22: 0x0000000000000004
> > 	gpr23: 0x0000000000000000
> > 	gpr24: 0x0000000010ac85c0
> > 	gpr25: 0x0000000000000008
> > 	gpr26: 0x00007fffa62fde10
> > 	gpr27: 0x0000000000000000
> > 	gpr28: 0x0000000000000002
> > 	gpr29: 0x0000000000000000
> > 	gpr30: 0x0000000039ba6900
> > 	gpr31: 0x0000000010ac85c0
> > sp: 0x00007fffa62fdd70
> >=20
> > Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> > ---
> >  target/ppc/cpu.h                |  1 +
> >  target/ppc/translate.c          | 60 +++++++++++++++++++++++++++++++++=
++++++++
> >  target/ppc/translate_init.inc.c |  1 +
> >  3 files changed, 62 insertions(+)
> >=20
> > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > index 5e7cf54b2f..28c4dffca1 100644
> > --- a/target/ppc/cpu.h
> > +++ b/target/ppc/cpu.h
> > @@ -1284,6 +1284,7 @@ struct PPCVirtualHypervisorClass {
> >  void ppc_cpu_do_interrupt(CPUState *cpu);
> >  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> >  void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> > +void ppc_cpu_dump_stack(CPUState *cpu, FILE *f);
> >  void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
> >  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >  int ppc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index 8d08625c33..b162998ce7 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -7705,6 +7705,66 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, i=
nt flags)
> >  #undef RFPL
> >  }
> > =20
> > +struct ppc_pt_regs {
> > +        unsigned long gpr[32];
> > +        unsigned long nip;
> > +        unsigned long msr;
> > +        unsigned long orig_gpr3;
> > +        unsigned long ctr;
> > +        unsigned long link;
> > +        unsigned long xer;
> > +        unsigned long ccr;
> > +        unsigned long softe;
> > +        unsigned long trap;
> > +        unsigned long dar;
> > +        unsigned long dsisr;
> > +        unsigned long result;
> > +};
> > +
> > +void ppc_cpu_dump_stack(CPUState *cs, FILE *f)
> > +{
> > +#if defined(TARGET_PPC64)
> > +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> > +    CPUPPCState *env =3D &cpu->env;
> > +    uint64_t sp, next_sp, lr, buf[4];
>=20
> These are hwaddr really.
>=20
> > +
> > +    /* stack pointer stored in r1 */
> > +    sp =3D env->gpr[1];
> > +
> > +    while (sp && (sp & (0xCUL << 60))) {
> > +        uint64_t marker =3D 0UL;
>=20
> sp =3D ppc_cpu_get_phys_page_debug(cs, sp) | (sp & ~TARGET_PAGE_MASK);
>=20
> and finish the loop when ppc_cpu_get_phys_page_debug returns -1?
>=20
> > +
> > +        /* read and print LR */
> > +        cpu_physical_memory_read(sp & ~(0xCUL << 60), buf, sizeof(*buf=
) * 4);
>=20
> and s/ & ~(0xCUL << 60)//
>=20
> > +        next_sp =3D buf[0];
> > +        lr =3D buf[2];
>=20
> These two need to be converted from guest endian. For a BE guest, I see:
>=20
> sp: 0x000000007e582ff0 lr: 0xe4e60a00000000c0
> sp: 0xffffffffffffffff lr: 0x0000600000006000
> sp: 0x0000600000006000
>=20
>=20
> > +        qemu_fprintf(f, "sp: 0x%.16lx lr: 0x%.16lx\n", sp, lr);
>=20
> HWADDR_PRIx. Or at least PRIx64, otherwise it won't compile on 32bit or
> x86 or somewhere else.
>=20
>=20
> > +        sp &=3D ~(0xCUL << 60);
>=20
> and remove this line. And now you can dump
>=20
>=20
>=20
> > +
> > +        /* Does the stackframe contain regs? */
> > +        cpu_physical_memory_read(sp + 96, &marker, sizeof(marker));
>=20
> I suspect the marker needs byteswap as well.

Yeah, best to use the cpu_ldl() etc wrappers if possible, which
include byteswaps.  Urgh... except this depends on the cpu mode which
complicates things.

>=20
> What is that 96?
>=20
> > +        if (marker =3D=3D 0x7265677368657265) { /* regshere */
> > +            struct ppc_pt_regs regs;
> > +            int i;
> > +
> > +            cpu_physical_memory_read(sp + 112, &regs, sizeof(regs));
>=20
> and the regs.
>=20
> What is that 112?
>=20
> I'd copy from arch/powerpc/include/asm/ptrace.h:
>=20
> #define STACK_FRAME_OVERHEAD    112     /* size of minimum stack frame */
> #define STACK_FRAME_REGS_MARKER ASM_CONST(0x7265677368657265)
>=20
> and whatever that 96 is.
>=20
> Sadly, scripts/update-linux-headers.sh cannot copy
> arch/powerpc/include/asm/ptrace.h as kernel's "make headers_install"
> does not install it (it installs the "uapi" header which does not have
> these symbols) so you'll have to define them.
>=20
>=20
> > +
> > +            qemu_fprintf(f, "\ttrap : 0x%.16lx\n", regs.trap);
> > +            qemu_fprintf(f, "\tpc   : 0x%.16lx\n", regs.nip);
> > +            qemu_fprintf(f, "\tmsr  : 0x%.16lx\n", regs.msr);
> > +            qemu_fprintf(f, "\tlr   : 0x%.16lx\n", regs.link);
> > +            for (i =3D 0; i < 32; i++)
> > +                qemu_fprintf(f, "\tgpr%2d: 0x%.16lx\n", i,
> > +                            regs.gpr[i]);
> > +        }
> > +
> > +        sp =3D next_sp;
> > +    }
> > +
> > +    qemu_fprintf(f, "sp: 0x%.16lx\n", sp);
>=20
>=20
> and this is "sp: 0x%"HWADDR_PRIx"\n".
>=20
>=20
>=20
> > +#endif
> > +}
> > +
> >  void ppc_cpu_dump_statistics(CPUState *cs, int flags)
> >  {
> >  #if defined(DO_PPC_STATISTICS)
> > diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_ini=
t.inc.c
> > index 0394a9ddad..3fd24f85cc 100644
> > --- a/target/ppc/translate_init.inc.c
> > +++ b/target/ppc/translate_init.inc.c
> > @@ -10587,6 +10587,7 @@ static void ppc_cpu_class_init(ObjectClass *oc,=
 void *data)
> >      cc->do_interrupt =3D ppc_cpu_do_interrupt;
> >      cc->cpu_exec_interrupt =3D ppc_cpu_exec_interrupt;
> >      cc->dump_state =3D ppc_cpu_dump_state;
> > +    cc->dump_stack =3D ppc_cpu_dump_stack;
> >      cc->dump_statistics =3D ppc_cpu_dump_statistics;
> >      cc->set_pc =3D ppc_cpu_set_pc;
> >      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzKPUAACgkQbDjKyiDZ
s5KTzBAA3Zh6yPWxZCA/Z5h8SEiSlbTz8GLavGxwX7rYeS6jzqYsNrhxYPEgrz1u
AzijjYwi20X7SKEiNaJ7CCP78V7Z/CJz7C30fwSyEdz4gztE93lnB97htVObPj6h
SDI1MRBekOl3xXMrZy4ERGm6PvrI3wARXq5i4hKo6je+ytYXUTcDwPu1LFlpeYDl
bjJXZ/098A8fuocmJU9LwcPJngQJ188qqx9tbb/jzC9IZbDG8D9D81YfRqkJP8h4
fDGFUXJuexRg6MjIT8hDX+8shbFKjA5FFRvx98DNr3N7Y+rn4P4z3gHfstjGnNWR
5OjWk/nOCSddQogB0DrZsxuWKKrkKfQEj2W5zulSxmLcTn9rG2LSLTNPaufHgOsn
igprTvjt1qJcqQ7hn7i66yLlwOYmdODIlEZKDaCT2IeJbrTpDaRA390PuDxORYFa
HSaP36pAgotW7CI5m9K3NUngMMiS/nK2InApPJQRKeZxntXNX4HUpwtJQfblh2IT
oYHM+3U9F7DdGnEQD9ovicql8iHqKJBy6xSeFWS75ID9C97l/9jyT9G+UUy81KnR
8aXVHma/V7SsXvxuiKBST5oWBky0Cbt0XkydH9KjCpntQSLrf1JVlh5SG25LkMNj
H+tCo7DYja3mmaQPJgaPhxX99wL+8YP/Ems9WgPi6UbNSqP1240=
=D/ij
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--

