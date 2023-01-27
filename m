Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0867F13E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXLZ-0008Ul-Mi; Fri, 27 Jan 2023 17:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXLY-0008Ts-2G
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:37:24 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXLU-0007PC-1j
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:37:23 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso10032501pjg.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s2CPd73Pjd/UIOMM2lbN5Y4pguFIZFCBuPPYBU70ubY=;
 b=DEcnKj1mEwr/VUkGrcAKw0HBRr5j7St/KwA55HKycEnc5OC0js4KhwbGNrG+YkOQqJ
 RQlm3cQg6SPSuZIUGudKQZkd6judIREvFD9CVTDHh9ksqqhbXuWP35/EsV4OXv5OQ+ud
 IenrKETflOfJk2eI7LaHN81vQTGkZ4UUM16xsbP/JryJt76bOfBQrOyQ+b93Uu3USa48
 nyAyTw3ebd3eWSUsCVAxoVdm8g0SVGgsuDQq49J2r1oxeNLN+1y3doUOfG832w/DXZtX
 lI91Dw9x5UTxmMG0W4TrVp9zh+NzFeze08UuoAlEn1njtDZBUxFb0aFoLK3zctg/gK0L
 Y+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s2CPd73Pjd/UIOMM2lbN5Y4pguFIZFCBuPPYBU70ubY=;
 b=53H2D2Cd39S78snS3mCb7buQL+2NN9e39D0ugJqugtqKw8nYQI7JRWgo4LWoFpHX7Q
 v85osg47GYnI5mfOE/uEJhl2664s4wBpjyKUrjIW2mNlLOrEugCGQkfTMSaN7RhCqyU7
 4lHgd2LVugmbGlRXGWphAdcx2PgUJpIk4aSnaMY149KfxUeJoKw07Y2NEeh5jYeruWMh
 lLSgN7hKpPBz46wvGT2aMpXh+c8/xmZBKiRuE7R89E+DQHl5NL9fNjwXFbS4zSZ9Dfnw
 OlGV4PQIgTQrc/OFnAEowR2VzO5EIxh1ebLkJL6r2m5w+v69epgkShb9DSfzuuni3/LY
 JuJQ==
X-Gm-Message-State: AO0yUKUt+ERnFoMdAhhauridTWNF3EPm1TWHKF+6j52qvC+Yx9p8IVlA
 Gicu/Lbs4XlgL3x6sFPVRAaBaw==
X-Google-Smtp-Source: AK7set+qlQekEf0GSrIDvskDxx7cQqiiS322YchR6t4v5o0nQt5EvMeuJslSXrIT1hbbfGBUeFtfPw==
X-Received: by 2002:a17:90b:33c8:b0:22c:1331:9c59 with SMTP id
 lk8-20020a17090b33c800b0022c13319c59mr71219pjb.31.1674859038440; 
 Fri, 27 Jan 2023 14:37:18 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm2826072pga.9.2023.01.27.14.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:37:17 -0800 (PST)
Message-ID: <85606bc0-5e48-9280-781f-b9641c36ce03@linaro.org>
Date: Fri, 27 Jan 2023 12:37:12 -1000
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static int kvm_arm_rme_get_core_regs(CPUState *cs)
> +{
> +    int i, ret;
> +    struct kvm_one_reg reg;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    for (i = 0; i < 8; i++) {
> +        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> +        reg.addr = (uintptr_t) &env->xregs[i];
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}

Wow, this is quite the restriction.

I get that this is just enough to seed the guest for boot, and take SMC traps, but I'm 
concerned that we can't do much with the machine underneath, when it comes to other things 
like "info registers" or gdbstub will be silently unusable.  I would prefer if we can 
somehow make this loudly unusable.

Pardon if I'm jumping the gun and you handle this later.


r~

