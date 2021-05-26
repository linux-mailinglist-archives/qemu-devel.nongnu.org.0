Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF6391CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:06:53 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llw3Y-0007J7-3G
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1llw09-0002x9-Gc
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:03:21 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:52089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1llw07-0000Rr-OZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:03:21 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-_V5loZ5RNb6TSxCzYcuLlA-1; Wed, 26 May 2021 12:03:13 -0400
X-MC-Unique: _V5loZ5RNb6TSxCzYcuLlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10008E7B43;
 Wed, 26 May 2021 16:03:12 +0000 (UTC)
Received: from bahia.lan (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC0E060875;
 Wed, 26 May 2021 16:03:10 +0000 (UTC)
Date: Wed, 26 May 2021 18:03:09 +0200
From: Greg Kurz <groug@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 2/3] spapr: Set LPCR to current AIL mode when
 starting a new CPU
Message-ID: <20210526180309.24b189c3@bahia.lan>
In-Reply-To: <20210526091626.3388262-3-npiggin@gmail.com>
References: <20210526091626.3388262-1-npiggin@gmail.com>
 <20210526091626.3388262-3-npiggin@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 19:16:25 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> TCG does not keep track of AIL mode in a central place, it's based on
> the current LPCR[AIL] bits. Synchronize the new CPU's LPCR to the
> current LPCR in rtas_start_cpu(), similarly to the way the ILE bit is
> synchronized.
>=20
> Open-code the ILE setting as well now that the caller's LPCR is
> available directly, there is no need for the indirection.
>=20
> Without this, under both TCG and KVM, adding a POWER8/9/10 class CPU
> with a new core ID after a modern Linux has booted results in the new
> CPU's LPCR missing the LPCR[AIL]=3D0b11 setting that the other CPUs have.
> This can cause crashes and unexpected behaviour.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_rtas.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 63d96955c0..b476382ae6 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -132,8 +132,8 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spapr=
MachineState *spapr,
>      target_ulong id, start, r3;
>      PowerPCCPU *newcpu;
>      CPUPPCState *env;
> -    PowerPCCPUClass *pcc;
>      target_ulong lpcr;
> +    target_ulong caller_lpcr;
> =20
>      if (nargs !=3D 3 || nret !=3D 1) {
>          rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> @@ -152,7 +152,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spapr=
MachineState *spapr,
>      }
> =20
>      env =3D &newcpu->env;
> -    pcc =3D POWERPC_CPU_GET_CLASS(newcpu);
> =20
>      if (!CPU(newcpu)->halted) {
>          rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
> @@ -164,10 +163,15 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spa=
prMachineState *spapr,
>      env->msr =3D (1ULL << MSR_SF) | (1ULL << MSR_ME);
>      hreg_compute_hflags(env);
> =20
> +    caller_lpcr =3D callcpu->env.spr[SPR_LPCR];
>      lpcr =3D env->spr[SPR_LPCR];
> -    if (!pcc->interrupts_big_endian(callcpu)) {
> -        lpcr |=3D LPCR_ILE;
> -    }
> +
> +    /* Set ILE the same way */
> +    lpcr =3D (lpcr & ~LPCR_ILE) | (caller_lpcr & LPCR_ILE);
> +

Unrelated change as Cedric already noted but that's nice :)

/me starting to think we might do the same elsewhere and
maybe get rid of PowerPCCPUClass::interrupts_big_endian()

> +    /* Set AIL the same way */
> +    lpcr =3D (lpcr & ~LPCR_AIL) | (caller_lpcr & LPCR_AIL);
> +

It seems better indeed to rely on the calling CPU here rather
than the arbitrary first_cpu in the hotplug handler.

Reviewed-by: Greg Kurz <groug@kaod.org>

>      if (env->mmu_model =3D=3D POWERPC_MMU_3_00) {
>          /*
>           * New cpus are expected to start in the same radix/hash mode


