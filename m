Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C32438647
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 03:58:55 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meSmk-0005ww-QN
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 21:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meSm0-0005HA-8i
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:58:08 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meSly-0001YO-Ah
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:58:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so8642905pjl.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UKajSTFOZ5e5UYMq5r3pMub9+myGD0R5aMhW2lZJe38=;
 b=P/lQyC36AyLTp/0O9t8S86nzHgb9rwzx77ylNwtgcp2EMGRjcNPuchCd8Zn6y3pc2C
 dg44vNti//vRVg57yx/mTtfM1XTGdNLk4b0RIrk7zYPacb2RhWyBDK8ccFjjFsDXiES8
 NN1wJkpePl3rxuUwz871mk0p+0KM2L2nZ2LJwbf6jZWmD3lBn+jbOXy5OUCxgVtTHX3B
 nuWWlvZvFRmOJK9bvVjqCQuxmmE64bJmCsC9H2bSFZsJAxCHzDMo6pjbvBkQJ86d36Rb
 y7SbIyBwH7bbQIFrAo4vTIAK1ppTWJ3zh6//xsf2R4LXlS+DNCAioH/uMGBKyDul+i7x
 7dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UKajSTFOZ5e5UYMq5r3pMub9+myGD0R5aMhW2lZJe38=;
 b=GdEt3Ehr+bPFbFzoMSv2flOwda/0+GkMw+NjHfRJMyBuBi6iTFK9MazsfthKwKvOoL
 FCNK2Iyv+LaCgbPW6fh7z0VdcVPiiO9qSzG20uC5ZB186pLMDg/72ipyL5jW6c/kdlx0
 Rr7D8Q5/mJyUo1+yPut6sSr6VWeS1NUoxJNwXqACEAnXLY+0GQ5bQyfoWG1dDyocP/Zn
 1GthTuXjjbjMYSQNL6eW+Oo3C1NGwgaG8UAmnKr2EVjNGgooC9R8gBzA/oxjVbBkCHTY
 zczoa/Sj6R3EHPYpb/mzBYCtdVrpEng3sgn6Sp8hyFjHgwoylAlkmVTui8zMhqtWy1Jt
 od/g==
X-Gm-Message-State: AOAM532xgCa5hwVwkvocFzzUz+swHzJcoAwEjHP5u0ssCb8TdOmqHDHd
 9SjO/eEnYzj/2xhX0Cywnu2cPA==
X-Google-Smtp-Source: ABdhPJxqewXzIjk0B7d2KzNIwP47eP+pNJudUM8h9hbKvCA7eY/qSmBB0TH8Kn8KvlOAHkN+GNMwAw==
X-Received: by 2002:a17:90b:33c6:: with SMTP id
 lk6mr25501463pjb.42.1635040685050; 
 Sat, 23 Oct 2021 18:58:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c24sm13712907pgj.63.2021.10.23.18.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 18:58:04 -0700 (PDT)
Subject: Re: [PATCH 09/33] target/mips: Introduce generic TRANS_CHECK() for
 decodetree helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53bf031d-0bfc-68e2-c2eb-570f621839a2@linaro.org>
Date: Sat, 23 Oct 2021 18:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Similar to the TRANS() macro introduced in commit fb3164e412d,
> introduce TRANS_CHECK() which takes a boolean expression as
> argument.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
> index 6111493651f..3ef09cc50c9 100644
> --- a/target/mips/tcg/translate.h
> +++ b/target/mips/tcg/translate.h
> @@ -224,6 +224,15 @@ bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
>       static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
>       { return FUNC(ctx, a, __VA_ARGS__); }
>   
> +#define TRANS_CHECK(NAME, CHECK_EXPR, FUNC, ...) \
> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
> +    { \
> +        if (!(CHECK_EXPR)) { \
> +            return false; \
> +        } \
> +        return FUNC(ctx, a, __VA_ARGS__); \
> +    }

So... if you're going to do this generically, you may want to adjust check_msa_access. 
OTOH, perhaps all you want is a more local TRANS_MSA, with the CHECK_EXPR built in.


r~

