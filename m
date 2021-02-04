Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BDF30EF3B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:07:38 +0100 (CET)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7abx-000274-PF
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1l7aYr-00087z-UJ; Thu, 04 Feb 2021 04:04:25 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1l7aYp-0000R8-5G; Thu, 04 Feb 2021 04:04:25 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n2so2401743iom.7;
 Thu, 04 Feb 2021 01:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=mgRpYo9gc2MvpIIUW7kKzGP0A2yzDNuup2L97imVU+I=;
 b=CjSqQDRnFCNF8ZqweI07o93LqFobhxsrNVZb4rkkLll0vJyRWbMd3LRfntX4kN2pK6
 SvN8Luxqg3UCZjKotsAzoXs/F1dfLfI98doTCKyIR3fZlX15OXkx8XzmQ2hPo7GpuGU8
 aOoxVZcahM8jwqbgJ7g52seIQjtYnJPWVIv/jKykxywhIph/vOlbUMg3VQESZewQpv52
 Xb16I6wrP8fZzRyCpDgOb3eb4eUIkpe4/TEbL4jl7ikSNrOCzNjaUMjo8JXpTVLlNFFV
 bxeXVBRf1HyIIVq5+jqc55OTIou55oNdF9aANkMH6x6suhbr5DKBg1COFohUpn/ZOf13
 tuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mgRpYo9gc2MvpIIUW7kKzGP0A2yzDNuup2L97imVU+I=;
 b=BBLc0Qwu12FXPWpEbk9RhNwzmH4EghDb3N0U/YijSxcG1Ju/7Mh+0E2+FeYhoFkEqZ
 DuWivJbbtwYcuCYpzI6IKDn0s8qmDWp+BoZLrbgL5LCGMVczhp6oFTYeXl3CMWn6y+Sw
 C+fNAZRDX6ICnnGi5hhPaPi/1JBqUvxRdxhBlKM6z4FCmPeecr1ghZgnbAJXjKJoN2Rh
 QN+dO5fKqrEBaUWDemC7KgqTTzeipolTL80l29uQj3/fWYjw4m4Ukix2GlAUMnjb3qoX
 K3UWPYG5TCGXOr+kD6RCmos31ZGGnOZl4jBXir5hoVwh7aIAQQ2Q5pTtptTdMP7ie3Ub
 NYew==
X-Gm-Message-State: AOAM533k0BOENbrq0rvCEnADDbeCNneM0NS5K0ANYQ02Mvlq7/YALq0/
 Kg1jCYieSMCTyhqp5wcm+uA=
X-Google-Smtp-Source: ABdhPJw3h7i2j47yGMJjAEuFpFNfOIIMybv+wzT2teRHBTZGWv1ULwmmJ2sqsbcjsCBYONRe7hHwcw==
X-Received: by 2002:a05:6602:2d81:: with SMTP id
 k1mr6101827iow.90.1612429461606; 
 Thu, 04 Feb 2021 01:04:21 -0800 (PST)
Received: from [127.0.0.1] (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id f11sm2326096ils.0.2021.02.04.01.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 01:04:21 -0800 (PST)
Message-ID: <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
From: schspa <schspa@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Date: Thu, 04 Feb 2021 17:04:17 +0800
In-Reply-To: <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>, Kevin Zhao <kevin.zhao@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-02-04 at 09:19 +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Please Cc the maintainers when posting your patch:
> 
> ./scripts/get_maintainer.pl -f hw/arm/xlnx-versal-virt.c
> Alistair Francis <alistair@alistair23.me> (maintainer:Xilinx ZynqMP
> and...)
> "Edgar E. Iglesias" <edgar.iglesias@gmail.com> (maintainer:Xilinx
> ZynqMP
> and...)
> Peter Maydell <peter.maydell@linaro.org> (maintainer:Xilinx ZynqMP
> and...)
> qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
> 

Thanks for reminding, I will pay attention next time

> On 2/4/21 7:58 AM, schspa wrote:
> > 
> > At the moment the following QEMU command line triggers an assertion
> > failure On xlnx-versal SOC:
> >   qemu-system-aarch64 \
> >       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
> >       -fsdev local,id=shareid,path=${HOME}/work,security_model=none
> > \
> >       -device virtio-9p-device,fsdev=shareid,mount_tag=share \
> >       -fsdev
> > local,id=shareid1,path=${HOME}/Music,security_model=none \
> >       -device virtio-9p-device,fsdev=shareid1,mount_tag=share1
> > 
> >   qemu-system-aarch64: ../migration/savevm.c:860:
> >   vmstate_register_with_alias_id:
> >   Assertion `!se->compat || se->instance_id == 0' failed.
> > 
> > This problem was fixed on arm virt platform in patch
> >  
> >  
> > https://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg01119.html
> 
> Please use instead "in commit f58b39d2d5b ("virtio-mmio: format
> transport base address in BusClass.get_dev_path")".
> 

Thanks, I will upload a new patch to fix it if there is no need to do
further change for the next question.

> > It works perfectly on arm virt platform. but there is still there
> > on
> > xlnx-versal SOC.
> > 
> > The main difference between arm virt and xlnx-versal is they use
> > different way to create virtio-mmio qdev. on arm virt, it calls
> > sysbus_create_simple("virtio-mmio", base, pic[irq]); which will
> > call
> > sysbus_mmio_map internally and assign base address to subsys device
> > mmio correctly. but xlnx-versal's implements won't do this.
> > 
> > However, xlnx-versal can't switch to sysbus_create_simple() to
> > create
> > virtio-mmio device. It's because xlnx-versal's cpu use
> > VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
> > system_memory. sysbus_create_simple will add virtio to
> > system_memory,
> > which can't be accessed by cpu.
> > 
> > We can solve this by simply assign mmio[0].addr directly. makes
> > virtio_mmio_bus_get_dev_path to produce correct unique device path.
> > 
> > Signed-off-by: schspa <schspa@gmail.com>
> > ---
> >  hw/arm/xlnx-versal-virt.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> > index 8482cd6196..87b92ec6c3 100644
> > --- a/hw/arm/xlnx-versal-virt.c
> > +++ b/hw/arm/xlnx-versal-virt.c
> > @@ -490,6 +490,7 @@ static void create_virtio_regions(VersalVirt
> > *s)
> >          object_property_add_child(OBJECT(&s->soc), name,
> > OBJECT(dev));
> >          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev),
> > &error_fatal);
> >          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
> > +        SYS_BUS_DEVICE(dev)->mmio[0].addr = base;
> 
> The proper API call is:
> 
>            sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> 

Can't to call this API, because this api will map virtio device memory
region to system_map. and it can't be add to &s->soc.mr_ps again. I'm
willing to change it to proper api but can't find a proper one.

> >          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> >          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
> >          g_free(name);
> > 
> 

-- 
schspa <schspa@gmail.com>


