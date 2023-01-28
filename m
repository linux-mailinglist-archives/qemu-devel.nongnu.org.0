Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B867F3DC
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 02:52:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLaNM-0003nM-93; Fri, 27 Jan 2023 20:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLaNK-0003n1-N1
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:51:26 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLaNJ-0006p1-5Y
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:51:26 -0500
Received: by mail-pj1-x1029.google.com with SMTP id j5so6263608pjn.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 17:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EMhTZ8Rk/lhQ93KagCmhtpH5/JtMkaItcaqMGxK6nNQ=;
 b=bt5xm0mRQxJG3m7A1JOVt1cqH/wE1GqWzCarl1RtL5MsjGCSATkEX53HDb0rRxhoKP
 6uwCrGAeP2+FiR4zoH39KwLGuatPCsir1qseHjmULPTzI22V7x+jYXzGK7Kj7jCBv5BC
 V9HVhHBa5sRhyhHsdNlxxWh2D3GtFA6DZeaThhrrOJwwFGbWrIQA2CW4keC8qrmMtkoW
 gLP7SiiynuQZOYgpu7ZCywGqyoXnlLh0pG5K89zj2SR9l5JD4INglPp8Hb6cnW7kKefC
 fWhL7z1oAk3+WFJmZGDUUKUrWPCZyXGgM6+NPODyFidPq21OKQ+aIUYudg9Q7zPKnnQm
 sh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMhTZ8Rk/lhQ93KagCmhtpH5/JtMkaItcaqMGxK6nNQ=;
 b=78irQtQ/V1HxuC+saf6KyPz4S1HCsAFZrN5FwT9fDkmp+osSwk2NR34QjRIiaujSLF
 ARH2hjO0Jl9KvcA1c8SYlbdq6D4tsdiOR+L/a2FtB6oCSEpsATYdd6KDAn0DsPGxNNs6
 si1KYYkPp2YzK8GTT/12DEwB9uykbJOiOp9vQzjSp5HUNiSFVHHj/hpFGSoWREbPw+Hu
 ayBaifanafYHVACD9eYCsxidf36LhKzZiCmQY86qKjmNxeefOXD0QCLm4bIFhEeJ9iYw
 RTZ4jm0hO6A7n0YYSQvCSeLMY0xriCirlDdHLZ/xJdlgVmpE8sZgsF6poKgzppt/73MW
 lbJQ==
X-Gm-Message-State: AO0yUKVa6veBSnXVzbiFbcrYwK3dbIDRPF5QkKXZQkW5PtJ652aSpeW6
 RdGSQ6i6a4Yw48CR4VHiaOqW4f0VbxYUlO4A
X-Google-Smtp-Source: AK7set9An+zTDIhj2lM6NvM7ho10gwQ83H12Y4b1tTbkO0eYtrLD1tNrrPU8v0xNbDCNZOdUeSbtVA==
X-Received: by 2002:a17:903:2290:b0:196:5cb8:60e6 with SMTP id
 b16-20020a170903229000b001965cb860e6mr3565574plh.45.1674870683751; 
 Fri, 27 Jan 2023 17:51:23 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b00188fc6766d6sm3458239plg.219.2023.01.27.17.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:51:23 -0800 (PST)
Message-ID: <5b1afe34-9906-4693-7181-722b5a247997@linaro.org>
Date: Fri, 27 Jan 2023 15:51:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 07/23] target/arm: Disable HSTR_EL2 traps if EL2 is not
 enabled
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 07:54, Peter Maydell wrote:
> The HSTR_EL2 register is not supposed to have an effect unless EL2 is
> enabled in the current security state.  We weren't checking for this,
> which meant that if the guest set up the HSTR_EL2 register we would
> incorrectly trap even for accesses from Secure EL0 and EL1.
> 
> Add the missing checks. (Other places where we look at HSTR_EL2
> for the not-in-v8A bits TTEE and TJDBX are already checking that
> we are in NS EL0 or EL1, so there we alredy know EL2 is enabled.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c    | 2 +-
>   target/arm/op_helper.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6f6772d8e04..66966869218 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11716,7 +11716,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>           DP_TBFLAG_A32(flags, VFPEN, 1);
>       }
>   
> -    if (el < 2 && env->cp15.hstr_el2 &&
> +    if (el < 2 && env->cp15.hstr_el2 && arm_is_el2_enabled(env) &&
>           (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

