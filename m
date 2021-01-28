Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDCD306ABE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:53:45 +0100 (CET)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wVE-0006Yq-Ac
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wOA-00085d-MR; Wed, 27 Jan 2021 20:46:26 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52715 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO8-0005Br-Nl; Wed, 27 Jan 2021 20:46:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GV4721z9sWD; Thu, 28 Jan 2021 12:46:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798370;
 bh=u1qLpa/yxNyfKUEJ4a2I8hqYOvPvvW0V6T0oVoBdUOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=em16T8G54CwLwTd+Gg/D87wj/zJNsAWfgqiVJnHwKyFXkuEPhFOLnyL8TiWg/RvFI
 7MKbg8vHttm1DwQ5jJX0WfZIYbctH8tqydyBZdjlis2WM0WDBwV6D9UvebC1Sk1/pr
 vceo6sw/v6Bj6sn5grSW2MOsEzHnswv/gU978P+w=
Date: Thu, 28 Jan 2021 11:52:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 6/7] ppc/pnv: Remove default disablement of the PNOR
 contents
Message-ID: <20210128005242.GI18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-7-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-7-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:58PM +0100, C=E9dric Le Goater wrote:
> On PowerNV systems, the BMC is in charge of mapping the PNOR contents
> on the LPC FW address space using the HIOMAP protocol. Under QEMU, we
> emulate this behavior and we also add an extra control on the flash
> accesses by letting the HIOMAP command handler decide whether the
> memory region is accessible or not depending on the firmware requests.
>=20
> However, this behavior is not compatible with hostboot like firmwares
> which need this mapping to be always available. For this reason, the
> PNOR memory region is initially disabled for skiboot mode only.
>=20
> This is badly placed under the LPC model and requires the use of the
> machine. Since it doesn't add much, simply remove the initial setting.
> The extra control in the HIOMAP command handler will still be performed.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/pnv_lpc.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index 590359022084..11739e397b27 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -825,7 +825,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, boo=
l use_cpld, Error **errp)
>      qemu_irq *irqs;
>      qemu_irq_handler handler;
>      PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
> -    bool hostboot_mode =3D !!pnv->fw_load_addr;
> =20
>      /* let isa_bus_new() create its own bridge on SysBus otherwise
>       * devices specified on the command line won't find the bus and
> @@ -856,13 +855,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bo=
ol use_cpld, Error **errp)
>       */
>      memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
>                                  &pnv->pnor->mmio);
> -    /*
> -     * Start disabled. The HIOMAP protocol will activate the mapping
> -     * with HIOMAP_C_CREATE_WRITE_WINDOW
> -     */
> -    if (!hostboot_mode) {
> -        memory_region_set_enabled(&pnv->pnor->mmio, false);
> -    }
> =20
>      return isa_bus;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASCtoACgkQbDjKyiDZ
s5KynA/+NubUn0gjthErhynUrhibyQsIikDr7gtVjfoXJlNTU8bolgDkfCcfrSt6
p+Z+ruBJZcAxcBsXLYkSZYkpkfqrnAcGkJcLtJ6J+uHZA8DRPVR8MLaibCDZHBY3
QX5Wo4TXx6QyM13lO68P2wIjZJ3R2M//QM6/vqwblyzoMrq+p8yd1SsUXOCHSW6s
27VuKtaMGzTFjI0gDSexwRueaDTKoqHD7+n1cTUTriwQYT6iB4LOKCwuWn/irJ9D
lmvzIRzans9J+KyXuioswZ5qhkK0tE5h5WAvcL3+3ALmALnOlhWfDmyq9Hzz/VYO
Wej/B76Db1ufLF/Y3AI6DoQ6Ia8sF2OdPNI8sLB6zv9Su1IQWE1+ntX+uEARLXbK
JsYfuqjEXtbLM3A3sRjaQsPdUQYLlQl5Rc2iKMXxsP3Q0L237vETY5xfb52uztke
V+gryjMR57+pBwmaRebgbC/uU2GyyqcS+rHOJVsFD6ypAfHk67ITGdRYIgx6g72p
TOevoSFgPD/mY8H0dyHYJlqL4N6yl5rZxXZJN+ZiBFGs/Yfl4oop4mECFK1Sq+9T
e4JeA/16EW4HPQDTJk9c7XMJcpeUniPMOSLRWlvksiGp/dMTi/g5UJcjkYErfTmS
LLncbekjZSp9AJmBW/F87r/U5VR9wVEJp/1X1dIw7eoWSKTdgqs=
=iV66
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--

