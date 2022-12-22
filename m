Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81E653CC9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:11:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GbQ-0002s7-Lg; Thu, 22 Dec 2022 03:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Gb6-0002l0-Bc
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:06:38 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Gb4-0005HO-EO
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:06:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 131-20020a1c0289000000b003d35acb0f9fso3290138wmc.2
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFjyqbpnz02nXZRvchFyHNpd7pQiGZsTqk5Z7SiuaF8=;
 b=eW5xUV4UQsXhlD8Q8Octu9n9cPSq6Sm197N0qRQPhIU32SabSOxk+11LHzxdmlTo9A
 OVU2hDkwRQFwr9+WDXkpTLlMoZbd6om/HyGfMxHhvKGbdSembbwcfgNStVJruDNK5Otg
 EULwUIgjWAkH6FIEsPoRZBi8dziwTT3ZwaKCMvSECdjnynljneJdLRfFPJrp+h4CHqPL
 6C5c1Fr2bXfLXo1rtNaKM9/7bMcIhjqe0YKQpZwu2Ou4nx0rcC7OXqv+ehFdsl9xuewR
 /RieivbkjqEGpsjTaFHezkT05IIt1qLtq2w0VibL3LTfv0sw5g60Fx4AFYb6JlP+yxDW
 FRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFjyqbpnz02nXZRvchFyHNpd7pQiGZsTqk5Z7SiuaF8=;
 b=M8Oup3wWKtZmNTfYUMRa66+QmD4qtkNtr9bDSFez78ZASxsPxwBL7zpSSmFhm/9R9Q
 79+N5TvnFHL1yJYRE6HgnO0/dp2o3t5CrTsIbjfc9ZAZrw7kVZjKNvdpWfWlC8l0OctV
 blplHM32AECZtC5Xt0YMGHPqW8VmxyDdYmfNxOhagjeYEPJMm+PzjJR3oYZ09Sk2ysET
 GLi4s+bcUkVpwL7BHSkDNjCu1BaLuvmfAQvCaTdUWz9D3s5VqcUH34Mc6JzN5+PUBnEZ
 4jFrR1T7w0c8w8RTxpBG2D+PMuCOXfsDIBFAh1GgduiZpim3gUN+m+TZCBwYjukyipnX
 gdLg==
X-Gm-Message-State: AFqh2kqvM7cgVdqb426ly3Al1uX6pq7FrcEYRv6StSG/PUbFwqae9vZg
 O+uZhLjvC067/MQtGDDaIfTkaQeUjA0rg0a33qI=
X-Google-Smtp-Source: AMrXdXs5goaEzrr0Isx4+zXUKVAdcbu6ZsaBdU2WK04IY4Zy0L0UiqvznqE6j5qNhocgTeWOOLDaIw==
X-Received: by 2002:a1c:4b03:0:b0:3d9:103d:9081 with SMTP id
 y3-20020a1c4b03000000b003d9103d9081mr2047772wma.28.1671696392616; 
 Thu, 22 Dec 2022 00:06:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003d358beab9dsm46242wms.47.2022.12.22.00.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:06:32 -0800 (PST)
Message-ID: <947734cf-7790-fa14-cb48-b2b48cc54896@linaro.org>
Date: Thu, 22 Dec 2022 09:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] MIPS: remove support for trap and emulate KVM
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20221221091718.71844-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221091718.71844-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 21/12/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> This support was limited to the Malta board, drop it.
> I do not have a machine that can run VZ KVM, so I am assuming
> that it works for -M malta as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Since Paolo's v1:
> 
> - Remove cpu_mips_kvm_um_phys_to_kseg0() declaration in "cpu.h"
> - Remove unused KVM_KSEG0_BASE/KVM_KSEG2_BASE definitions
> - Use USEG_LIMIT/KSEG0_BASE instead of magic values
> 
>         /* Check where the kernel has been linked */
>    -    if (!(kernel_entry & 0x80000000ll)) {
>    -        error_report("CONFIG_KVM_GUEST kernels are not supported");
>    +    if (kernel_entry <= USEG_LIMIT) {
>    +        error_report("Trap-and-Emul kernels (Linux CONFIG_KVM_GUEST)"
>    +                     " are not supported");
> 
>    -    env->CP0_EBase = (cs->cpu_index & 0x3FF) | (int32_t)0x80000000;
>    +    env->CP0_EBase = KSEG0_BASE | (cs->cpu_index & 0x3FF);
> ---
>   docs/about/deprecated.rst       |  9 -------
>   docs/about/removed-features.rst |  9 +++++++
>   hw/mips/malta.c                 | 46 +++++----------------------------
>   target/mips/cpu.c               |  7 +----
>   target/mips/cpu.h               |  3 ---
>   target/mips/internal.h          |  3 ---
>   target/mips/kvm.c               | 11 +-------
>   target/mips/sysemu/addr.c       | 17 ------------
>   target/mips/sysemu/physaddr.c   | 13 ----------
>   9 files changed, 18 insertions(+), 100 deletions(-)

Thanks, queued to mips-next.

