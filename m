Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50EE69D06A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7ub-0003kr-Sp; Mon, 20 Feb 2023 10:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7uZ-0003Xk-AX
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:17:03 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7uX-0002bV-9y
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:17:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id l25so1174110wrb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WzcBr/MvJRW8+xOdQkcNWyqz6ZFwjEzpJSvH2pez51w=;
 b=DfQAdhzD4Biso1t6wq+Hn9UGBT1f8UzBRsyBNvPvO7MmHC814jernFENHinArB1JQp
 KtQcqJwwFmzrCjKNaAY4yMvQLBOV8jjQPbGDii2wxd/RH4suHcUOQQ1l5Tw/83Az0Dcv
 VHEPOGm8bVJ7gPfasqEj3BDmoOVaHihXleygWCrBn0TaICohDQvflU3xK5xh//WGhNkc
 aMGYUPWN9+IdgxjiMORn2fGJd0d8Gn6XGr6lpV14++1//XJh5EiYzxLqgdz04MYgLn2s
 J+M9FQnIXYWuqw79YH37zgyEXHGLfjpZc07qVYVsmFFyBouAAz8SpC6oOlt19e2xihxj
 ZEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WzcBr/MvJRW8+xOdQkcNWyqz6ZFwjEzpJSvH2pez51w=;
 b=ODXsklDiYRLB0IE2d9poNbCqkIuoVRNViHYdMBneFdzGjFpaUCwU2HG+mZ1Yy7GDd0
 1yyVQkkMcDVS5tYyqC9bHQnTqYjrVEy8miW3Q7Tuo3jVNVIJWp3IC86rpfIojhl+sn94
 chGsew5yqIseF5jBNdjjUXJKQgh10X7e7Fz6F///g3jrsPtL6sJPB4iel0qbuk0SN/qB
 PyzLOjZAFD502BL/ljVDChElGG3onkQ0078ztDhH9L7jI0WA4cb2A3AV9007kNGt8MZ0
 iGC+MGaiIyWSLnU+IpfyTslUtZDk07Dm1z3cub0EOlZmum04e6wZ4CXik/bq/n4G2kij
 nQmQ==
X-Gm-Message-State: AO0yUKXQrUp66XiI0vlzQ6AM6qn3qlfxgdSdHurElRUZtNjr5rE5bB42
 HVqj8WCynwXHQt2URHkKLo1RoA6UGjw2MtiManM=
X-Google-Smtp-Source: AK7set8625pLf5jAWPp8Ag0vBc6utLMooypByprklA8DERGLYQ4fmRT/o/VjOG/ri+PPtg1XF9NnVg==
X-Received: by 2002:a05:6000:2cf:b0:2c5:5313:9d19 with SMTP id
 o15-20020a05600002cf00b002c553139d19mr881364wry.26.1676906218581; 
 Mon, 20 Feb 2023 07:16:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a5d453b000000b002c577e2fc87sm3659404wra.15.2023.02.20.07.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 07:16:58 -0800 (PST)
Message-ID: <c3a0bb80-5057-0e6e-f804-056a6ec90cc2@linaro.org>
Date: Mon, 20 Feb 2023 16:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-5-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20230220111215.27471-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

On 2/20/23 12:12, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert(0) definition.
> 
> Change code to g_assert_not_reached() fix the warning.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/ppc/dfp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index cc024316d5..5967ea07a9 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
>           case 3: /* use FPSCR rounding mode */
>               return;
>           default:
> -            assert(0); /* cannot get here */
> +            g_assert_not_reached();
>           }
>       } else { /* r == 1 */
>           switch (rmc & 3) {
> @@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
>               rnd = DEC_ROUND_HALF_DOWN;
>               break;
>           default:
> -            assert(0); /* cannot get here */
> +            g_assert_not_reached();
>           }
>       }
>       decContextSetRounding(&dfp->context, rnd);

