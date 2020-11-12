Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5690E2B106B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:29:12 +0100 (CET)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdK9X-0007dj-Bv
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK77-0005f8-4s
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:26:42 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK73-00019t-9l
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:26:40 -0500
Received: by mail-pg1-x541.google.com with SMTP id f18so5292067pgi.8
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p8or8tRuzhfMj4P57qfqu8H+07q2qiQGecGF7X+UQlU=;
 b=kTplA9zh7QY3Ma3Kibo8QnpbV1IzpQDgbnd7jJXVJZtfrVAaXH6+/4F/CzyXM60qef
 kX6RAHXvpPOsjNrSoSWSe6FkqXYQF2BxVlKqsHQoaCW1saM0aet6tkgaOQQc16tITqKL
 CoZh09Ul54XAToLmmDtas/OfjiuLdkWfDjF6yqZ2pZPOcA5T/uFRj4zEM6+WSQzxK/HW
 xb8hvAW4lYRgYoxFt1d5QhxvgeA/dhQSpEAseV3Qf24hfIh/Xjom+uqEOBd3ZMdh6cdk
 /dWSIN6AA93TJgEZeJH+FaNQv00L0l+0ESFaDGmbtKMwjiLv9OamTlIGouKAdkH5jCIa
 8WAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p8or8tRuzhfMj4P57qfqu8H+07q2qiQGecGF7X+UQlU=;
 b=lFuBIGKTNuPbtrrPLKNer2twKxaYFfg6XgqBZFuteebV/7eathE9eytadU2cKgMXsH
 t9rEsJ8o9/BcBY7AA3szmuPw4I9woarWbMH47qAHIWjSWlhi/cok3zdHtylEqqssDg3A
 9NQ4DZo52yb/oi3t/G/prPWuZMTx4nUVVT8DmQa0ajtw9L6vPBqPaALeBaN/JbOvbp+B
 M6ayGOZtEuzbkZOGmy+RbETOZXMUAnG2hnS9qdhVY0wc0cwoJqZeg01b6rNKmQR0T+17
 L4PxRqEEfU0pLpKcdGN/s5THfiL35d3THVQTOstUYeYh9KpNQ0lYTJYgZCuOezZxmErj
 bhJA==
X-Gm-Message-State: AOAM531X5UnGf0VjfOBP1Fxjj63Ocbqvd52NuFvIbZfU+uYkIXnvk7kU
 tCM2AAVojy0p8miXu9WFBahbhg==
X-Google-Smtp-Source: ABdhPJwCdWSvkuR7R5x+T4d/RZdVhRULYUkoNlhOnKNiNvgoXfu+FVfMAhRyogIrA1z62diZmuWbvA==
X-Received: by 2002:a63:c250:: with SMTP id l16mr1194238pgg.66.1605216392791; 
 Thu, 12 Nov 2020 13:26:32 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j8sm6727364pgb.55.2020.11.12.13.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:26:32 -0800 (PST)
Subject: Re: [PATCH v2 1/4] ppc/translate: Fix unordered f64/f128 comparisons
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20201110105321.25889-1-thatlemon@gmail.com>
 <20201110105321.25889-2-thatlemon@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb0248b1-cc5c-da37-60a5-7b3e699b4851@linaro.org>
Date: Thu, 12 Nov 2020 13:26:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110105321.25889-2-thatlemon@gmail.com>
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

On 11/10/20 2:53 AM, LemonBoy wrote:
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

You can now drop the |= for =, since cc is always 0 beforehand.


r~

