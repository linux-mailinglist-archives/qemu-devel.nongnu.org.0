Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0A64A364
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jpo-0000jF-Lk; Mon, 12 Dec 2022 09:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jpS-0000cs-Qm
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:30:55 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jpQ-0008Og-FH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:30:50 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 e22-20020a4a5516000000b004a3d3028bafso884923oob.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WTIv/AXMIVxsoFpNNe3fVaJR9gqLfCqZD4obOQsZpB8=;
 b=gBNUre0Ya88hFatP5rbJuBEleE5SOlTsPXrAN/EY2bV2cWpP0w6cF9u+7h/NorjOP4
 P0fKkiYdoOGQLhv6WIo1zmVtIX91mzopmCMAN7PcdBWmMFU6rL0NiI56DEtRdkGWWysj
 BlQDgYq/unn7YSGXH9hS96ytcRUImfz+l5TKqlE3CLy1eGkJEna2/8bi3hKy6cAndk1y
 +ODFul1EgY5wWd1VWgtvG3hj32pLwbrR4k6G4IpnoZ/NSMpr+07BY4+kPu5GEpDZC2WY
 uOHnLu7uy6X4wjMVBjagMXk7UWelMQCj+K2lj15DuIiIF2d8GA7N3yZzJyBZ+NIePXun
 UKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTIv/AXMIVxsoFpNNe3fVaJR9gqLfCqZD4obOQsZpB8=;
 b=AnqiFepFqOkOq7753sf3CtTMaME1IhCj3JxwERD3v0j0AdALsbRrTph0bGgsM46kI3
 mHs6G6JY630lyUM1Glck0A4jTc7pP2MTk/QE/Awu3ObWUpqmIqfrMUYoyZ5+djhbubPv
 TEdesGcDv3aiOKBrBrZcisn/6aDTNfUGPuULawGKYl/5Rt1+w5N6AxaEXCiaKARwqaBG
 CU4Nf78jVrqQO1R5Gj77XgqqLjT/hdU1vYjDdeYRWQANaFwAP7FMjpqVdxBdrloco2kv
 g7OOjaxZJyxNYK2VzjJ2kKuvb7U4EwRKJVPQ4k3JJrmDn2FkeIgEC8ejD9bfZ7u3YAAW
 KNmw==
X-Gm-Message-State: ANoB5pl7DPpAaRWXaGDZxFxwyrHjs55J1nMI+0BhnCrzzjrUFdT7VS4R
 nJe8FQi2w8MBZVnICKJnj2hv8g==
X-Google-Smtp-Source: AA0mqf5aFOQ2CAfDAFHJ5PPCKFZJF4fl82Qpo8u1KYzf0Icxocbl5XyZYDCObExiJeCdWnuU12VpeQ==
X-Received: by 2002:a4a:d549:0:b0:4a4:224:736f with SMTP id
 q9-20020a4ad549000000b004a40224736fmr662059oos.6.1670855445455; 
 Mon, 12 Dec 2022 06:30:45 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a4ad628000000b0049ef7712ee5sm3577664oon.11.2022.12.12.06.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:30:44 -0800 (PST)
Message-ID: <375e840f-a823-b1e8-3d3c-3b1b4298188e@linaro.org>
Date: Mon, 12 Dec 2022 08:30:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, balaton@eik.bme.hu
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <20221210152744.GA2275483@roeck-us.net>
 <20221212011345.GA2235238@roeck-us.net>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221212011345.GA2235238@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
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

On 12/11/22 19:13, Guenter Roeck wrote:
> On Sat, Dec 10, 2022 at 07:27:46AM -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Thu, Sep 01, 2022 at 11:15:09AM +0100, Richard Henderson wrote:
>>> The value previously chosen overlaps GUSA_MASK.
>>>
>>> Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
>>> that they are included in TB_FLAGs.  Add aliases for the
>>> FPSCR and SR bits that are included in TB_FLAGS, so that
>>> we don't accidentally reassign those bits.
>>>
>>> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> I noticed that my sh4 emulations crash randomly with qemu v7.2-rc4.
>> This happens with all Linux kernel versions. Testing shows that this
>> patch is responsible. Reverting it fixes the problem.
>>
> 
> The patch below fixes the problem for me.

Thanks for the investigation.


> +++ b/target/sh4/cpu.c
> @@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
>       SuperHCPU *cpu = SUPERH_CPU(cs);
>   
>       cpu->env.pc = tb_pc(tb);
> -    cpu->env.flags = tb->flags;
> +    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;

Only this hunk should be necessary.



>   }
>   
>   static void superh_restore_state_to_opc(CPUState *cs,
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 7db3468b01..546c182463 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -2270,7 +2270,6 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>                     (tbflags & (1 << SR_RB))) * 0x10;
>       ctx->fbank = tbflags & FPSCR_FR ? 0x10 : 0;
>   
> -#ifdef CONFIG_USER_ONLY
>       if (tbflags & TB_FLAG_GUSA_MASK) {
>           /* In gUSA exclusive region. */
>           uint32_t pc = ctx->base.pc_next;
> @@ -2290,7 +2289,6 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>               return;
>           }
>       }
> -#endif

This one is actively wrong.


r~


