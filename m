Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763E67F41B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLbCI-0006vy-DG; Fri, 27 Jan 2023 21:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbCG-0006vQ-IE
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:44:04 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbCE-0008FQ-Vf
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:44:04 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso6389382pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QdpQD4Q97VZYC+RzRVpu3X4VUun2rCqUMAKulNsIpWE=;
 b=kvnggD8N1p7shmaGHTWjWHGwBmvkvsQlmDvbjJ2CRy7JBkF7vcyWnZ8XCG7nkLb7gC
 5L+qNJceGPwVWb6sKUVTTkg9NkzkdrlDEJ+v7a22sU2MC9gdhDYxdKXgcKXyYyylIZAl
 ddrUtLBIXO24OH151pR4BXHIAHyYLuPZIR6c1flKRNNmpF7WnVTGUTUYY8ZFV4GxjnaS
 mlLyO1/ZSTrElIdFpSf/GSXLry57aqzJsicSgSO01Kr6c9FCH2qcYCXHua5wUs5o9xtK
 0DJdpDfJub6ne3gNClhrjPS0RKGd0nBWwyAHJf08VQCzFy6Ds0LOJwU02WzajvnFhjC6
 WJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QdpQD4Q97VZYC+RzRVpu3X4VUun2rCqUMAKulNsIpWE=;
 b=waZAbWO+kyaG4RKii6MMorrCOcedodJEWZF4rg60ptwnxMcxRLMcMzVhbzsz9u2MQQ
 fmwjHsmuwG7v0noL54oPqrE9S5MrOsc/GfkrGevWN69J4agoyTmtS2BefM9GUYSPs2rM
 SyBDRiaOTWOLJuWKvixvxIaTfAJlcIHVWc8VylKhsfnTZ8YYaLGHZVy97JpsM50w10pT
 r3CQHwM6/KdlIBg0ElR6JqmjxnoyEYTKhEjx18v36J9Zp4yQ1ChPco3WLKvESc2O75zB
 Mp4iHYSKXtmpMfl4M+OxDkBrVGlh79LmdwSHAiH6l1BXtI+124tQdy+Bzylk8frs+YO9
 wFhw==
X-Gm-Message-State: AFqh2kpTfnvD1Z3mgxxpzQcQXaEcYb5BIFyHbV6YCQwfRIBAtO4kwOXJ
 Qem9KLkYvYQm2cF77vks3KFgs63P1SGCI9Z/
X-Google-Smtp-Source: AMrXdXvED+rqBzKePaV0qaLXzB6bLCiycoBiTXVgaevAGTlRISz4KPNRZnqx47w27pXCqdDKpvdR9w==
X-Received: by 2002:a17:90b:3b45:b0:22b:b6c5:fa7e with SMTP id
 ot5-20020a17090b3b4500b0022bb6c5fa7emr29439664pjb.35.1674873841438; 
 Fri, 27 Jan 2023 18:44:01 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a6-20020a17090a688600b00223ed94759csm5728909pjd.39.2023.01.27.18.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:44:00 -0800 (PST)
Message-ID: <26972e02-502a-3436-8b96-0c212e1551f9@linaro.org>
Date: Fri, 27 Jan 2023 16:43:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/23] target/arm: Mark up sysregs for HFGRTR bits 24..35
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HFGRTR/HFGWTR bits 24..35.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 12 ++++++++++++
>   target/arm/helper.c | 14 ++++++++++++++
>   2 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

