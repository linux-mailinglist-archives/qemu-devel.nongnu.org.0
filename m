Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4B067ED5C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTPV-0001IW-Ls; Fri, 27 Jan 2023 13:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTPT-0001Hx-Ex
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:25:11 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTPR-00060D-R9
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:25:11 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 b24-20020a17090a551800b0022beefa7a23so9410139pji.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Vs/GIn0GyxZ07vSNzt87yyHpt5ljXDpbQWGu/SIXyA=;
 b=DiZSfjGF2tQ1bkgD9y9JWt6PtmlGbwJue90jBP4LzbFycOUfQZFi7EjK7rMcfhKeUi
 1cX/8odlFrzjqkQduair1JYvzURthcvTFZPQqS6mdAzXAXDERrMX8fim8CTeLxWUXt9A
 HMYFuiNCiHGzjeoYR3QZVam3VLHaqc0aYRbMOYfrI4HCVvdPaKi0wgT9nzg2qzMsvdFt
 RuSpUCyf5V8rftJR5KpjoJIH1VrDurNbFiIgt8cQFfgHtZKzw86DIDjywb8Eu1JftURv
 KYyf7Yu9W9KIOuMfankfs+5uX0xrOQRG8d3IIsuEVSPe6NR8i4qKaRfxBAFjN3JRDo/Q
 vRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Vs/GIn0GyxZ07vSNzt87yyHpt5ljXDpbQWGu/SIXyA=;
 b=pTKB+/ncqWTkKnSViCs3qM6VIVbVZXJTSQ1X/U53ogYESLS/gu/whh7Vwv9XeUe5DK
 5nG9vdoJ8LqE9VzhLri7oiLL3/sqsF1GyWyMQUTYW4hnGiBVyMumFLzK4LJ82jFPyMvd
 FqC80PKslZFmAdQXDDfaufe8s6AHR0ApJ0vhF300JCE9ny3iFkeSx08XbNRn33Qusynl
 YKLdTinE+Cra46V5dydiMAH3lLOlJcw7hfaqeNGoxtc46iTyuw8ZXLXvqiWzYhyYuB4D
 fosQ6iQVEJ010yRGzaE6kVbkzfID5tpW8RUgzDwRBlsVxwkmEjkdup6bPmCX0jH9rFrR
 IOdg==
X-Gm-Message-State: AO0yUKVwa9k5f8EYwTboQdYhPxXBWbeZtDKKTc/5LTYAigkbRuc458HN
 krR3+IoILV+53LmQLQenSofNSIcVbEALBfk0
X-Google-Smtp-Source: AK7set8iEVL+JMJ4ZXRLLzAx+ofZ4k4fAH2kq0AEBcZz6jsRuNowz2czd+2AONlrRQwmy0FbrKfA6Q==
X-Received: by 2002:a17:902:dacb:b0:196:3bbb:e9e3 with SMTP id
 q11-20020a170902dacb00b001963bbbe9e3mr9657507plx.28.1674843908411; 
 Fri, 27 Jan 2023 10:25:08 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a24-20020a1709027d9800b0019460c34839sm3156390plm.185.2023.01.27.10.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:25:07 -0800 (PST)
Message-ID: <42cff1f8-a256-bf34-039b-9dacc7e4d755@linaro.org>
Date: Fri, 27 Jan 2023 08:25:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] target/tricore: Fix OPC2_32_RRRR_DEXTR
Content-Language: en-US
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: anton.kochkov@proton.me
References: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
 <20230127120328.2520624-5-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127120328.2520624-5-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 1/27/23 02:03, Bastian Koppelmann wrote:
> if cpu_gpr_d[r3] == 0 then we were shifting the lower register to the
> right by 32 which is undefined behaviour. In this case the TriCore would
> do nothing an just return the higher register cpu_reg_d[r1]. We fixed
> that by detecting whether cpu_gpr_d[r3] was zero and cleared the lower
> register.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>   target/tricore/translate.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 62128c6aae..b8e0969079 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -8245,10 +8245,19 @@ static void decode_rrrr_extract_insert(DisasContext *ctx)
>           if (r1 == r2) {
>               tcg_gen_rotl_tl(cpu_gpr_d[r4], cpu_gpr_d[r1], tmp_pos);
>           } else {
> +            TCGv msw = tcg_temp_new();
> +            TCGv zero = tcg_const_tl(0);

tcg_constant_tl(0), which you then don't need to free at the end.

>               tcg_gen_shl_tl(tmp_width, cpu_gpr_d[r1], tmp_pos);
> +            tcg_gen_subfi_tl(msw, 32, tmp_pos);
> +            tcg_gen_shr_tl(msw, cpu_gpr_d[r2], msw);
> +            /* if pos == 0, then we do cpu_gpr_d[r2] << 32, which is undefined

   /*
    * If ...
    */

> +             * behaviour. So check that case here and set the low bits to zero
> +             * which effectivly returns cpu_gpr_d[r1]
> +             */
> +            tcg_gen_movcond_tl(TCG_COND_EQ, msw, tmp_pos, zero, zero, msw);
> +            tcg_gen_or_tl(cpu_gpr_d[r4], tmp_width, msw);
> +            tcg_temp_free(zero);
> +            tcg_temp_free(msw);

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


