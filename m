Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBA4149E6B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 04:41:56 +0100 (CET)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivvHf-0002wc-0m
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 22:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ivvGF-0001cl-BX
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 22:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ivvGD-0005Mc-Fr
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 22:40:27 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:43649)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ivvGC-0005Jv-H7; Sun, 26 Jan 2020 22:40:25 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 485b9Y226nz9sNx; Mon, 27 Jan 2020 14:40:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580096417;
 bh=kU9VDb2GKJYMOn/CesT+JqrXn9A9Yg7ZgCGqpecejE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCdMZcuzod2e40dHNMvRHRbIEhZRUfcLLVjt2x0AC9WbqP4BniVmUvi7Eoso/Nl2g
 0J9Z8GkdPkrl9fD1vmfty6qKkVDqgR2Ild16oohGZ+6DLGqDduscOlCgtTn5DE6uNY
 KdOwVhw6DHJv2hWa6jHzdfxU8Q9lxwqa7CW47/b8=
Date: Mon, 27 Jan 2020 14:39:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 64/80] ppc/{ppc440_bamboo,sam460ex}: drop RAM
 size fixup
Message-ID: <20200127033936.GC1818@umbus.fritz.box>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-65-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
In-Reply-To: <1579779525-20065-65-git-send-email-imammedo@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 12:38:29PM +0100, Igor Mammedov wrote:
> If user provided non-sense RAM size, board will complain and
> continue running with max RAM size supported or sometimes
> crash like this:
>   %QEMU -M bamboo -m 1
>     exec.c:1926: find_ram_offset: Assertion `size !=3D 0' failed.
>     Aborted (core dumped)
> Also RAM is going to be allocated by generic code, so it won't be
> possible for board to fix things up for user.
>=20
> Make it error message and exit to force user fix CLI,
> instead of accepting non-sense CLI values.
> That also fixes crash issue, since wrongly calculated size
> isn't used to allocate RAM
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v2:
>   * s/ppc4xx_sdram_adjust/ppc4xx_sdram_prep/
>      (BALATON Zoltan <balaton@eik.bme.hu>)
>   * print possible valid ram size id not all RAM was distributed
>   * initialize ram_bases/ram_bases at the same time we are checking
>     that user supplied RAM would fit available banks and drop nested
>     loop that were duplicating the same calculations.
>   * coincidentally fix crash when -m is less than minimal bank size
> v3:
>   * s/ppc4xx_sdram_prep/ppc4xx_sdram_banks/
>       (BALATON Zoltan <balaton@eik.bme.hu>)
>   * fix subject line in commit message
> v3.1:
>   * add lost 'break' statement in 'j' loop
> v3.2:
>   * replace global ram_size with machine->ram_size in ppc4xx_sdram_banks(=
) call
>   * add a comment about the expected sorting order within sdram_bank_size=
s[]
>     (BALATON Zoltan <balaton@eik.bme.hu>)
>=20
> CC: balaton@eik.bme.hu
> CC: david@gibson.dropbear.id.au
> CC: qemu-ppc@nongnu.org
> ---
>  include/hw/ppc/ppc4xx.h |  9 ++++----
>  hw/ppc/ppc440_bamboo.c  | 11 ++++-----
>  hw/ppc/ppc4xx_devs.c    | 60 ++++++++++++++++++++++++++-----------------=
------
>  hw/ppc/sam460ex.c       |  5 ++---
>  4 files changed, 42 insertions(+), 43 deletions(-)
>=20
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 7d82259..b8c8f32 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -42,11 +42,10 @@ enum {
>  qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
>                         uint32_t dcr_base, int has_ssr, int has_vr);
> =20
> -ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
> -                               MemoryRegion ram_memories[],
> -                               hwaddr ram_bases[],
> -                               hwaddr ram_sizes[],
> -                               const ram_addr_t sdram_bank_sizes[]);
> +void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_banks,
> +                        MemoryRegion ram_memories[],
> +                        hwaddr ram_bases[], hwaddr ram_sizes[],
> +                        const ram_addr_t sdram_bank_sizes[]);
> =20
>  void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
>                          MemoryRegion ram_memories[],
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index b782641..29a9642 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -158,7 +158,6 @@ static void main_cpu_reset(void *opaque)
> =20
>  static void bamboo_init(MachineState *machine)
>  {
> -    ram_addr_t ram_size =3D machine->ram_size;
>      const char *kernel_filename =3D machine->kernel_filename;
>      const char *kernel_cmdline =3D machine->kernel_cmdline;
>      const char *initrd_filename =3D machine->initrd_filename;
> @@ -203,10 +202,8 @@ static void bamboo_init(MachineState *machine)
>      /* SDRAM controller */
>      memset(ram_bases, 0, sizeof(ram_bases));
>      memset(ram_sizes, 0, sizeof(ram_sizes));
> -    ram_size =3D ppc4xx_sdram_adjust(ram_size, PPC440EP_SDRAM_NR_BANKS,
> -                                   ram_memories,
> -                                   ram_bases, ram_sizes,
> -                                   ppc440ep_sdram_bank_sizes);
> +    ppc4xx_sdram_banks(machine->ram_size, PPC440EP_SDRAM_NR_BANKS, ram_m=
emories,
> +                       ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
>      /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UI=
C0. */
>      ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memorie=
s,
>                        ram_bases, ram_sizes, 1);
> @@ -268,7 +265,7 @@ static void bamboo_init(MachineState *machine)
>      /* Load initrd. */
>      if (initrd_filename) {
>          initrd_size =3D load_image_targphys(initrd_filename, RAMDISK_ADD=
R,
> -                                          ram_size - RAMDISK_ADDR);
> +                                          machine->ram_size - RAMDISK_AD=
DR);
> =20
>          if (initrd_size < 0) {
>              error_report("could not load ram disk '%s' at %x",
> @@ -279,7 +276,7 @@ static void bamboo_init(MachineState *machine)
> =20
>      /* If we're loading a kernel directly, we must load the device tree =
too. */
>      if (kernel_filename) {
> -        if (bamboo_load_device_tree(FDT_ADDR, ram_size, RAMDISK_ADDR,
> +        if (bamboo_load_device_tree(FDT_ADDR, machine->ram_size, RAMDISK=
_ADDR,
>                                      initrd_size, kernel_cmdline) < 0) {
>              error_report("couldn't load device tree");
>              exit(1);
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index c2e5013..d89008a 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -668,21 +668,22 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq =
irq, int nbanks,
> =20
>  /* Fill in consecutive SDRAM banks with 'ram_size' bytes of memory.
>   *
> - * sdram_bank_sizes[] must be 0-terminated.
> + * sdram_bank_sizes[] must be in descending order, that is sizes[i] > si=
zes[i+1]
> + * and must be 0-terminated.
>   *
>   * The 4xx SDRAM controller supports a small number of banks, and each b=
ank
>   * must be one of a small set of sizes. The number of banks and the supp=
orted
>   * sizes varies by SoC. */
> -ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
> -                               MemoryRegion ram_memories[],
> -                               hwaddr ram_bases[],
> -                               hwaddr ram_sizes[],
> -                               const ram_addr_t sdram_bank_sizes[])
> +void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_banks,
> +                        MemoryRegion ram_memories[],
> +                        hwaddr ram_bases[], hwaddr ram_sizes[],
> +                        const ram_addr_t sdram_bank_sizes[])
>  {
>      MemoryRegion *ram =3D g_malloc0(sizeof(*ram));
>      ram_addr_t size_left =3D ram_size;
>      ram_addr_t base =3D 0;
>      ram_addr_t bank_size;
> +    int last_bank =3D 0;
>      int i;
>      int j;
> =20
> @@ -690,7 +691,12 @@ ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, =
int nr_banks,
>          for (j =3D 0; sdram_bank_sizes[j] !=3D 0; j++) {
>              bank_size =3D sdram_bank_sizes[j];
>              if (bank_size <=3D size_left) {
> +                ram_bases[i] =3D base;
> +                ram_sizes[i] =3D bank_size;
> +                base +=3D bank_size;
>                  size_left -=3D bank_size;
> +                last_bank =3D i;
> +                break;
>              }
>          }
>          if (!size_left) {
> @@ -699,34 +705,32 @@ ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size,=
 int nr_banks,
>          }
>      }
> =20
> -    ram_size -=3D size_left;
>      if (size_left) {
> -        error_report("Truncating memory to %" PRId64 " MiB to fit SDRAM"
> -                     " controller limits", ram_size / MiB);
> +        ram_addr_t used_size =3D ram_size - size_left;
> +        GString *s =3D g_string_new(NULL);
> +
> +        for (i =3D 0; sdram_bank_sizes[i]; i++) {
> +            g_string_append_printf(s, "%" PRIi64 "%s",
> +                                   sdram_bank_sizes[i] / MiB,
> +                                   sdram_bank_sizes[i + 1] ? " ," : "");
> +        }
> +        error_report("Max %d banks of %s MB DIMM/bank supported",
> +            nr_banks, s->str);
> +        error_report("Possible valid RAM size: %" PRIi64,
> +            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
> +
> +        g_string_free(s, true);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      memory_region_allocate_system_memory(ram, NULL, "ppc4xx.sdram", ram_=
size);
> =20
> -    size_left =3D ram_size;
> -    for (i =3D 0; i < nr_banks && size_left; i++) {
> -        for (j =3D 0; sdram_bank_sizes[j] !=3D 0; j++) {
> -            bank_size =3D sdram_bank_sizes[j];
> -
> -            if (bank_size <=3D size_left) {
> -                char name[32];
> -                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
> -                memory_region_init_alias(&ram_memories[i], NULL, name, r=
am,
> -                                         base, bank_size);
> -                ram_bases[i] =3D base;
> -                ram_sizes[i] =3D bank_size;
> -                base +=3D bank_size;
> -                size_left -=3D bank_size;
> -                break;
> -            }
> -        }
> +    for (i =3D 0; i <=3D last_bank; i++) {
> +        char name[32];
> +        snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
> +        memory_region_init_alias(&ram_memories[i], NULL, name, ram,
> +                                 ram_bases[i], ram_sizes[i]);
>      }
> -
> -    return ram_size;
>  }
> =20
>  /***********************************************************************=
******/
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 437e214..949acba 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -324,9 +324,8 @@ static void sam460ex_init(MachineState *machine)
>      /* SDRAM controller */
>      /* put all RAM on first bank because board has one slot
>       * and firmware only checks that */
> -    machine->ram_size =3D ppc4xx_sdram_adjust(machine->ram_size, 1,
> -                                   ram_memories, ram_bases, ram_sizes,
> -                                   ppc460ex_sdram_bank_sizes);
> +    ppc4xx_sdram_banks(machine->ram_size, 1, ram_memories, ram_bases, ra=
m_sizes,
> +                       ppc460ex_sdram_bank_sizes);
> =20
>      /* FIXME: does 460EX have ECC interrupts? */
>      ppc440_sdram_init(env, SDRAM_NR_BANKS, ram_memories,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4uW3gACgkQbDjKyiDZ
s5Iaag//SUW6uaoNgn2qEhEGuLR6EGnVISpYZRsUZmVbf85v1dv3VWpRef99n1aO
neWuazv1Z7Ot8is/Dt+xyQO4/jKeClbCJjdNXGx0I/3EpWyKW+15zWg+wouEbXO/
hWVifNelg2DGphwJmp758hYj5aFUugcexChfwoTzY1vaD7yXpMrZAbeuM/xGH9Ei
Z+r/kvnhIs99kGnVRb4IqClLgApptLxYhGhxgOANXty34OxpxhpHkzKGGo1JuRea
HDfVZfbdFB07iJEVHMlIzTCxG24/2KTLynfydWz2raqgOS8n3r7+Qkojnm9/FJ6q
Ze/qa2wcyvACfBP+7pCtt6ThhIdMVSjNsAoL7mnIUIyefXT8fl81/6BJrPglFPQr
V++cDg9S5pQa5tHeCl8BrMeLwMzVY3LnsPLLyU9SeOqsH2FUYdtybXgtUyW/ho+C
HgiQtV4VfyA9boqwxoA8D3ELXkFl0CWrUk3LgxL8pvPZCg08UttY3rS4YDbcLFCg
8Px3zDzkI0s8rIKvl0Qvy5Zsuv6TFae5UqmMoRla0mWUVmx/w3IRdMTjme8UViYg
zTr2TDSUvDIWvAZpmbvUOdeWiOL99p6eWJ1FR3rzJm0/xf0jbG2k6uDCjv7J4/wT
jd6CWD5KmMkZlF5g23mlxHsN2aSizdn7Bwt0NKUojOUC2LNekbM=
=19SC
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--

