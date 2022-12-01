Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393D63EA70
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:42:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0eDL-0002KO-0z; Thu, 01 Dec 2022 02:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0eDF-0002J1-Qi
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:42:29 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0eDD-0004K2-U6
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:42:29 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 130so1102167pfu.8
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=muMR7e20seT5AacuJVDQXvk9+9FnZysBpe5HPhOWh/c=;
 b=U1AsMW38O0/yd4XBQ5Yx660lopdhygxYyVW0RGAOrqQLgtnvYJchDMhS4eFnSyzNYG
 tHhPmrFrRIb+o2OxMbrnRTPMxURaXOOi+jFYpvtPIWg1hoKIep2uGaQl9Bm8R46mq0eW
 5HPjhOrP+DWgZFIwDgWLLgRzeiF3GaK/IiCmGwu2T4CxK3U6BLBiY+LxGFbjMdI10X3b
 WL3GYkY4+/Es5gCxMzGnrjquw8hZDPIdqDDvN1fPcWCxsTeVVZ225ajfIXA9FDrQZRbL
 pQ4IHKdRMPanx97Z3NpxHiWBreQcerZtp0EpOEMe8sA/yz0WpQ3rP5guEE2xM5JZjANQ
 uK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=muMR7e20seT5AacuJVDQXvk9+9FnZysBpe5HPhOWh/c=;
 b=x4Dbvwka/fWCzzZH4n6P9FZERR1/p7zWFDWE25gyrbj35lmDkVM9qpnF4f4smK1k47
 7NWAXvcco33seLFMWgkhk+48cNeMx3783UfdrZ8f3JaauLpgsXsfJZtXMH6gbVfLVf25
 CYt82gh3JY0SLusl211jdG69b3CNvwQnhigcrgI90P0HUOdxSM5vpJ+xxOMYSqNkCbw0
 7zjpGR3PJDiAZ7yvQsDvwB6UJV2Lt452iFJpShX2QsgNtuanBNDgOmo4C1TkpNQAaRgy
 R5tIcKppyNHzh4kaaXQsSl8l+ZqNQWAbmaT7r/UOifZNmjzrUUFH4FPgzXlH6T2vGJO2
 kJrg==
X-Gm-Message-State: ANoB5pkszREww/K9rOwmaFBL+ufQuiUTxA03059PwHE1YJfc2h/ImKhF
 QZAYpCWw310uype4mLyeTFbiww==
X-Google-Smtp-Source: AA0mqf7s0+DSasHOsdMI7ojdSiB17SjD4pp52paBawI0MjxviqqtIJlQtntr9LDrvOmXpTAYaOg3HQ==
X-Received: by 2002:a63:d356:0:b0:477:1a2:390e with SMTP id
 u22-20020a63d356000000b0047701a2390emr58247222pgi.83.1669880546302; 
 Wed, 30 Nov 2022 23:42:26 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170902cec800b001867fb4056asm2834817plg.32.2022.11.30.23.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 23:42:25 -0800 (PST)
Message-ID: <5c74fd8f-5f46-4d5b-f390-01250706cb3f@linaro.org>
Date: Wed, 30 Nov 2022 23:42:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/tcg: Fix undefined jump with x86_cpu_tlb_fill
Content-Language: en-US
To: Daniel Hoffman <dhoff749@gmail.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20221201064813.1315752-1-dhoff749@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221201064813.1315752-1-dhoff749@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 22:48, Daniel Hoffman wrote:
> Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
> ---
>   target/i386/tcg/sysemu/excp_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> index 405a5d414a..6a93e96eb7 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -595,6 +595,7 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>       CPUX86State *env = cs->env_ptr;
>       TranslateResult out;
>       TranslateFault err;
> +    bool use_stage2 = env->hflags2 & HF2_NPT_MASK;
>   
>       if (get_physical_address(env, addr, access_type, mmu_idx, &out, &err)) {
>           /*
> @@ -615,7 +616,7 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>           return false;
>       }
>   
> -    if (err.stage2 != S2_NONE) {
> +    if (use_stage2 && err.stage2 != S2_NONE) {
>           raise_stage2(env, &err, retaddr);
>       }
>   

The patch description is missing, which might have included some indication of how the 
problem might have been triggered.

 From inspection I can guess that it comes from the incomplete initialization of 
TranslateFault in get_physical_address, after the check for a canonical address form.  In 
any case this is not an ideal fix.


r~

