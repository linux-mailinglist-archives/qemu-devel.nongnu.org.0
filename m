Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7E38DFF2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:49:29 +0200 (CEST)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1aq-0000fk-AB
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yu-0006H2-G4; Sun, 23 May 2021 23:47:28 -0400
Received: from ozlabs.org ([203.11.71.1]:56891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yq-00039J-4w; Sun, 23 May 2021 23:47:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl2S1Tz9sRf; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=apaNZTz7Q/PwdQ9MDFXZNWvvHBY1UcgOslX/Mu3W0Cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OhokmWxc41MBnZl5VP6ge0edooukIV0V+WXgNyERKkxw7kc6AGoh0ZDZ6K0xY5/fG
 CWfTrj84dIDeSsQwPp4zS+9sn8gGTxXmNibqGZa1bDOJA1AxJwHjL283cX7DLbVOKk
 /IXiCifpxThOdLJfbS7noOmEEVG55TNn8GAIjRvE=
Date: Mon, 24 May 2021 13:14:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v3] spapr: Fix EEH capability issue on KVM guest for PCI
 passthru
Message-ID: <YKsaCJeu+/K599QD@yekko>
References: <162158429107.145117.5843504911924013125.stgit@jupiter>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KsJc5TlH/vv3m7cB"
Content-Disposition: inline
In-Reply-To: <162158429107.145117.5843504911924013125.stgit@jupiter>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KsJc5TlH/vv3m7cB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 01:35:51PM +0530, Mahesh Salgaonkar wrote:
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
>=20
> Hence in qemu guest with recent kernel the ibm,set-eeh-option RTAS call
> fails with -3 return value indicating that there is no PCI device exist f=
or
> the specified PE config address. The rtas_ibm_set_eeh_option call uses
> pci_find_device() to get the PC device that matches specific bus and devfn
> extracted from PE config address passed as argument. Thus it tries to map
> the PE config address to a single specific PCI device 'bus->devices[devfn=
]'
> which always results into checking device on slot 0 'bus->devices[0]'.
> This succeeds when there is a pass-through device (vfio-pci) present on
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
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Gross, but I don't see a better way of handling this, so, applied to
ppc-for-6.1, thanks.

> ---
> Change in v3:
> - Add a comment about reason for not checking for validity of supplied
>   config_addr as pointed by Oliver in spapr_phb_vfio_eeh_set_option()
>   function.
> Change in v2:
> - Fix ibm,set-eeh-option instead of returning per-device PE config addres=
s.
> - Changed patch subject line.
> ---
>  hw/ppc/spapr_pci_vfio.c |   40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> index e0547b1740..6587c8cb5b 100644
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
> @@ -59,17 +69,33 @@ int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
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
> +         * per PCI device. We have already identified this specific sphb
> +         * based on buid passed as argument to ibm,set-eeh-option rtas
> +         * call. Now we just need to check the validity of the PCI
> +         * pass-through devices (vfio-pci) under this sphb bus.
> +         * We have already validated that all the devices under this sphb
> +         * are from same iommu group (within same PE) before comming her=
e.
> +         *
> +         * Prior to linux commit 98ba956f6a389 ("powerpc/pseries/eeh:
> +         * Rework device EEH PE determination") kernel would call
> +         * eeh-set-option for each device in the PE using the device's
> +         * config_address as the argument rather than the PE address.
> +         * Hence if we check validity of supplied config_addr whether
> +         * it matches to this PHB will cause issues with older kernel
> +         * versions v5.9 and older. If we return an error from
> +         * eeh-set-option when the argument isn't a valid PE address
> +         * then older kernels (v5.9 and older) will interpret that as
> +         * EEH not being supported.
>           */
>          phb =3D PCI_HOST_BRIDGE(sphb);
> -        pdev =3D pci_find_device(phb->bus,
> -                               (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
> -        if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
> +        pci_for_each_device(phb->bus, (addr >> 16) & 0xFF,
> +                            spapr_eeh_pci_find_device, &found);
> +
> +        if (!found) {
>              return RTAS_OUT_PARAM_ERROR;
>          }
> =20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KsJc5TlH/vv3m7cB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrGggACgkQbDjKyiDZ
s5IZvBAAon0gM8aBwAFav7O7LwBRw6o8r1dGtDwH662zXPqgEZeu8T5PdY1FxSmO
00X++YaWCDEmUONXKQBA8/Db9OY/HEJipRnNHsSG5tCLii34RYv8jst8liYa3D8i
Aq9IujDGzVtbtWw6BqTdBtOmsmPeII47gkvrYv7DWO7+3l5AYAXO5PcVN1FPbRHv
ZRoXP255I7VJsxKUM+2Vpa6OPfRyi4om/nys2B456T5cG6zACI9tTVDBFteg2NWm
DUq5DzKNdNcq8LOpjFtp2wHNGjEUWs6drDhuspgYt3fGsyvXs8bitLaO33IQlhpd
UqnjaLkY5iT32xHfP8lMwyPJTiKtWHTStbF25653SvT8pXzdkFyDFou5tqZKBheN
mlUVnREUfgCkT0vLJJ0odDDGbYIJQdBUIG+V05HRkGXHIcJbjOktUbA5VoXNpz2A
GQissEMZf1/iCQ5w/NMNPgn9btKK1XI+TzXtyovBOI4MySl3nVdSxGQ+Fi9pV+YF
aXBoA0nqcjnSRkKnIIupm/EVHeyH/ECFLqHJW/TAyztTmoyRp0UP4FfTj6karsTm
SxXJSQ5BPAIRVu5sN3fo94J9uNizPWRZSLD8mb+OfTuzekrE1YwHS/k9M6KJYMV2
xg6x4XtCFulyUEIx0OAwqtjcpVYhA3VxVCYq2YmdFsh1dFYJ9RA=
=dko5
-----END PGP SIGNATURE-----

--KsJc5TlH/vv3m7cB--

