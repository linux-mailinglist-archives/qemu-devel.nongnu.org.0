Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7366B902
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:23:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHKlw-0002GS-KZ; Mon, 16 Jan 2023 03:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHKlv-0002GF-9t
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:23:15 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHKlt-0008K9-Co
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:23:14 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so2036137wml.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LyvPCxNsRykEHdvO+ZUB95i/bGN9rVnDNMH2P4vJK/U=;
 b=Ac6ktgzTCxKHX8KBFsX0be/lNqQnkpOPonrS1ak3MY7NVajgo3y/Iup16FUwQ2CHTI
 MYk5FL0u7EAomjT7V0MNjewJ89P6vsNyu08RQA5X2gwm8yKTjsyfcR17jGf+0tUwLUix
 QTbd5/80L/DxDHkxpwGiDi5WUCJhmZB9+sC006kOLfh8DFE2jQ7Npk+GnRoM/CBsj5MH
 cjGKlGbjCaUAw2Jmj37/q9hQhUEAoEn51vmkofMzTZwsnskyEPWfQ9hNIldpsz93Itv3
 ivAhBgvS6STDl99HSA35l65NsKtTwyi+WIfGxvu4fF7S8waTDahJhX95RpGPRDZ3R1L8
 9Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LyvPCxNsRykEHdvO+ZUB95i/bGN9rVnDNMH2P4vJK/U=;
 b=A6IYQhXMzs58hJrQR/rpLuEE3udAcGCU8w+A7kR2v2YfI1DcdX3s9XZ1XmbJ7uCnfa
 jJXWnfWahvLvqUiW1FGWd3IdZifx5a3QH0ftHfAsdJ1l1nwAQhs3LOHwiLCXKKYpbAIp
 ZVYWz2+dVeqIlHS8pLlkryo4mD8bVhU4koYZ17A8AAFgq2hMDVa/oFq5cvIFuqvmTBAO
 q/jTr1+Etdv5NTZ4tfQNaUtf0IOTP53KXV6pnhw8PRZovcmor98J2Rez4Muywv+Lq1zp
 TS3G04eqqvdVKaNNYrJuvm8CgmG4uoFRa3A69j8ubECpGpLrqvM8ny/UseAVhtrG58ZG
 JS8g==
X-Gm-Message-State: AFqh2ko14t664HZ9z/qxYVMvnVKGJ/ahicbQJtBkFHLcfzUYGRxlgJs6
 wB1a6Z/SXTQkopXiLg0H05Bjug==
X-Google-Smtp-Source: AMrXdXuC7uuelRZSlCT4Ym8VEIlCNRa4jfyOvpLVWBgmiWlYUVduOP8p7Ba3tXieR7FoGrTgRGajqQ==
X-Received: by 2002:a05:600c:1d13:b0:3da:fa80:62f9 with SMTP id
 l19-20020a05600c1d1300b003dafa8062f9mr2888856wms.18.1673857390807; 
 Mon, 16 Jan 2023 00:23:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003b4ff30e566sm10479472wms.3.2023.01.16.00.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:23:10 -0800 (PST)
Message-ID: <aa2862bd-7310-2f27-3a75-a3b351691235@linaro.org>
Date: Mon, 16 Jan 2023 09:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] tests/tcg/i386: Introduce and use reg_t consistently
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230114230542.3116013-1-richard.henderson@linaro.org>
 <20230114230542.3116013-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114230542.3116013-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/1/23 00:05, Richard Henderson wrote:
> Define reg_t based on the actual register width.
> Define the inlines using that type.  This will allow
> input registers to 32-bit insns to be set to 64-bit
> values on x86-64, which allows testing various edge cases.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/i386/test-i386-bmi2.c | 182 ++++++++++++++++----------------
>   1 file changed, 93 insertions(+), 89 deletions(-)
> 
> diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
> index 5fadf47510..3c3ef85513 100644
> --- a/tests/tcg/i386/test-i386-bmi2.c
> +++ b/tests/tcg/i386/test-i386-bmi2.c
> @@ -3,34 +3,40 @@
>   #include <stdint.h>
>   #include <stdio.h>
>   
> +#ifdef __x86_64
> +typedef uint64_t reg_t;
> +#else
> +typedef uint32_t reg_t;
> +#endif
> +
>   #define insn1q(name, arg0)                                                           \
> -static inline uint64_t name##q(uint64_t arg0)                                        \
> +static inline reg_t name##q(reg_t arg0)                                              \
>   {                                                                                    \
> -    uint64_t result64;                                                               \
> +    reg_t result64;                                                                  \
>       asm volatile (#name "q   %1, %0" : "=r"(result64) : "rm"(arg0));                 \
>       return result64;                                                                 \
>   }
>   
>   #define insn1l(name, arg0)                                                           \
> -static inline uint32_t name##l(uint32_t arg0)                                        \
> +static inline reg_t name##l(reg_t arg0)                                              \
>   {                                                                                    \
> -    uint32_t result32;                                                               \
> +    reg_t result32;                                                                  \
>       asm volatile (#name "l   %k1, %k0" : "=r"(result32) : "rm"(arg0));               \
>       return result32;                                                                 \
>   }

Are the names 'result64/result32' still appropriate?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


