Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE460D734
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 00:35:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onSTX-0000sc-DR; Tue, 25 Oct 2022 18:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onSTI-0000ng-33
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:32:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onSTA-0000pn-10
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:32:30 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q9-20020a17090a178900b00212fe7c6bbeso370326pja.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m1vuISpLfSr6beT7uFKApEO/GtRH68SgS89ftFG+Zns=;
 b=fkvMZJYLkupAfVW5+PAMpv3AmrlUoMjG57T5NKOEwcj5oHy7a00ZUsVBfeNFd3xqgU
 9umKAtU57lbmPIYXv999NJmkb9rlw0ap8Q7imJnOTCer2N7CJSq+2qnRYREli1YDkPsq
 F7yZBM7tTI9EqY/xK1+Xg9L1aNxWzm+J/pLV2pW0RlWfZ4nj1Kw5rgcJ5wmS+2nKmQfR
 gbZ3cWLyBh0z2XqgZxov9dEaGmqk5JM+85J994s1d8RvDG5nlIpMrOGJ5nubAWxZICmO
 1dmbDXyPJpRZQ9LTDyk1xvkNxs5wrzL6uGGJUF1vyQATq3Zqo/mlobLpoNYT28Ogr126
 LqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m1vuISpLfSr6beT7uFKApEO/GtRH68SgS89ftFG+Zns=;
 b=o8BpaRRE9eGKq0LwMUUvZ/79QdxbMGkM1QCBr2Ygvm8sKEPnpR9qwdULkVwH6J3TkB
 IwqVnNFK4nxmSmk6OanZBHiL1lbMxSeSPZ4a8paRkAWZuGOy40DeZbU6q6lickiOMxh/
 fPimZgK130gQFviRXUMZWat2vk+aWfH/BTMf3huBtK1II6LXugEkUJIs5Cx7ja/rPlwr
 SAVxLwz4hqbQND+NTvr0hquptNbTnPIjkEQoov6CmAYuaK6ue2t2DBMjWCJhd4E1brtv
 0+5pCJ8jk96lufZOZXUNvhy6L0VUgphM0ZPOJeSF0ionYNGsuqcnsw36NVV0B2vwlUnd
 S3lw==
X-Gm-Message-State: ACrzQf1635f/NGMHmwz3QhF25gqiZQ/acIdcXSA62y3agfVvPadNMCI/
 xlKTsOj7bnEiVFRXJISTz+R+Mw==
X-Google-Smtp-Source: AMsMyM5VzaqyDcQbPw0ftgGQBuzBdx8SL3PsF5vBMjAg6O4gdgaX4y+1jSwaMtPVTDctc0JCtkuimA==
X-Received: by 2002:a17:903:3293:b0:186:867b:e24 with SMTP id
 jh19-20020a170903329300b00186867b0e24mr21356182plb.127.1666737141664; 
 Tue, 25 Oct 2022 15:32:21 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a636dc3000000b0046f03254c9csm1736331pgc.23.2022.10.25.15.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 15:32:21 -0700 (PDT)
Message-ID: <e2c10320-cda9-ec4b-e0e6-64409110d1e9@linaro.org>
Date: Wed, 26 Oct 2022 08:32:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/4] include/qemu/thread: Use qatomic_* functions
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
 <20221024232435.3334600-4-richard.henderson@linaro.org>
 <0669dabb-5db2-b6d7-bf73-424e77045285@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0669dabb-5db2-b6d7-bf73-424e77045285@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 23:47, Claudio Fontana wrote:
> On 10/25/22 01:24, Richard Henderson wrote:
>> Use qatomic_*, which expands to __atomic_* in preference
>> to the "legacy" __sync_* functions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/qemu/thread.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
>> index af19f2b3fc..976e1ab995 100644
>> --- a/include/qemu/thread.h
>> +++ b/include/qemu/thread.h
>> @@ -227,7 +227,7 @@ struct QemuSpin {
>>   
>>   static inline void qemu_spin_init(QemuSpin *spin)
>>   {
>> -    __sync_lock_release(&spin->value);
>> +    qatomic_set(&spin->value, 0);
> 
> Here an integer literal is used, which makes sense, spin->value is int.
> 
>>   #ifdef CONFIG_TSAN
>>       __tsan_mutex_create(spin, __tsan_mutex_not_static);
>>   #endif
>> @@ -246,7 +246,7 @@ static inline void qemu_spin_lock(QemuSpin *spin)
>>   #ifdef CONFIG_TSAN
>>       __tsan_mutex_pre_lock(spin, 0);
>>   #endif
>> -    while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
>> +    while (unlikely(qatomic_xchg(&spin->value, true))) {
> 
> nit: here 'true' is used. Maybe "1" instead of "true" for consistency?

Fair enough.


r~

