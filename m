Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DA589F2F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:14:15 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdUE-0008NE-Kt
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdOS-0007rh-1J
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:08:16 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdOO-0005hL-Jg
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:08:14 -0400
Received: by mail-pg1-x531.google.com with SMTP id d7so248487pgc.13
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vGm29pSFkuqhf81qrHLapxLUdeyrSGc8DSxjF8Y3ER0=;
 b=vAQEnVTbox2ic+0uxFv2sDP8CGuVVyZMBOo7nEAbOM2LWucZTy05FSQLfL33s3rdBi
 24xecKvZnureGDwXml3Bw8hhCoPxqyp8UYFK+4RNWWvlbvqAkyeI076plW/tl6y5owxU
 0ddW6ydn4ZsU80c+7QDTsm+vBu2iJfOn6ZPR0yfpG1PvwDra50sFUi7nhNJAOC1waGjD
 HN5D+QxK9ClWKHrnYIsxF6M/Pd9rl+dirHjt7e16TV6JfW9AaXX0ilfGuv3RQaWsAAEi
 t22wHMZpMww3RkC4RUrhPRtgweHIqJIc+NKA4AUBlNgI/3uiUXLFhImL5foqPT+YG0U2
 U8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vGm29pSFkuqhf81qrHLapxLUdeyrSGc8DSxjF8Y3ER0=;
 b=o+dLfOUNpZIgEfnkLNr0tggkOkQ4Agh3nuKFTn5+sbUsKyCgE0LljPZOWnQiI5WuNA
 uh/32fzKekm1dPctDKEvZJSU1DEXX8ui2cxgHMSbI/PY8bugKzUb9YnhHk4nr4iHPRTg
 VvyFsjNZmxvO9ZJ11K1s6s5heT81c9ymXVLLk68N9S70VsKB7jA3fUn0eEntFQ2fTDH0
 ZJZzL2J+ROKh2XQ8IgQSll73sZMkqcurm2s4coV2vykcUzf2ggDThkFUnB8E++lyVQnx
 ci/XPxwEgbNfdDLXw7cwfDC8/GksvQhTN9/iIG/NfzmMzzfk4v6LiKankgwD7FWqjp7E
 rT9A==
X-Gm-Message-State: ACgBeo1N4KYr4mPPzVPxzwhYijLuwprABQh6xr3CF44rFyN3YPqXXZpF
 DaDvAtFLjs7FKJq5rGFHIczXfg==
X-Google-Smtp-Source: AA6agR4x2xJw4SM4Xr5cYswwpzCPNjGDI53jyGb1+yBuzbVMuqsdWunVRX9CpgiIEIPplahstzOniA==
X-Received: by 2002:a05:6a00:a8e:b0:527:9d23:c613 with SMTP id
 b14-20020a056a000a8e00b005279d23c613mr2431041pfl.53.1659629291024; 
 Thu, 04 Aug 2022 09:08:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f7c600b0016d1f6d1b99sm1202274plw.49.2022.08.04.09.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 09:08:10 -0700 (PDT)
Message-ID: <2103e803-d9c4-bb10-1a62-7c086d988a90@linaro.org>
Date: Thu, 4 Aug 2022 09:08:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 5/5] target/loongarch: Update gdb_set_fpu() and
 gdb_get_fpu()
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220804130213.1364164-1-gaosong@loongson.cn>
 <20220804130213.1364164-6-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804130213.1364164-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/22 06:02, Song Gao wrote:
> GDB LoongArch fpu use fcc register,  update gdb_set_fpu() and gdb_get_fpu() to match it.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/gdbstub.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
> index 7d95b4b11c..265f0f43b6 100644
> --- a/target/loongarch/gdbstub.c
> +++ b/target/loongarch/gdbstub.c
> @@ -51,9 +51,14 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
>   {
>       if (0 <= n && n < 32) {
>           return gdb_get_reg64(mem_buf, env->fpr[n]);
> -    } else if (32 <= n && n < 40) {
> -        return gdb_get_reg8(mem_buf, env->cf[n - 32]);
> -    } else if (n == 40) {
> +    } else if (n == 32) {
> +        /* fcc */
> +        uint64_t val = 0;
> +        for (int i = 0; i < 8; ++i) {
> +            val |= (uint64_t)env->cf[i] << (i * 8);
> +        }
> +        return gdb_get_reg64(mem_buf, val);

You've got this function over in linux-user/loongarch/signal.c.
You might as well move it into target/loongarch/ and share it.


> +    } else if (n == 33) {
>           return gdb_get_reg32(mem_buf, env->fcsr0);
>       }
>       return 0;
> @@ -67,10 +72,14 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
>       if (0 <= n && n < 32) {
>           env->fpr[n] = ldq_p(mem_buf);
>           length = 8;
> -    } else if (32 <= n && n < 40) {
> -        env->cf[n - 32] = ldub_p(mem_buf);
> -        length = 1;
> -    } else if (n == 40) {
> +    } else if (n == 32) {
> +        /* fcc */
> +        uint64_t val = ldq_p(mem_buf);
> +        for (int i = 0; i < 8; ++i) {
> +            env->cf[i] = (val >> (i * 8)) & 1;
> +        }
> +        length = 8;

Likewise.


r~

> +    } else if (n == 33) {
>           env->fcsr0 = ldl_p(mem_buf);
>           length = 4;
>       }


