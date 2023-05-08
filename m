Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED76FB382
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:14:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2Yz-00051M-3a; Mon, 08 May 2023 11:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw2Yv-0004yH-4q
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:14:05 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw2Yp-00010y-FC
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:14:01 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso28377075e87.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683558836; x=1686150836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/xvjyhabWaICVY4t71aMVSVOMCnu/xhpTBrg9NSrt8c=;
 b=uhEqrpKLYYPIiKUGN5KI9cbrwRU7JseslWf7hSJkRfbe0X4YOrSud78fRNahh12Wm0
 ji3qgILmPs67QKtZCuTmIk/FEDpL811pmhNyUVBGvU5z15zOnyp8x9hfmSluJenmEj5H
 SWVZLYjc5JY16Karn5nm78CZ9WGupxz5yMNby1mBqhI1E0HaynZqG3LYC7LTJgeZ8Cnn
 EmRhdmAmSHf7WqpRfqcdB9JY4xpkXe8asPH2EMCA5CK4yEHgrVHBjVgpzwgHtR2qYx/a
 nbizvu1lVQIAumwr/z63FasDoObQlq11oGUXDaNibLKfWhWMq172O3eGNfzVeTTbNDOj
 9Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683558836; x=1686150836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/xvjyhabWaICVY4t71aMVSVOMCnu/xhpTBrg9NSrt8c=;
 b=JFtu5uKBQxcdn+5enTKW7mvwnFTUXNB+JMHqBL3kwnyoLgMcaDt62b3CfIECi4QmR2
 9hMVHeuiJ0RNA/kB7ym4r78ll5hzQQ9KbxkKHjKHx1FNp1xzHe1hNIEY9vEYsy0OWQDs
 Lc5BLS61Ui7qVB5vO71TtzrlAbw8RymsAI5ZMu1JUs3TNTCItWp5G/FGKAxC5ATAroQW
 dO3yK9cN/Bi7WqKy0RMpfh6l6mpoa6F+6+6cnf7gk6LbT38rkDx/zgKryhXuVlhlJG/P
 ZYScXsiLl8f8jFblbX2xe6/18oQ48j7PF5mYjUKdhsmbm8R94AtHLqzVRKyMosVwRi6a
 VHug==
X-Gm-Message-State: AC+VfDzNYfl5VrT7lFBG0ZyeJ0UYjpS8tBoBawIpAvFSNphD7CsX/jL+
 NJIBIW89BOw5E6n8fIh5GNHKyw==
X-Google-Smtp-Source: ACHHUZ63GnFzZZQp49kjgV46SC3qBAGltRoAhKqd2bRXFK2sLjswhg+tHEDA0vQKzOWilYTXJNam5g==
X-Received: by 2002:a05:651c:10b4:b0:2ad:f82:93d2 with SMTP id
 k20-20020a05651c10b400b002ad0f8293d2mr1732579ljn.18.1683558836473; 
 Mon, 08 May 2023 08:13:56 -0700 (PDT)
Received: from [192.168.110.227] ([91.209.212.42])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a2e88ca000000b002a8d01905f7sm1185901ljk.101.2023.05.08.08.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:13:56 -0700 (PDT)
Message-ID: <60b7bd48-a22b-b0b5-0499-a0e49ec8b155@linaro.org>
Date: Mon, 8 May 2023 16:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 26/57] tcg/arm: Adjust constraints on qemu_ld/st
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-27-richard.henderson@linaro.org>
 <CAFEAcA_i+XxebX2m448iA-XdbBuN1w0VsEwhAQkP_yQvqnjNhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_i+XxebX2m448iA-XdbBuN1w0VsEwhAQkP_yQvqnjNhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/5/23 13:14, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
>> ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
>> to the misaligned trap.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>>   /*
>> - * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
>> - * and r0-r1 doing the byte swapping, so don't use these.
>> - * r3 is removed for softmmu to avoid clashes with helper arguments.
>> + * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
>> + * r14 will be overwritten by the BLNE branching to the slow path.
>>    */
>>   #ifdef CONFIG_SOFTMMU
>> -#define ALL_QLOAD_REGS \
>> +#define ALL_QLDST_REGS \
>>       (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
>>                             (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
>>                             (1 << TCG_REG_R14)))
>> -#define ALL_QSTORE_REGS \
>> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
>> -                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
>> -                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
>>   #else
>> -#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
>> -#define ALL_QSTORE_REGS \
>> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
>> +#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
>>   #endif
> 
> Why is it OK not to remove r0 and r1 from this any more ?
> The commit message doesn't say anything about this bit of the change.

I'm not 100% sure why they were included.  Perhaps bswap, from the old days where that was 
required of the backend.


r~


