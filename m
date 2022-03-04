Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686E4CDFE7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:47:55 +0100 (CET)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFmD-00087J-QU
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQFjk-0006BB-4o
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:45:20 -0500
Received: from [2607:f8b0:4864:20::62d] (port=37434
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQFji-0005es-7C
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:45:19 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j13so907677plx.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 13:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XbAWErD1jk9YjJ/iYbxEQAkwqRmZKBiUfmIPF2nb9TA=;
 b=dOxUGtdQTDwrsnJDzFHmzS5I/+3cdGaINBB7uf0Cor5Rl7455ESdTamfIuHVg19vVH
 Ru+p9xwXxrp/aZO1Ai8kXV0hOY0I/9zgFoqGC8Vgbm5MGjFCOFg+SCiEDTuvjrxPm3lA
 SEJjAk32NinKPqon419e1QC6n/p3HlM6IJwQVmni+nj62Dc6T/E8yWlqm9HZ7fCmRhyv
 bHpx0s8Kh33ZrzlAdNCjEHidC5OaPtxtQE6jLhjF01bQcjN8Tajhlo1wdDV9LCbq9kLd
 NIycxDpDTlPafz2gCf2sHRJUWtjKhmOmNwnuBPtQRveQwrvzx0DlhQUEG2QYQufalsp2
 q89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XbAWErD1jk9YjJ/iYbxEQAkwqRmZKBiUfmIPF2nb9TA=;
 b=wyGTA3dHMDZCmHwhFyAhtpJ7TratV0/DJFoPq9FXpLs1ZS6qI/BqrtGO+oZRw4nXE7
 bWIuQ2QwgNaLa6+EhQYtMGK+K+otx5jRwuDihTNCU5xxdAYnq+bYiqYdUO3U7pnuCMoR
 TQqYfs/nQ+qUyyvOsuf39gfE2+i/pYSw8kaJpHxwBGy0TJ1Iti/mQLnSbAG6HiUMjdQ7
 291FvuNZhgffgrQ6QnASiWTQVopQxwkatuM451bcQAUpAfsMHvd+Tkz4mXb//B9hA50q
 I53+i+PzhHqK+YIyQStw7y1pDGd2G36L1y7CqN4euslNGYZZ6synZKBYHOeDzOWIW3+r
 3NYw==
X-Gm-Message-State: AOAM532pCOwnBkO7GJiLkU93VnsUD+yHnAhPJw5AaH+PVP/X2USDVDUp
 6O9tOZ2djFhYYdJPuGg19AF23g==
X-Google-Smtp-Source: ABdhPJzDM1C11EzkmRpiehaVjZ+4yFl/25Rg+TNXH3GrpJcAb9m0AdHS/mM2t1dlr/H9zmOn6augMA==
X-Received: by 2002:a17:902:e542:b0:150:e0a:c21e with SMTP id
 n2-20020a170902e54200b001500e0ac21emr354410plf.59.1646430316591; 
 Fri, 04 Mar 2022 13:45:16 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm6698562pfu.74.2022.03.04.13.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 13:45:16 -0800 (PST)
Message-ID: <16f01126-988b-2cef-3dd4-6564ace49493@linaro.org>
Date: Fri, 4 Mar 2022 11:45:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/5] target/nios2: Shadow register set
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
 <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/3/22 05:39, Amir Gonnen wrote:
> Implement shadow register set and related instructions
> rdprs, wrprs. Fix eret to update either status or sstatus
> according to current register set.
> eret also changes register set when needed.
> 
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> ---
>   target/nios2/cpu.c       |  1 +
>   target/nios2/cpu.h       | 48 +++++++++++++++++++++++++++---
>   target/nios2/helper.h    |  1 +
>   target/nios2/op_helper.c | 18 +++++++++++
>   target/nios2/translate.c | 64 ++++++++++++++++++++++++++++++++++++----
>   5 files changed, 123 insertions(+), 9 deletions(-)
> 
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 6975ae4bdb..026ee18b01 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -54,6 +54,7 @@ static void nios2_cpu_reset(DeviceState *dev)
>       ncc->parent_reset(dev);
> 
>       memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
> +    memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_REGS);

Zeroing registers is not part of processing 3.7.4 Reset Exception.
I'd be tempted to set all of the registers to 0xdeadbeef instead, to catch out incorrect 
code, especially wrt the shadowed r0.

> -#define   CR_STATUS_CRS  (63 << 10)
> -#define   CR_STATUS_PRS  (63 << 16)
> +FIELD(CR_STATUS, CRS, 10, 6)
> +FIELD(CR_STATUS, PRS, 16, 6)

This change needs to be done separately from introducing shadow registers.

Having read the specification more closely now, I think this implementation may be wrong. 
  In particular:

(1) r0 appears to be hardwired to 0 only in the normal register set (CRS = 0).  That's why 
software is directed to use wrprs to initialize r0 in each shadow register set to 0.

(2) Changes are needed to wrctl to protect the read-only bits of the control registers. 
In this case, especially status.NMI and status.CRS.

(3) The advice I gave you for rdprs/wrprs is wrong when CRS == PRS (you'd need to modify 
regs[n] not shadow_regs[prs][n]).

These 3 items need to be handled in separate patches.

> +static inline void cpu_change_reg_set(CPUNios2State *env, uint32_t prev_set,
> +                                      uint32_t new_set)
> +{
> +    if (new_set == prev_set) {
> +        return;
> +    }
> +    memcpy(env->shadow_regs[prev_set], env->regs,
> +           sizeof(uint32_t) * NUM_GP_REGS);
> +    memcpy(env->regs, env->shadow_regs[new_set],
> +           sizeof(uint32_t) * NUM_GP_REGS);
> +    env->regs[CR_STATUS] =
> +        FIELD_DP32(env->regs[CR_STATUS], CR_STATUS, PRS, prev_set);
> +    env->regs[CR_STATUS] =
> +        FIELD_DP32(env->regs[CR_STATUS], CR_STATUS, CRS, new_set);
> +}

Another possibility, that doesn't involve moving data around is to use a pointer to the 
CRS base, like sparc does for its register windows.  I'm not necessarily advocating this 
solution, merely pointing it out.


r~

