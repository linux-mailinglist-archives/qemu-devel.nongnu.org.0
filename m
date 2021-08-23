Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692C3F4F80
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:30:37 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDmO-0007I8-Gn
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDl7-0006dx-9I
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:29:17 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDl5-00047C-PH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:29:17 -0400
Received: by mail-pf1-x431.google.com with SMTP id 18so15983592pfh.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9rbDy4TqQBWde0NhX5xICKwZnka8n4Y0k0kcLLUehrg=;
 b=G6z18NNDDIJ3SBwaZHBFjEvrqV2lDRoQgiyKggJAccT3gRlhm9wLUBE+qqBsm3t5zQ
 mS1slj0WtY/+2ZC0Ffifr1AaVxCGUWOyBT/8UP1E4uarTCBR19lNkdGvE3aWOE0MPHkI
 +tUROin0rN2Opj4xtnq5oyoPxj576A5Fo0XPWHTfefYdGsgn6Ua+weZpY+kmD9l4uUVy
 Xwwbm1sYDkbXPqfgF2kDY0BYkYVkRL4p9kiU4Q88vVGIeavR++QFsy1hDPvM+CXn4uZX
 EH0i/mDSs0VoQ854W8m2SjjHY2eYP4gNgqBJjC6JbgyNGxRSE5BU7OdRyxI8S8PEkBlA
 Bc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9rbDy4TqQBWde0NhX5xICKwZnka8n4Y0k0kcLLUehrg=;
 b=dlpAIqKw4Ms62ICnMvLTRoihGcWk5ccxWqAqAirkv3OrINF3wngVjHsoXhFM7YImjh
 hbNMVVj8x8Hn9fP/piW0UsVos4z5r1upMlKWDkFevaBLderFYr436lI2YfGyZkNYWZVU
 RQCvD2l3wzQFfXccN3r2kLAhD5jFdNtDyj41a756a1CUM1wQTlZeRHODJKPBB5yDiIWj
 jO1gHg46MfyaMflI8gyGDzCs6HpbCEoGkNeSEbiKsdlapdk/F3HHOaaTNNqINymeC6DN
 iJLBLEpvGYV8qA8HrS4zE2iWaQp7ZYQazSqx+CntdXSRPSq6jOY0XtGUeWQbZFV8tKDi
 OC6g==
X-Gm-Message-State: AOAM533w44uD2fZamH4a2dmRNX0saVdOQGMWls+qsFvDe300avPy7Kje
 Ugc6Qeq3TysW7YqlLmolMplEsg==
X-Google-Smtp-Source: ABdhPJz+s0Os4OhnA7WJ4dxLHYfUw4QdVHXqk6Y5dLnhcb2gFQf4DPZdd5m2M03gfkObHT+FSCx5bQ==
X-Received: by 2002:a05:6a00:1348:b0:3e2:c99:a7b0 with SMTP id
 k8-20020a056a00134800b003e20c99a7b0mr35595845pfu.62.1629739754153; 
 Mon, 23 Aug 2021 10:29:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v63sm19384258pgv.59.2021.08.23.10.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:29:13 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] target/riscv: Add rev8 instruction, removing
 grev/grevi
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-12-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16e41b41-f054-3225-7552-d9e6300fa58e@linaro.org>
Date: Mon, 23 Aug 2021 10:29:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-12-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> +++ b/target/riscv/insn32.decode
> @@ -682,6 +682,7 @@ min        0000101 .......... 100 ..... 0110011 @r
>   minu       0000101 .......... 101 ..... 0110011 @r
>   orc_b      001010 000111 ..... 101 ..... 0010011 @r2
>   orn        0100000 .......... 110 ..... 0110011 @r
> +rev8       011010 011000 ..... 101 ..... 0010011 @r2

I think it would be clearer to call this version rev8_32.

> +# The encoding for rev8 differs between RV32 and RV64.
> +# When executing on RV64, the encoding used in RV32 is an illegal
> +# instruction, so we use different handler functions to differentiate.
> +rev8_64    011010 111000 ..... 101 ..... 0010011 @r2

... to match this.

> @@ -303,18 +293,11 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>       return gen_shiftw(ctx, a, gen_rolw);
>   }
>   
> -static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
> +static bool trans_rev8_64(DisasContext *ctx, arg_rev8 *a)

And I think we should move the two trans_* functions to be sequential.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

