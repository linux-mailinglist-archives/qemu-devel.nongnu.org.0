Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C83F7625
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:42:40 +0200 (CEST)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItAo-0004re-Lw
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIt8Q-00025J-MX
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:40:06 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIt8O-0007gE-Gy
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:40:06 -0400
Received: by mail-pf1-x432.google.com with SMTP id v123so6583547pfb.11
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tq9zQ5gfOX3UwNL8ZjTXFueZuj6573W9zulCC9Yb6vs=;
 b=C0W1N21KepCZ0Ue360kGJ4yB1HYf3KZyA5QUF4ef42K9aTxv2SpkPN9TU+NI67hZ+N
 QKkmSDOoZ1V6JMdwg2AR2J1whs1qPhJdtBZMJk5GbLGLxNHUR6fkyYU+6rq3JRX8atS6
 HtYAK7+PphTM9D9gJ7f5UqjxjZg4Mu1gxny6v1tx653lhjwv1WBlRW0vQ4M1KWxkkpUU
 81uK5I3bupMYuHxcHoFNFj6t3R6YhjteZbwTWK7/5Mm2paVEmZ7kgff+CkFFuwnKKPHi
 Een0LrvcEnDtXtvlOoK5+soB59wEU8pcHPmfVa2cX4kkrik0lsuBb0wMHGMGTABRoQgD
 HuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tq9zQ5gfOX3UwNL8ZjTXFueZuj6573W9zulCC9Yb6vs=;
 b=fl8udBzmP1UlatkBU3I3pKhNql+UKS7R23LwuTXqWF7iR+P76GNQpaCtepoqZ/IWUJ
 qRBKyim2IwMg7l520tz1tVDRQXwkstowGr+Gz3XwGbuidWjLt4JVgXCTEFXIrnHqfr2a
 +cIzRHbQ/tFoEbgbaMZqqs6P/0qPI2kb6gfG6lNQ2X7xJfYCnCEUWINlUDDZPui135sr
 qwfJy4sxcxDJ4oXBjp/6JLaefolWPx8bQqjJV96hvuaY3kCSzp94m4HfG0uy3NQdhzRT
 5jn7WAGZsJ9lSD+Hz4lOdsc6q/SFriCQQbjo1ilJcyxfK26utII3goXyuMYlU88W3c36
 crCQ==
X-Gm-Message-State: AOAM532Jtc1z5dCQW5ExesQOYnpXoXr1KUrMP4xstWtggTS7tiv4FEKS
 SvfkFxKv88qLcPSZluLaIkZI4g==
X-Google-Smtp-Source: ABdhPJwYHSRgdjnOFUbaECNRhDm35u+XVmyZXws8yYIPWZ/VFracCTyEO3VJNmVEmgQ+Qo/RV833zQ==
X-Received: by 2002:a63:af12:: with SMTP id w18mr8198226pge.221.1629898801809; 
 Wed, 25 Aug 2021 06:40:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x40sm21548363pfh.145.2021.08.25.06.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:40:01 -0700 (PDT)
Subject: Re: [PATCH v5 07/14] target/riscv: Add instructions of the
 Zbc-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
 <20210823184248.2209614-8-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c3e8e3a-62b4-532f-0682-52deb58ec0b9@linaro.org>
Date: Wed, 25 Aug 2021 06:39:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823184248.2209614-8-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.24,
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

On 8/23/21 11:42 AM, Philipp Tomsich wrote:
> +static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +    return gen_arith(ctx, a, gen_helper_clmul);
> +}
> +
> +
> +static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +    return gen_arith(ctx, a, gen_clmulh);
> +}
> +
> +static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +    return gen_arith(ctx, a, gen_helper_clmulr);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fc22ae82d0..32a067dcd2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -739,6 +739,12 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
>       tcg_gen_add_tl(ret, arg1, arg2);
>   }
>   
> +static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
> +{
> +     gen_helper_clmulr(dst, src1, src2);
> +     tcg_gen_shri_tl(dst, dst, 1);
> +}
> +

Put this immediately before its use in trans_rvb.c.inc.  I have patches to clean up the 
rest of the instances that still remain in translate.c.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

