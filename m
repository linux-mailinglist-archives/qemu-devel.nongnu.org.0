Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8467F1FE
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXmD-0000ed-Vl; Fri, 27 Jan 2023 18:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXm1-0000e3-Dv
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:04:46 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXly-0004Q4-RX
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:04:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id v23so6473553plo.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZPFJmW5XKyYOOk/UPaUouBU5VqYMgswETW4k1N1Fo44=;
 b=WLuHieCsxiLAEihq+pZyIYsEHRhaTq0kmA3e78ml7wofI4FikhYO3o6wkquBsFKSsI
 5TgSKM1YCU866QUzbe/eWCU/E+sHaR4gBFX7EUSTNzttNkEgTcOt3wqnjz5vlXZWca99
 t9n7On7IFXcdyOwuOEr+eTrOdVHNpDVNEuVFkYPg605IlD/j88wjdtNX+RIQhtd5IWO1
 6M+Ap27mnUq7rWGAutDtPQdmA7THSyd5kXvWHOgnOpqRRQRJXFOeSVOjwDPhmI1Dbdx5
 SC19i6RIZyVIVc6kaj0SnUKlw/R7ZYP333Z1Mcpl4jO6VyF6SS2AvhsPGY/8OfWhTP2D
 DQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPFJmW5XKyYOOk/UPaUouBU5VqYMgswETW4k1N1Fo44=;
 b=mWVgeg9DtZzTL2X+N6oT+pDNO9bBtZy9C+JaW9UT8kdeCh2gzMhNh9M2GYC5LSSHiQ
 A7cDbEK0Ve0aJXiBy4Y2rNpBSEKj1VMWZX8byyNwoJLUYdngK4HztuLj3eGknKL9vu1X
 R9Mlp5xK7rt370xuYyv5Mwo8Aie/irxZr1MWs2q66OabEQMLZ5wf0bgqVOmtFALx7WEx
 ruO1ecYIMwUmTDfnFUxfvX+iLpSdJJX/KTuKNx3KPI9NzbxFq0Jjp1soMpMzTJn/zl1U
 htxuntOBDqGWm6vqPwT0W+NeyvTQDhRm2CtSwnJ6OlJRK103PJMDjjJ8ofr3LyRtZPcU
 Atiw==
X-Gm-Message-State: AO0yUKXB/qRVPNipAWoLtxcUzB1UracDPoaOg8vS4+sO50QgyPPNC0a2
 7O4OpF6iXDQFZ0fpWLnjsJwMmA==
X-Google-Smtp-Source: AK7set8iUQqqGQKNu7EsalBJe6XeaIhWCgz7v1VNbqI3WMDsYazRsl1RXCtwVy9TfB/ga6Xo60C3wg==
X-Received: by 2002:a17:90a:1dd:b0:22b:eedb:649a with SMTP id
 29-20020a17090a01dd00b0022beedb649amr16287452pjd.20.1674860681277; 
 Fri, 27 Jan 2023 15:04:41 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a4ecb00b00229f68ba7fbsm5541004pjl.19.2023.01.27.15.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:04:40 -0800 (PST)
Message-ID: <45e099d2-1418-6002-f6d3-a11275e6f14d@linaro.org>
Date: Fri, 27 Jan 2023 13:04:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-7-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -118,6 +118,16 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
>       return 0;
>   }
>   
> +int kvm_arm_rme_vcpu_init(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (kvm_arm_rme_enabled()) {
> +        cpu->kvm_rme = true;
> +    }
> +    return 0;
> +}

So... harking back to patch 3, how may times are we going to query the cast of 
machine->cgs to TYPE_RME_GUEST before we save this value?


r~

