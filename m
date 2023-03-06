Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC26ACC76
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFVL-0001l8-FU; Mon, 06 Mar 2023 13:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFVJ-0001km-U4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:24:09 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFVI-0007Up-Cc
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:24:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id kb15so10709556pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678127046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8k9TOFCLuRkfF65tT9vO14B6UGRTW6jnxfupno8gZIc=;
 b=haXjpZ//amzrb98XtBm/7JUMVsVe07e8j06qD3onT5raM8fsRQCwzhy/MfHvhGN7j9
 17cVHeEHpjRlhRt8hDEBvUze8Th252TbGJLAfnhYlwANpncFNLVA063ItNI0LOFHS8X0
 vYr27NbVN6ibdqiVGMQUxAviRpn7l6d3xg8MIvMxIKxgchjzkIp6NOBmtPoO/rZY35BY
 XP/jk24PGtuZFXa/zKQ80WCGIHF4ZZRmi7W8ND+XhNDwNGKLKeMicOoW8NkGVye7mb1q
 W0V22JpB5xfvLI2i/uG/ATxQIXrQR+xcRW02OvYmZNAnw3EWBNv83UvN0JvXDRQ0CSdM
 UY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8k9TOFCLuRkfF65tT9vO14B6UGRTW6jnxfupno8gZIc=;
 b=dDlgRhEAEmR8onof5mikZy4RcJLQTmKKvMHx7VrJ9pvEScmgXxO32rIIwv0FMMImx4
 aO4CWe3/MedJW84CLKputNYTIU617D19KvkJod6NdF4uFhIAzjK4bmU/s4EmA05mDKGg
 okanp4eX7Xm8BZ6fW9RehMHK+CQdHzx4cFcH3ZAloes7nSQsZUbDI9QHglgepzmnwNuT
 7eT7Y4eBYApR3//KWG84kqX/DIGdyjF8kBBpqwVgo/Zbks033WTuzeQMcqPiPFjSKhYT
 f+orOcUtIWzrzzRrarqsMoYDYAuGk6DrUEOPYl0CCLakPpS57YC+D0pOZ4CuxRZb2XwS
 EAaQ==
X-Gm-Message-State: AO0yUKXMjoAFOc9RornrzUkdT4WG/3g77AScPTCMr3A41iiNMuSRIIyx
 ukzxMjg87cAKfkwg0NVmd1Fqcw==
X-Google-Smtp-Source: AK7set/EPIdJgoG+m1yulPq5lQFHZjMnEadUEwoZK4U5ZKMVEumcA/aDRQf9oAqMwosQHTnHhOxtvA==
X-Received: by 2002:a17:903:2348:b0:196:595b:2580 with SMTP id
 c8-20020a170903234800b00196595b2580mr14803429plh.0.1678127046428; 
 Mon, 06 Mar 2023 10:24:06 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170902cf4800b0019a96d3b456sm7058574plg.44.2023.03.06.10.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:24:05 -0800 (PST)
Message-ID: <89519b9f-6e0a-c380-c7c6-e8e615d11eb0@linaro.org>
Date: Mon, 6 Mar 2023 10:24:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] target/riscv: refactor Zicond support
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230306152303.281313-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306152303.281313-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 3/6/23 07:23, Philipp Tomsich wrote:
> After the original Zicond support was stuck/fell through the cracks on
> the mailing list at v3 (and a different implementation was merged in
> the meanwhile), we need to refactor Zicond to prepare it to be reused
> by XVentanaCondOps.
> 
> This commit lifts the common logic out into gen_czero and uses this
> via gen_logic and 2 helper functions (effectively partial closures).
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

For any multi-patch series, you should use a cover letter.
Lacking this causes the set to be missed by tooling.

> -static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
> +/* Emits "$rd = ($rs2 <cond> $zero) ? $zero : $rs1" */
> +static inline void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond cond)

Drop the inline markers and let the compiler choose.

> +static inline void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
> +static inline void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)

These especially, where we use their function pointer...

> +    return gen_logic(ctx, a, gen_czero_eqz);
> +    return gen_logic(ctx, a, gen_czero_nez);

here, so they will most definitely exist out-of-line.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

