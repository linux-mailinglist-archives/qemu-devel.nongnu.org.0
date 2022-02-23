Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196B94C05E1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:22:19 +0100 (CET)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfQ9-0001YD-Tq
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:22:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfOe-0000bC-0g
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:20:44 -0500
Received: from [2607:f8b0:4864:20::102f] (port=44002
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfOc-0002ik-4Y
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:20:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso1154730pjb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/jbHv7WH4mADJqeDzwIaGQ+wV3K6YH06mKZKox8RaSI=;
 b=hvA9MAxMC0WkwtAjVB5gYgjBk2FoiYQvricCiGkZ4yK4ylB67ZzznmdOQAuhJxC6Tq
 p0BlIHKGEAOI40fHYWFzzFzGdo7QEZFQDwcDzq2ce+haECdF4tsKovAPSiRLF+b5spfq
 kgAe8hLbrlQ9T6j0loSf+zm/zR8FAny/NCqqQwMGHGYJSWvX1xn9qyBdRA1w3BELxkfW
 X4FB+K/tLJxuqAQqMKwzDjMEihvwLeS3uFfcEdILBvCSA/i5g2UehtDvCkxIngZsOKA0
 166UmwiSP5UE/G316OZCGagXsq3OEdlobkkcPTYzHZ8rZGg9arMYGXL3tFF0nCl2FA8d
 IP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/jbHv7WH4mADJqeDzwIaGQ+wV3K6YH06mKZKox8RaSI=;
 b=SIi/PnpeEVIAJlSVmWCaYADCZlyGqyh4wKIMxSYSYLjxx1OY99KU1ninIl36ljNI8D
 lUecwzDXR8PeF03CsdEyeQsumPwpIdtcTR+FLkCBpnGRdPQm/J8sbKayyIegCz8HsTeV
 W7pM7cQUIyjUiBwFCnkwYb5IyfuYwEvRcf7MqirA2guRjUQa+vjfRV2yf2STOlTBYewh
 Go0TzCiAeAAipzhqPbM7I92g6Fe3GkkrqKjeyHlzGUhYhDIGg7qsAhvMDv8rrJaNggei
 RWSZiWvN6475QJWDPXplp5gil04IW/qRrgCoy7j3o1rD5sdRn0S6CtJP4yjuWiXVp+ny
 /v7g==
X-Gm-Message-State: AOAM531/HIuw32FrhjRozQXsI6jO61/1w/LZjBRljicG8hjy6iglEKuE
 qxIcpLyKQlcmADBycyneECkhUA==
X-Google-Smtp-Source: ABdhPJyUR5CH1fJFHdfjg7EXTyEZ+u6ywROq9FTCCUQVVztpoTnBMRm8oC3Gzr2qDdrvKu/FgjppHA==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr25813704plh.156.1645575640510; 
 Tue, 22 Feb 2022 16:20:40 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id 13sm767358pje.50.2022.02.22.16.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:20:40 -0800 (PST)
Message-ID: <c4e1ed69-62a7-dfa8-302e-c74845803098@linaro.org>
Date: Tue, 22 Feb 2022 14:20:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 38/47] target/ppc: Refactor VSX_SCALAR_CMP_DP
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-39-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-39-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> Refactor VSX_SCALAR_CMP_DP, changing its name to VSX_SCALAR_CMP and
> prepare the helper to be used for quadword comparisons.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 9b034d1fe4..5ebbcfe3b7 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2265,28 +2265,30 @@ VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
>   VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
>   
>   /*
> - * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precision
> + * VSX_SCALAR_CMP - VSX scalar floating point compare
>    *   op    - instruction mnemonic
> + *   tp    - type
>    *   cmp   - comparison operation
>    *   exp   - expected result of comparison
> + *   fld   - vsr_t field
>    *   svxvc - set VXVC bit
>    */
> -#define VSX_SCALAR_CMP_DP(op, cmp, exp, svxvc)                                \
> +#define VSX_SCALAR_CMP(op, tp, cmp, fld, exp, svxvc)                          \
>   void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
>                    ppc_vsr_t *xa, ppc_vsr_t *xb)                                \
>   {                                                                             \
> -    ppc_vsr_t t = *xt;                                                        \
> +    ppc_vsr_t t = { };                                                        \
>       bool vxsnan_flag = false, vxvc_flag = false, vex_flag = false;            \
>                                                                                 \
> -    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||             \
> -        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {             \
> +    if (tp##_is_signaling_nan(xa->fld, &env->fp_status) ||                    \
> +        tp##_is_signaling_nan(xb->fld, &env->fp_status)) {                    \
>           vxsnan_flag = true;                                                   \
>           if (fpscr_ve == 0 && svxvc) {                                         \
>               vxvc_flag = true;                                                 \
>           }                                                                     \
>       } else if (svxvc) {                                                       \
> -        vxvc_flag = float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
> -            float64_is_quiet_nan(xb->VsrD(0), &env->fp_status);               \
> +        vxvc_flag = tp##_is_quiet_nan(xa->fld, &env->fp_status) ||            \
> +            tp##_is_quiet_nan(xb->fld, &env->fp_status);                      \
>       }                     

Note that this can be simplified further, using the full FloatRelation result and 
float_flag_invalid_snan.

Note that do_scalar_cmp gets half-way there, only checking for NaNs once we have 
float_relation_unordered as a comparision result.  But it could go further and check 
float_flag_invalid_snan and drop all of the other checks vs snan and qnan.


r~

