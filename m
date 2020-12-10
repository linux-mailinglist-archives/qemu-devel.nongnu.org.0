Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274262D518C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:41:44 +0100 (CET)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCpr-00007g-4W
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCmA-0006nq-62; Wed, 09 Dec 2020 22:37:54 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39461 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCm5-0003US-8S; Wed, 09 Dec 2020 22:37:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs03n5bHNz9sWL; Thu, 10 Dec 2020 14:37:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607571461;
 bh=m++D17J9CytwBeq6eKjAkLZxJE2+D9uo4WEox4EZ1bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2gIicoq0vFA2S3UUDC1lZdnzY1tGn4nwsEE9Bqs8R2dsD+IW7aVouTz+vfyCzHX5
 //hnCgsN4MeXYE40rnSW4eKUK+Dlwuhlnn0Q1OIog0udhu3xFBlu7534ss4CfE0Qjh
 TxalS6NRm00BMCfnO8izvX0qz8DS1yCdl2p4DOVw=
Date: Thu, 10 Dec 2020 14:28:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/6] spapr: Pass sPAPR machine state down to
 spapr_pci_switch_vga()
Message-ID: <20201210032854.GH2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-4-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nOM8ykUjac0mNN89"
Content-Disposition: inline
In-Reply-To: <20201209170052.1431440-4-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nOM8ykUjac0mNN89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 06:00:49PM +0100, Greg Kurz wrote:
> This allows to drop a user of qdev_get_machine().
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0.

> ---
>  include/hw/ppc/spapr.h | 2 +-
>  hw/ppc/spapr_hcall.c   | 7 ++++---
>  hw/ppc/spapr_pci.c     | 3 +--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index b7ced9faebf5..e0f10f252c08 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -834,7 +834,7 @@ int spapr_dma_dt(void *fdt, int node_off, const char =
*propname,
>                   uint32_t liobn, uint64_t window, uint32_t size);
>  int spapr_tcet_dma_dt(void *fdt, int node_off, const char *propname,
>                        SpaprTceTable *tcet);
> -void spapr_pci_switch_vga(bool big_endian);
> +void spapr_pci_switch_vga(SpaprMachineState *spapr, bool big_endian);
>  void spapr_hotplug_req_add_by_index(SpaprDrc *drc);
>  void spapr_hotplug_req_remove_by_index(SpaprDrc *drc);
>  void spapr_hotplug_req_add_by_count(SpaprDrcType drc_type,
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 1d8e8e6a888f..c0ea0bd5794b 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1351,6 +1351,7 @@ static target_ulong h_logical_dcbf(PowerPCCPU *cpu,=
 SpaprMachineState *spapr,
>  }
> =20
>  static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
> +                                           SpaprMachineState *spapr,
>                                             target_ulong mflags,
>                                             target_ulong value1,
>                                             target_ulong value2)
> @@ -1365,12 +1366,12 @@ static target_ulong h_set_mode_resource_le(PowerP=
CCPU *cpu,
>      switch (mflags) {
>      case H_SET_MODE_ENDIAN_BIG:
>          spapr_set_all_lpcrs(0, LPCR_ILE);
> -        spapr_pci_switch_vga(true);
> +        spapr_pci_switch_vga(spapr, true);
>          return H_SUCCESS;
> =20
>      case H_SET_MODE_ENDIAN_LITTLE:
>          spapr_set_all_lpcrs(LPCR_ILE, LPCR_ILE);
> -        spapr_pci_switch_vga(false);
> +        spapr_pci_switch_vga(spapr, false);
>          return H_SUCCESS;
>      }
> =20
> @@ -1411,7 +1412,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, Spa=
prMachineState *spapr,
> =20
>      switch (resource) {
>      case H_SET_MODE_RESOURCE_LE:
> -        ret =3D h_set_mode_resource_le(cpu, args[0], args[2], args[3]);
> +        ret =3D h_set_mode_resource_le(cpu, spapr, args[0], args[2], arg=
s[3]);
>          break;
>      case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
>          ret =3D h_set_mode_resource_addr_trans_mode(cpu, args[0],
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 2d9b88b93122..149bf4c21d22 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2490,9 +2490,8 @@ static int spapr_switch_one_vga(DeviceState *dev, v=
oid *opaque)
>      return 0;
>  }
> =20
> -void spapr_pci_switch_vga(bool big_endian)
> +void spapr_pci_switch_vga(SpaprMachineState *spapr, bool big_endian)
>  {
> -    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>      SpaprPhbState *sphb;
> =20
>      /*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nOM8ykUjac0mNN89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/RlfYACgkQbDjKyiDZ
s5LVpQ//biS09yMa13P4OEfGe0FBbDRNUY1hHrEU4Sax0dkkQ+qdPIqWzk2tJyv7
L2Q3JRcVT5+JHOSubwZIFQyCEFyXCn7JZ1AilXh0qAFdEUmxlA+ZfznbOHYt0kRE
dy4c3xpT/yUqFsrZbCiBL20HGp4KkWKBYVhNmbvvvGy9eWB4dqCyk1gu+gMIfYYk
2LVDnaOg/O2judlviwog4HHnpFX2DF5WvBbvAqze8tZ1IhKZoo6Mm0kwvE5wKrGd
7U5SFnYb/yLDs23p1PBYDMCh6xFcXDVO+4PlBpu7nwqbn/FOGoD4bR0ePbJXNCS5
D37gIqnrbd74963GlEk59Yan4OQJycacNhwstguzBkeGQcL/DDSKtTTMtbYNJBnj
ZNrhuQLNhTnNuXd3Jl3RvgrTnqLjWotKm8lt6OYUWzPrUjGY1HHA/WgdSBSZtLne
DUA1bMKVyLyExiZleQ0gU2MwOnDtxZ1JMJo8L3HLA30AGImjzMX94COwROATT2J3
ipezXq7XyLXzdauoW9XCRMYe8kpNaGcnZyXPVegJFmclQ5g/k5fwK4HtDMINQ2WD
2emkwlx3+x6DD2GRGFB+VnWxyNlDjXeQHpifuY4Q51JHDbFQVaLzMNvlj7VKf271
pDbgB8cEWNBAqRMF313yoybPg75oCbThk64qMskrA2Q+cdVyyNc=
=+vSk
-----END PGP SIGNATURE-----

--nOM8ykUjac0mNN89--

