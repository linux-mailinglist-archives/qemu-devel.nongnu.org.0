Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A746667EF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaO-0007XL-0i; Wed, 11 Jan 2023 19:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaL-0007UF-HK
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:49 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaK-0001hs-1X
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id 17so18613006pll.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sEQ0/v2lgRbmNyJeHQMshFVirskAzeMMZlwqJvwwm30=;
 b=SOIDFDMGbMSszkOk/HyrtXXaHpfawabIV0/6WHB74GZoeEc89Qpod9i2wQnR6Trbek
 Qm8fOkb2oPIMiZk3zRb+ZqwMLfKtFox3emCrmTXKPAyiajmYKGmmN1uq7Um0nT7Eec7Q
 789Zoi0VhGlYOePQ35plZR9i1vIlpqTR95K8WYbIvc2ibXsUHa7QI0DQsMDl9Qx/SgO1
 nUErXJCmeEaLJrcgzZjappT2yK9UZZnYR+7iZyPjuYvAsW3WDbcihvFOb7B/SzBaPtEU
 rTFow8do2iqYbYwEGKO2WOK8b+B9Tn6k3eebYCq82TJMLWTM6EDy0fnLfzOlVrS+BVBz
 XT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sEQ0/v2lgRbmNyJeHQMshFVirskAzeMMZlwqJvwwm30=;
 b=HEV3wAerUPnJvHftDAeN0sH2EySmYwo43Ox5M74S4TqoAC/oRdT6FOH5WQm6QHjWYp
 n+vVjea7D0cVEvI+yDCeBFeNPIj/ivpzlUeJMChlPj+EBX0PEGtBuHiLPl3R3DG6e/tq
 0xPScdoH/svZ/dk+q/Jw0vggv9My6Sw10dDcKDces8506lOVAnsh9I+KxFIBWUWRhw3S
 JoPXFiZ1K4XVTfhwjCux0ILeYNRtLNSSIxyD5GUxFFPaHYVczHKe/1GRPx7Q24Sq3vir
 t+Y2uwM8BTcFcq2YXokpKv0gq/KPLwAdhZUgRw31gaiqwBthuSZgi7t5xaCAGTRM1Jr2
 xJ4g==
X-Gm-Message-State: AFqh2krGn0Qrtbbs2DzGgagtu5cEtykv1jwvc6OfcmgFtUFEDweHMFG+
 zMJazym2gZQRkTrCAHygJY0DYw==
X-Google-Smtp-Source: AMrXdXsofiNI3k4U3nrPsmYlk6rrUVjsyRA1jghnwKyW4QyIdypUnCkwmVHXDUcHQ1Pbi5DgcGOkIw==
X-Received: by 2002:a17:90b:17c2:b0:219:b034:941c with SMTP id
 me2-20020a17090b17c200b00219b034941cmr75013151pjb.18.1673483806551; 
 Wed, 11 Jan 2023 16:36:46 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 fa21-20020a17090af0d500b00223f495dc28sm9761219pjb.14.2023.01.11.16.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:46 -0800 (PST)
Message-ID: <8f016b06-5f09-b14c-a3a1-6d2b93f516e7@linaro.org>
Date: Wed, 11 Jan 2023 09:15:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 25/26] tcg: exclude lookup_tb_ptr from helper
 instrumentation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 09:39, Alex Bennée wrote:
> From: Emilio Cota <cota@braap.org>
> 
> It is internal to TCG and therefore we know it does not
> access guest memory.
> 
> Related: #1381
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> Message-Id: <20230108164731.61469-4-cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tcg/tcg.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index da91779890..ee67eefc0c 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1652,8 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
>       op = tcg_op_alloc(INDEX_op_call, total_args);
>   
>   #ifdef CONFIG_PLUGIN
> -    /* detect non-plugin helpers */
> -    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
> +    /* flag helpers that are not internal to TCG */
> +    if (tcg_ctx->plugin_insn &&
> +        strncmp(info->name, "plugin_", 7) &&
> +        strcmp(info->name, "lookup_tb_ptr")) {
>           tcg_ctx->plugin_insn->calls_helpers = true;
>       }
>   #endif

I think this should be detected with

   !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)

i.e., side-effects, which in this case is the possibility of a fault.


r~

