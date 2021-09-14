Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7940A91D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:25:21 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3km-0004vK-8e
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ3jE-0003yh-0K
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:23:44 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:39368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ3jC-0008GE-FA
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:23:43 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-C6v-yxhzPne1I5t2r7SfwQ-1; Tue, 14 Sep 2021 04:23:30 -0400
X-MC-Unique: C6v-yxhzPne1I5t2r7SfwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74843100C661;
 Tue, 14 Sep 2021 08:23:29 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAD160C82;
 Tue, 14 Sep 2021 08:23:26 +0000 (UTC)
Date: Tue, 14 Sep 2021 10:23:25 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 1/6] spapr_numa.c: split FORM1 code into helpers
Message-ID: <20210914102325.0fffb31f@bahia.huguette>
In-Reply-To: <20210910195539.797170-2-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sep 2021 16:55:34 -0300
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
>  hw/ppc/spapr_numa.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 779f18b994..786def7c73 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -92,7 +92,7 @@ static uint8_t spapr_numa_get_numa_level(uint8_t distan=
ce)
>      return 0;
>  }
> =20
> -static void spapr_numa_define_associativity_domains(SpaprMachineState *s=
papr)
> +static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)

Another option would have been to open-code this function in its
unique caller but your patch is definitely easier to review so :

Reviewed-by: Greg Kurz <groug@kaod.org>


>  {
>      MachineState *ms =3D MACHINE(spapr);
>      NodeInfo *numa_info =3D ms->numa_state->nodes;
> @@ -155,8 +155,11 @@ static void spapr_numa_define_associativity_domains(=
SpaprMachineState *spapr)
> =20
>  }
> =20
> -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> -                                   MachineState *machine)
> +/*
> + * Set NUMA machine state data based on FORM1 affinity semantics.
> + */
> +static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
> +                                           MachineState *machine)
>  {
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
>      int nb_numa_nodes =3D machine->numa_state->num_nodes;
> @@ -225,7 +228,13 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>          exit(EXIT_FAILURE);
>      }
> =20
> -    spapr_numa_define_associativity_domains(spapr);
> +    spapr_numa_define_FORM1_domains(spapr);
> +}
> +
> +void spapr_numa_associativity_init(SpaprMachineState *spapr,
> +                                   MachineState *machine)
> +{
> +    spapr_numa_FORM1_affinity_init(spapr, machine);
>  }
> =20
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
> @@ -302,12 +311,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachin=
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
> @@ -365,6 +370,16 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spa=
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


