Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1965F670
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYPo-0004jY-ND; Thu, 05 Jan 2023 17:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYPl-0004iL-BS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:08:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYPj-0005jZ-K6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:08:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so2398851wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9t5GIb/uAT6DeRVBdVuPmoPlMcQNT9m6UL4kA8OBXH8=;
 b=m5au+OzOxoaDNTIaTUk7z1yuxBNFrYNuak7mUI0S3L/77jgO/tetZ3+YsENeG6qFgX
 jQcVeM9n+D5kBa+ZOWoYeX9QGR1yZDmccEVT4s7zNAktvM/jNruU/cb4x1IgHGPXFHCq
 W/t+qGjEDMeJC9dMwMzsbj2/WX6CXG/1r0XrvbZat9kLgJhAdYrb7fQeyvYUUsPP8WbO
 Rt9sbugsAThX+vRjhhLm2P/PV8oaMnrc4dhkwU5KkqZLXW5iENsjvJxGQFI1FOR0bOCo
 zG718icMkdHpC8Ayijfxa2lP4msPESZ2dHXpqTlTJQkuFTb5M4NK0pMolTO8QADnZc5q
 rL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9t5GIb/uAT6DeRVBdVuPmoPlMcQNT9m6UL4kA8OBXH8=;
 b=kHbKSiPqTB+yawXE/QGy2TSPlbAhcx3UGql3jgbSY3BrvFhctggGQqMIQfrulT9pI/
 0trW5Bxg+VO8py+nZR9zSdi+9w1H/6eCOHJsUBH8Ju454l5/XsNxV0eFpb4nPD7xCkU/
 3LbSNDRqV5pb+IA47GxTMsZMD0RVRfm/gnn3eMdhnvFG6j9X18dNz/TV+S6TC1ibwLwB
 I/IbH42ssRu+qyQjYTFei2GsX8FVtRsHyO2XiMqHHfi6DWQ3J0bjEyBPM4yitRu41syq
 23Pn/iCawjWsZ7Y8XxVe8uUSt9AWVfnoBzbel7e2G5yICesL/HFSXwafjiNrgX9Z0xfg
 U4mA==
X-Gm-Message-State: AFqh2kp2cCo7Un1cbbENfKMh7PasoOlvyUuM6wJTeUxKOrCAxYYwafz8
 JF0M7QLG6MPu0LSfCOsRbq/rpw==
X-Google-Smtp-Source: AMrXdXs5D0V82Z1fkkfDiH6Fx51WEuncjS9ruYUhMS+nsHgW92w+ILEG8k36xNkAAuYloMRMOAMOEA==
X-Received: by 2002:a05:600c:a56:b0:3cf:894d:1d06 with SMTP id
 c22-20020a05600c0a5600b003cf894d1d06mr37490852wmq.30.1672956513389; 
 Thu, 05 Jan 2023 14:08:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003c6f1732f65sm4288676wmq.38.2023.01.05.14.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:08:32 -0800 (PST)
Message-ID: <81600a17-d082-d6da-5fac-04dd41824755@linaro.org>
Date: Thu, 5 Jan 2023 23:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 21/40] target/arm: Remove aarch64 check from
 aarch64_host_object_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> Since kvm32 was removed

Maybe add here:

   (see commit 82bf7ae84c: "target/arm: Remove KVM support for 32-bit
   Arm hosts")

> , all kvm hosts support aarch64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu64.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 28b5a07244..668e979a24 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1095,10 +1095,8 @@ static void aarch64_host_object_init(Object *obj)
>   #if defined(CONFIG_KVM)
>       ARMCPU *cpu = ARM_CPU(obj);
>       kvm_arm_set_cpu_features_from_host(cpu);
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {

Worth asserting this feature is enabled? I don't think so, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> -        aarch64_add_sve_properties(obj);
> -        aarch64_add_pauth_properties(obj);
> -    }
> +    aarch64_add_sve_properties(obj);
> +    aarch64_add_pauth_properties(obj);
>   #elif defined(CONFIG_HVF)
>       ARMCPU *cpu = ARM_CPU(obj);
>       hvf_arm_set_cpu_features_from_host(cpu);


