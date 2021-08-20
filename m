Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0183F2D4A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:41:44 +0200 (CEST)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4mF-0008Sx-7D
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH4lA-0007dl-LC
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:40:36 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:35301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH4l9-0003Gl-2s
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:40:36 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-sWNwAbuhMBCT6Rn3url4eQ-1; Fri, 20 Aug 2021 09:40:30 -0400
X-MC-Unique: sWNwAbuhMBCT6Rn3url4eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 402AA107ACF5;
 Fri, 20 Aug 2021 13:40:29 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6A566A8FE;
 Fri, 20 Aug 2021 13:40:27 +0000 (UTC)
Date: Fri, 20 Aug 2021 15:40:26 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 01/26] ppc: Add a POWER10 DD2 CPU
Message-ID: <20210820154026.614dd703@bahia.lan>
In-Reply-To: <20210809134547.689560-2-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-2-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 15:45:22 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The POWER10 DD2 CPU adds an extra LPCR[HAIL] bit. DD1 doesn't have
> HAIL but since it does not break the modeling and that we don't plan
> to support DD1, modify the LPCR mask of all the POWER10 family.
>=20

Maybe consider dropping DD1 at some point then ?

Anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

> Setting the HAIL bit is a requirement to support the scv instruction
> on PowerNV POWER10 platforms since glibc-2.33.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  target/ppc/cpu-models.h | 1 +
>  target/ppc/cpu-models.c | 4 +++-
>  target/ppc/cpu_init.c   | 3 +++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index fc5e21728d7e..095259275941 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -375,6 +375,7 @@ enum {
>      CPU_POWERPC_POWER9_DD20        =3D 0x004E1200,
>      CPU_POWERPC_POWER10_BASE       =3D 0x00800000,
>      CPU_POWERPC_POWER10_DD1        =3D 0x00800100,
> +    CPU_POWERPC_POWER10_DD20       =3D 0x00800200,
>      CPU_POWERPC_970_v22            =3D 0x00390202,
>      CPU_POWERPC_970FX_v10          =3D 0x00391100,
>      CPU_POWERPC_970FX_v20          =3D 0x003C0200,
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 87e4228614b0..4baa111713b0 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -776,6 +776,8 @@
>                  "POWER9 v2.0")
>      POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POW=
ER10,
>                  "POWER10 v1.0")
> +    POWERPC_DEF("power10_v2.0",  CPU_POWERPC_POWER10_DD20,           POW=
ER10,
> +                "POWER10 v2.0")
>  #endif /* defined (TARGET_PPC64) */
> =20
>  /***********************************************************************=
****/
> @@ -952,7 +954,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] =3D {
>      { "power8", "power8_v2.0" },
>      { "power8nvl", "power8nvl_v1.0" },
>      { "power9", "power9_v2.0" },
> -    { "power10", "power10_v1.0" },
> +    { "power10", "power10_v2.0" },
>  #endif
> =20
>      /* Generic PowerPCs */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 505a0ed6ac09..66deb18a6b65 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -8270,6 +8270,9 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data=
)
>                               LPCR_DEE | LPCR_OEE))
>          | LPCR_MER | LPCR_GTSE | LPCR_TC |
>          LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
> +    /* DD2 adds an extra HAIL bit */
> +    pcc->lpcr_mask |=3D LPCR_HAIL;
> +
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)


