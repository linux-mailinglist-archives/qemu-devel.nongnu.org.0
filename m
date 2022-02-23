Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27574C09FF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 04:10:21 +0100 (CET)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMi2m-00012E-KV
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 22:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMi1G-00008v-TZ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:08:46 -0500
Received: from [2607:f8b0:4864:20::1033] (port=46626
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMi1F-0004VA-0s
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:08:46 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so1444060pjw.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cGx2LeHWbtIAeKxwFqrDia+ZfiUW5Yk7y4oucvokimU=;
 b=b6WQiqvZ+h/F2y6tcV5f4FOouwnbgbNxFQ08mQGmyGWRRH3SlwdexipDNi5t4gTTcu
 cSxLr6Qr28LyYHr9PDfYoad8TZMwiH6En/4XFeFOCI6CZSsJIE13MtqDS6gELCHNb3K/
 61E3b6RvjguJtGp9fxhNxPA0/IJd1ipX5j6hcNiw2kQg+D2Z2Mt6wIhDrAI9Lg8NNJ1z
 XYcLFKBpvQZxlkoj0j6ua1TfjGW2ltPnH9mTOQLyY2J9TmlQf1u0WnKCYQApPE/IcAsc
 ZbK0evYcJTfuLmaxbTv366J48TutMawFF0y7gY5f9hAhtV9ndeBUmYmx1ks0eDpueSGX
 ik8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cGx2LeHWbtIAeKxwFqrDia+ZfiUW5Yk7y4oucvokimU=;
 b=WV30uLMXolnkKR5+dBpMtBLw3vq/JHz2rdPpSwcys+Xi0tHem0cbQfeSlkaIzotkzb
 lU/r1svj2duWEfS+cAAidmc4MyoCCKm1wFTA4GPgpOcV8gzHnMmNpJgo2qitouEGxCWd
 ot2MnQiWeOAFUCQtRuBMkEugtXp78/Ov7drG6a/sKR4ig21PtrLXpeFzrelU2ehKOeju
 USUTjNJcB/n3apSUWGwyRNB8dD76CASyZLMNDN3irssiYzWsRIAgkLcd4aw+U+m5Pz4b
 4vhR0QzeaH/BU47R4LvrEi3vzg0kOq8TAzskmUfx9SWJeW2ymsgsF4ahTkg9nWI5BmMN
 4vyg==
X-Gm-Message-State: AOAM5338bfxG1gB+9xbJtKDAKDwmLX7lFo1r9fAao9Etl5o4GsawyUq5
 4pTsWrZ6uCJNErbDeHkH8OHp7w==
X-Google-Smtp-Source: ABdhPJzesTE5XcjD7xtq5U1L2ljsQWQGB8v6ERIv5XUQb6uDrcu/Q+RWvQjXwipyvZwsj40pWW+OWg==
X-Received: by 2002:a17:902:7b8d:b0:14f:f1c2:9ff4 with SMTP id
 w13-20020a1709027b8d00b0014ff1c29ff4mr2598632pll.54.1645585723510; 
 Tue, 22 Feb 2022 19:08:43 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 e20-20020a17090ab39400b001bc4f9ad3cbsm1109593pjr.3.2022.02.22.19.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 19:08:43 -0800 (PST)
Message-ID: <69fc3846-8736-5676-95ff-0385436c0ca1@linaro.org>
Date: Tue, 22 Feb 2022 17:08:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 44/47] target/ppc: Implement xvcvbf16spn and xvcvspbf16
 instructions
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-45-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-45-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo <victor.colombo@eldorado.org.br>
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 21 +++++++++++++++++++
>   target/ppc/helper.h                 |  1 +
>   target/ppc/insn32.decode            | 11 +++++++---
>   target/ppc/translate/vsx-impl.c.inc | 31 ++++++++++++++++++++++++++++-
>   4 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 7773333bd7..d77900fff1 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2790,6 +2790,27 @@ VSX_CVT_FP_TO_FP_HP(xscvhpdp, 1, float16, float64, VsrH(3), VsrD(0), 1)
>   VSX_CVT_FP_TO_FP_HP(xvcvsphp, 4, float32, float16, VsrW(i), VsrH(2 * i  + 1), 0)
>   VSX_CVT_FP_TO_FP_HP(xvcvhpsp, 4, float16, float32, VsrH(2 * i + 1), VsrW(i), 0)
>   
> +void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
> +{
> +    ppc_vsr_t t = { };
> +    int i;
> +
> +    helper_reset_fpstatus(env);
> +    for (i = 0; i < 4; i++) {
> +        if (unlikely(float32_is_signaling_nan(xb->VsrW(i), &env->fp_status))) {
> +            float_invalid_op_vxsnan(env, GETPC());
> +            t.VsrH(2 * i + 1) = float32_to_bfloat16(
> +                float32_snan_to_qnan(xb->VsrW(i)), &env->fp_status);
> +        } else {
> +            t.VsrH(2 * i + 1) =
> +                float32_to_bfloat16(xb->VsrW(i), &env->fp_status);
> +        }
> +    }

Do not check for snan first; use float_flag_invalid_snan.
And you can move that check outside the loop, before the
writeback of t to *xt.


r~

