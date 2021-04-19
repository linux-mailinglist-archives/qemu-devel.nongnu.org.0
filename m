Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A536420F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 14:50:46 +0200 (CEST)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYTMT-0003Dx-Jj
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 08:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTIr-00013J-Pa
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:47:01 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTIp-0003JV-EX
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:47:01 -0400
Received: by mail-ed1-x532.google.com with SMTP id d21so20423894edv.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZ9NtiNKsi2EtKnVhl1Wkgcf7o2uFz8HZkLJVddYhCI=;
 b=Rk3CnaAtUqukoTi3O3AyjmUd6bUXNvtBBti/dFzUUDaapGoPIf5pPY3NIVncmyzegU
 rOUMQpUa/911SqjRs308xGtUsTIYrEaNrNBsaEItDTFARvuI2zTMzPa75yqeMyXwyLnR
 NZkVSQyWRLfxp5WqjY9QD+eIrEGS/6OG5s0tldSnTtQMxAu81zsnfs3xYaf0pJGac0ke
 mXZFHdS/Y/sW/5olf3lERloaiU7JMgv2is9DQqFeSm9ig2vmmgSA2qAf7M53sDhoUGEI
 z5+VCWWO6qSSzMp2po3FGQ8jwt+35IRuDI/d90Q382NfjgwYCtawZIH4N9xDeE7JbWli
 CasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZ9NtiNKsi2EtKnVhl1Wkgcf7o2uFz8HZkLJVddYhCI=;
 b=EBrF87hMYRCUyQRmfVSyYOwRs/Y96bVDzxutqYY1VJ4ckGG1N8BS1k8ph9uOnv28gl
 5czRbeioUHNa7k0QTh2IqyOLs8fLFdu4Mj2kqxno8m1HJY/M89SRGwwbrK/smoLooyHj
 2/2aSs3oFk4LNlXW0f5iPXZhNLwkyXr3wqHwoZMeiEXNH67T8bN+c8Ikb1WDV+wlrIXm
 NLtrytzD1QBQkA/vHE+0yqqomNGUVfWBx57rxKjbUl3crvoAyYh2Z6K8BMAmiZXYXAGK
 3J9+GLoRZ3OrZmGzO5hzkC8p8SWKqnyHPw+eOQYovG56c1f07/RuvHZAMQzBgLj+9UBD
 PqSw==
X-Gm-Message-State: AOAM532Ao9C33jyrgtWv6qR1C5wtNl2cybZgslZCHRq4cIIlAb5RCx6w
 D+6ymOsHCUAmQkaJAVHMWgSCu/JQS/CRjaJmnJfBzg==
X-Google-Smtp-Source: ABdhPJxzDX9N1kyCIGfOheKxDf/svbNk6yACfp5LcMgbuIsd4186i3mfDgbsbjmvcbhx3YZApAuBRgSjLzpjut3r4FQ=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr25390167edt.36.1618836418060; 
 Mon, 19 Apr 2021 05:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-9-shashi.mallela@linaro.org>
In-Reply-To: <20210401024152.203896-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 13:46:06 +0100
Message-ID: <CAFEAcA_0xrjGn3WSL4Aoe+nneh4Yk3tg+d5N95GGN779M6qQYw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/arm/virt: add ITS support in virt GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 at 03:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of virt platform GIC
> initialization.This Emulated ITS model now co-exists with kvm
> ITS and is enabled in absence of kvm irq kernel support in a
> platform.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/virt.c        | 10 ++++++++--
>  target/arm/kvm_arm.h |  4 ++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e0..77cf2db90f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -622,7 +622,7 @@ static void create_v2m(VirtMachineState *vms)
>      vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
>  }
>
> -static void create_gic(VirtMachineState *vms)
> +static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>  {
>      MachineState *ms = MACHINE(vms);
>      /* We create a standalone GIC */
> @@ -656,6 +656,12 @@ static void create_gic(VirtMachineState *vms)
>                               nb_redist_regions);
>          qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
>
> +        if (!kvm_irqchip_in_kernel()) {
> +            object_property_set_link(OBJECT(vms->gic), "sysmem", OBJECT(mem),
> +                                     &error_fatal);
> +            qdev_prop_set_bit(vms->gic, "has-lpi", true);
> +        }
> +
>          if (nb_redist_regions == 2) {
>              uint32_t redist1_capacity =
>                      vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
> @@ -2039,7 +2045,7 @@ static void machvirt_init(MachineState *machine)
>
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>
> -    create_gic(vms);
> +    create_gic(vms, sysmem);
>
>      virt_cpu_post_init(vms, sysmem);
>
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..0613454975 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
>          /* KVM implementation requires this capability */
>          return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
>      } else {
> -        /* Software emulation is not implemented yet */
> -        return NULL;
> +        /* Software emulation based model */
> +        return "arm-gicv3-its";
>      }
>  }

This is OK as far as it goes, but I think we need to add the
versioned-machine support so that only "virt-6.1" and later get the
new ITS, and "virt-6.0" behave the same way (ie no ITS) as they did
in older QEMU versions.

thanks
-- PMM

