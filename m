Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3732F64A420
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kjb-0005HT-25; Mon, 12 Dec 2022 10:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4kjZ-0005HL-H5
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:28:49 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4kjX-0000zW-ST
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:28:49 -0500
Received: by mail-oi1-x22f.google.com with SMTP id q186so11506346oia.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f5mew2/uMhtUIctFRzkhzjnISgw5SWYDtQaU/rgQpzc=;
 b=EuMHfTwirBpXvljnkWuURuv5TBufAU9WIXA0CHuDRYc4V/l35ApGbCHUNGiUzue9RW
 o0YhrNlUeCHduVsY4NplYTpcjtGIcYCRBxdho2hxHH2Mm8gEgUXqGxPMF7QucCAB6BDx
 JsJHpyHILDnuY1tm8/Gf5WNgnLOQ6m8vkeiGi/oIe/uKxTa1S5bxL+u7UIFZojMMtLw/
 vdVbzYsxNgbRlCC2RBI675s+8NG2Wj0fThc6CPSmtpkS3BmUcQum7KK20IYIiUIoeqBe
 lT3z+u3oWKorDF3kDXSqEcSmGck/CdZduGEZj+SDxVQOuCMn9EX2yHrZEW8U6E+oDBwN
 f5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5mew2/uMhtUIctFRzkhzjnISgw5SWYDtQaU/rgQpzc=;
 b=CcbimeDf5fa6in66TG0qgKSt/AzXO25iKrS3ziHE9x7eMI4goz5TlHQ9zdARp0WR+r
 GLFqb1Tco1xNXZH7ac8ht02I0Idg/ZHpSWCu4A9M1jwBrVgyUymwaw3fTXuBnBVLuYWI
 lujzXqfrYaatckL4jneiuWR0ZFRbmbeOwHWCyzlj6QvmLUYNliDE4Wfhov+NHmiOuOSZ
 kCHYTdUvEc+bIqf1SF6QYOtXe5SZ2sg274/np01bLAiWj3vTa2IYmQsPdswnHOIhlGBv
 z2Mw48xRhnvGfmH+49VqhNJdQ3Q2x0e4fcNFDmCGKSeVLjLc8Yf0IoyiiRNoqpG82stc
 ok3w==
X-Gm-Message-State: ANoB5pmKkQepeVtCr9d0EvjhmLO7FdaO/ykjiwdTLpWwHe0q+D1AC6Kw
 fz9rPxNN8obobgcs1i9jvHyONQ==
X-Google-Smtp-Source: AA0mqf6+Yk3ydvElF5JrCzWEx9GrmdyKrKez/+o4PyBLHKV57YDXMREI44/g3pHanDUjsSzlvZEISw==
X-Received: by 2002:a05:6808:1ab2:b0:35e:6a35:fc56 with SMTP id
 bm50-20020a0568081ab200b0035e6a35fc56mr4511961oib.5.1670858926067; 
 Mon, 12 Dec 2022 07:28:46 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a4abd92000000b004a382acad85sm34255oop.15.2022.12.12.07.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:28:45 -0800 (PST)
Message-ID: <6006a739-9474-4c27-c42e-b642a957e346@linaro.org>
Date: Mon, 12 Dec 2022 09:28:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/8] accel/tcg: Move PageDesc tree into tb-maint.c for
 system
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-8-richard.henderson@linaro.org>
 <953275ef-a900-0a44-d2a4-1d990a1522a8@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <953275ef-a900-0a44-d2a4-1d990a1522a8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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

On 12/9/22 01:22, Philippe Mathieu-Daudé wrote:
> On 9/12/22 06:19, Richard Henderson wrote:
>> Now that PageDesc is not used for user-only, and for system
>> it is only used for tb maintenance, move the implementation
>> into tb-main.c appropriately ifdefed.
>>
>> We have not yet eliminated all references to PageDesc for
>> user-only, so retain a typedef to the structure without definition.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/internal.h      |  49 +++-----------
>>   accel/tcg/tb-maint.c      | 130 ++++++++++++++++++++++++++++++++++++--
>>   accel/tcg/translate-all.c |  95 ----------------------------
>>   3 files changed, 134 insertions(+), 140 deletions(-)
> 
> 
>> -/*
>> - * In system mode we want L1_MAP to be based on ram offsets,
>> - * while in user mode we want it to be based on virtual addresses.
>> - *
>> - * TODO: For user mode, see the caveat re host vs guest virtual
>> - * address spaces near GUEST_ADDR_MAX.
>> - */
>> -#if !defined(CONFIG_USER_ONLY)
>> -#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
>> -# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
>> -#else
>> -# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
>> -#endif
>> -#else
>> -# define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
>> -#endif
> 
> 
>> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
>> index 20e86c813d..9b996bbeb2 100644
>> --- a/accel/tcg/tb-maint.c
>> +++ b/accel/tcg/tb-maint.c
>> @@ -127,6 +127,121 @@ static PageForEachNext foreach_tb_next(PageForEachNext tb,
>>   }
>>   #else
>> +/*
>> + * In system mode we want L1_MAP to be based on ram offsets.
>> + */
>> +#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
>> +# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
>> +#else
>> +# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
>> +#endif
> So you removed L1_MAP_ADDR_SPACE_BITS in this patch. If you ever respin,
> I'd rather have it cleaned in the previous patch, along with the comment
> updated and TODO removed.

I don't agree.  I move all of the PageDesc symbols together in this patch.  I think that 
it would get in the way of the main point of the previous patch.


r~

