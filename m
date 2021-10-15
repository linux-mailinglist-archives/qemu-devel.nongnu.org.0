Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22742E9C6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:13:32 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHPH-0006Gh-7x
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHQ-0004Qd-Rm; Fri, 15 Oct 2021 03:05:24 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHH9-0006MZ-Lg; Fri, 15 Oct 2021 03:05:22 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N3Q3rz4xqN; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=ucjbuHcGN8EA7HFuGN2sUhJV59Ua4y+lQ68XMpznEoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LdazeLHzk7MvNM6cwcbhtPd5dlvrMTSZvXFGxQ4cCZcrHcr0DE6rXAwt8zIRAgMdR
 pO9pk5EyLpLei5xAjZcliVVwweUl1KNLFI6ymkowXsIkGH+5xIyYQfoBEdCrkdfH6L
 SLkdvayHwsLxLyQk3xTnx5Wl0wlbeKjNZhqcM2Sc=
Date: Fri, 15 Oct 2021 14:18:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 4/6] ppc/pegasos2: Access MV64361 registers via their
 memory region
Message-ID: <YWjzEkEZZ+y8Ny04@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <b6f768023603dc2c4d130720bcecdbea459b7668.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O2PrHzVSgaOBlT3z"
Content-Disposition: inline
In-Reply-To: <b6f768023603dc2c4d130720bcecdbea459b7668.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) DATE_IN_PAST_03_06=1.592, DKIM_SIGNED=0.1,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--O2PrHzVSgaOBlT3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> Instead of relying on the mapped address of the MV64361 registers
> access them via their memory region. This is not a problem at reset
> time when these registers are mapped at the default address but the
> guest could change this later and then the RTAS calls accessing PCI
> config registers could fail. None of the guests actually do this so
> this only avoids a theoretical problem not seen in practice.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, thanks.

> ---
>  hw/pci-host/mv64361.c |   1 +
>  hw/ppc/pegasos2.c     | 117 ++++++++++++++++++++----------------------
>  2 files changed, 56 insertions(+), 62 deletions(-)
>=20
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index 92b0f5d047..00b3ff7d90 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -869,6 +869,7 @@ static void mv64361_realize(DeviceState *dev, Error *=
*errp)
>      s->base_addr_enable =3D 0x1fffff;
>      memory_region_init_io(&s->regs, OBJECT(s), &mv64361_ops, s,
>                            TYPE_MV64361, 0x10000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->regs);
>      for (i =3D 0; i < 2; i++) {
>          g_autofree char *name =3D g_strdup_printf("pcihost%d", i);
>          object_initialize_child(OBJECT(dev), name, &s->pci[i],
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index a9e3625f56..a861bf16b8 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -205,56 +205,49 @@ static void pegasos2_init(MachineState *machine)
>      }
>  }
> =20
> -static uint32_t pegasos2_pci_config_read(AddressSpace *as, int bus,
> +static uint32_t pegasos2_mv_reg_read(Pegasos2MachineState *pm,
> +                                     uint32_t addr, uint32_t len)
> +{
> +    MemoryRegion *r =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(pm->mv), 0=
);
> +    uint64_t val =3D 0xffffffffULL;
> +    memory_region_dispatch_read(r, addr, &val, size_memop(len) | MO_LE,
> +                                MEMTXATTRS_UNSPECIFIED);
> +    return val;
> +}
> +
> +static void pegasos2_mv_reg_write(Pegasos2MachineState *pm, uint32_t add=
r,
> +                                  uint32_t len, uint32_t val)
> +{
> +    MemoryRegion *r =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(pm->mv), 0=
);
> +    memory_region_dispatch_write(r, addr, val, size_memop(len) | MO_LE,
> +                                 MEMTXATTRS_UNSPECIFIED);
> +}
> +
> +static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int b=
us,
>                                           uint32_t addr, uint32_t len)
>  {
> -    hwaddr pcicfg =3D (bus ? 0xf1000c78 : 0xf1000cf8);
> -    uint32_t val =3D 0xffffffff;
> -
> -    stl_le_phys(as, pcicfg, addr | BIT(31));
> -    switch (len) {
> -    case 4:
> -        val =3D ldl_le_phys(as, pcicfg + 4);
> -        break;
> -    case 2:
> -        val =3D lduw_le_phys(as, pcicfg + 4);
> -        break;
> -    case 1:
> -        val =3D ldub_phys(as, pcicfg + 4);
> -        break;
> -    default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
> -        break;
> +    hwaddr pcicfg =3D bus ? 0xc78 : 0xcf8;
> +    uint64_t val =3D 0xffffffffULL;
> +
> +    if (len <=3D 4) {
> +        pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
> +        val =3D pegasos2_mv_reg_read(pm, pcicfg + 4, len);
>      }
>      return val;
>  }
> =20
> -static void pegasos2_pci_config_write(AddressSpace *as, int bus, uint32_=
t addr,
> -                                      uint32_t len, uint32_t val)
> +static void pegasos2_pci_config_write(Pegasos2MachineState *pm, int bus,
> +                                      uint32_t addr, uint32_t len, uint3=
2_t val)
>  {
> -    hwaddr pcicfg =3D (bus ? 0xf1000c78 : 0xf1000cf8);
> -
> -    stl_le_phys(as, pcicfg, addr | BIT(31));
> -    switch (len) {
> -    case 4:
> -        stl_le_phys(as, pcicfg + 4, val);
> -        break;
> -    case 2:
> -        stw_le_phys(as, pcicfg + 4, val);
> -        break;
> -    case 1:
> -        stb_phys(as, pcicfg + 4, val);
> -        break;
> -    default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
> -        break;
> -    }
> +    hwaddr pcicfg =3D bus ? 0xc78 : 0xcf8;
> +
> +    pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
> +    pegasos2_mv_reg_write(pm, pcicfg + 4, len, val);
>  }
> =20
>  static void pegasos2_machine_reset(MachineState *machine)
>  {
>      Pegasos2MachineState *pm =3D PEGASOS2_MACHINE(machine);
> -    AddressSpace *as =3D CPU(pm->cpu)->as;
>      void *fdt;
>      uint64_t d[2];
>      int sz;
> @@ -265,51 +258,51 @@ static void pegasos2_machine_reset(MachineState *ma=
chine)
>      }
> =20
>      /* Otherwise, set up devices that board firmware would normally do */
> -    stl_le_phys(as, 0xf1000000, 0x28020ff);
> -    stl_le_phys(as, 0xf1000278, 0xa31fc);
> -    stl_le_phys(as, 0xf100f300, 0x11ff0400);
> -    stl_le_phys(as, 0xf100f10c, 0x80000000);
> -    stl_le_phys(as, 0xf100001c, 0x8000000);
> -    pegasos2_pci_config_write(as, 0, PCI_COMMAND, 2, PCI_COMMAND_IO |
> +    pegasos2_mv_reg_write(pm, 0, 4, 0x28020ff);
> +    pegasos2_mv_reg_write(pm, 0x278, 4, 0xa31fc);
> +    pegasos2_mv_reg_write(pm, 0xf300, 4, 0x11ff0400);
> +    pegasos2_mv_reg_write(pm, 0xf10c, 4, 0x80000000);
> +    pegasos2_mv_reg_write(pm, 0x1c, 4, 0x8000000);
> +    pegasos2_pci_config_write(pm, 0, PCI_COMMAND, 2, PCI_COMMAND_IO |
>                                PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> -    pegasos2_pci_config_write(as, 1, PCI_COMMAND, 2, PCI_COMMAND_IO |
> +    pegasos2_pci_config_write(pm, 1, PCI_COMMAND, 2, PCI_COMMAND_IO |
>                                PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 0) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x9);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 0) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>                                0x50, 1, 0x2);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x109);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                PCI_CLASS_PROG, 1, 0xf);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                0x40, 1, 0xb);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                0x50, 4, 0x17171717);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                PCI_COMMAND, 2, 0x87);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 2) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 2) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x409);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 3) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 3) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x409);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x9);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
>                                0x48, 4, 0xf00);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
>                                0x40, 4, 0x558020);
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
>                                0x90, 4, 0xd00);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 5) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 5) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x309);
> =20
> -    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 6) << 8) |
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 6) << 8) |
>                                PCI_INTERRUPT_LINE, 2, 0x309);
> =20
>      /* Device tree and VOF set up */
> @@ -404,7 +397,7 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pe=
gasos2MachineState *pm,
>          }
>          addr =3D ldl_be_phys(as, args);
>          len =3D ldl_be_phys(as, args + 4);
> -        val =3D pegasos2_pci_config_read(as, !(addr >> 24),
> +        val =3D pegasos2_pci_config_read(pm, !(addr >> 24),
>                                         addr & 0x0fffffff, len);
>          stl_be_phys(as, rets, 0);
>          stl_be_phys(as, rets + 4, val);
> @@ -421,7 +414,7 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pe=
gasos2MachineState *pm,
>          addr =3D ldl_be_phys(as, args);
>          len =3D ldl_be_phys(as, args + 4);
>          val =3D ldl_be_phys(as, args + 8);
> -        pegasos2_pci_config_write(as, !(addr >> 24),
> +        pegasos2_pci_config_write(pm, !(addr >> 24),
>                                    addr & 0x0fffffff, len, val);
>          stl_be_phys(as, rets, 0);
>          return H_SUCCESS;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O2PrHzVSgaOBlT3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo8xEACgkQbDjKyiDZ
s5LE6Q//Q4O/LXkwqgZSnQhx2I5eUoD8/TvEysXmuqe2T36Ac7nPfh1nDJHKjeIY
lWKcwAZut75PcW56UfipgXpCGJTpNVqfWzgt76NkZLImxCfHrlSRrD02I4ljZPJW
TelxJYZ5zuo9Ts6FAZO8HGprHx3mow1m6y4rPEOOzVqqFyL2Jt39yT2MSlRsGxB2
mgEmn3Wc2Udt2tLqAAHvotPkQqFxxOovX2XyQN8o3cG5KmVNwZvAhfJepxLztT14
vVmZ4QKBubiL5xFjuCf/hUJwtOWBCMvpHgWWJ2pr+v+gz0Q7e+HSjEZ6N3Lap1cJ
E+ZjuUWoE0QNTg24S7zzRSsgjU4omylAeK27pOq6kyQyhqh9py7CYjf/ZJ+elqmS
FOC6njPAvaBqo5ZMYRRV+NEAzyKfBjTZeOoFMLrNlBKlAZ4U82jM/8cPfrDZuuIB
GLI+FzCUH/JPT+6CmZCPaF4lvhPgXBTeHgkYkAT0gYgMm/82n4Flh/e3Dmlsm6Xf
uka/jPJlmWl6fYsdy38+kpZZUTbWrW/QVQXZUOdB8GTalC5ji7cHLse3zAw0sKs4
W2pekDIg4UkV2Pf5NMi9arvXlk0hokac+69HkqMpADCT3g4IaBuwZSKTFuEZxFFs
b9g+3Yg6XhNiZtvpsI+62WAOUBrRUZ0RL6SUZx5Me+16M3Z5r+A=
=ZDKo
-----END PGP SIGNATURE-----

--O2PrHzVSgaOBlT3z--

