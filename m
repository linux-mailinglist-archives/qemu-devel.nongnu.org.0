Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EEB4CC576
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:52:06 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqYV-00013V-QA
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:52:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqWc-0007TI-U4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:50:07 -0500
Received: from [2607:f8b0:4864:20::1035] (port=55148
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqWb-0007CV-2f
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:50:06 -0500
Received: by mail-pj1-x1035.google.com with SMTP id b8so5359355pjb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pDBvUQqJYVkjfrW/2ssMUs0g2ExXG3q2qCfzpMeDVxs=;
 b=ImnArsvmxTyPBz9PGEl/rXQF1Rma/Hv/fheumKbvLv1WqQPb9198uUol+kNG2FsIYM
 ab913QxLEOVfQv4R7BB4kOF3BlwrBDXLEhioAQOVDZsoVRcK8WPMfV2J6SmHrX/NoSz0
 na8JQ/+mT2lB7IougoNOos+VWyPnkK2mv3SRqQHwrJZXBuxLKJQ6z6H17qIAuxhn/jG5
 lxDqBn8OtDmUznx74VbKMYoW9YgZmT45+6kOmY/ZHegH1QMfK2yi2AthHBdGCS19EJdr
 a4A3zXrsiZVlrqiaqbMIF534D34cwBygP3abmEiN+MDTo903E4gwk+Rwa9EKhTyQVm74
 Yq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pDBvUQqJYVkjfrW/2ssMUs0g2ExXG3q2qCfzpMeDVxs=;
 b=VS5tA6pO+BSPuLQUbovP09UwUsbVCXkX88bKPVsimup24MKMhAfcwqfIxrLpf5q+Si
 CKQumKyRwVV/depyVR2wS04mzjygdeN5OuiynA3aja3zqBFrx0wU9tbtoIN6UzFQSGel
 ta9Qrla+h5KifXccnit7Pvprylg3yMIB4sXzpc0as/A5KhUg8RnQ9ttX1EtW3N/hQsz4
 rgEdJ68WpTqU3BeUwOyPymEqSN4aiphDkgHk0+FDHN7DjQEXyMlvlTLYZmSDBoTkN2/C
 t6EXaKOFAi+1FLFxyuodqkNNeq5U8iN6APThQHVxrnDQNnvoKQG61iW+XC4aVmHnc+Zr
 HMwg==
X-Gm-Message-State: AOAM5315uR6nI8EQh+coDIBgFakbnklbhaa6VfxZ7yBEVDanypNTziwU
 JZ+XBEXRjnFHGzuFWKkb0RpNKQ==
X-Google-Smtp-Source: ABdhPJx0m7y0+tTT0GKng9Zx8mEaj2AARDjtL7dpOzv1whAkwZT/oVqkSpPBlKBT7317ctgo5rhZ9w==
X-Received: by 2002:a17:902:7b8d:b0:14f:1aca:d95e with SMTP id
 w13-20020a1709027b8d00b0014f1acad95emr37279729pll.122.1646333401644; 
 Thu, 03 Mar 2022 10:50:01 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 my6-20020a17090b4c8600b001bc2cb011dasm2754470pjb.4.2022.03.03.10.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 10:50:01 -0800 (PST)
Message-ID: <e65ce858-b6aa-e52e-c5e7-f6020b0b0b30@linaro.org>
Date: Thu, 3 Mar 2022 08:49:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/5] target/ppc: change xs[n]madd[am]sp to use
 float64r32_muladd
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303172041.1915037-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 07:20, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Change VSX Scalar Multiply-Add/Subtract Type-A/M Single Precision
> helpers to use float64r32_muladd. This method should correctly handle
> all rounding modes, so the workaround for float_round_nearest_even can
> be dropped.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c | 93 ++++++++++++++++-------------------------
>   1 file changed, 35 insertions(+), 58 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 8f970288f5..c973968ed6 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -1916,22 +1916,19 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
>    *   fld   - vsr_t field (VsrD(*) or VsrW(*))
>    *   sfprf - set FPRF
>    */
> -#define VSX_RE(op, nels, tp, fld, sfprf, r2sp)                                \
> +#define VSX_RE(op, nels, tp, op_tp, fld, sfprf)                               \
>   void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
>   {                                                                             \
>       ppc_vsr_t t = { };                                                        \
> -    int i;                                                                    \
> +    int i, flags;                                                             \
>                                                                                 \
>       helper_reset_fpstatus(env);                                               \
>                                                                                 \
>       for (i = 0; i < nels; i++) {                                              \
> -        if (unlikely(tp##_is_signaling_nan(xb->fld, &env->fp_status))) {      \
> +        t.fld = op_tp##_div(tp##_one, xb->fld, &env->fp_status);              \
> +        flags = get_float_exception_flags(&env->fp_status);                   \
> +        if (unlikely(flags & float_flag_invalid_snan)) {   

You seem to have squashed the change to recip-estimate into the same patch as muladd.


> -#define VSX_RSQRTE(op, nels, tp, fld, sfprf, r2sp)                           \
> +#define VSX_RSQRTE(op, nels, tp, op_tp, fld, sfprf)                          \

And recip-sqrt-estimate.

I guess it's ok to squash, since it's all related, but you should update the patch 
description if you leave it this way.


r~

