Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477B59061E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:55:54 +0200 (CEST)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCPR-00075d-EI
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCC9-0005TW-Gz
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:42:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCC7-0004me-Pq
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:42:09 -0400
Received: by mail-pg1-x52a.google.com with SMTP id c24so12852445pgg.11
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4Qpm+Xv45I8XtRvHofzSvfjkYBnx/KYa7+CNEfmDsXU=;
 b=R02qBr5zvBHW5Xb3v6f2GCd6f06jYI93CVyhNDjNBkGD9J6PfyKpEMlXg0A15h1y26
 5TQjq5Jx1zdfTMcdZWH86gbWPyrVteqSfFXDo+9Da+V3srJjJQ93TpJRk/j66Y7elZC9
 68Jiu4XySC864p9VKF6e5kOhnMZeSa5RABKQ+cHpY/ILdXKIgvtXaWNF4jgfXD2WonEm
 c6yVcP+CViLUZWKzhcsGnu62nk07f8BN9H2sKs3KCBVhzITYkD7Demm8vjO2o2/mgd10
 ZVVY+i93LQFHS6Xp6HGMkH49U3bapI6Dn/lElAM8lbVhnbHOXZ2mjMTpO1wXgW09tXEN
 80aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4Qpm+Xv45I8XtRvHofzSvfjkYBnx/KYa7+CNEfmDsXU=;
 b=kYE9478s5xNEbpJ1RO/VRMNi/nrvYzCsXCajV4BeKS0qC3FIEEbDu3v51SeORMQ0uC
 0p2DOSTqjmqQwOYXbk7OS//AgjH/3dacid5KUc0owXXiW3xGZMX6qHfHIwULy5jOY89h
 ivkp03NzFtuXphBDQVLhHFB7B4reIMXDpj9i+3HhhkLa0i9JTikEdUtu+BeynJhyaWJf
 Ij3PO10kfiFQsXe4hKrwXxJvlhVJG8LdkkkMhRyge52BKQK76Rqlf/S2TZttzh9+j9Rg
 OOwVQFbLCHvOZFAVqx2zDh73dGirBgQVE5ed+PIV8D/Js5KpdTxaE2+dJQApiStV6YKo
 Zk0Q==
X-Gm-Message-State: ACgBeo2sM4w1/Nt5u4IGffGSANnqs8VBiuFxn6QvF4rqFCmD37IkYtu6
 qzAJX297mwCkxb4Rdpujo5pl09t9wkoTcg==
X-Google-Smtp-Source: AA6agR4c3ttL8YaJCwRw7ZNTDmxSibK3fTViTVkX6+3ommHrUvpG6RBTmtA5s1iBVIscKHVdZAw4DQ==
X-Received: by 2002:a63:1502:0:b0:411:4cc0:3ec1 with SMTP id
 v2-20020a631502000000b004114cc03ec1mr131985pgl.91.1660239726030; 
 Thu, 11 Aug 2022 10:42:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 e18-20020aa798d2000000b0053253b63e21sm130451pfm.3.2022.08.11.10.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:42:05 -0700 (PDT)
Message-ID: <764c037f-0573-58a8-cc45-be9826f12f67@linaro.org>
Date: Thu, 11 Aug 2022 10:42:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/10] target/arm: Correct value returned by
 pmu_counter_mask()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
> pmu_counter_mask() accidentally returns a value with bits [63:32]
> set, because the expression it returns is evaluated as a signed value
> that gets sign-extended to 64 bits.  Force the whole expression to be
> evaluated with 64-bit arithmetic with ULL suffixes.
> 
> The main effect of this bug was that a guest could write to the bits
> in the high half of registers like PMCNTENSET_EL0 that are supposed
> to be RES0.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index b8fefdff675..83526166de0 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1296,7 +1296,7 @@ static inline uint32_t pmu_num_counters(CPUARMState *env)
>   /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
>   static inline uint64_t pmu_counter_mask(CPUARMState *env)
>   {
> -  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
> +  return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
>   }
>   
>   #ifdef TARGET_AARCH64
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

