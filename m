Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E74473644
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 21:48:22 +0100 (CET)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwsFB-00016A-Fy
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 15:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwsDW-00007c-RG
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:46:38 -0500
Received: from [2607:f8b0:4864:20::102c] (port=36541
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwsDU-0002gx-7g
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:46:38 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so15556711pja.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 12:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LYNhEYfC3SEHhXcMNJyp9cAbkd7HbOVMti4fmtj3VcI=;
 b=Zp8aiKfa3md3rlX2DhmHJ61AiIqsw/jvMwMiBW9sV7QgDdwV7ctcPmbhxtX3Phx6AH
 OlZj72q7zlKvHEMXMSIIMhokoVd/EfLjoDo5WF4UL1pE+wwSELioFBH/F5+jv9onvHug
 KUx+JnInvVprpNfrnDm//wnBH1SXhREXkyhIuwtZjjL+NmsG/n7Wu1WTtrrzGhU1GcIV
 fv9wUgWeLhGLiIWAUx2k6G8lk4e8pwejU+6/CZN0nYpHXAD5iw7dPADCuzMW0Ww4D0cp
 4bodJxSvGNzo9LziAFyLLMjJ5tyncGvioZ6BUi8IDEfNaxrkxd7okDD9AYYySb4qn8Qd
 wmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LYNhEYfC3SEHhXcMNJyp9cAbkd7HbOVMti4fmtj3VcI=;
 b=6p5Ziava+YShaF9erkxAO7AoI5n9BVORN4wsR++5g2t5WCAhpB11pN++Zo0fpZSFJN
 EO+sboxDqD+ysOdpO2Z22fIpCRU3DLalKrTk+BJS3zoCnpHi+6G0JeY7ZDYdyuBqsizz
 IUGTMcIZGmIfM4Q5wOFpOeWdiCZk6ixBpdQrewJf7R66+mSSPwOzrS8FPfBzn9+Xdejs
 IsnWwmolTU3pBwENNRzvVzjuxEAv4i0nB0W8VakFGtNOiyrIbQNZzYIXEeoX996/U4wX
 6lZfqD2bGkXv6JqGvQKAIA6pkWZpvyaSY6g767M+J92D7erBNIVLpcwCbR6FpUjLzwSX
 6FAw==
X-Gm-Message-State: AOAM5322vROUYeAGNFmsW9DYjO8NbnmhMZY80OboANq0hlG4Qxcw6tw0
 11mv9bXFkQIS5kJb7GNphfSvjg==
X-Google-Smtp-Source: ABdhPJxY6caPfco1jZy1nM3ogTEqtwJiLKjT+ZXQMFt8SItgs4jsIHqxXGpgOr/r+gNs/egP7dFzLA==
X-Received: by 2002:a17:902:bd87:b0:143:c6e8:4110 with SMTP id
 q7-20020a170902bd8700b00143c6e84110mr838182pls.23.1639428394530; 
 Mon, 13 Dec 2021 12:46:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t12sm21388pjo.44.2021.12.13.12.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 12:46:33 -0800 (PST)
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: Byron Lathi <bslathi19@gmail.com>, qemu-devel@nongnu.org
References: <20211213182449.7068-1-bslathi19@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <215c98d7-2be4-56d3-7487-ebb7472be17c@linaro.org>
Date: Mon, 13 Dec 2021 12:46:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211213182449.7068-1-bslathi19@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 10:24 AM, Byron Lathi wrote:
> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 init functions, using the appropriate values from the technical
> reference manual for the A5.
> 
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>   target/arm/cpu_tcg.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..38f0fc3977 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -304,6 +304,42 @@ static void cortex_a8_initfn(Object *obj)
>       define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>   }
>   
> +static void cortex_a5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a5";
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x410fc0f1;
> +    cpu->reset_fpsid = 0x41023051;
> +    cpu->isar.mvfr0 = 0x10110221;
> +    cpu->isar.mvfr1 = 0x11000011;
> +    cpu->ctr = 0x83338003;
> +    cpu->reset_sctlr = 0x00c50078;
> +    cpu->isar.id_pfr0 = 0x00001231;
> +    cpu->isar.id_pfr1 = 0x00000011;
> +    cpu->isar.id_dfr0 = 0x02010444;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00100103;
> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01230000;
> +    cpu->isar.id_mmfr3 = 0x00102211;
> +    cpu->isar.id_isar0 = 0x00101111;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232041;
> +    cpu->isar.id_isar3 = 0x11112131;
> +    cpu->isar.id_isar4 = 0x00011142;
> +    cpu->isar.dbgdidr = 0x1203f001;
> +    cpu->clidr = 0x09200003;
> +    cpu->ccsidr[0] = 0x701fe00a;
> +    cpu->ccsidr[1] = 0x203fe00a;
> +}

Looks ok.

> +    { .name = "cortext-a5",  .initfn = cortex_a5_initfn },

Typo.

In addition, you probably want to add the cortex-a5 to the list of cpus that are supported 
by hw/arm/virt.c, and then you need to add this to docs/system/arm/virt.rst.


r~

