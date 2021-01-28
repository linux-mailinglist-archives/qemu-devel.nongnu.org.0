Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771C23068FE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:57:50 +0100 (CET)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vd7-00012s-DT
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vYv-0008Sf-KG; Wed, 27 Jan 2021 19:53:30 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vYu-0007lK-2o; Wed, 27 Jan 2021 19:53:29 -0500
Received: by mail-qv1-xf36.google.com with SMTP id l11so2081878qvt.1;
 Wed, 27 Jan 2021 16:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SHRvZU1eqmujX5dkXjedEK+g0HYOJlm0E6LERamhGa0=;
 b=JGElg8GdrSu7oVfrKPRoNLTzM0mCd0Tz6EcGO3+9VWw4ES2TwvRNJd8vCBUUCJCM8u
 tyUg7tIgJ7gH4FSyuIK463qIYaAmSLpmBXzKvGRCsHVJHQ7iLCy58kUwFiHxKHGlbnJo
 wAhPY7KHIASvnPXDNzMPynB8Ag8J89rtc3QC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SHRvZU1eqmujX5dkXjedEK+g0HYOJlm0E6LERamhGa0=;
 b=GhYoGbZc9Ji8oAqk8VGCIbFAUuTJZquIxD7EUD1+vPaKQXumKND12FHL6evd988AFS
 Qj9RgM1nClo/iJ+4sz0oVCVNd6sJaQwPeObqmVxEIQhm04e9xodF4pubU4y5dLJcDJVj
 iyM6w3EaaWP9X/xgocPXgI3ZnzP1vh3vxz3zRFHElIharAkznLYMzEHas0rCoFZoQYhQ
 JPSBbW+LnaQvEXp7+yvyth+/b/ywGwwI0ezdVXNFzmemjkCPiaDBMA4zzmACpP9LlmuZ
 0nFw1T7gk9IUe7/043RDyy1FvLFgQsnGdIhk3do2cHAKJlD4d89/TtEANxRwdhUxZ940
 lWtw==
X-Gm-Message-State: AOAM5339vXq1iS8N6tkWfd1Fl9ixw50tcw1q/M5GIfVMDMDdIPdfn0pq
 WRyDrpTt3SoMuEAOTRkNFWVXzdDSldA3b74F5kg=
X-Google-Smtp-Source: ABdhPJx6HPz8RHhBiMfAFf92/dV2egzC0L3v/I5A3ELDl9vb82gcy2DCI3u+psysk3a6O/55u2IZNGNAFZmfoKMhnw4=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr11835395qvl.10.1611795206882; 
 Wed, 27 Jan 2021 16:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-8-clg@kaod.org>
In-Reply-To: <20210126171059.307867-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 00:53:14 +0000
Message-ID: <CACPK8Xd+4JnqrdoJrxgaL59QZBU8Gi3jZVvCy-OGUwaO5Svhqg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ppc/pnv: Introduce a LPC FW memory region attribute
 to map the PNOR
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This to map the PNOR from the machine init handler directly and finish
> the cleanup of the LPC model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/ppc/pnv.h |  1 +
>  hw/ppc/pnv.c         | 11 +++++++++++
>  hw/ppc/pnv_lpc.c     |  7 -------
>  3 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index ee7eda3e0102..d69cee17b232 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -58,6 +58,7 @@ struct PnvChip {
>      MemoryRegion xscom;
>      AddressSpace xscom_as;
>
> +    MemoryRegion *fw_mr;
>      gchar        *dt_isa_nodename;
>  };
>
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index e500c2e2437e..50810df83815 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -871,6 +871,14 @@ static void pnv_init(MachineState *machine)
>          pnv_ipmi_bt_init(pnv->isa_bus, pnv->bmc, 10);
>      }
>
> +    /*
> +     * The PNOR is mapped on the LPC FW address space by the BMC.
> +     * Since we can not reach the remote BMC machine with LPC memops,
> +     * map it always for now.
> +     */
> +    memory_region_add_subregion(pnv->chips[0]->fw_mr, PNOR_SPI_OFFSET,
> +                                &pnv->pnor->mmio);
> +
>      /*
>       * OpenPOWER systems use a IPMI SEL Event message to notify the
>       * host to powerdown
> @@ -1150,6 +1158,7 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
>      qdev_realize(DEVICE(&chip8->lpc), NULL, &error_fatal);
>      pnv_xscom_add_subregion(chip, PNV_XSCOM_LPC_BASE, &chip8->lpc.xscom_=
regs);
>
> +    chip->fw_mr =3D &chip8->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/xscom@%" PRIx64 "/isa@%x=
",
>                                              (uint64_t) PNV_XSCOM_BASE(ch=
ip),
>                                              PNV_XSCOM_LPC_BASE);
> @@ -1479,6 +1488,7 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
>      memory_region_add_subregion(get_system_memory(), PNV9_LPCM_BASE(chip=
),
>                                  &chip9->lpc.xscom_regs);
>
> +    chip->fw_mr =3D &chip9->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
>                                              (uint64_t) PNV9_LPCM_BASE(ch=
ip));
>
> @@ -1592,6 +1602,7 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
>      memory_region_add_subregion(get_system_memory(), PNV10_LPCM_BASE(chi=
p),
>                                  &chip10->lpc.xscom_regs);
>
> +    chip->fw_mr =3D &chip10->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
>                                              (uint64_t) PNV10_LPCM_BASE(c=
hip));
>  }
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index 11739e397b27..bcbca3db9743 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -824,7 +824,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, boo=
l use_cpld, Error **errp)
>      ISABus *isa_bus;
>      qemu_irq *irqs;
>      qemu_irq_handler handler;
> -    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
>
>      /* let isa_bus_new() create its own bridge on SysBus otherwise
>       * devices specified on the command line won't find the bus and
> @@ -850,11 +849,5 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bo=
ol use_cpld, Error **errp)
>
>      isa_bus_irqs(isa_bus, irqs);
>
> -    /*
> -     * TODO: Map PNOR on the LPC FW address space on demand ?
> -     */
> -    memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
> -                                &pnv->pnor->mmio);
> -
>      return isa_bus;
>  }
> --
> 2.26.2
>
>

