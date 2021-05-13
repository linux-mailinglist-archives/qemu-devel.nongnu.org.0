Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0137F226
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:25:14 +0200 (CEST)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2uP-0002IC-K0
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sQ-00079z-Dy; Thu, 13 May 2021 00:23:10 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:45241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sK-0004NZ-8h; Thu, 13 May 2021 00:23:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms0N9Sz9sXS; Thu, 13 May 2021 14:22:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=/QzdeAPoYqB1PU4ifSTmgbybnm4L2hqG7nGvyVg2pDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuBvPuHHvRjI1jTP4dZKwLzjeQjx9+lUEWvmarBQDDzhp0VW8MUsaySmD8Lan9tYs
 dFPl+mgXS/3C2DT8MNiubGEVctFFYxXDHYADPrJ/cjbkZte+2RzYJepDYlSL5BEa5G
 noWyfnbyx63SfwFSxMuIeIx7BiOHjZcJlEryrBdo=
Date: Thu, 13 May 2021 13:08:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH updated v2] spapr: Fix EEH capability issue on KVM guest
 for PCI passthru
Message-ID: <YJyYI8HDTy5eYrnq@yekko>
References: <162022601665.118720.1424074431457537864.stgit@jupiter>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fgbb/6+Dbx4dkUWs"
Content-Disposition: inline
In-Reply-To: <162022601665.118720.1424074431457537864.stgit@jupiter>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Qemu-ppc <qemu-ppc@nongnu.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Oliver O'Halloran <oohall@gmail.com>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Fgbb/6+Dbx4dkUWs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 08:18:27PM +0530, Mahesh Salgaonkar wrote:
> With upstream kernel, especially after commit 98ba956f6a389
> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that K=
VM
> guest isn't able to enable EEH option for PCI pass-through devices anymor=
e.
>=20
> [root@atest-guest ~]# dmesg | grep EEH
> [    0.032337] EEH: pSeries platform initialized
> [    0.298207] EEH: No capable adapters found: recovery disabled.
> [root@atest-guest ~]#
>=20
> So far the linux kernel was assuming pe_config_addr equal to device's
> config_addr and using it to enable EEH on the PE through ibm,set-eeh-opti=
on
> RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> commit 98ba956f6a389 fixed this flow. With that fixed, linux now uses PE
> config address returned by ibm,get-config-addr-info2 RTAS call to enable
> EEH option per-PE basis instead of per-device basis. However this has
> uncovered a bug in qemu where ibm,set-eeh-option is treating PE config
> address as per-device config address.

Huh.  To be fair, the stuff about this in PAPR is nearly
incomprehensible, so we probably used what the kernel was doing as a
guide instead.

> Hence in qemu guest with recent kernel the ibm,set-eeh-option RTAS call
> fails with -3 return value indicating that there is no PCI device exist f=
or
> the specified PE config address. The rtas_ibm_set_eeh_option call uses
> pci_find_device() to get the PC device that matches specific bus and devfn
> extracted from PE config address passed as argument. Thus it tries to map
> the PE config address to a single specific PCI device 'bus->devices[devfn=
]'
> which always results into checking device on slot 0 'bus->devices[0]'.
> This succeeds when there is a pass-through device (vfio-pci) present in
> slot 0. But in cases where there is no pass-through device present in slot
> 0, but present in non-zero slots, ibm,set-eeh-option call fails to enable
> the EEH capability.
>=20
> hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
>    case RTAS_EEH_ENABLE: {
>         PCIHostState *phb;
>         PCIDevice *pdev;
>=20
>         /*
>          * The EEH functionality is enabled on basis of PCI device,
>          * instead of PE. We need check the validity of the PCI
>          * device address.
>          */
>         phb =3D PCI_HOST_BRIDGE(sphb);
>         pdev =3D pci_find_device(phb->bus,
>                                (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
>         if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
>             return RTAS_OUT_PARAM_ERROR;
>         }
>=20
> hw/pci/pci.c:pci_find_device()
>=20
> PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
> {
>     bus =3D pci_find_bus_nr(bus, bus_num);
>=20
>     if (!bus)
>         return NULL;
>=20
>     return bus->devices[devfn];
> }
>=20
> This patch fixes ibm,set-eeh-option to check for presence of any PCI devi=
ce
> (vfio-pci) under specified bus and enable the EEH if found. The current
> code already makes sure that all the devices on that bus are from same
> iommu group (within same PE) and fail very early if it does not.
>=20
> After this fix guest is able to find EEH capable devices and enable EEH
> recovery on it.
>=20
> [root@atest-guest ~]# dmesg | grep EEH
> [    0.048139] EEH: pSeries platform initialized
> [    0.405115] EEH: Capable adapter found: recovery enabled.
> [root@atest-guest ~]#
>=20
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> Change in v2:
> - Fix ibm,set-eeh-option instead of returning per-device PE config addres=
s.
> - Changed patch subject line.
> ---
>  hw/ppc/spapr_pci_vfio.c |   27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> index e0547b1740..b30020da6a 100644
> --- a/hw/ppc/spapr_pci_vfio.c
> +++ b/hw/ppc/spapr_pci_vfio.c
> @@ -47,6 +47,16 @@ void spapr_phb_vfio_reset(DeviceState *qdev)
>      spapr_phb_vfio_eeh_reenable(SPAPR_PCI_HOST_BRIDGE(qdev));
>  }
> =20
> +static void spapr_eeh_pci_find_device(PCIBus *bus, PCIDevice *pdev,
> +                                      void *opaque)
> +{
> +    bool *found =3D opaque;
> +
> +    if (object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
> +        *found =3D true;
> +    }
> +}
> +
>  int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
>                                    unsigned int addr, int option)
>  {
> @@ -59,17 +69,20 @@ int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
>          break;
>      case RTAS_EEH_ENABLE: {
>          PCIHostState *phb;
> -        PCIDevice *pdev;
> +        bool found =3D false;
> =20
>          /*
> -         * The EEH functionality is enabled on basis of PCI device,
> -         * instead of PE. We need check the validity of the PCI
> -         * device address.
> +         * The EEH functionality is enabled per sphb level instead of
> +         * per PCI device. We just need to check the validity of the PCI
> +         * pass-through devices (vfio-pci) under this sphb bus.
> +         * We have already validated that all the devices under this sphb
> +         * are from same iommu group (within same PE) before comming her=
e.
>           */
>          phb =3D PCI_HOST_BRIDGE(sphb);
> -        pdev =3D pci_find_device(phb->bus,
> -                               (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
> -        if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
> +        pci_for_each_device(phb->bus, (addr >> 16) & 0xFF,
> +                            spapr_eeh_pci_find_device, &found);
> +
> +        if (!found) {


Hmm.. shouldn't we at least check that the supplied config_addr
matches the one it should be for this PHB, rather than just ignoring
it?

=2E.and, looking back at rtas_ibm_get_config_addr_info2(), I think
that looks wrong in the case of PCI bridges.  AFAICT it gives an
address that depends on the bus, but in other places we assume that
the entire PHB is a single PE on the guest side, so it really
shouldn't.



>              return RTAS_OUT_PARAM_ERROR;
>          }
> =20
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Fgbb/6+Dbx4dkUWs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcmCAACgkQbDjKyiDZ
s5LwchAArm0KQrLqnC6FBBKqXU2QCpjA2GbzvALzpY8zW7myU6kG/RTi+W61cwQc
GcdO790qNq73oW6bWJ/BTRZWvJvrhoo+DCn2kjCL2KlWaduU8vKF9rQmq4F1AJnA
qbJJ6rdT8CzVFjrtr7arIy6IwSsYjuYPydirciPkKN3RawPSiaNQXS+H+d5RqmFp
8uIUtLRpaZEpuZdvTecujc8Qll2ddy/384CKA8ai3ML/B5fAArS27m/+ZGV7ewUd
R5IpXtYAbu9vSNDN2xRlLwCf+hZd+5+Ct3j4ZB1mwei3ovHaIu4V8F1m31IVXxYw
VVj3kfaNUFbSDBTOjCV8EAgWr0ZSjMyZ1eIEdIXj9cvc2RPwAgVsddywMBJGsBPR
aYeMgX1GPrGVoiOW8dmQZv6Qbi45rfCFdCO8tJpwUEmRgqjxv1N2h6VuEUkbCHFH
n1C5YPg70KqsOH2wFUuWXM5eOovLCoyxS3fan3IDeoI5TIZLwidHR1u3T7RwnEwK
xlPi+Em0tO2pIs6I8vz8z/9HwgVXgCu+a5Fb3TBnzugrdOWLQs2tezaQrxe7KbgC
gPL+l0yV3GowsE6alUvEBNEKOOVKaRMKjSWEpIoq7+4/yizfljJNLrTE8IksE53o
nMEI5xfOdxrr0JDtpnwt87bj27/oGpUj7INKGhLvgg1yoY0T6Ms=
=47G7
-----END PGP SIGNATURE-----

--Fgbb/6+Dbx4dkUWs--

