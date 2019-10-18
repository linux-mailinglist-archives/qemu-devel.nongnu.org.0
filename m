Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBADDBF73
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 10:09:04 +0200 (CEST)
Received: from localhost ([::1]:36283 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLNJn-0001zh-CW
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 04:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iLNIJ-00014T-2e
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:07:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iLNIH-0001p1-BS
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:07:30 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:39145)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iLNIH-0001oM-2A
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:07:29 -0400
Received: from player798.ha.ovh.net (unknown [10.109.143.79])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5C21C11D35B
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:07:26 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id B9365B2A9B81;
 Fri, 18 Oct 2019 08:07:21 +0000 (UTC)
Date: Fri, 18 Oct 2019 10:07:16 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/2] spapr/xive: Set the OS CAM line at reset
Message-ID: <20191018100716.35b417ac@bahia.lan>
In-Reply-To: <20191017144241.12522-3-clg@kaod.org>
References: <20191017144241.12522-1-clg@kaod.org>
 <20191017144241.12522-3-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 8267764494640519563
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.111.180
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

On Thu, 17 Oct 2019 16:42:41 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> When a Virtual Processor is scheduled to run on a HW thread, the
> hypervisor pushes its identifier in the OS CAM line. When running in
> TCG or kernel_irqchip=3Doff, QEMU needs to emulate the same behavior.
>=20

This is only related to kernel_irqchip=3Doff, which is always the case
when running in TCG actually. Maybe rephrase to "When not running with
an in-kernel irqchip, QEMU needs..." ?

> Introduce a 'os-cam' property which will be used to set the OS CAM
> line at reset and remove the spapr_xive_set_tctx_os_cam() calls which
> are done when the XIVE interrupt controller are activated.
>=20

Since OS CAM is constant, I guess it is ok to make it a property.
Alternatively, you could pass it as an extra parameter to
xive_tctx_reset().

> This change also has the benefit to remove the use of CPU_FOREACH()
> which can be unsafe.
>=20

Nice !

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/spapr_xive.h |  1 -
>  include/hw/ppc/xive.h       |  4 +++-
>  hw/intc/spapr_xive.c        | 31 +++++--------------------------
>  hw/intc/xive.c              | 22 +++++++++++++++++++++-
>  hw/ppc/pnv.c                |  3 ++-
>  5 files changed, 31 insertions(+), 30 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index d84bd5c229f0..742b7e834f2a 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -57,7 +57,6 @@ typedef struct SpaprXive {
>  void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
> =20
>  void spapr_xive_hcall_init(SpaprMachineState *spapr);
> -void spapr_xive_set_tctx_os_cam(XiveTCTX *tctx);
>  void spapr_xive_mmio_set_enabled(SpaprXive *xive, bool enable);
>  void spapr_xive_map_mmio(SpaprXive *xive);
> =20
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 99381639f50c..e273069c25a9 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -319,6 +319,7 @@ typedef struct XiveTCTX {
>      qemu_irq    os_output;
> =20
>      uint8_t     regs[XIVE_TM_RING_COUNT * XIVE_TM_RING_SIZE];
> +    uint32_t    os_cam;
>  } XiveTCTX;
> =20
>  /*
> @@ -414,7 +415,8 @@ void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset=
, uint64_t value,
>  uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr offset, unsigned size);
> =20
>  void xive_tctx_pic_print_info(XiveTCTX *tctx, Monitor *mon);
> -Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp);
> +Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, uint32_t os_cam,
> +                         Error **errp);
>  void xive_tctx_reset(XiveTCTX *tctx);
> =20
>  static inline uint32_t xive_nvt_cam_line(uint8_t nvt_blk, uint32_t nvt_i=
dx)
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 0c3acf1a4192..71f138512a1c 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -205,21 +205,13 @@ void spapr_xive_mmio_set_enabled(SpaprXive *xive, b=
ool enable)
>      memory_region_set_enabled(&xive->end_source.esb_mmio, false);
>  }
> =20
> -/*
> - * When a Virtual Processor is scheduled to run on a HW thread, the
> - * hypervisor pushes its identifier in the OS CAM line. Emulate the
> - * same behavior under QEMU.
> - */
> -void spapr_xive_set_tctx_os_cam(XiveTCTX *tctx)
> +static uint32_t spapr_xive_get_os_cam(PowerPCCPU *cpu)
>  {
>      uint8_t  nvt_blk;
>      uint32_t nvt_idx;
> -    uint32_t nvt_cam;
> -
> -    spapr_xive_cpu_to_nvt(POWERPC_CPU(tctx->cs), &nvt_blk, &nvt_idx);
> =20
> -    nvt_cam =3D cpu_to_be32(TM_QW1W2_VO | xive_nvt_cam_line(nvt_blk, nvt=
_idx));
> -    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &nvt_cam, 4);
> +    spapr_xive_cpu_to_nvt(cpu, &nvt_blk, &nvt_idx);
> +    return xive_nvt_cam_line(nvt_blk, nvt_idx);
>  }
> =20
>  static void spapr_xive_end_reset(XiveEND *end)
> @@ -537,19 +529,14 @@ static int spapr_xive_cpu_intc_create(SpaprInterrup=
tController *intc,
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
>      Object *obj;
>      SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> +    uint32_t os_cam =3D spapr_xive_get_os_cam(cpu);
> =20
> -    obj =3D xive_tctx_create(OBJECT(cpu), XIVE_ROUTER(xive), errp);
> +    obj =3D xive_tctx_create(OBJECT(cpu), XIVE_ROUTER(xive), os_cam, err=
p);
>      if (!obj) {
>          return -1;
>      }
> =20
>      spapr_cpu->tctx =3D XIVE_TCTX(obj);
> -
> -    /*
> -     * (TCG) Early setting the OS CAM line for hotplugged CPUs as they
> -     * don't beneficiate from the reset of the XIVE IRQ backend
> -     */
> -    spapr_xive_set_tctx_os_cam(spapr_cpu->tctx);
>      return 0;
>  }
> =20
> @@ -650,14 +637,6 @@ static void spapr_xive_dt(SpaprInterruptController *=
intc, uint32_t nr_servers,
>  static int spapr_xive_activate(SpaprInterruptController *intc, Error **e=
rrp)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> -    CPUState *cs;
> -
> -    CPU_FOREACH(cs) {
> -        PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -
> -        /* (TCG) Set the OS CAM line of the thread interrupt context. */
> -        spapr_xive_set_tctx_os_cam(spapr_cpu_state(cpu)->tctx);
> -    }
> =20
>      if (kvm_enabled()) {
>          int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, errp);
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 0ae3f9b1efe4..be4f2c974178 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -566,6 +566,18 @@ static void xive_tctx_reset_handler(void *dev)
>          ipb_to_pipr(tctx->regs[TM_QW1_OS + TM_IPB]);
>      tctx->regs[TM_QW3_HV_PHYS + TM_PIPR] =3D
>          ipb_to_pipr(tctx->regs[TM_QW3_HV_PHYS + TM_IPB]);
> +
> +    /*
> +     * (TCG) Set the OS CAM line of the thread interrupt context.

As per my remark above, this shouldn't mention TCG but rather
kernel-irqchip=3Doff.

> +     *
> +     * When a Virtual Processor is scheduled to run on a HW thread,
> +     * the hypervisor pushes its identifier in the OS CAM line.
> +     * Emulate the same behavior under QEMU.
> +     */
> +    if (tctx->os_cam) {
> +        uint32_t qw1w2 =3D cpu_to_be32(TM_QW1W2_VO | tctx->os_cam);
> +        memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
> +    }
>  }
> =20
>  void xive_tctx_reset(XiveTCTX *tctx)
> @@ -667,11 +679,17 @@ static const VMStateDescription vmstate_xive_tctx =
=3D {
>      },
>  };
> =20
> +static Property  xive_tctx_properties[] =3D {
> +    DEFINE_PROP_UINT32("os-cam", XiveTCTX, os_cam, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void xive_tctx_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
>      dc->desc =3D "XIVE Interrupt Thread Context";
> +    dc->props =3D xive_tctx_properties;
>      dc->realize =3D xive_tctx_realize;
>      dc->unrealize =3D xive_tctx_unrealize;
>      dc->vmsd =3D &vmstate_xive_tctx;
> @@ -689,7 +707,8 @@ static const TypeInfo xive_tctx_info =3D {
>      .class_init    =3D xive_tctx_class_init,
>  };
> =20
> -Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp)
> +Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, uint32_t os_cam,
> +                         Error **errp)
>  {
>      Error *local_err =3D NULL;
>      Object *obj;
> @@ -698,6 +717,7 @@ Object *xive_tctx_create(Object *cpu, XiveRouter *xrt=
r, Error **errp)
>      object_property_add_child(cpu, TYPE_XIVE_TCTX, obj, &error_abort);
>      object_unref(obj);
>      object_property_add_const_link(obj, "cpu", cpu, &error_abort);
> +    object_property_set_int(obj, os_cam, "os-cam", &local_err);
>      object_property_set_bool(obj, true, "realized", &local_err);
>      if (local_err) {
>          goto error;
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 7cf64b6d2533..99c06842573e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -806,7 +806,8 @@ static void pnv_chip_power9_intc_create(PnvChip *chip=
, PowerPCCPU *cpu,
>       * controller object is initialized afterwards. Hopefully, it's
>       * only used at runtime.
>       */
> -    obj =3D xive_tctx_create(OBJECT(cpu), XIVE_ROUTER(&chip9->xive), &lo=
cal_err);
> +    obj =3D xive_tctx_create(OBJECT(cpu), XIVE_ROUTER(&chip9->xive), 0,
> +                           &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;


