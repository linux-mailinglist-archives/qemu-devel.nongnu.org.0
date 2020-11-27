Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375F2C6C10
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:39:48 +0100 (CET)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijat-00016G-FW
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kijYP-0008IV-3L
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:37:13 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kijYN-0004KI-F9
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:37:12 -0500
Received: by mail-wr1-x442.google.com with SMTP id u12so6704803wrt.0
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CRPUPPWQ4Iptq0Ytd5wXyLcKreUsml8Ikg0eWo4JrBc=;
 b=hOFqH4/Bj5A9FpkTrwfRgHO0JLEgAtffFMhxlvjeabH4T5XsH5I0wvRyzjSQBGZ1Yl
 Z8U0veIm+zgn4wSGIKtgQECP8I890Y3J9x6GSA43IvRJrXummkh9WMjfwFQa6FuMRNLW
 NHVPpM2HkHsC16UkpWPaww61/wXWLvevyUVknDUM6Sb2V/7RDc7VLXoUQLYdCwsqVIhE
 neuXqWay0oAS1BowP5fWJ/eLjY5bTDMwRq+EfNILg6zeQKvKHzOJmfD39dJt9aqgwuSJ
 lCT6Xu6EBDlvsQ1oR9aywBDFPuhtuFt6bNSqzFMa/dvNxuAqu+6dwXVWpeCCgtQzlrqk
 7TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRPUPPWQ4Iptq0Ytd5wXyLcKreUsml8Ikg0eWo4JrBc=;
 b=uOAHL9VWUuyR9HmV6IzseJMMsOSPxmva3rX1k6oBU1KBBHOy4TL9byvvhEQaM8dZMr
 Cyc/vJF/yzsXkFAcPvwo3fZE92rkWv6CCjm8RCPkMWlsIgswP2klv/e189+S6y1n2i3E
 GisnhQ6huZBBH9vc9P9iFmY9QRFM3lWWwaT6xucWWSzRI2HgPl25d0heWO1E9bE5vpSV
 F7IWMi4HPjDf92S5Nsbvmfz9ruVr/4X0rV3nHue0cmA6ApaLRjGyTjKlsSEGmz1I2MkR
 IE+nJongeIYNYq7ygjAF/kqLatSWF6+yQWL2W4RYY34QHdAxO4HNOEsxz0QUnVmRKQ/X
 gCSw==
X-Gm-Message-State: AOAM532YSt8xQpaW6KkQ3SicB2Eh82PE4iNEYIVPYcuVWKBsyfxCRqV9
 rRi7+mvJXiivYbJa1Uinz4B9CrSRJLs=
X-Google-Smtp-Source: ABdhPJz/JcA2YGOnNeOt4ZBORD1j8vxq8q8GGI8QMC8FT2BuMnW235imdsV6elThKBH92PzvOu11tg==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr12547857wrr.26.1606505830114; 
 Fri, 27 Nov 2020 11:37:10 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id f2sm18017812wre.63.2020.11.27.11.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 11:37:09 -0800 (PST)
Subject: Re: [PATCH 1/2] target/nios2: Move cpu_pic code into CPU object proper
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201127191233.11200-1-peter.maydell@linaro.org>
 <20201127191233.11200-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d36dc289-3b25-0724-38f8-444992eb3e20@amsat.org>
Date: Fri, 27 Nov 2020 20:37:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127191233.11200-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 8:12 PM, Peter Maydell wrote:
> The nios2 code uses an old style of interrupt handling, where a
> separate standalone set of qemu_irqs invoke a function
> nios2_pic_cpu_handler() which signals the interrupt to the CPU proper
> by directly calling cpu_interrupt() and cpu_reset_interrupt().
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
> can have GPIO input lines themselves, and the neater modern way to
> implement this is to simply have the CPU object itself provide the
> input IRQ lines.
> 
> Create named "NMI" and "IRQ" GPIO inputs to the Nios2 CPU object, and
> make the only user of nios2_cpu_pic_init() wire up directly to those
> instead.
> 
> This fixes a Coverity-reported trivial memory leak of the IRQ array
> allocated in nios2_cpu_pic_init().
> 
> Fixes: Coverity CID 1421916
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/nios2/cpu.h        |  1 -
>  hw/nios2/10m50_devboard.c |  8 +++-----
>  hw/nios2/cpu_pic.c        | 31 -------------------------------
>  target/nios2/cpu.c        | 34 ++++++++++++++++++++++++++++++++++
>  4 files changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 86bbe1d8670..b7efb54ba7e 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -201,7 +201,6 @@ void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                     MMUAccessType access_type,
>                                     int mmu_idx, uintptr_t retaddr);
>  
> -qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu);
>  void nios2_check_interrupts(CPUNios2State *env);
>  
>  void do_nios2_semihosting(CPUNios2State *env);
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index 5c13b74306f..ac1993e8c08 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -52,7 +52,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>      ram_addr_t tcm_size = 0x1000;    /* 1 kiB, but QEMU limit is 4 kiB */
>      ram_addr_t ram_base = 0x08000000;
>      ram_addr_t ram_size = 0x08000000;
> -    qemu_irq *cpu_irq, irq[32];
> +    qemu_irq irq[32];
>      int i;
>  
>      /* Physical TCM (tb_ram_1k) with alias at 0xc0000000 */
> @@ -76,14 +76,12 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>      /* Create CPU -- FIXME */
>      cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
>  
> -    /* Register: CPU interrupt controller (PIC) */
> -    cpu_irq = nios2_cpu_pic_init(cpu);
> -
>      /* Register: Internal Interrupt Controller (IIC) */
>      dev = qdev_new("altera,iic");
>      object_property_add_const_link(OBJECT(dev), "cpu", OBJECT(cpu));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                       qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", 0));

Ah, NMI is never used.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      for (i = 0; i < 32; i++) {
>          irq[i] = qdev_get_gpio_in(dev, i);
>      }
...

