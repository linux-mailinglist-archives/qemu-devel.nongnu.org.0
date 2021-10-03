Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC07420264
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:47:00 +0200 (CEST)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3hb-0002X7-87
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3dg-0007lO-Si
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:42:56 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3df-0002q3-EB
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:42:56 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 73so14133065qki.4
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4mrd9sx9SL5FfEhQRI2Gj3kmjz1HWrwhmueP+IS1rk4=;
 b=w3iBz6IvJPv1L8kS/1ex57Cdg19caU05OrSkeAPqJob+GJ3cYeYwUTndbrCf7Zal7p
 CdoIwA173i9n4zaf+MDh1jzK+Me8aeorqkf1C610XBjbTw/WstQDiNny41g4Q92Vj87P
 zzHx9JJZKQTesJ+zg+7lYWR40W52DktC07kFKgoLHwp7EuwtF6N1EhcJQI1vLGrUbm7r
 nkqr2MIx/lIlOWd1Q6XepuSm9pMRu38qfQuLzwlDXaWOGSw4UeFEGSlluS2Wyh0elBJO
 kO/pJRmyRil9veoQTl/6h6BeUuvKYAMX9C66IfYP6Vh+kbghBLxdx12zzPAzLdXc5oAh
 lXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4mrd9sx9SL5FfEhQRI2Gj3kmjz1HWrwhmueP+IS1rk4=;
 b=nXgjH8qz4dG92dGgH8fktkwCdOs5z4hffA6l8zkuDYRG+tdqdZa4wAdUXV3PsCxqsr
 VTcxASiJWSSTadRvwSDcIN+Ucq1ieF5gOCQxfkKE+gv3c0/tLBB2bL1i3MZOPujoc3qH
 4WpFs1HWPCt7Q1sv11kvFgBmXgcLHhAMYmLjjx7qn5LTcMSO4gYIOqGCn2N0W67JEQ0s
 jBMYOwO9AbMiFwvOSdZ/flmN76kuSovp3onUlJ8u8Sp+y0t1hJfNAOi5k7IAkRpPGFED
 xPo1r8E+L5U3cpxKNzCZHnhA4ZqfpuChUZK/mpIeBgrtb4Hf3EL8ej/XUd9K07pAsNCX
 hzKg==
X-Gm-Message-State: AOAM533bpltAmBDj5K0JvQmM2SdXLo81/Soi2TNvUCT+OyzrskR+2EiK
 0N4SBqyN8BQ5K9uVUh+rfhNBNg==
X-Google-Smtp-Source: ABdhPJwE/X9pIrU+AehSdUnKCkqMQGtSHfej10dPY6LoL2Z3hZUjKnPQKHSKeASK3vpVJ3MapfMGQA==
X-Received: by 2002:a05:620a:550:: with SMTP id
 o16mr6630250qko.146.1633275774453; 
 Sun, 03 Oct 2021 08:42:54 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l1sm7120637qti.94.2021.10.03.08.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:42:54 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/arm: Introduce store_cpu_field_constant()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf1c7cfa-6a0a-586c-58a2-8886402952a2@linaro.org>
Date: Sun, 3 Oct 2021 11:35:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003143901.3681356-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
> +static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
>   {
>       tcg_gen_st_i32(var, cpu_env, offset);
> -    tcg_temp_free_i32(var);
> +    if (is_temp) {
> +        tcg_temp_free_i32(var);
> +    }
>   }
>   
>   #define store_cpu_field(var, name) \
> -    store_cpu_offset(var, offsetof(CPUARMState, name))
> +    store_cpu_offset(var, offsetof(CPUARMState, name), true)
> +
> +#define store_cpu_field_constant(val, name) \
> +    store_cpu_offset(tcg_const_i32(val), offsetof(CPUARMState, name), false)
>   

You missed out on using tcg_constant_i32 in the end.

r~

