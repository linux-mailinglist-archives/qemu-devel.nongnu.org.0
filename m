Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD8697A37
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFNZ-00026x-Iw; Wed, 15 Feb 2023 05:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFNW-00026d-9J
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:51:10 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFNU-0007Ye-Hh
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:51:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so1205064wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aGtG0RBQ8cvU1copGnrKRgUv8PgUB7nWAUIcvNiRd3Q=;
 b=aBzwWuRww/qcTHeCETdJS/QSElGJmog1RjYettpjBpmOdpK2uJIMeHggwLlYvDNNoS
 pxNC/oJJB5qszLIISs5+OGhoNPuCa+rn5Ix20JfI2lTSP/qfjXYJ395C9WhR7XQVo7Wa
 O5RPuEd78XFzPpuUyXYgv9s3eA5hvjlVevY44oii20GwDK4KW8+U7JJ0Miw5SlrEemvk
 E2xChZYT2T2PnscuQwxKAk4OftgTUxhuwdEniR+WNXkzKzeJUUxykdHXVhP/LKOJHuy2
 88rWktzReadzw7woqkzsAWzwGCluXQECTaI5FN9FXtL/HJ/cCqDn1LlUdMxtT1XqytWA
 F5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aGtG0RBQ8cvU1copGnrKRgUv8PgUB7nWAUIcvNiRd3Q=;
 b=FuKQCRfTL37y4EymoHGxdywgP7aHPSwT+Zp7AvfYBWgnUbEhP89CA/oyDrKPllL2jO
 AyjG2MpkDlzg3IuPaAwQuMOH+tgeXtCCojpWyXpMn/YRl/TOYLYd8CmgpuGtlgv8BEYg
 gAv5DJ3wJEMwtKNcufcNMumLn5EoB6a3V6XwU0YhQLPmsNRivNuc4/3Pdt+g4JtIlbb0
 rwhAhmoJTAykLmqlVSVyZgFYqH2ZeiP0qnjUIfJcMztd0m6Gxb2Avj2w67v+OOdXSilk
 Yrd8opiyIYoSkecLc2MgtdOSNtC+2TFb/wM1iT3oevEoeQ3BSy7zTfE75/F8mjyK1UwP
 Mj8w==
X-Gm-Message-State: AO0yUKXWnrw/9q5Gs9CNB274ZFI/GvyMRP8YBCnAqK6brSFWCWMh1tlb
 Q3YUGSjr5X0Qrn8iL65wVxLpQg==
X-Google-Smtp-Source: AK7set99ySsXbF6A5s3emcOXl3Baw0S2tniBFPYwkBa22UHezaRYpL0CF+J/OAjuOVTdpQbEQPOR+g==
X-Received: by 2002:a05:600c:5409:b0:3df:f2a5:49fb with SMTP id
 he9-20020a05600c540900b003dff2a549fbmr1659782wmb.7.1676458265910; 
 Wed, 15 Feb 2023 02:51:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b003e200d3b2d1sm1647217wmq.38.2023.02.15.02.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:51:05 -0800 (PST)
Message-ID: <63199a0a-2a37-e84b-dbe7-effd44fd3a1a@linaro.org>
Date: Wed, 15 Feb 2023 11:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 2/3] target/mips: fix SWM32 handling for micromips
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-3-marcin.nowakowski@fungible.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215084754.3816747-3-marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 15/2/23 09:47, Marcin Nowakowski wrote:
> SWM32 should store a sequence of 32-bit words from the GPRs, but it was
> incorrectly coded to store 16-bit words only. As a result, an LWM32 that
> usually follows would restore invalid register values.
> 

Fixes: 7dd547e5ab ("target/mips: Use cpu_*_mmuidx_ra instead of 
MMU_MODE*_SUFFIX")

(I suppose a typo S[W] -> ST[W], since LW correctly converted to LDL)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> ---
>   target/mips/tcg/ldst_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
> index d0bd0267b2..c1a8380e34 100644
> --- a/target/mips/tcg/ldst_helper.c
> +++ b/target/mips/tcg/ldst_helper.c
> @@ -248,14 +248,14 @@ void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
>           target_ulong i;
>   
>           for (i = 0; i < base_reglist; i++) {
> -            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
> +            cpu_stl_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
>                                 mem_idx, GETPC());
>               addr += 4;
>           }
>       }
>   
>       if (do_r31) {
> -        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
> +        cpu_stl_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
>       }
>   }
>   


