Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4D648777B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:12:30 +0100 (CET)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5o6f-0007FQ-75
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:12:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n5nsf-0001XB-49
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:58:01 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n5nsb-0004Pe-RM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:58:00 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-1Q0ImecXMLmea5o_9q2rGQ-1; Fri, 07 Jan 2022 06:57:52 -0500
X-MC-Unique: 1Q0ImecXMLmea5o_9q2rGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B005A089;
 Fri,  7 Jan 2022 11:57:51 +0000 (UTC)
Received: from bahia (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6415752CD;
 Fri,  7 Jan 2022 11:57:48 +0000 (UTC)
Date: Fri, 7 Jan 2022 12:57:47 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Message-ID: <20220107125747.7ddfd3a0@bahia>
In-Reply-To: <20220107072423.2278113-1-aik@ozlabs.ru>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 18:24:23 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> "PowerPC Processor binding to IEEE 1275" says in
> "8.2.1. Initial Register Values" that the initial state is defined as
> 32bit so do it for both SLOF and VOF.
>=20
> This should not cause behavioral change as SLOF switches to 64bit very
> early anyway.=20

Only one CPU goes through SLOF. What about the other ones, including
hot plugged CPUs ?

> As nothing enforces LE anywhere, this drops it for VOF.
>=20
> The goal is to make VOF work with TCG as otherwise it barfs with
> qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  hw/ppc/spapr_cpu_core.c | 5 +++++
>  hw/ppc/spapr_vof.c      | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index a57ba70a8781..a781e97f8d1d 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -37,6 +37,11 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> =20
>      cpu_reset(cs);
> =20
> +    /*
> +     * "PowerPC Processor binding to IEEE 1275" defines the initial MSR =
state
> +     * as 32bit (MSR_SF=3D0) in "8.2.1. Initial Register Values".
> +     */
> +    env->msr &=3D ~(1ULL << MSR_SF);
>      env->spr[SPR_HIOR] =3D 0;
> =20
>      lpcr =3D env->spr[SPR_LPCR];
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> index 40ce8fe0037c..a33f940c32bb 100644
> --- a/hw/ppc/spapr_vof.c
> +++ b/hw/ppc/spapr_vof.c
> @@ -88,8 +88,6 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fd=
t, Error **errp)
>      spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>                                stack_ptr, spapr->initrd_base,
>                                spapr->initrd_size);
> -    /* VOF is 32bit BE so enforce MSR here */
> -    first_ppc_cpu->env.msr &=3D ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
> =20
>      /*
>       * At this point the expected allocation map is:


