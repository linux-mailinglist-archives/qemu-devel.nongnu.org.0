Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC220126548
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:57:07 +0100 (CET)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihxEg-0005u5-N8
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ihxCH-000340-KV
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:54:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ihxCG-0004uZ-6f
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:54:37 -0500
Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]:50113)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ihxCF-00048d-U2
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:54:36 -0500
Received: from player732.ha.ovh.net (unknown [10.109.143.246])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3CF0E263632
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 15:54:27 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 046EFD62E5A1;
 Thu, 19 Dec 2019 14:54:21 +0000 (UTC)
Date: Thu, 19 Dec 2019 15:54:19 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 01/10] ppc/pnv: Modify the powerdown notifier to get the
 PowerNV machine
Message-ID: <20191219155419.70d3c764@bahia.lan>
In-Reply-To: <20191219073001.26790-2-clg@kaod.org>
References: <20191219073001.26790-1-clg@kaod.org>
 <20191219073001.26790-2-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 10313806100162386315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.109.111
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

On Thu, 19 Dec 2019 08:29:52 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Use container_of() instead of qdev_get_machine()
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/pnv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f77e7ca84ede..855254f28263 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -561,7 +561,7 @@ static void *pnv_dt_create(MachineState *machine)
> =20
>  static void pnv_powerdown_notify(Notifier *n, void *opaque)
>  {
> -    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
> +    PnvMachineState *pnv =3D container_of(n, PnvMachineState, powerdown_=
notifier);
> =20
>      if (pnv->bmc) {
>          pnv_bmc_powerdown(pnv->bmc);


