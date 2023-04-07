Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A896DB70B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:14:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvHZ-00033P-0u; Fri, 07 Apr 2023 19:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvHU-00032p-Vk
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:14:08 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvHT-00038k-DE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:14:08 -0400
Received: by mail-pl1-x631.google.com with SMTP id q2so5013808pll.7
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680909246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
 b=con+E+nBuUuL8bc6aBTNFmZw3A88rUFZYxGTFhDreXq5RHJZKuVoYlJBjJANRic/qc
 d5s0aIniIw0RL+malEGtEBMEHpe94GQp29//JHjND3LOTt2Qz6neACI5ima/6Bs8ADdA
 yo/JWYahYMsh7ErPLucmzyNckoeMuF0c9x1qrf9zMQmx6Bnh5MEN+0uiyAhmVmsWPJFI
 pWVaQ9k2ZnUgguA6EPAKVUUEzJY96hKZT4/VabPIIz8klAbW+JC3mY3jjRBuLk3fSGy5
 mfIp7D/2faI4Ti1BgkVfeheIv0888nglBVVCpOLVsdTkwhfsjv/mG9K919FmrAqv8UV4
 NPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680909246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
 b=IkhbRiEv7n+hwlCd6fOwm0bX9pya7HSOk4US0sbfcnkF97cH6IP4H9hODOxT3JyxNL
 XtXl1TU1daBehTwuFDQ8mJBiU2iP1Y00ydns/Rnll1xjxDvLiDZq1vOCPlFTTvHvHpnN
 4Lm50bclHg0/teSfSsKdfSIuWZFk7dZ+CAYuxl7CwbZGnW2FzgIeWshABcJim8EV1GTR
 fdtiEQB7wsLD8tAlicP5aeT8lrbxtAxGZ38kufDYRPnFhHpvvrvUYEoDcaq+08s7t6F6
 36e/UFk2P5risaNERg/YwKyUtWYt1AthsPAJfWyxCVoWaIP+oKZ/YIrGVrGfuuWsQGkZ
 EO4w==
X-Gm-Message-State: AAQBX9fRUvntTnbLIKmnxbNUi0nOLXfb5L0gfmRLJOIIVNesiuTIq02R
 tSlwXN72M+XEwgOtXKQvC5pfkA==
X-Google-Smtp-Source: AKy350aI+71oWAmO3OSiaf8U410Jg/WRlz+R9/yR6IazGZ/MKyDHhEtyo9+noerB1d8Pc0Zo6Qu0ww==
X-Received: by 2002:a17:903:183:b0:1a1:e33f:d567 with SMTP id
 z3-20020a170903018300b001a1e33fd567mr5603426plg.52.1680909245863; 
 Fri, 07 Apr 2023 16:14:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001963a178dfcsm1477074plb.244.2023.04.07.16.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:14:05 -0700 (PDT)
Message-ID: <e2687d91-85d8-d11f-4cea-c7363927cb9b@linaro.org>
Date: Fri, 7 Apr 2023 16:14:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 14/14] accel: Rename HVF struct hvf_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState.
> 
> Rename the 'hvf_vcpu_state' structure as 'AccelvCPUState'.
> 
> Use the generic 'accel' field of CPUState instead of 'hvf'.
> 
> Replace g_malloc0() by g_new0() for readability.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h     |  3 --
>   include/sysemu/hvf_int.h  |  2 +-
>   accel/hvf/hvf-accel-ops.c | 16 ++++-----
>   target/arm/hvf/hvf.c      | 70 +++++++++++++++++++--------------------
>   4 files changed, 44 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

