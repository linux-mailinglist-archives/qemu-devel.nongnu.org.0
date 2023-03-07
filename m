Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D46AF66F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZdeA-0008La-BO; Tue, 07 Mar 2023 15:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZde8-0008LR-EY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:10:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZde6-0007YD-QG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:10:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id p16so8571030wmq.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678219848;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tEmrmTSsUw/B63z0rYyXtotJcFguEAbMNiNFGvqd/hg=;
 b=UpS64CSfbXfJmi7zHIbjmW4PEeYiukr3wh8srFKePJXPAQwzrY5kEWD4TO66cspfEr
 7VzlIRx8c5Ig1hH6OcJbj+0zv4R7sC+vaw8GBDsrT5jksaHHNX56FXrvQIAyk8JRMVs+
 q1znF3U7td36P1ywCNt/xlj4J/cEKhoou53KBsJmSoY7pFioHq4U3pxzHeLgLBrmBlb8
 JCKkKvAWWjcnjirROqJShwnif28DZli6mGAZS97uy1clV2hj1E0yHsPKpc7DqdXJWRSo
 0F19MWip4z3O+iebsxaXzFx6J/diArDC96m6bg89nrR4H3eA/OPaJjFZY76LDgTeQ2v1
 rcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678219848;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tEmrmTSsUw/B63z0rYyXtotJcFguEAbMNiNFGvqd/hg=;
 b=pIlVTNM+hQZb/vkyYc+LIk4w9fmTTrjhcjofBcwBeil7Ho4AwVvX61HTxH8+Acjj/X
 UHn19oVxUysdJjC2fS2jNYjhfEcNpFuimO7fLELNTWZzPhfvrlucRUJt53617+Mj2I1Q
 KUXRzgDNiPE9BrqEF8CQDMO3ud9P6d6GrAlZIQ45fRSAKI8QwqW3ruZFitylm5Mxe9or
 QVl3dx18U3qPHytEOgDRAuN/OdZxB0QYbbCzV6KcnWyBymrHp5n03M8NSt1JThvIc3us
 sitNFst1Lxa/yyQCyl5K1hzdH6CAMilK0U2a1FMfFSmsxjEAEJrOYDHdj+h0tw4JOF0S
 nPNQ==
X-Gm-Message-State: AO0yUKV73mkwOHvMEL3osUURCbL0f/QqbPqF2iLil0CnfITZZyY1fHsX
 u3+Qc6z4G/U08Dv63tSR+WqJGQ==
X-Google-Smtp-Source: AK7set8k65mbxD/65dA8OVGUkLmbapwzzLEoeJ2OsIHML0cTkpRdBtJqTp91DlzrNx+dUfGmld2IcQ==
X-Received: by 2002:a05:600c:3549:b0:3eb:55d2:9c4c with SMTP id
 i9-20020a05600c354900b003eb55d29c4cmr11089942wmq.16.1678219848599; 
 Tue, 07 Mar 2023 12:10:48 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c47d500b003e11ad0750csm13399508wmo.47.2023.03.07.12.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:10:48 -0800 (PST)
Message-ID: <93c0a866-74e8-8fad-07cf-79e964b73d84@linaro.org>
Date: Tue, 7 Mar 2023 21:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] hw/mips: Add MIPS virt board
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <20230304223803.55764-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230304223803.55764-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/3/23 23:38, Jiaxun Yang wrote:
> MIPS virt board is design to utilize existing VirtIO infrastures
> but also comptitable with MIPS's existing internal simulation tools.
> 
> It includes virtio-pci, virtio-mmio, pcie gpex, flash rom, fw_cfg,
> goldfish-rtc and MIPS CPS system.
> 
> It should be able to cooperate with any MIPS CPU cores.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v1:
>   - Rename to virt board
>   - Convert BIOS flash to ROM
>   - Cleanups
> v2:
>   - Fix fdt flash
>   - Remove UP variant
> ---
>   MAINTAINERS                             |   7 +
>   configs/devices/mips-softmmu/common.mak |   1 +
>   docs/system/target-mips.rst             |  22 +
>   hw/mips/Kconfig                         |  17 +
>   hw/mips/meson.build                     |   1 +
>   hw/mips/virt.c                          | 916 ++++++++++++++++++++++++
>   6 files changed, 964 insertions(+)
>   create mode 100644 hw/mips/virt.c


> +static void virt_machine_init(MachineState *machine)
> +{
> +    MIPSVirtState *s = MIPS_VIRT_MACHINE(machine);
> +    MemoryRegion *system_memory = get_system_memory();
> +    const MemMapEntry *memmap = virt_memmap;
> +    int i;
> +
> +    s->cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
> +    clock_set_hz(s->cpuclk, VIRT_CPU_REF_CLK_FREQ);
> +
> +    s->cps = MIPS_CPS(qdev_new(TYPE_MIPS_CPS));
> +    object_property_set_str(OBJECT(s->cps), "cpu-type", machine->cpu_type,
> +                            &error_fatal);
> +    object_property_set_int(OBJECT(s->cps), "num-core", machine->smp.cpus,
> +                            &error_fatal);
> +    qdev_connect_clock_in(DEVICE(s->cps), "clk-in", s->cpuclk);
> +    sysbus_realize(SYS_BUS_DEVICE(s->cps), &error_fatal);

qemu-system-mips64el: Property 'mips-cps.num-core' not found

I'm worried. I suppose you want this property:

   DEFINE_PROP_UINT32("num-vp", MIPSCPSState, num_vp, 1),

Is your series based on mainstream QEMU?

