Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2227313B8A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:53:27 +0100 (CET)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Aj0-00009n-Lh
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l965Q-000609-Hd
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:56:20 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9659-0003mS-Ce
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:56:10 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q2so14796418eds.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQ4/ibB41KJlFFX8EImRDjjcdxSC1Q2P+X/Q9BR6KCs=;
 b=o5sflZh1gEQSvC2zIz8CAC0muIDXr9+72uPYYG3WqE4V8XDUoHpYR6RBuRh1xjgTvh
 EIxyla+d9nJT6/V0kcUkgUkVCeozBU4hqzI+ugFOmMxuxXJOB0nk/C5oWaqEKM6PtzRt
 zyggfP71+vffrQ9ARWL82OwSX3VhK2sFOmai/TVGxD2g++PyfoQL5cOh/FaLFHOYHQez
 L1iQckEsD/1wo1gOGeYXhER3in/Wx4COae7HsdNIgR1Dx3oOQb1CrTWXweyVUCBfhN/A
 UjT4UOVklwfolfxcOOyl/BbFAP6R+vzikEXk+HgQjQKb4VvhBmPrA70ppWnZDRY0lT/W
 iwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQ4/ibB41KJlFFX8EImRDjjcdxSC1Q2P+X/Q9BR6KCs=;
 b=KWRZEb9+OsLMbOZxBL5llSNcIR1GtV6aEp8m2y3+UR+kvxw9F7RQ+urJo5O7svtMOX
 D1kRiAw4Dy6wGLxU1sRpAl8U8XBgclWLRlfo73FCb1xqFsyHyPrLnVdxQrOQf8TrFPfU
 nueJaKUB+KKdtyzni09I/fOaeqod/FIS6CoX4Zb35Ujzbwpj5aX0xBrqfhNlI3LOPM2E
 C1P/rdcTO1Dva6Jm5ArUz0/6kFYrm6UaQ9ozhy8EGhnAYYfTRs3FrUSxIJSwr/z40W+m
 uHm7ECXIYR1PpSoqfQRAYOsYLFJ9V08Z4oy94C+hvNCzTU3Ckd6FOIlStCdCHNpfdTis
 c7cg==
X-Gm-Message-State: AOAM530yCeGdy2hTxYKsLO6B8A9ijOjf4H7awF/o/z7l3FjE6DjVGUDn
 5ewq1rMh4NXTLPJjDsVJu7dhjKSkOIFxSKO1bjxzVQ==
X-Google-Smtp-Source: ABdhPJzSTSvVIFWFJt449gVy8yJO27TBo+K3Ru2TKqkIqcIo/I9cd0Ij6p1xITbwuT/IgUVuIKPoN07mQEAhMea76w0=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr15439882ede.44.1612788957117; 
 Mon, 08 Feb 2021 04:55:57 -0800 (PST)
MIME-Version: 1.0
References: <db793d463822491bc581fa3204f733adb649faa6.camel@gmail.com>
In-Reply-To: <db793d463822491bc581fa3204f733adb649faa6.camel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 12:55:45 +0000
Message-ID: <CAFEAcA99Hmp0+tLd7NFRg34dXUARRbBXF75HAcXpfaARtDpwFQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm: xlnx-versal: fix virtio-mmio base address
 assignment
To: schspa <schspa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 02:20, schspa <schspa@gmail.com> wrote:
>
>
> At the moment the following QEMU command line triggers an assertion
> failure On xlnx-versal SOC:
>   qemu-system-aarch64 \
>       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
>       -fsdev local,id=shareid,path=${HOME}/work,security_model=none \
>       -device virtio-9p-device,fsdev=shareid,mount_tag=share \
>       -fsdev local,id=shareid1,path=${HOME}/Music,security_model=none \
>       -device virtio-9p-device,fsdev=shareid1,mount_tag=share1
>
>   qemu-system-aarch64: ../migration/savevm.c:860:
>   vmstate_register_with_alias_id:
>   Assertion `!se->compat || se->instance_id == 0' failed.
>
> This problem was fixed on arm virt platform in commit f58b39d2d5b
> ("virtio-mmio: format transport base address in BusClass.get_dev_path")
>
> It works perfectly on arm virt platform. but there is still there on
> xlnx-versal SOC.
>
> The main difference between arm virt and xlnx-versal is they use
> different way to create virtio-mmio qdev. on arm virt, it calls
> sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
> sysbus_mmio_map internally and assign base address to subsys device
> mmio correctly. but xlnx-versal's implements won't do this.
>
> However, xlnx-versal can't switch to sysbus_create_simple() to create
> virtio-mmio device. It's because xlnx-versal's cpu use
> VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
> system_memory. sysbus_create_simple will add virtio to system_memory,
> which can't be accessed by cpu.
>
> Besides, xlnx-versal can't add sysbus_mmio_map api call too, because
> this will add memory region to system_memory, and it can't be added
> to VersalVirt.soc.fpd.apu.mr again.
>
> We can solve this by simply assign mmio[0].addr directly. makes
> virtio_mmio_bus_get_dev_path to produce correct unique device path.
>
> Signed-off-by: schspa <schspa@gmail.com>
> ---
>  hw/arm/xlnx-versal-virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 8482cd6196..87b92ec6c3 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -490,6 +490,7 @@ static void create_virtio_regions(VersalVirt *s)
>          object_property_add_child(OBJECT(&s->soc), name, OBJECT(dev));
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
> +        SYS_BUS_DEVICE(dev)->mmio[0].addr = base;
>          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
>          g_free(name);

This is definitely not the right way to fix this problem.
The 'addr' field in a MemoryRegion is a part of its internal
implementation. It is not used solely as a mechanism for setting
the virtio-mmio bus name, and it will break things if you just
reach in and mess with it.

The right fix here is going to involve improving
virtio_mmio_bus_get_dev_path() (which also should not be
just reaching into the internals of MemoryRegion structs!)
so that it can cope with setups where the MR of the transport
is not directly placed into the system memory. I think that
probably involves calling memory_region_find() and then
looking at the .offset_within_address_space field of the
returned MemoryRegionSection, but that would need testing to
confirm that it returns the same results for the non-xilinx
cases that the current code does, and that it also returns
sensible values for xilinx.

thanks
-- PMM

