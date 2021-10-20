Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B93434415
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 06:19:42 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md34m-0000LS-I4
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 00:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1md318-0007bM-DF; Wed, 20 Oct 2021 00:15:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1md315-0005h4-Dx; Wed, 20 Oct 2021 00:15:53 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HYy2W2szXz4xd8; Wed, 20 Oct 2021 15:15:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634703331;
 bh=vKw19D21mDmEFrgWeT/sdw4soarDnVw84D9uMe160MA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cQDasABmgMAPAIhcEd+yK9YtTtxCb2lZ7/WMeKO4gAObBe+GEVAT9H5ongfT0c7DK
 kY25l9CHc3jJ7877A3kTY9qza2RU4RmssvRv18h+DHpdkJpgIwvnJ3Xk/k110JwvwL
 4vLX3KUjqKOhtVwD1fWES2ETrBkNcmW2JqwtVmZw=
Date: Wed, 20 Oct 2021 15:15:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent
 Linux kernels
Message-ID: <YW+X3hZ02B/mosyi@yekko>
References: <20211019091817.469003-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F/D81DonFyFSjtSR"
Content-Disposition: inline
In-Reply-To: <20211019091817.469003-1-thuth@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, clg@kaod.org, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--F/D81DonFyFSjtSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 11:18:17AM +0200, Thomas Huth wrote:
65;6402;1c> Recent Linux kernels are accessing the PCI device in slot 0 that
> represents the PCI host bridge. This causes ppc4xx_pci_map_irq()
> to return -1 which causes an assert() later:
>=20
>  hw/pci/pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >=3D 0' f=
ailed.
>=20
> Thus we should allocate an IRQ line for the device in slot 0, too.
> To avoid changes to the outside of ppc4xx_pci.c, we map it to
> the internal IRQ number 4 which will then happily be ignored since
> ppc440_bamboo.c does not wire it up.
>=20
> With these changes it is now possible again to use recent Linux
> kernels for the bamboo board.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/ppc4xx_pci.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 8147ba6f94..304a29349c 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -48,12 +48,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(PPC4xxPCIState, PPC4xx_PCI=
_HOST_BRIDGE)
>  #define PPC4xx_PCI_NR_PMMS 3
>  #define PPC4xx_PCI_NR_PTMS 2
> =20
> +#define PPC4xx_PCI_NUM_DEVS 5
> +
>  struct PPC4xxPCIState {
>      PCIHostState parent_obj;
> =20
>      struct PCIMasterMap pmm[PPC4xx_PCI_NR_PMMS];
>      struct PCITargetMap ptm[PPC4xx_PCI_NR_PTMS];
> -    qemu_irq irq[PCI_NUM_PINS];
> +    qemu_irq irq[PPC4xx_PCI_NUM_DEVS];
> =20
>      MemoryRegion container;
>      MemoryRegion iomem;
> @@ -246,7 +248,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int=
 irq_num)
> =20
>      trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
> =20
> -    return slot - 1;
> +    return slot > 0 ? slot - 1 : PPC4xx_PCI_NUM_DEVS - 1;
>  }
> =20
>  static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
> @@ -254,7 +256,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_=
num, int level)
>      qemu_irq *pci_irqs =3D opaque;
> =20
>      trace_ppc4xx_pci_set_irq(irq_num);
> -    assert(irq_num >=3D 0);
> +    assert(irq_num >=3D 0 && irq_num < PPC4xx_PCI_NUM_DEVS);
>      qemu_set_irq(pci_irqs[irq_num], level);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--F/D81DonFyFSjtSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFvl9wACgkQbDjKyiDZ
s5K5cxAAnLLfWu4J/eAy2tdMp79DJ/HaXfhBRNmmLMC4+WAEFpo8LnFNWcVnG6Bl
2gHxdx8aGAMiowW96vruHSITcTcOAT0H5lu/l2qPNXvtCb1Pl4pIxPEIzrXS6S0P
h0rBpHos7tUrB8ANdjO5CcK+7OOB5KIl0eoZbDisiGry0bmEIu/3ZEAFF+NbIvof
aUJ7Qo1lqmPMlmJg0XvKvNXdKBlYmXI4kAik3sLqZPRdIXQuEtugjxLnUGBdv5t4
acD0kuuqGHQrt0CA52AKK8nyyEC4UkGeCIDWtahR9EA5mx40VSMfXJ0W7hbxjcmU
z7roQ1/wUiXtGN4eYmYAz9n9PzF9oH4E6pLQUyQmvWAa2zWM5IIHgcNow4arifoD
tOiRpq2GRswKlVNZHTDPisBHqYQTUfKdiTEqmQRgMPlkzLl/sk5ECf/EohXCgm+T
qcLLXmS7rBb0X1e0sn43+eAKUFOy3orbxsZ///kOw/GpeRONYnAvObgVg4O8vmj6
DuoM6A1Ci5dWDZ0Xkv99umCN7BlbRucRlLKgDTmORiZyL+lQM2MfiXPhKsNHJ75y
5aNcuhf/Y1K9tMXCVtodMpMcodHaAAcQj24FxvXLMn6m68qtiUGejdkZZmhHxhyA
3mrdsugBkwsm1SaLS1F+mrfloGP/vCzrNnV2AH5i+3YssU9UKfQ=
=KPu5
-----END PGP SIGNATURE-----

--F/D81DonFyFSjtSR--

