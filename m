Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567C213AD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 08:23:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRWHZ-0007mZ-Uw
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 02:23:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRWGX-0007PL-Bc
	for qemu-devel@nongnu.org; Fri, 17 May 2019 02:22:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRWGV-00079Q-DS
	for qemu-devel@nongnu.org; Fri, 17 May 2019 02:22:49 -0400
Received: from 11.mo6.mail-out.ovh.net ([188.165.38.119]:35323)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hRWGU-00076K-6j
	for qemu-devel@nongnu.org; Fri, 17 May 2019 02:22:47 -0400
Received: from player788.ha.ovh.net (unknown [10.108.57.150])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id E7B4B1CB639
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 08:22:41 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player788.ha.ovh.net (Postfix) with ESMTPSA id A1B3C5D48401;
	Fri, 17 May 2019 06:22:36 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
References: <20190517041823.23871-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9b88623f-bad7-e946-1ec8-a58dc0248746@kaod.org>
Date: Fri, 17 May 2019 08:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517041823.23871-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 5994572582292523929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtuddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.38.119
Subject: Re: [Qemu-devel] [PATCH] spapr: Add forgotten capability to
 migration stream
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/19 6:18 AM, David Gibson wrote:
> spapr machine capabilities are supposed to be sent in the migration str=
eam
> so that we can sanity check the source and destination have compatible
> configuration.  Unfortunately, when we added the hpt-max-page-size
> capability, we forgot to add it to the migration state.  This means tha=
t we
> can generate spurious warnings when both ends are configured for large
> pages, or potentially fail to warn if the source is configured for huge
> pages, but the destination is not.
>=20
> Fixes: 2309832afda "spapr: Maximum (HPT) pagesize property"
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/ppc/spapr.c         | 1 +
>  hw/ppc/spapr_caps.c    | 1 +
>  include/hw/ppc/spapr.h | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 8580a8dc67..bcae30ad26 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2125,6 +2125,7 @@ static const VMStateDescription vmstate_spapr =3D=
 {
>          &vmstate_spapr_cap_cfpc,
>          &vmstate_spapr_cap_sbbc,
>          &vmstate_spapr_cap_ibs,
> +        &vmstate_spapr_cap_hpt_maxpagesize,
>          &vmstate_spapr_irq_map,
>          &vmstate_spapr_cap_nested_kvm_hv,
>          &vmstate_spapr_dtb,
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9b1c10baa6..658eb15a14 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -703,6 +703,7 @@ SPAPR_CAP_MIG_STATE(dfp, SPAPR_CAP_DFP);
>  SPAPR_CAP_MIG_STATE(cfpc, SPAPR_CAP_CFPC);
>  SPAPR_CAP_MIG_STATE(sbbc, SPAPR_CAP_SBBC);
>  SPAPR_CAP_MIG_STATE(ibs, SPAPR_CAP_IBS);
> +SPAPR_CAP_MIG_STATE(hpt_maxpagesize, SPAPR_CAP_HPT_MAXPAGESIZE);
>  SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_KVM_HV);
>  SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
>  SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 7e32f309c2..9fc91c8f5e 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -849,6 +849,7 @@ extern const VMStateDescription vmstate_spapr_cap_d=
fp;
>  extern const VMStateDescription vmstate_spapr_cap_cfpc;
>  extern const VMStateDescription vmstate_spapr_cap_sbbc;
>  extern const VMStateDescription vmstate_spapr_cap_ibs;
> +extern const VMStateDescription vmstate_spapr_cap_hpt_maxpagesize;
>  extern const VMStateDescription vmstate_spapr_cap_nested_kvm_hv;
>  extern const VMStateDescription vmstate_spapr_cap_large_decr;
>  extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
>=20


