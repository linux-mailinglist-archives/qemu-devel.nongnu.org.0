Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6B3F7972
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:50:57 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIvAx-0003ML-Bz
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mIv9f-00025G-RN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:49:31 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:54695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mIv9d-00047x-Re
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:49:31 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ZUk-vDjZOOyLHzTDihZUwA-1; Wed, 25 Aug 2021 11:49:23 -0400
X-MC-Unique: ZUk-vDjZOOyLHzTDihZUwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B95192D789;
 Wed, 25 Aug 2021 15:49:21 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.194.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6D815C1A1;
 Wed, 25 Aug 2021 15:49:20 +0000 (UTC)
Date: Wed, 25 Aug 2021 17:49:19 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RESEND PATCH v3 1/5] spapr_numa.c: split FORM1 code into helpers
Message-ID: <20210825174919.3c71a5d2@bahia.lan>
In-Reply-To: <20210825143943.529733-2-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
 <20210825143943.529733-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 11:39:39 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The upcoming FORM2 NUMA affinity will support asymmetric NUMA topologies
> and doesn't need be concerned with all the legacy support for older
> pseries FORM1 guests.
>=20
> We're also not going to calculate associativity domains based on numa
> distance (via spapr_numa_define_associativity_domains) since the
> distances will be written directly into new DT properties.
>=20
> Let's split FORM1 code into its own functions to allow for easier
> insertion of FORM2 logic later on.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_numa.c | 61 +++++++++++++++++++++++++++++----------------
>  1 file changed, 39 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 779f18b994..04a86f9b5b 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -155,6 +155,32 @@ static void spapr_numa_define_associativity_domains(=
SpaprMachineState *spapr)
> =20
>  }
> =20
> +/*
> + * Set NUMA machine state data based on FORM1 affinity semantics.
> + */
> +static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
> +                                           MachineState *machine)
> +{
> +    bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr);
> +
> +    /*
> +     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
> +     * 1 NUMA node) will not benefit from anything we're going to do
> +     * after this point.
> +     */
> +    if (using_legacy_numa) {
> +        return;
> +    }
> +
> +    if (!spapr_numa_is_symmetrical(machine)) {
> +        error_report("Asymmetrical NUMA topologies aren't supported "
> +                     "in the pSeries machine");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    spapr_numa_define_associativity_domains(spapr);
> +}
> +
>  void spapr_numa_associativity_init(SpaprMachineState *spapr,
>                                     MachineState *machine)
>  {
> @@ -210,22 +236,7 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
>      }
> =20
> -    /*
> -     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
> -     * 1 NUMA node) will not benefit from anything we're going to do
> -     * after this point.
> -     */
> -    if (using_legacy_numa) {
> -        return;
> -    }
> -
> -    if (!spapr_numa_is_symmetrical(machine)) {
> -        error_report("Asymmetrical NUMA topologies aren't supported "
> -                     "in the pSeries machine");
> -        exit(EXIT_FAILURE);
> -    }
> -
> -    spapr_numa_define_associativity_domains(spapr);
> +    spapr_numa_FORM1_affinity_init(spapr, machine);
>  }
> =20
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
> @@ -302,12 +313,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachin=
eState *spapr, void *fdt,
>      return ret;
>  }
> =20
> -/*
> - * Helper that writes ibm,associativity-reference-points and
> - * max-associativity-domains in the RTAS pointed by @rtas
> - * in the DT @fdt.
> - */
> -void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
> +static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
> +                                           void *fdt, int rtas)
>  {
>      MachineState *ms =3D MACHINE(spapr);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> @@ -365,6 +372,16 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spa=
pr, void *fdt, int rtas)
>                       maxdomains, sizeof(maxdomains)));
>  }
> =20
> +/*
> + * Helper that writes ibm,associativity-reference-points and
> + * max-associativity-domains in the RTAS pointed by @rtas
> + * in the DT @fdt.
> + */
> +void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
> +{
> +    spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
> +}
> +
>  static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
>                                                SpaprMachineState *spapr,
>                                                target_ulong opcode,


