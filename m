Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC59655B4A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 22:18:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9BuQ-0002Tl-2Y; Sat, 24 Dec 2022 16:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9BuM-0002TO-5i
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 16:18:18 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9BuK-0005ye-CH
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 16:18:17 -0500
Received: by mail-pj1-x1030.google.com with SMTP id o2so2272050pjh.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 13:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=44dNsAiSuH9Q731m5KiRIIPk40ouxxitpXaUjjAiAUM=;
 b=F4PAWIXBS9pqu+hH1sZWC7CavMy77SNCVfMgCyHGNdGPRFBqFua9kwh2g5iocwziSb
 GPE/KUI/Qg510Luy5BjCpDKJSmANw3I4MGc8/17IKxmm39ywf1fNBqE57DRDTUeNG9jw
 o8J1XzGy7+4WJMfVZGnucQwtZV8DN2L8//tvyLwNGdM+mUymDWEXyjA1h5aAs/QUm1x8
 TDYUgWHb+PFWBYsA7/u2qPHiqQvjWf/drjuQZV3sjH3p+TB1+BzLDBMyeiG+ASHKisBa
 pBOBUV539R84LhhjlH7y1aK0gwqjEvB+aGw8K8ypbqEla3tBLnlSl0Nev/FgD7Xb000J
 l8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=44dNsAiSuH9Q731m5KiRIIPk40ouxxitpXaUjjAiAUM=;
 b=2dir0dBRzdBDnOyoQHOrs7kAeT0+ImxGOLLifvER6wp/JQbhuJn2gn/xxKWTJam419
 H2K3Akm6Rd8f1q12Ai1vXjGgl5eOpmzpXPRb7ptFOe/CE4RyfhIIL85i9zZPtdZ9bBhv
 UzuqVW4Q0bf4qz8sCvCn81Y792vcALSAgiimpKGo3gXWT1bm/zLjYn3ihjGnAUGf9Gu9
 IzNHVlygZT1lERb2o6czD8GTRzrRnUmVILwMAaI4T6kCnIbBC8LDUPAaRBtBFgM+yyFZ
 uMZscUgzASIpJlcussUzuKdXO1X637aN32cI7cMNaSX61UpyEKt1FXZ2NQ6eimoeR4BN
 Es0Q==
X-Gm-Message-State: AFqh2kroSW26SyM+F0iM1p77AN99s8IesNpv/hGmeDZOXtmPUr6amsct
 9rttf7imJ7rQvVieb2tNF6S/Xg==
X-Google-Smtp-Source: AMrXdXvFWE7VsFFGnHJn4hmYlfVzNrJdyx+QeQPxjZlt+0WkGvHGh+dpVr46dBeB1crBgZGMITsILA==
X-Received: by 2002:a05:6a20:c113:b0:aa:1db4:d31 with SMTP id
 bh19-20020a056a20c11300b000aa1db40d31mr15654977pzb.54.1671916694499; 
 Sat, 24 Dec 2022 13:18:14 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a62790b000000b00580a0bb411fsm3162635pfc.174.2022.12.24.13.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 13:18:13 -0800 (PST)
Message-ID: <0230980f-9f64-5bbd-3186-ca5f86c368f9@linaro.org>
Date: Sat, 24 Dec 2022 13:18:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 43/43] target/loongarch: Implement vldi
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-44-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-44-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +static bool trans_vldi(DisasContext *ctx, arg_vldi *a)
> +{
> +    TCGv_i32 twd = tcg_constant_i32(a->vd);
> +    TCGv_i32 tui = tcg_constant_i32(a->imm);
> +
> +    CHECK_SXE;
> +    gen_helper_vldi(cpu_env, twd, tui);
> +    return true;
> +}
> +

The constant should be expanded during translate, and use tcg_gen_gvec_dupi.


r~

