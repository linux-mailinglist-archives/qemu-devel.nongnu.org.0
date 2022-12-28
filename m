Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3E65854E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 18:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAaLy-0006cc-FE; Wed, 28 Dec 2022 12:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAaLt-0006cI-3S
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 12:36:31 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAaLr-0008QK-6h
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 12:36:28 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so20638769pjj.2
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 09:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsfNaGBcUb11wpmBxYZqftTHuL7Dd7aCZhhos4G9Bew=;
 b=n9qI5YkaJwcIAyEQU0b1aL0M+EUm2pZPhHzX+do4p+fJVd/sn00mMFMX4rBhBQ+jRL
 g/Lev1mF0KM5Wr4Z1yTpk7PdoCebd2UDwzFaCRriaD7859vLfkptoCMiljX8xk3yFA/M
 +WnSqU4ITc/uHLPYdIwFGr7bQS39C+oeofEm7+MzQ5/TVdBopoRydHpavchH4DuPM0ku
 5M5TtPOcibay3+QEVsP4Dl19OyytHi9baEKWh7MVnvBnR021P7RxKitSmfT526rBQsQb
 hjB+yibC6rHMfOIkWjaqbT8Yur7V4ZKS5vraUQ3jAGTOwN99OWRa/Fu3HPi6EhuOb8aT
 Zc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qsfNaGBcUb11wpmBxYZqftTHuL7Dd7aCZhhos4G9Bew=;
 b=Rr3TNHclqpLILequI9VqfFQFz+WW7volgDHdg3nRKFXTiyfUys70arq+pg4l7kO8ml
 r00bJPyPcTMcCd4NVWGnDFSyuWCIX4Au4OQsuXQmvKF13q6MS3tO6Xhh93/iDmkNVTH5
 FRgtwqhJyWfdESKQ42AXKPV54HKUXfy/QLGBb7FWIGZVAXPyjeID3cfX2Z8m86k9PQiw
 Ueno3EJoefw2ZBbF/NA2YUiYnQ9yra2/UWOO2+6iIwOc8RnEhdSbDEL/j6s+D8/kUL9p
 rihVJ6XR+aGGJjtnOHykQYTuHNqev0lJ59f5LfHgZIDkhSA87vm07U/7zQ1mJM2LfXHh
 9YbA==
X-Gm-Message-State: AFqh2koCtx0x3WEpoRa3tI7Sr9yTbD8/e8os5Nd5pp1mNYPOxgDvbcBC
 hCyUrjJMIcATWEaWW2s+oCGB/Q==
X-Google-Smtp-Source: AMrXdXsyZNzZ4X1b7Wz7lrauIxIleeHYtgXaR8BQCUsY3IaUcS2c/cAA4k6CIdtCvA4mBeV7HKqe+w==
X-Received: by 2002:a05:6a20:5487:b0:ad:b4a5:8d2f with SMTP id
 i7-20020a056a20548700b000adb4a58d2fmr40594195pzk.42.1672248985543; 
 Wed, 28 Dec 2022 09:36:25 -0800 (PST)
Received: from [172.16.2.190] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a621c15000000b00581498190efsm4651923pfc.161.2022.12.28.09.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 09:36:24 -0800 (PST)
Message-ID: <eba7c0ee-96dc-928d-b2a2-19fc46dbb8f4@linaro.org>
Date: Wed, 28 Dec 2022 09:36:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-4-richard.henderson@linaro.org>
 <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/27/22 23:24, Philippe Mathieu-Daudé wrote:
> On 24/12/22 16:18, Richard Henderson wrote:
>> As in page_get_flags, we need to try again with the mmap
>> lock held if we fail a page lookup.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/user-exec.c | 39 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>> index 2c5c10d2e6..c72a806203 100644
>> --- a/accel/tcg/user-exec.c
>> +++ b/accel/tcg/user-exec.c
>> @@ -525,6 +525,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>>   int page_check_range(target_ulong start, target_ulong len, int flags)
>>   {
>>       target_ulong last;
>> +    int locked, ret;
> 
> have_mmap_lock() returns a boolean, can we declare 'locked'
> as such, ...
> 
>>       if (len == 0) {
>>           return 0;  /* trivial length */
>> @@ -535,42 +536,66 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
>>           return -1; /* wrap around */
>>       }
>> +    locked = have_mmap_lock();
>>       while (true) {
>>           PageFlagsNode *p = pageflags_find(start, last);
>>           int missing;
>>           if (!p) {
>> -            return -1; /* entire region invalid */
>> +            if (!locked) {
>> +                /*
>> +                 * Lockless lookups have false negatives.
>> +                 * Retry with the lock held.
>> +                 */
>> +                mmap_lock();
>> +                locked = -1;
> 
> ... skip this confusing assignation, ...
> 
>> +                p = pageflags_find(start, last);
>> +            }
>> +            if (!p) {
>> +                ret = -1; /* entire region invalid */
>> +                break;
>> +            }
>>           }
>>           if (start < p->itree.start) {
>> -            return -1; /* initial bytes invalid */
>> +            ret = -1; /* initial bytes invalid */
>> +            break;
>>           }
>>           missing = flags & ~p->flags;
>>           if (missing & PAGE_READ) {
>> -            return -1; /* page not readable */
>> +            ret = -1; /* page not readable */
>> +            break;
>>           }
>>           if (missing & PAGE_WRITE) {
>>               if (!(p->flags & PAGE_WRITE_ORG)) {
>> -                return -1; /* page not writable */
>> +                ret = -1; /* page not writable */
>> +                break;
>>               }
>>               /* Asking about writable, but has been protected: undo. */
>>               if (!page_unprotect(start, 0)) {
>> -                return -1;
>> +                ret = -1;
>> +                break;
>>               }
>>               /* TODO: page_unprotect should take a range, not a single page. */
>>               if (last - start < TARGET_PAGE_SIZE) {
>> -                return 0; /* ok */
>> +                ret = 0; /* ok */
>> +                break;
>>               }
>>               start += TARGET_PAGE_SIZE;
>>               continue;
>>           }
>>           if (last <= p->itree.last) {
>> -            return 0; /* ok */
>> +            ret = 0; /* ok */
>> +            break;
>>           }
>>           start = p->itree.last + 1;
>>       }
>> +
>> +    if (locked < 0) {
> 
> ... and check for !locked here?

No, we may have entered with mmap_locked.  Only unlocking if the lock was taken locally.


r~


