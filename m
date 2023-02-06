Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86968C5ED
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6NE-0007fU-Q2; Mon, 06 Feb 2023 13:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6NB-0007cT-SX
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:37:50 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6NA-00038d-1f
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:37:49 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 bg10-20020a17090b0d8a00b00230c7f312d4so2896057pjb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJ4WZRb+qcB0ADCuzq0HTG68lsC6ky8K+1goHFG9KLM=;
 b=rfGVI8arAbGktWNINQD0qsezrFXq3+jSVliXFmkpCZjFRRmGQuu5A/UTb3vfjOUUIj
 fiKLqxVMkuAF0dU9sE3RU6exR9RP3R+s7FynK1LpHdWRtCpIV5YAVb+5CEIbiZVsCldp
 XYV3cG2HkQGdgYiBcKfQ3T6Hgga/rOCIOqeVcpLGikR2f2r7bLP0dBrwmbj+E1rnIU7p
 SuhXLA4DV9dNeqeHGU3sLyb6gdbNe1lPUNI6TbLhPxxFv+fwSwnzas8fe1mpfJDirCHQ
 0vfcXTK9Il9PpdyaeHAASb89qdcS9PNT8SxHeeHSe9m5Lq228OhluBXpz4XW14Wxzio+
 xSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJ4WZRb+qcB0ADCuzq0HTG68lsC6ky8K+1goHFG9KLM=;
 b=jXey1smzlGPsQLGGSRxJ9ykO1khzWkm1nsOZVblJexs3ddUywwnux/+UVSW5YSO3mf
 +nQPV3qCaD/zpTDx1GaRAycmrH1OEvDxUEIVFOJShnrykU7eonM6L/S0QWgXA4PJAH6S
 iXj+rE6KVLYkeYzvp1B3BQMzcC0U2KHlDMQC5uyKJzNNQDwU1pHDJzpRs5Sjzt4kAuPX
 rOB3yDNI5iRnu1ygtCmEE1dI418HT5hq04YrREcE0MXZZtzs8JFQW9RhjnaFIFLPFWpE
 SZI5UUoMs/bCYMviMwYQwOMVSN6uzyHgmu0lmt568TLIx9tnxZnfY5dsQMDhom7K+jEB
 QJPw==
X-Gm-Message-State: AO0yUKVgaGuQo7ZFqmnjRb1dwDUDr0fuieuSDAI1rkNN9HhIcl4/QJkh
 C5bsgZEKAjqS+YLR/yjLNZ5LXg==
X-Google-Smtp-Source: AK7set+ZFIlo7OjHs+s/1ZBYwYXZ6WB4RgLVekZkc6lo1zPNcW//42EYVNL8c8Lsr3P2Bur9Yq7GTA==
X-Received: by 2002:a17:903:18f:b0:199:19b7:cb3 with SMTP id
 z15-20020a170903018f00b0019919b70cb3mr4588519plg.34.1675708665496; 
 Mon, 06 Feb 2023 10:37:45 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jl12-20020a170903134c00b0017f73dc1549sm4188215plb.263.2023.02.06.10.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:37:44 -0800 (PST)
Message-ID: <afe89944-610f-4a05-741b-75d28c1ab36f@linaro.org>
Date: Mon, 6 Feb 2023 08:37:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] target/arm: Avoid resetting CPUARMState::eabi field
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> Although the 'eabi' field is only used in user emulation where
> CPU reset doesn't occur, it doesn't belong to the area to reset.
> Move it after the 'end_reset_fields' for consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 7bc97fece9..bbbcf2e153 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -721,11 +721,6 @@ typedef struct CPUArchState {
>       ARMVectorReg zarray[ARM_MAX_VQ * 16];
>   #endif
>   
> -#if defined(CONFIG_USER_ONLY)
> -    /* For usermode syscall translation.  */
> -    int eabi;
> -#endif
> -
>       struct CPUBreakpoint *cpu_breakpoint[16];
>       struct CPUWatchpoint *cpu_watchpoint[16];
>   
> @@ -772,6 +767,10 @@ typedef struct CPUArchState {
>           uint32_t ctrl;
>       } sau;
>   
> +#if defined(CONFIG_USER_ONLY)
> +    /* For usermode syscall translation.  */
> +    int eabi;
> +#endif

As a follow-up, this could be bool.  And thus this might pack better just before 
tagged_addr_enable.

Other than placement,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

