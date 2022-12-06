Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282B644832
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:41:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2a3m-0004vv-5j; Tue, 06 Dec 2022 10:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2a3c-0004tG-OF
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:40:33 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2a3b-0003WI-7v
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:40:32 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso512553otb.12
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9uaNnxLQxTy5+xq0wktSEKujJM6RlJKRtX063mR3500=;
 b=Y/7QB2cIYgkuDoZiv96EShYeujyImBMQ57yXjoxlwXb97Gszsl2TbnCLKWzSJs+0lc
 LnjYqzDPY+CkKl1DkXl8Ba7X32wIWGwEgQuL/3YpE7VvLToFS1YbCd/bVXtuCo0OGzCk
 45rCx6JAdhxSlSu4IorhHYJLj/YcI3tTuKYxOqKzqsQ8NxCTay50kGwFcjzBYXBmzfXi
 32W50+mkDqX0Uk6ex2nD3I/yZyEzc9RPkIMDOHm7egRA2XHPLFWO8M4FCuDXz4aJq30r
 eXou/RpVIwzww8cfqvODB8SzFtHbJ2rBmJf1giS8/iTCmJdaBLLxJKSPI3R/Sh3k8SUX
 FofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9uaNnxLQxTy5+xq0wktSEKujJM6RlJKRtX063mR3500=;
 b=AuGxi85cvShW0/o1in/WNOaLBiv6rxvE8llHi5o4Jt+m0SxeVB7NUc/gjpSOwmAyyR
 tB2KgKXNruSIrY3l+YqQKoFhCieYblJS+JONq80l7tvVtLutqwGbgn+OxWnXfBPUfzTh
 WVCLdAicL7B2jkymzQKpARmzkI4nBMfczd5DSWR2/zH0imHSezetnGI6Yk6PdUrCW+bc
 hs5/Sq6pjodSC+XBSfeZaBiykilp9sDMWpsgC0xIGHvSGzs7G0OkUNb0R5V9XerHzR5V
 W9KHR9E1FP3sgvW+sRHOQV4TJ4oFXzoAy9bpdjoC/Ja5VLEoJ70s6627hCnVixwlilsL
 nYTw==
X-Gm-Message-State: ANoB5pkBG6Ia+Lm0prM2MqwIhn9X1SdHbix98puxvLdlev47RoKfVl0z
 R5npC136TXqfxk8/Z8PJu66NMQ==
X-Google-Smtp-Source: AA0mqf6wilEdP2Xp7OT5aX9OL1fOxEse7L2YA+v+/MdVor3q8eW+QJjsKD6Upm157UI1DCRp//RdoQ==
X-Received: by 2002:a05:6830:1696:b0:66c:1:feef with SMTP id
 k22-20020a056830169600b0066c0001feefmr33128099otr.347.1670341228380; 
 Tue, 06 Dec 2022 07:40:28 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:e319:9475:a359:f17a?
 ([2806:102e:18:70b5:e319:9475:a359:f17a])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a056830115600b0066ec67bbc7asm2994579otq.7.2022.12.06.07.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:40:27 -0800 (PST)
Message-ID: <4530a8c2-eb88-b825-d02b-f75725cd7735@linaro.org>
Date: Tue, 6 Dec 2022 09:40:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 18/22] tcg/sparc64: Remove USE_REG_TB
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-19-richard.henderson@linaro.org>
 <9909a5ae-02c4-19b6-d930-ad773a1b524c@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9909a5ae-02c4-19b6-d930-ad773a1b524c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 01:44, Philippe Mathieu-Daudé wrote:
> On 6/12/22 05:17, Richard Henderson wrote:
>> This is always true for sparc64, so this is dead since 3a5f6805c7ca.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc64/tcg-target.c.inc | 57 ++++++++++++++----------------------
>>   1 file changed, 22 insertions(+), 35 deletions(-)
> 
>> @@ -1897,7 +1884,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>>       tcg_debug_assert(tb_disp == (int32_t)tb_disp);
>>       tcg_debug_assert(br_disp == (int32_t)br_disp);
>> -    if (!USE_REG_TB) {
>> +    if (0) {
>>           qatomic_set((uint32_t *)jmp_rw,
>>               deposit32(CALL, 0, 30, br_disp >> 2));
>>           flush_idcache_range(jmp_rx, jmp_rw, 4);
> 
> Why remove in the next patch and not here?

Heh.  I did that so I could move this code in the next patch.
I meant to go back and edit this patch to delete, after I'd done that.


r~

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


