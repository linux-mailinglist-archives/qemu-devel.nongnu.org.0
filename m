Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32122118E75
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 18:03:00 +0100 (CET)
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieiuY-0003Up-O6
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 12:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ieilT-0003Xh-TA
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:53:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ieilS-0007XI-Oh
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:53:35 -0500
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:40691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ieilS-0007X0-Ig
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:53:34 -0500
Received: from player693.ha.ovh.net (unknown [10.108.1.161])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 77FF57480C
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 17:53:32 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id CF43BD1B2159;
 Tue, 10 Dec 2019 16:53:25 +0000 (UTC)
Date: Tue, 10 Dec 2019 17:53:23 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/2] ppc/pnv: populate the DT with realized XSCOM devices
Message-ID: <20191210175323.76e77bcb@bahia.tlslab.ibm.com>
In-Reply-To: <20191210135845.19773-3-clg@kaod.org>
References: <20191210135845.19773-1-clg@kaod.org>
 <20191210135845.19773-3-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 14811213274579507595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.50.107
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

On Tue, 10 Dec 2019 14:58:45 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Some devices could be initialized in the instance_init handler but not
> realized for configuration reasons. Nodes should not be added in the DT
> for such devices.
>=20

Do you have examples of such devices to share ?

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/pnv_xscom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index 006d87e970d9..6d3745a49e50 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -272,7 +272,10 @@ static int xscom_dt_child(Object *child, void *opaqu=
e)
>          PnvXScomInterface *xd =3D PNV_XSCOM_INTERFACE(child);
>          PnvXScomInterfaceClass *xc =3D PNV_XSCOM_INTERFACE_GET_CLASS(xd);
> =20
> -        if (xc->dt_xscom) {
> +        /*
> +         * Only "realized" devices should be configured in the DT
> +         */
> +        if (xc->dt_xscom && DEVICE(child)->realized) {
>              _FDT((xc->dt_xscom(xd, args->fdt, args->xscom_offset)));
>          }
>      }


