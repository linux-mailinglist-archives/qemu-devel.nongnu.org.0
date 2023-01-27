Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09DC67F10C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLX1u-0002eW-Ld; Fri, 27 Jan 2023 17:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLX1s-0002dL-Qz
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:17:04 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLX1r-0002rm-3b
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:17:04 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 203so2933826pfx.6
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40sBIB1RZqR/70Vok5LVj5wJxs2g2fLbQ/igRW/TGzo=;
 b=mxNvCGul6qheMswRnT3+jGCAmtg9CljfQFnYACZJ5FjxeJx2d18iVVOSF/mvA7/0cP
 O0JY2Fuuwud4FyM+wr/UXP0KufatOJ1qn0I7zzceCUVXW/lh0f6yprYA9UBzCJSS+XYW
 pWgeP2MYngy6wJxGZ6RfiHedKYTBEclfmx5wVkgzn6jBxb00WKiSdeDuR2wLVdyH3NU8
 kwIxMyxUJLZWdr6hrCQmYWwN6bxTiMWCcukA+ORMlJUtlEUNkZaLNaNMYpraLuI4YuGz
 AmEJnHSXIou4IhNEnVxpSbT3DjgNbZys/DGKBQa4EaQaeoAz6rHdRY38UXJ4M34Q79UA
 uT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40sBIB1RZqR/70Vok5LVj5wJxs2g2fLbQ/igRW/TGzo=;
 b=25JeAaF6vFwbfm+Jj8AbUohabAkuYDyNVm8+PXFtRL8G/mMRERud1SZMagLCy0aEsb
 bsLPKNfr2zVdQBARLKsoIM9JCU8wMlasjsth6sGZew/x95A7QidJA21mbtuH4fgcGQQr
 eK4W8UE6f8mZtbwBvSeIpXsPr5Jh1PAI6GXggROclAOEcH8Xa71EgiYRTiPwPsBWjwoY
 /SkCJqdese3vW0tidcMawOe0OVOgRobIxsVrOl7MECK3InWiClk/MGgdIyQszarOiMoy
 u9mozzEOTxjr+BFzVVu/PeIMIaXH+9gYVdATgfynnZm1g+fn5PlvtqWS83vZbG89fToR
 lQrg==
X-Gm-Message-State: AO0yUKXfGzGELH8x4S/Fy7K2uegT3QYtVFGGDblMKuE863fd9CirlPQT
 SC89G12HUCVow0VSCHql7NoxYw==
X-Google-Smtp-Source: AK7set9hlSAp9hQwJhaz1ucd4MLoTL/MSK0+lFrETZw9IoY1vXxidpHfqoRhEyuTm+1pmPUNfWlGlA==
X-Received: by 2002:a05:6a00:8cd:b0:591:3d20:3827 with SMTP id
 s13-20020a056a0008cd00b005913d203827mr10002978pfu.21.1674857821283; 
 Fri, 27 Jan 2023 14:17:01 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 26-20020aa7915a000000b0058d99337381sm3149997pfi.172.2023.01.27.14.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:17:00 -0800 (PST)
Message-ID: <991a4365-9301-62ff-f357-0b95e8bf4252@linaro.org>
Date: Fri, 27 Jan 2023 12:16:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 05/16] target/arm/kvm: Split kvm_arch_get/put_registers
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-6-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-6-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
> The confidential guest support in KVM limits the number of registers
> that we can read and write. Split the get/put_registers function to
> prepare for it.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   target/arm/kvm64.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)

Given the additional checks within write_list_to_cpustate and write_cpustate_to_list, I 
question whether this is the correct split.


r~

