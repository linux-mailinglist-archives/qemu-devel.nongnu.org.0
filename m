Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB7467A9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:39:32 +0200 (CEST)
Received: from localhost ([::1]:54172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbr6o-0004td-IV
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hbqD1-0007Oq-U2
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hbqCz-0005gx-T4
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:41:51 -0400
Received: from 1.mo178.mail-out.ovh.net ([178.33.251.53]:37170)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hbqCw-0005Tg-Bi
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:41:49 -0400
Received: from player795.ha.ovh.net (unknown [10.108.42.184])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 7A9FE6C747
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 19:41:33 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id EBCAB6CBF181;
 Fri, 14 Jun 2019 17:41:28 +0000 (UTC)
Date: Fri, 14 Jun 2019 19:41:28 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20190614194128.48c1a2e7@bahia.lan>
In-Reply-To: <20190614165920.12670-2-clg@kaod.org>
References: <20190614165920.12670-1-clg@kaod.org>
 <20190614165920.12670-2-clg@kaod.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 15874062787113621899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.53
Subject: Re: [Qemu-devel] [PATCH 1/2] spapr/xive: rework the mapping the KVM
 memory regions
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

On Fri, 14 Jun 2019 18:59:19 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Today, the interrupt device is fully initialized at reset when the CAS
> negotiation process has completed. Depending on the KVM capabilities,
> the SpaprXive memory regions (ESB, TIMA) are initialized with a host
> MMIO backend or a QEMU emulated backend. This results in a complex
> initialization sequence partially done at realize and later at reset,
> and some memory region leaks.
>=20
> To simplify this sequence and to remove of the late initialization of
> the emulated device which is required to be done only once, we
> introduce new memory regions specific for KVM. These regions are
> mapped as overlaps on top of the emulated device to make use of the
> host MMIOs. Also provide proper cleanups of these regions when the
> XIVE KVM device is destroyed to fix the leaks.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Nice !

Reviewed-by: Greg Kurz <groug@kaod.org>

>  include/hw/ppc/spapr_xive.h |  2 +-
>  include/hw/ppc/xive.h       |  1 +
>  hw/intc/spapr_xive.c        | 38 ++++++++++---------------------------
>  hw/intc/spapr_xive_kvm.c    | 21 +++++++++++---------
>  hw/ppc/spapr_irq.c          |  1 -
>  5 files changed, 24 insertions(+), 39 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index b26befcf6b56..719714426524 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -42,6 +42,7 @@ typedef struct SpaprXive {
>      /* KVM support */
>      int           fd;
>      void          *tm_mmap;
> +    MemoryRegion  tm_mmio_kvm;
>      VMChangeStateEntry *change;
>  } SpaprXive;
> =20
> @@ -66,7 +67,6 @@ void spapr_xive_map_mmio(SpaprXive *xive);
> =20
>  int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
>                               uint32_t *out_server, uint8_t *out_prio);
> -void spapr_xive_init(SpaprXive *xive, Error **errp);
> =20
>  /*
>   * KVM XIVE device helpers
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index a6ee7e831d8b..55c53c741776 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -197,6 +197,7 @@ typedef struct XiveSource {
> =20
>      /* KVM support */
>      void            *esb_mmap;
> +    MemoryRegion    esb_mmio_kvm;
> =20
>      XiveNotifier    *xive;
>  } XiveSource;
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 58c2e5d890bd..3ae311d9ff7f 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -194,13 +194,6 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Moni=
tor *mon)
>      }
>  }
> =20
> -void spapr_xive_map_mmio(SpaprXive *xive)
> -{
> -    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
> -}
> -
>  void spapr_xive_mmio_set_enabled(SpaprXive *xive, bool enable)
>  {
>      memory_region_set_enabled(&xive->source.esb_mmio, enable);
> @@ -305,6 +298,7 @@ static void spapr_xive_realize(DeviceState *dev, Erro=
r **errp)
>          error_propagate(errp, local_err);
>          return;
>      }
> +    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xsrc->esb_mmio);
> =20
>      /*
>       * Initialize the END ESB source
> @@ -318,6 +312,7 @@ static void spapr_xive_realize(DeviceState *dev, Erro=
r **errp)
>          error_propagate(errp, local_err);
>          return;
>      }
> +    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &end_xsrc->esb_mmio);
> =20
>      /* Set the mapping address of the END ESB pages after the source ESB=
s */
>      xive->end_base =3D xive->vc_base + (1ull << xsrc->esb_shift) * xsrc-=
>nr_irqs;
> @@ -333,31 +328,18 @@ static void spapr_xive_realize(DeviceState *dev, Er=
ror **errp)
> =20
>      qemu_register_reset(spapr_xive_reset, dev);
> =20
> -    /* Define all XIVE MMIO regions on SysBus */
> -    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xsrc->esb_mmio);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &end_xsrc->esb_mmio);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xive->tm_mmio);
> -}
> -
> -void spapr_xive_init(SpaprXive *xive, Error **errp)
> -{
> -    XiveSource *xsrc =3D &xive->source;
> -
> -    /*
> -     * The emulated XIVE device can only be initialized once. If the
> -     * ESB memory region has been already mapped, it means we have been
> -     * through there.
> -     */
> -    if (memory_region_is_mapped(&xsrc->esb_mmio)) {
> -        return;
> -    }
> -
>      /* TIMA initialization */
>      memory_region_init_io(&xive->tm_mmio, OBJECT(xive), &xive_tm_ops, xi=
ve,
>                            "xive.tima", 4ull << TM_SHIFT);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xive->tm_mmio);
> =20
> -    /* Map all regions */
> -    spapr_xive_map_mmio(xive);
> +    /*
> +     * Map all regions. These will be enabled or disabled at reset and
> +     * can also be overridden by KVM memory regions if active
> +     */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
>  }
> =20
>  static int spapr_xive_get_eas(XiveRouter *xrtr, uint8_t eas_blk,
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index b48f135838f2..5559f8bce5ef 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -728,8 +728,10 @@ void kvmppc_xive_connect(SpaprXive *xive, Error **er=
rp)
>          return;
>      }
> =20
> -    memory_region_init_ram_device_ptr(&xsrc->esb_mmio, OBJECT(xsrc),
> +    memory_region_init_ram_device_ptr(&xsrc->esb_mmio_kvm, OBJECT(xsrc),
>                                        "xive.esb", esb_len, xsrc->esb_mma=
p);
> +    memory_region_add_subregion_overlap(&xsrc->esb_mmio, 0,
> +                                        &xsrc->esb_mmio_kvm, 1);
> =20
>      /*
>       * 2. END ESB pages (No KVM support yet)
> @@ -744,8 +746,10 @@ void kvmppc_xive_connect(SpaprXive *xive, Error **er=
rp)
>          error_propagate(errp, local_err);
>          return;
>      }
> -    memory_region_init_ram_device_ptr(&xive->tm_mmio, OBJECT(xive),
> +    memory_region_init_ram_device_ptr(&xive->tm_mmio_kvm, OBJECT(xive),
>                                        "xive.tima", tima_len, xive->tm_mm=
ap);
> +    memory_region_add_subregion_overlap(&xive->tm_mmio, 0,
> +                                        &xive->tm_mmio_kvm, 1);
> =20
>      xive->change =3D qemu_add_vm_change_state_handler(
>          kvmppc_xive_change_state_handler, xive);
> @@ -771,9 +775,6 @@ void kvmppc_xive_connect(SpaprXive *xive, Error **err=
p)
>      kvm_kernel_irqchip =3D true;
>      kvm_msi_via_irqfd_allowed =3D true;
>      kvm_gsi_direct_mapping =3D true;
> -
> -    /* Map all regions */
> -    spapr_xive_map_mmio(xive);
>  }
> =20
>  void kvmppc_xive_disconnect(SpaprXive *xive, Error **errp)
> @@ -795,13 +796,15 @@ void kvmppc_xive_disconnect(SpaprXive *xive, Error =
**errp)
>      xsrc =3D &xive->source;
>      esb_len =3D (1ull << xsrc->esb_shift) * xsrc->nr_irqs;
> =20
> -    sysbus_mmio_unmap(SYS_BUS_DEVICE(xive), 0);
> +    memory_region_del_subregion(&xsrc->esb_mmio, &xsrc->esb_mmio_kvm);
> +    object_unparent(OBJECT(&xsrc->esb_mmio_kvm));
>      munmap(xsrc->esb_mmap, esb_len);
> +    xsrc->esb_mmap =3D NULL;
> =20
> -    sysbus_mmio_unmap(SYS_BUS_DEVICE(xive), 1);
> -
> -    sysbus_mmio_unmap(SYS_BUS_DEVICE(xive), 2);
> +    memory_region_del_subregion(&xive->tm_mmio, &xive->tm_mmio_kvm);
> +    object_unparent(OBJECT(&xive->tm_mmio_kvm));
>      munmap(xive->tm_mmap, 4ull << TM_SHIFT);
> +    xive->tm_mmap =3D NULL;
> =20
>      /*
>       * When the KVM device fd is closed, the KVM device is destroyed
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 75654fc67aba..73e6f10da165 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -413,7 +413,6 @@ static const char *spapr_irq_get_nodename_xive(SpaprM=
achineState *spapr)
> =20
>  static void spapr_irq_init_emu_xive(SpaprMachineState *spapr, Error **er=
rp)
>  {
> -    spapr_xive_init(spapr->xive, errp);
>  }
> =20
>  static void spapr_irq_init_kvm_xive(SpaprMachineState *spapr, Error **er=
rp)


