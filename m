Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A169E5A6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:12:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWAy-0002cN-9P; Tue, 21 Feb 2023 12:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWAv-0002aZ-9T
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:11:34 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWAs-0005pW-Ha
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:11:33 -0500
Received: by mail-pf1-x42e.google.com with SMTP id b20so3606195pfo.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8SPKI5k/zbVYg1kJLvV1E1dVbiZFoL0Re4U1LDMZw8g=;
 b=j7uxMeyOyMQLXsSprFw9VpLQo4FGpiHRdioG+FlZxKSLy6cRFPjk+7z1O4dRPvGPk3
 SrR1ZkWjfxq6/H2Sde/MrZwU4OWTW9Ap5eztauINX1k3holJm3d+48abhVND6ioWwq3m
 WbN9NhIuC81LlwJrFpql4Y1wc2VcJDrdCoIdPGN93FO1N20PotaE2lv+30YnPMcWyVbL
 eZBpQxkGnKSi2PkfiQGZbrP2xKhGXpfR4gaNjKQd73SRPTq+cInQRy3KOkSiHE5z91T6
 GGxN1A5RRb1WZBLaqQlrGa3UyMocyQ/7YfzQcJYkq4m1oPurwLOQe7+RViOSL/mmfBP/
 lCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8SPKI5k/zbVYg1kJLvV1E1dVbiZFoL0Re4U1LDMZw8g=;
 b=XN7Rr3f4lbwYV6VQPmyGP97GgNFc4Ph7t13vr5y551VumpqAC5BxUKMGJ7rrJc6txW
 h0LOtY8neDwVFTQtS47TfyVI9uj0BYwh1P3OyHqxgbfMaL191a1XcMvSgFCHRWu25UH1
 yllDwRVzQtoktidR8xUwIZ736z0b8iBwdcJB3CISWXFwoJgxdx/f7DkXtUGYVIWZg2FH
 jWbQdUvnuVo9NLRiNA7JwS9ujUtrKo4lnJU41oLXJM3gvayxnsJIJouUkNKwysAegjME
 K6VYtkijffJ4Bwr5O2LuA5y8bYcLhDT3H4YyLm6RL+goiqQTs3++1fpGW30HbAvTLUCK
 qT3Q==
X-Gm-Message-State: AO0yUKV9oUOnPahWgRLaSgcV4kDD1lWlEt+kZBfLH/suwJCJUMkAwFQo
 3FM0jofQ8CPQliUTs0X7feNd6w==
X-Google-Smtp-Source: AK7set+LIOHuEg+ihEEwEAeVKKVNmmhr+D1PURdfgwWc16oDBb6o8jz9c4WBAfO2hTevaTov5YZB6g==
X-Received: by 2002:a62:52d7:0:b0:5a8:4bf8:1752 with SMTP id
 g206-20020a6252d7000000b005a84bf81752mr4591400pfb.32.1676999488748; 
 Tue, 21 Feb 2023 09:11:28 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s23-20020a62e717000000b005921c46cbadsm3691040pfh.99.2023.02.21.09.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 09:11:28 -0800 (PST)
Message-ID: <2d33dd76-0518-3461-199d-a6e94616aba0@linaro.org>
Date: Tue, 21 Feb 2023 07:11:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-3-richard.henderson@linaro.org>
 <CAFEAcA8yq_h953pLi+zJ0Ai52ErYyS28YkZP2Mq0L2ZWfEK3FQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8yq_h953pLi+zJ0Ai52ErYyS28YkZP2Mq0L2ZWfEK3FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 06:56, Peter Maydell wrote:
> On Tue, 21 Feb 2023 at 03:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> M-profile is not supported by arm_is_secure, so using it as
>> a replacement when bypassing get_phys_addr was incorrect.
> 
> That's pretty non-obvious. I think we should either
> make arm_is_secure() handle M-profile[*], or else have
> it assert if you try to call it for an M-profile CPU.
> 
> [*] i.e.
>    if (arm_feature(env, ARM_FEATURE_M)) {
>        return env->v7m.secure;
>    }
> at the top of the function.
> 
> If we do the latter we wouldn't need the revert in patch 1,
> right? Or do you think regime_is_secure() is a better
> choice of function here anyway?

You're absolutely right that it's surprising, as it surprised me.
I'll re-spin.

r~

