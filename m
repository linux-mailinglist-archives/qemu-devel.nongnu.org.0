Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FF17C187
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 16:17:49 +0100 (CET)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAEjT-0002Kx-KZ
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 10:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jAEiV-0001YL-Um
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jAEiV-0004Cy-2D
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:16:47 -0500
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:35793)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jAEiU-00046U-Ss
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:16:47 -0500
Received: from player737.ha.ovh.net (unknown [10.110.208.245])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id E4AC587590
 for <qemu-devel@nongnu.org>; Fri,  6 Mar 2020 16:16:42 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id C38246B0FB80;
 Fri,  6 Mar 2020 15:16:38 +0000 (UTC)
Date: Fri, 6 Mar 2020 16:16:37 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr/xive: use SPAPR_IRQ_IPI to define IPI ranges
 exposed to the guest
Message-ID: <20200306161637.002d4826@bahia.home>
In-Reply-To: <20200306123307.1348-1-clg@kaod.org>
References: <20200306123307.1348-1-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 7591380122623252875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.78
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

On Fri,  6 Mar 2020 13:33:07 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The "ibm,xive-lisn-ranges" defines ranges of interrupt numbers that
> the guest can use to configure IPIs. It starts at 0 today but it could
> change to some other offset. Make clear which IRQ range we are
> exposing by using SPAPR_IRQ_IPI in the property definition.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/spapr_xive.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 20c8155557d6..6608d7220a47 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -677,8 +677,8 @@ static void spapr_xive_dt(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
>      uint64_t timas[2 * 2];
>      /* Interrupt number ranges for the IPIs */
>      uint32_t lisn_ranges[] =3D {
> -        cpu_to_be32(0),
> -        cpu_to_be32(nr_servers),
> +        cpu_to_be32(SPAPR_IRQ_IPI),
> +        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
>      };
>      /*
>       * EQ size - the sizes of pages supported by the system 4K, 64K,


