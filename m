Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D68641A36
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 02:05:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1dQ0-0003M1-KG; Sat, 03 Dec 2022 20:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1dPy-0003Lm-N1
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:03:42 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1dPx-0005n7-3J
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:03:42 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-14455716674so3449947fac.7
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 17:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rTAaFODKNP8Pdz0Uad+n8NB3F33Ax6pUk7yKDAy8nXE=;
 b=G98AY67ff4Hq1TjJeB7k19WKfvZO2WrrjqLJX3c0Q8X+lgUVKEOMwah/9RnnV97aQ2
 W6z8vwtXpCV8B/qs+taXr8W9BelULq84+L5Fgw3Wn7mSgPmaFFjk98c5kAnSAXMfYWUg
 MrED7vPhKngZxMgML3NucdhkKJiguFX/IR4OW5A3Lg2dBAZFWV9x0qssaJXLPPiO3UR5
 stbCL4ADCOWAwrtiExcgJpBxYoXDysKEZE4s+4xd4VS+3qTR7wSy07o096n13udt/KRj
 tyjev/n+sSbcwzD3odXZhi1113bFaMBtv1OaUWbiAFqV9gE8UgF3X5C5wPzHMe9o9eO2
 DC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTAaFODKNP8Pdz0Uad+n8NB3F33Ax6pUk7yKDAy8nXE=;
 b=IUhzk9aplNPt0PLALHPYlYOpph24Z87skEJAp7fily20kASV0ZW0s73ga3QTTd1U2b
 n6NL0NUwoQRbp+WIxBfGjkc+1YtZeMpYCsc2eNPYtYhwS+jtbWRuJlScTjVR212TTqFZ
 WYYpF6fVWVT8s1pXyfAiizgM9mgbLJ/Q8F/OaPSrEm4cmu5LalgJYHwwgdEf8f4ExIN4
 q0WWhXqEJwmyjuVO2IqfrTtB/wbfk8Szzxamwheesrmm454uys/cwQ54tdQZyvEaFTQQ
 lJUPaP6tBPp9TxkeqLgirJ4lNdpRAa31S4EaDTOWt0giY0cDyRRN0XWrA4KxQkv+a3KM
 ahRw==
X-Gm-Message-State: ANoB5pmypFeLAG5jfK78/kA0j+Lsc6Bz1aOT4GJXbZ498Iqv2+JfEguK
 AkJnAxRSJ7692ZJFi6CPK6orIg==
X-Google-Smtp-Source: AA0mqf4vNAWlZWoRa/GYMb/usba0h1RAsEk4bbldGHUPW6N6IUI3maGtwCfT/s7G+nuJMzDNnbVIRA==
X-Received: by 2002:a05:6871:468f:b0:132:82d1:7ab7 with SMTP id
 ni15-20020a056871468f00b0013282d17ab7mr34271562oab.137.1670115819374; 
 Sat, 03 Dec 2022 17:03:39 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:6b63:a06c:99b3:833?
 ([2806:102e:18:70b5:6b63:a06c:99b3:833])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a9d5e8a000000b0066c39c99ae5sm5452796otl.25.2022.12.03.17.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Dec 2022 17:03:38 -0800 (PST)
Message-ID: <1679d632-772a-480d-ccb4-45acbe3c5e2d@linaro.org>
Date: Sat, 3 Dec 2022 19:03:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 7/7] accel/tcg: Move remainder of page locking to
 tb-maint.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
References: <20221027111258.348196-1-richard.henderson@linaro.org>
 <20221027111258.348196-8-richard.henderson@linaro.org>
 <87zgc7b3tk.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zgc7b3tk.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 12/1/22 08:22, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The only thing that still touches PageDesc in translate-all.c
>> are some locking routines related to tb-maint.c which have not
>> yet been moved.  Do so now.
>>
>> Move some code up in tb-maint.c as well, to untangle the maze
>> of ifdefs, and allow a sensible final ordering.
>>
>> Move some declarations from exec/translate-all.h to internal.h,
>> as they are only used within accel/tcg/.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> <snip>
>>   #ifdef CONFIG_USER_ONLY
>> +
>> +/*
>> + * In user-mode page locks aren't used; mmap_lock is enough.
>> + */
>> +#define assert_page_locked(pd) tcg_debug_assert(have_mmap_lock())
>> +
>> +static inline void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
>> +                                  PageDesc **ret_p2, tb_page_addr_t phys2,
>> +                                  bool alloc)
>> +{
>> +    *ret_p1 = NULL;
>> +    *ret_p2 = NULL;
>> +}
>> +
>> +static inline void page_lock(PageDesc *pd) { }
>> +static inline void page_unlock(PageDesc *pd) { }
>> +static inline void page_lock_tb(const TranslationBlock *tb) { }
>> +static inline void page_unlock_tb(const TranslationBlock *tb) { }
>> +
> <snip>
> 
> clang picks up that page_lock is unused in this branch of the code.

Yep, and there's a minor rebase conflict now.
It would be helpful to fix the other issues that prevent using clang without 
--disable-werror...


r~


