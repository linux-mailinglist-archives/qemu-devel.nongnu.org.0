Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B852CB0B5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 00:17:46 +0100 (CET)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkEu0-0007XD-UU
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 18:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkEry-0006TH-9J
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 18:15:38 -0500
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkErp-0000DI-5q
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 18:15:37 -0500
Received: by mail-oo1-xc43.google.com with SMTP id y3so830538ooq.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 15:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JdhBR1jya00vvW/+Hbbz7N2Ltr/qvMNqadyy9niF2xg=;
 b=BM7x8zPHo729H39aFJSkM9nRniraRoHUygwKe54pHLS4TpLSuzLPYMT7R9bVmuhxz2
 xEWwCp4y2jvRaRuVm7J7CWUhtK153dac2x1J951FJBC0PmWVCrPw87tBkR4GrPWvbFId
 ogAxH9qQ5co6mBgUIxk3x4t5KLNdJho7TXuZwOrthURXK+j131f++Y1Xp9yof8zFW2sf
 YrPKdV7ak42rxqznCwFm/qihhCGNg0HYW5LanJ9IootpdA7KiVbGPx7EYK6RtJJM0Pq7
 hY+x8m3yiwhbXXX/dL/NCyo3H5GoFOsRmnNfX6aj3VUZENmJZ56kLn0ypEkg3IKggfBb
 LVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdhBR1jya00vvW/+Hbbz7N2Ltr/qvMNqadyy9niF2xg=;
 b=GfNAvHJRlqraLS68c8MYHauLxkjm9YoNa1IizEtp3qlyCYrXMiZ5AkkShIDKwG7RDz
 VC5LQIjXB8B9mguZMmgzW0I3VBL8biVJ6llWOI5NuwHce1i+LurnHXqlldyelHs4FR3L
 s2PN6tMBGUiUowQ19NvdyanxzzlFfaNysQUtCTwLLXgP/rJfsjEC51zV5N6W0tI6HYnc
 TwjXmjNtc3voA+Y1PeWm4+vQkGJDCRUkVXuzdTm69832KulcjwuVQzn5JUayjSTwJPFj
 Lr8g1+mWMLVq/cq8OBMFNpKuYz2fvL/LMpWTvIEnZEF1G7TtC0+yIRsu09GUGqCNQrFM
 ai9w==
X-Gm-Message-State: AOAM532ECKcBE7ZzgUB+cwAqoyO9eePTnOgx4XcF93U7vygjemS4kbIM
 A9erBVw1/1HfFSgGhSzXE7fNTA==
X-Google-Smtp-Source: ABdhPJwC5tQ5dwOdEHbBvaaveUz7DONmLlfhrYLnrqEQIqElmdYLiGWi9c80L0bF+Q8dZyG2c0uBFA==
X-Received: by 2002:a4a:9e02:: with SMTP id t2mr3580882ook.42.1606864527796;
 Tue, 01 Dec 2020 15:15:27 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id x21sm300677oov.5.2020.12.01.15.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 15:15:27 -0800 (PST)
Subject: Re: [PATCH v3 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
References: <20201201192807.1094919-1-f4bug@amsat.org>
 <20201201192807.1094919-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d221a26-7d32-936d-3421-6848bd07e84c@linaro.org>
Date: Tue, 1 Dec 2020 17:15:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201192807.1094919-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc43.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 1:28 PM, Philippe Mathieu-Daudé wrote:
> ISA features are usually denoted in read-only bits from
> CPU registers. Add the GET_FEATURE_REG_EQU() macro which
> checks if a CPU register has bits set to a specific value.
> 
> Use the macro to check the 'Architecture Revision' level
> of the Config0 register, which is '2' when the Release 6
> ISA is implemented.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index b7c6d30723a..9c475fa5f70 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -7,6 +7,7 @@
>  
>  #include "qemu.h"
>  #include "disas/disas.h"
> +#include "qemu/bitops.h"
>  #include "qemu/path.h"
>  #include "qemu/queue.h"
>  #include "qemu/guest-random.h"
> @@ -995,17 +996,25 @@ enum {
>  #define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
>      do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
>  
> +#define GET_FEATURE_REG_EQU(_reg, _start, _length, _val, _hwcap) \
> +    do { \
> +        if (extract32(cpu->env._reg, (_start), (_length)) == (_val)) { \
> +            hwcaps |= _hwcap; \
> +        } \
> +    } while (0)
> +
>  static uint32_t get_elf_hwcap(void)
>  {
>      MIPSCPU *cpu = MIPS_CPU(thread_cpu);
>      uint32_t hwcaps = 0;
>  
> -    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
> +    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);

You still get the magic 3.

This is where hw/registerfields.h would come in handy.  But that is certainly a
large change to mips' cpu.h.  So I guess this is good enough for now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

