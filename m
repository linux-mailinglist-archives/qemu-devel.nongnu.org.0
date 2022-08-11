Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452E590615
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:46:10 +0200 (CEST)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCG0-00021q-Sh
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCBO-0004nP-SJ
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:41:23 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCBM-0004hf-NY
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:41:22 -0400
Received: by mail-pf1-x42d.google.com with SMTP id u133so17052387pfc.10
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SaQMuBXfEOyNnbG7/Q1+A/2uIPSOOD1EHOFoKJDwMXA=;
 b=GLIXhl37IkHLn1t+f+gY0rYyS6uDDKmTwd+kPTA+S0QUIkf1K0eyg1ck6phHUBm0Gz
 KeveK/pF7z+Ody8pwoMaXOR/SGUihu+wpnDx1HwNcFBiOWcrgp6jGMKNVR4Eh3yYbG68
 ygLwY9FOsORkgS5wUpuWNeGHs6EFiEB1VZXLCt4JdgD2QBTUYZLOLJFh/7DrOJRovpQ8
 svJ1fonGEA7JU2zgbRBja/GrfGvBSV22ARiHIxgJC27IDZVm0NyDyIH7DLQ5LihV9y4k
 LVZuj+kQfUjKXv9vOlluN4vzzpCwxdUnj8yaE6k8JsrjhI54DluZHkRYvfseTgXn+d9b
 Cl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SaQMuBXfEOyNnbG7/Q1+A/2uIPSOOD1EHOFoKJDwMXA=;
 b=YkS7zz0r/6FDT8WzRd7Vk3i5yeQ2bPzv4cz042pfwNfmlLBBw4gcnk7wzSbtqNyiwr
 iQ07gtRsBDi5hDhDdqV5oqC6UERyvUqaK3KDudFTVqvVzj/rcAGznldAcXWo0SbGy5+T
 68GAgJv9lWSWiduSavqZbvugazxFGT9vAhvhRvCX+YlvRyueO76fWSmIee58cdFsg8pC
 iLUb8Zhb9CiF1SeT2DcYE1gyUh7ObEbTwSK4u3KB2mq8Gxuv4gJL+uhilBXw7xVToD5v
 uaN6yN6kZXEOzGeJZTkUovxSTLh7HvIlouspZ11JYTx6mYyZjZuDKHaf/yPNpfk1jMvm
 djEg==
X-Gm-Message-State: ACgBeo119iuoLIoThzFJ9v0BT7h6HaoL5FIoJj4mJyS71MQkVqG0wExR
 X9waAe3eX2ua+JRARH0ejiFerg==
X-Google-Smtp-Source: AA6agR4A4g/wBmlvMmzl6KyI7t61lCp6xwlTj5fmia0JyQd3M/GSW4XqSV9bKOERz/C79Z3GNMDmzQ==
X-Received: by 2002:a63:4b1b:0:b0:41d:548f:8e29 with SMTP id
 y27-20020a634b1b000000b0041d548f8e29mr135636pga.77.1660239678310; 
 Thu, 11 Aug 2022 10:41:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b0016bfbd99f64sm15402794plh.118.2022.08.11.10.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:41:17 -0700 (PDT)
Message-ID: <12988a80-ff95-cb09-dd1d-a8745aa00885@linaro.org>
Date: Thu, 11 Aug 2022 10:41:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/10] target/arm: Don't corrupt high half of PMOVSR when
 cycle counter overflows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 10:16, Peter Maydell wrote:
> When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
> to indicate this. However a missing ULL suffix means that we end up
> setting all of bits 63-31. Fix the bug.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d7bc467a2a5..87c89748954 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
>           uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
>                                    1ull << 63 : 1ull << 31;
>           if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
> -            env->cp15.c9_pmovsr |= (1 << 31);
> +            env->cp15.c9_pmovsr |= (1ULL << 31);
>               pmu_update_irq(env);
>           }
>   
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

