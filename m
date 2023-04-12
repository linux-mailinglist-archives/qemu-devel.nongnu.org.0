Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4C6DFF59
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgeV-000225-RL; Wed, 12 Apr 2023 16:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgeU-00021d-AN
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:01:10 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgeQ-00023C-ML
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:01:10 -0400
Received: by mail-oi1-x235.google.com with SMTP id t23so193409oiw.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681329665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oYUlqp7DOOYFgt3XSfQbMs2OwrXSW0diZtzXYFuRk1s=;
 b=KAGHKbI1BQyhne+wBINTaJ7l+X/uTJolmxDA31Th56hWYZuJk78aEy9j/6+gLEnhZ4
 brvQ1oLml4cJ2H3rR4IRd5hbyHU7sysBbCsVCziUsZh1Zgeid+CbujWRBtvOJNbA9ZXj
 GV2F+W2jdHzXlsnobuNoypUlRMPHXSE9Tp3JVr2R4XKKMFoN/XzXKrz3jSENtnIkZYyS
 Iw0hT+qHotQM6M+0BRe7ZIE+qkN1zDO4EFf2QEmUrpRgTL4qBJ6XukVzUiKVAH/H5dTB
 dgYiJSndZFLHSuxyMWAEbtgL6fmNyyeuacvITL8E7IZwdKrwm0m6s8lfDYGz/Tst5zgF
 jqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681329665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oYUlqp7DOOYFgt3XSfQbMs2OwrXSW0diZtzXYFuRk1s=;
 b=JGvmAkJCd01sD7ZEhCC8DP9uZc2CTg5BCeG2L7cm2oCbEHcx8sy1vR0FsLAeHZzLLs
 6Q0ufYttsULSWgirRQLggP47Dz8kQV9IoqAcw1mGlmPgTfRhOWK3bJSo66YuoUeKRoOI
 0QEdMfu3ArDEDp80qdMHZrY5p8tp+aNobhVQe0QsSnYoW39noz1WgkrXibbVpAjJTPVO
 hqLMDnlyus5wH/ajiLTwSf13526h7aM7nE64otJxzTIB3+YDj0avU8PXUYB/oGnnB5R/
 L+LitlsySlRT/5HB6ovLwchuL30jr0dUvaaOeNIQhnCBCLy8rNkPoQMHb1/vPE+rfhSA
 Pk8Q==
X-Gm-Message-State: AAQBX9dhrq31ljkgQeSsbgXwvKTR5tWPFHXOJoL/4/fgdkIO+mJCSu7s
 Oxwc2uMc0r6UC/xgqPEn6fwpvQ==
X-Google-Smtp-Source: AKy350ZRIaTlK/IFx38YnrRzcJ7gDhi8q63EbscDO+Tv6GSCWA0HC388ClI0nZMNcYPDBdfA5wpkPg==
X-Received: by 2002:a05:6808:23cb:b0:386:eedc:a5cd with SMTP id
 bq11-20020a05680823cb00b00386eedca5cdmr10800132oib.43.1681329664920; 
 Wed, 12 Apr 2023 13:01:04 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 w130-20020aca6288000000b0038bb2f60064sm4595976oib.30.2023.04.12.13.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:01:04 -0700 (PDT)
Message-ID: <34ba8e89-87f0-8e80-d1c5-c30b0850291e@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:01:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 12/54] tcg/riscv: Conditionalize tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-13-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411010512.5375-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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



On 4/10/23 22:04, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept sign-extended in registers,
> via "w" instructions, we need not extend if the register matches.

Perhaps "we don't need to extend if ..." ?

> This is already relied upon by comparisons.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



>   tcg/riscv/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 7bd3b421ad..2b9aab29ec 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -604,7 +604,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
>   
>   static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
>   {
> -    tcg_out_ext32s(s, ret, arg);
> +    if (ret != arg) {
> +        tcg_out_ext32s(s, ret, arg);
> +    }
>   }
>   
>   static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,

