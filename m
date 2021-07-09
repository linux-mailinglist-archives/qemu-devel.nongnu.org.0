Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610A3C2709
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:44:03 +0200 (CEST)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sfa-0003iN-Iz
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sdG-00078b-KZ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:41:38 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sdF-00049z-1f
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:41:38 -0400
Received: by mail-pg1-x529.google.com with SMTP id s18so10346029pgg.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4v8uuXx7owcu1oFKQhHcumDEPDjJvDExy16MWPDG2Sk=;
 b=KgQyZ3RjMXpOmS1OUa8mB0H70XrvXR1Tulu810aPaST/Ci5eB3GY8n+fjS2Vx/d1mC
 Qq45GFiO0RhKoGfdEsPVrHO2xIsA22qvFFO8UycAW2M/11/6nEBQkkTMh0NDnedGOmGn
 xGl7LFuuAeeS1APKyqVDD/v5bF1Y7GFIACBIOD5M3a2MX6kA0aaCDQOdFvx7HrxD1qZX
 HiSWiFfFPgYA06XIF2nEcGkv9r/72EYEOEpWjI2vcKGMp59d3I3gwpJTAgyPKFU/S9rP
 QXV9eWcvrT3g4sUEj9nYRvpRe3A/ucBi6FSvIQgMU3Bfqp2vObSXv6pPGY8x0CpWxf+c
 2DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4v8uuXx7owcu1oFKQhHcumDEPDjJvDExy16MWPDG2Sk=;
 b=dAGuh3WlowYFbyG6BRwr8YAwYPl9QwKzmEfFzP5Opc/uZC6/APdp8sWI4wSXwVqIpa
 Ck60vL6nEvnWBmGy8VEdH13c2mzYPXhT0cgeDLb+VqIN2RWetVo89cnTpjo1Nj/QlEeC
 uTnOQe7pcfzN+cIVvmG82sf/0ggluzU9q9mlzAtBH66BZixNIsFl+cj71byak9qDGyTn
 sUaFBbBQxMSDm5qiKYc9oyUL1fo6YOYgBuOywhxIM/asXGSnkI/Lrvm92ReEz+8ewdiC
 ty1a/77EqFv39Ywn85aOU8+o2ChV275QLwvoinmDJyG61GhxB5KWDG+8RaR2W46Txjtc
 GXWQ==
X-Gm-Message-State: AOAM531kf43ULVSsQ3ZEO5RihQyVfuZLPkvx6ey1x+AC2U2A4abHd4CD
 gGnL89DSIGuuqrBH43D2w0b/tw==
X-Google-Smtp-Source: ABdhPJxpSicTWjdfqZtJH9cFdypRRdACTFRXX8NlgTaXMfG0q4kiVt+3F6CGgrXbrEjR3R1axQC6+g==
X-Received: by 2002:a63:d852:: with SMTP id k18mr39501602pgj.290.1625845295584; 
 Fri, 09 Jul 2021 08:41:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 31sm7703132pgu.17.2021.07.09.08.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:41:35 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] hw/intc: sifive_plic: Convert the PLIC to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8dd50fa9-2728-c60b-d29e-dd5d0fe7ddee@linaro.org>
Date: Fri, 9 Jul 2021 08:41:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:31 PM, Alistair Francis wrote:
>           switch (mode) {
>           case PLICMode_M:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> +            if (level) {
> +                qemu_irq_raise(plic->m_external_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(plic->m_external_irqs[hartid]);
> +            }
>               break;
>           case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> +            if (level) {
> +                qemu_irq_raise(plic->s_external_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(plic->s_external_irqs[hartid]);
> +            }
>               break;

qemu_irq_set.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

