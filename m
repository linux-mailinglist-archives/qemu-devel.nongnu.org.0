Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF82ACBAA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 04:26:18 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcKIT-0000Oe-5I
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 22:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcKGr-0007WB-Cx
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:24:37 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcKGm-0004nR-Fg
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:24:36 -0500
Received: by mail-pg1-x541.google.com with SMTP id e21so8933685pgr.11
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 19:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bbUycxEGTVnZuFJ80HW47227gAq9fNuMJJwxMA5kMKk=;
 b=vWhk17GcCm+Q7ksQt+1h/nDbl2XC2T+vuNuuD1V5KC8jT9z0SaEs5PmEhZCfvTJQ4G
 2DA2LBxqn3pP35FONhAhRMAfwGryLvC8rA5on9y2yFurY4aQnfIZpjyEFXesyxhp6Okg
 fWTD/BAOWbYs5+k6dHl82zqK5Ul/534M58opRqsjW+chUAorgEF5vC6lOoSBUICXBa6i
 7Shw0IzCqZPCxSYnScxsoYiZSy3qxZf+QtSBj5JxrohhCyRNjXHHTo0zRZQGe1AJKFBh
 etYUljETC6j/OK/9Ra6mkTLqwJYpYXSoy6ZW702HCdH3DzmtXgrgrsCG8U7Knbnr9DUS
 U2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bbUycxEGTVnZuFJ80HW47227gAq9fNuMJJwxMA5kMKk=;
 b=M13olE0mbtL1JffHRYfyQJixx45E+OuuGOzvfDFVrbjLg6x9rAQk0yFYjmxamXoWhA
 HNA6eyXmI+eoIteWiJBDcNFFppxQWbgAepWZ2gqwfBGlBzmTdc3VvNNzdA3FaDQgNMJT
 2zPt2J4gOlUmfBNVfcZ07o9j0WWwsEd89h6GcEth7fNLJivGIlqHUnKCyve9i2RldEct
 owiXT+JmcItVNNZpT9mllz8esd/mv8KKRNOe1lV5b37TRiIU0jmVLFtL4yNpWrj3ksAD
 CY5aQ+GrQ7oeB3Uir5iMuSme5KAHVHRg6W2U554Uz2kLHMlgo1CScrQ4GbhoYt4w0C0x
 B9TA==
X-Gm-Message-State: AOAM530V8NvXsZqvdOcOR0wCw5nhctNYMrnuNiZfYVMLEMj0PXR46aTs
 Jd1nsYPSVk2PwrIPtvcDOVT1Tg==
X-Google-Smtp-Source: ABdhPJxNLdV/LVBj8JXVfVA38GXAmgYsUf0aEZdbSCJwAQtl+TRak+VGlTTAnx0JicT9JxHI+rYWGA==
X-Received: by 2002:a63:7009:: with SMTP id l9mr14445849pgc.199.1604978670918; 
 Mon, 09 Nov 2020 19:24:30 -0800 (PST)
Received: from [192.168.3.43] (068-185-011-182.biz.spectrum.com.
 [68.185.11.182])
 by smtp.gmail.com with ESMTPSA id g1sm954534pjt.40.2020.11.09.19.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 19:24:30 -0800 (PST)
Subject: Re: [PATCH] ppc/translate: Fix unordered f64/f128 comparisons
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20201109102147.31747-1-thatlemon@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99c83004-82ef-882b-b41d-a163b0966aa4@linaro.org>
Date: Mon, 9 Nov 2020 19:24:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109102147.31747-1-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 2:21 AM, LemonBoy wrote:
> According to the PowerISA v3.1 reference, Table 68 "Actions for xscmpudp
> - Part 1: Compare Unordered", whenever one of the two operands is a NaN
> the SO bit is set while the other three bits are cleared.
> 
> Apply the same change to xscmpuqp.
> 
> The respective ordered counterparts are unaffected.
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 9b8c8b70b6..b07ff66375 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2479,13 +2479,11 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
>      if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
>          float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
>          vxsnan_flag = true;                                              \
> -        cc = CRF_SO;                                                     \
>          if (fpscr_ve == 0 && ordered) {                                  \
>              vxvc_flag = true;                                            \
>          }                                                                \
>      } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
>                 float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
> -        cc = CRF_SO;                                                     \
>          if (ordered) {                                                   \
>              vxvc_flag = true;                                            \
>          }                                                                \
> @@ -2497,12 +2495,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
>          float_invalid_op_vxvc(env, 0, GETPC());                          \
>      }                                                                    \
>                                                                           \
> -    if (float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {         \
> +    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
> +    case float_relation_less:                                            \
>          cc |= CRF_LT;                                                    \
> -    } else if (!float64_le(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) { \
> -        cc |= CRF_GT;                                                    \
> -    } else {                                                             \
> +        break;                                                           \
> +    case float_relation_equal:                                           \
>          cc |= CRF_EQ;                                                    \
> +        break;                                                           \
> +    case float_relation_greater:                                         \
> +        cc |= CRF_GT;                                                    \
> +        break;                                                           \
> +    case float_relation_unordered:                                       \
> +        cc |= CRF_SO;                                                    \
> +        break;                                                           \
>      }                          

This needs some more cleanup.  There's no point in checking for nans first;
wait until you get to float_relation_unordered.

These macros should be made into straight functions.


r~

