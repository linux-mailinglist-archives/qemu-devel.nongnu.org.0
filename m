Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E024E0740
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 17:25:59 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMw2o-0007l3-2a
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iMw1O-00075u-U2
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 11:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iMw1N-0004q1-LL
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 11:24:30 -0400
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:47884)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iMw1N-0004op-EI
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 11:24:29 -0400
Received: from player795.ha.ovh.net (unknown [10.109.146.166])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id EB7D820CB3B
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 17:24:26 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 8E97DB15D98E;
 Tue, 22 Oct 2019 15:24:21 +0000 (UTC)
Date: Tue, 22 Oct 2019 17:24:18 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 3/7] ppc/pnv: Introduce a PnvCore reset handler
Message-ID: <20191022172418.57811758@bahia.lan>
In-Reply-To: <20191022134632.29098-4-clg@kaod.org>
References: <20191022134632.29098-1-clg@kaod.org>
 <20191022134632.29098-4-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 2245607366571563403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.33.112
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Oct 2019 15:46:28 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> in which individual CPUs are reset. It will ease the introduction of
> future change reseting the interrupt presenter from the CPU reset
> handler.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/pnv_core.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index b1a7489e7abf..9f981a4940e6 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -40,9 +40,8 @@ static const char *pnv_core_cpu_typename(PnvCore *pc)
>      return cpu_type;
>  }
> =20
> -static void pnv_cpu_reset(void *opaque)
> +static void pnv_core_cpu_reset(PowerPCCPU *cpu)
>  {
> -    PowerPCCPU *cpu =3D opaque;
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> =20
> @@ -192,8 +191,17 @@ static void pnv_realize_vcpu(PowerPCCPU *cpu, PnvChi=
p *chip, Error **errp)
> =20
>      /* Set time-base frequency to 512 MHz */
>      cpu_ppc_tb_init(env, PNV_TIMEBASE_FREQ);
> +}
> +
> +static void pnv_core_reset(void *dev)
> +{
> +    CPUCore *cc =3D CPU_CORE(dev);
> +    PnvCore *pc =3D PNV_CORE(dev);
> +    int i;
> =20
> -    qemu_register_reset(pnv_cpu_reset, cpu);
> +    for (i =3D 0; i < cc->nr_threads; i++) {
> +        pnv_core_cpu_reset(pc->threads[i]);
> +    }
>  }
> =20
>  static void pnv_core_realize(DeviceState *dev, Error **errp)
> @@ -244,6 +252,8 @@ static void pnv_core_realize(DeviceState *dev, Error =
**errp)
>      snprintf(name, sizeof(name), "xscom-core.%d", cc->core_id);
>      pnv_xscom_region_init(&pc->xscom_regs, OBJECT(dev), pcc->xscom_ops,
>                            pc, name, PNV_XSCOM_EX_SIZE);
> +
> +    qemu_register_reset(pnv_core_reset, pc);
>      return;
> =20
>  err:
> @@ -259,7 +269,6 @@ static void pnv_unrealize_vcpu(PowerPCCPU *cpu)
>  {
>      PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
> =20
> -    qemu_unregister_reset(pnv_cpu_reset, cpu);
>      object_unparent(OBJECT(pnv_cpu_state(cpu)->intc));
>      cpu_remove_sync(CPU(cpu));
>      cpu->machine_data =3D NULL;
> @@ -273,6 +282,8 @@ static void pnv_core_unrealize(DeviceState *dev, Erro=
r **errp)
>      CPUCore *cc =3D CPU_CORE(dev);
>      int i;
> =20
> +    qemu_unregister_reset(pnv_core_reset, pc);
> +
>      for (i =3D 0; i < cc->nr_threads; i++) {
>          pnv_unrealize_vcpu(pc->threads[i]);
>      }


