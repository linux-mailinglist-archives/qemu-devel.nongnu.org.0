Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0511963F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 22:25:52 +0100 (CET)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ien0x-0001WO-EC
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 16:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iemzm-0000yo-Qh
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iemzl-0002FB-MI
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:24:38 -0500
Received: from 18.mo4.mail-out.ovh.net ([188.165.54.143]:45949)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iemzl-0002EG-Fx
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:24:37 -0500
Received: from player738.ha.ovh.net (unknown [10.108.54.13])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id EFD1321672C
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 22:24:33 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 4263FD4205E1;
 Tue, 10 Dec 2019 21:24:27 +0000 (UTC)
Date: Tue, 10 Dec 2019 22:24:26 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/2] ppc/pnv: Loop on the whole hierarchy to populate
 the DT with the XSCOM nodes
Message-ID: <20191210222426.0c70918e@bahia.tlslab.ibm.com>
In-Reply-To: <20191210135845.19773-2-clg@kaod.org>
References: <20191210135845.19773-1-clg@kaod.org>
 <20191210135845.19773-2-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 941533800825330059
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.54.143
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Dec 2019 14:58:44 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Some PnvXScomInterface objects lie a bit deeper (PnvPBCQState) than
> the first layer, so we need to loop on the whole object hierarchy to
> catch them.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/pnv_xscom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index bed41840845e..006d87e970d9 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -326,7 +326,12 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_=
offset)
>      args.fdt =3D fdt;
>      args.xscom_offset =3D xscom_offset;
> =20
> -    object_child_foreach(OBJECT(chip), xscom_dt_child, &args);
> +    /*
> +     * Loop on the whole object hierarchy to catch all
> +     * PnvXScomInterface objects which can lie a bit deeper the first
> +     * layer.
> +     */
> +    object_child_foreach_recursive(OBJECT(chip), xscom_dt_child, &args);
>      return 0;
>  }
> =20


