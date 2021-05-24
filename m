Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE038F279
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:47:46 +0200 (CEST)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEg5-0005EB-Nf
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llE14-0002g4-Pn
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llE12-00048a-Vs
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso269943pjx.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=V8iU3nwqiRYYRLGBcsH/TBALO9S/lMXV/2JXfI1uIuU=;
 b=GnHPBoOuDvy1sgHfKAQ8WWu+ndvyC0sMi9WUFPxFnC1zaLqg7EjCsUkqrWjLhi7xgh
 THvpGGxMfTjrgdTAl/LrwrHF8y6CwXps8hwVqnN+oSLA34kHF3cK5qcD+SS2y0eI+SK+
 H2aXilLBfqSNGbZudirLr6zX8rBYTdtSLXGMo+qkz3NzwdIg2gbHLAsUgfkijv1z3U1r
 q78atvVORm5S98at3SAayhk0fvWVz8nvsag9yWivyP9R84wE65vRAwoecFy/I/VGniOC
 GDqTyl2K6Abh7dbP9UlBeg4+icMV7K3SwY/GCOfiUVowtuYKsxXNzUVR5UWXKpYsRSB8
 JE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V8iU3nwqiRYYRLGBcsH/TBALO9S/lMXV/2JXfI1uIuU=;
 b=cRh6SiEEZtj6U8betVKLgEuvMaRCL0P12NTj/NxRNxMiwkNSbVWz3LMKlwa68PVQM9
 cOoQo+hsGZX7XeOJHN2YQoko/xB0OZ9tnrJAeqCOx3tdHr1XoC0XfPts0fYwEY1D89TB
 sG3tmJQ998YXt3XJqsWVFPM5Ywl7OFOnd6Oo+o/0gMFT6UQSPt/nVhNFRj/HwdFqHDWa
 2RssV7/46i64ORUvke5bdje9+BoN8IPEZDLiNwmI4845OII6VfYN3vQLyGNgDQdHks2d
 9jqzdcvHBX03ZItfD6zMwqdDic907LJXQM6F10AJeFjKWhVELcPcBXHUJNM2MQ0LgaBe
 dJ9Q==
X-Gm-Message-State: AOAM531qTsJKcARNUmMwopnWANKbUkU1biUJlOL+7P4UZMg1IJuyMk9y
 bJSHbrn61OU6yyTwjuTXPIy8qT4Al3IjTg==
X-Google-Smtp-Source: ABdhPJxvpLuX30NNaK/hPVt0RCvbLMMXyfRfLjyiPCQKU6npsGBvHbohJMnmmoo31ly3+kXIxt/LyA==
X-Received: by 2002:a17:902:a705:b029:ec:bd14:7825 with SMTP id
 w5-20020a170902a705b02900ecbd147825mr26711605plq.83.1621875919373; 
 Mon, 24 May 2021 10:05:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gz18sm48213pjb.19.2021.05.24.10.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 10:05:18 -0700 (PDT)
Subject: Re: [PATCH 9/9] target/arm: Allow board models to specify initial NS
 VTOR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <263a44a4-a890-31fc-ab51-33c519b704f5@linaro.org>
Date: Mon, 24 May 2021 10:05:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Currently we allow board models to specify the initial value of the
> Secure VTOR register, using an init-svtor property on the TYPE_ARMV7M
> object which is plumbed through to the CPU.  Allow board models to
> also specify the initial value of the Non-secure VTOR via a similar
> init-nsvtor property.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I admit to not having a publicly-visible use for this yet, but
> it does bring the NSVTOR into line with both our handling of the
> SVTOR and also with the hardware, which allows both to be set
> via reset-time config signal inputs, as seen eg on the Cortex-M55:
> https://developer.arm.com/documentation/101051/0002/Signal-descriptions/Reset-configuration-signals?lang=en
> ---
>   include/hw/arm/armv7m.h |  2 ++
>   target/arm/cpu.h        |  2 ++
>   hw/arm/armv7m.c         |  7 +++++++
>   target/arm/cpu.c        | 10 ++++++++++
>   4 files changed, 21 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

