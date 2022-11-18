Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626362FC80
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 19:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow60K-0007ZX-2P; Fri, 18 Nov 2022 13:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ow60H-0007YQ-TY
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 13:22:17 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ow60G-0008OD-5U
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 13:22:17 -0500
Received: by mail-pg1-x534.google.com with SMTP id n17so5665465pgh.9
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e/cAT/BkPIEqCpB0qbcCQUcpW2It3Qx/592wryD9iC4=;
 b=Xs5xGkrcBres5Zcxe8cAB92S32ho6y/5uDkP5Z6EXl1c9Sd1haKvSFv+0WFwuFQ/GC
 C0QR0N9wrQ9Xptao0iNSXwKy9ecJKoKZFOzcQJqa/FLfuzITHyw57Hp3dsquI29eKA9B
 UvYUcXlRiydqnmUdTIkTRIPJzBCK0YCUc05GsGfG/d6GqW5ScnprqtdiSNPaSnm+vyfm
 WAbwk7fbVgI8zqq1XWE+WJX5wq4FdAQVxmlwrjoVBPQtyG+hfHJ3tvyIn7RJL0+Nmsg8
 acMH/YlYKd1PlF5eqjRn8MXepRHgN9VjR5JQLDrHadnMkraaTMptSWfgDivKYZIPhgLx
 qGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e/cAT/BkPIEqCpB0qbcCQUcpW2It3Qx/592wryD9iC4=;
 b=sRov4TaYytklUK+LbaDHboDCzmkXoCApSEnwB9fmbw8KbZvNHO/QiZwaCjlyi2EiCZ
 GOVJq8fIMKxPZZMgvrFbFdpWp+0sUi+rIhzkarjpipo3i57z5tev2Fjqxmvbj42OoK4m
 X0A4tCseE2qrWMyrkbjjTpHPqlOqtjgjfk5L0J+eeWkXczP4bkr45gOyf5myT09sQl9+
 tk/WZLPSvBHv/AsSzdFewwuBXz9sy3Mxzxlvn0FVpmizVub226C0Qwoud4S+KXVN4xXu
 gVsQsdJmpYDMhZOdhRlikvtmKZBE4lbqDMtP/MguZYbUw5Az5J3EInLgfe7trZ57Ssez
 v2mQ==
X-Gm-Message-State: ANoB5pm12eOR1qxsCp5CI+5ghVpiI4F2crvgRFTjIy7qUikQcO9w9Fyv
 NvEKEfVQ7CPA7RlzrDzGbcr+lA==
X-Google-Smtp-Source: AA0mqf7Q6S1Rl749Oc4WpkUVNl2MLr3R85KObUqWrWKYviFFLKSbxvOSnUc8l0rsEab6fWcCDYeMNA==
X-Received: by 2002:aa7:8610:0:b0:56c:ba99:8735 with SMTP id
 p16-20020aa78610000000b0056cba998735mr8928989pfn.15.1668795734435; 
 Fri, 18 Nov 2022 10:22:14 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:4328:d05:e646:9f25?
 ([2602:47:d48a:1201:4328:d05:e646:9f25])
 by smtp.gmail.com with ESMTPSA id
 c65-20020a621c44000000b0056bcd7e1e04sm3457179pfc.124.2022.11.18.10.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 10:22:13 -0800 (PST)
Message-ID: <63ae5761-e718-ba68-1fd4-0cf0c20e1cc7@linaro.org>
Date: Fri, 18 Nov 2022 10:22:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-2-richard.henderson@linaro.org>
 <87fseg757a.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fseg757a.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

On 11/18/22 05:38, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Create a wrapper for locking/unlocking the iothread lock.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:Main loop)
>> ---
>>   include/qemu/main-loop.h | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
>> index 3c9a9a982d..c25f390696 100644
>> --- a/include/qemu/main-loop.h
>> +++ b/include/qemu/main-loop.h
>> @@ -343,6 +343,35 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
>>    */
>>   void qemu_mutex_unlock_iothread(void);
>>   
>> +/**
>> + * QEMU_IOTHREAD_LOCK_GUARD
>> + *
>> + * Wrap a block of code in a conditional qemu_mutex_{lock,unlock}_iothread.
>> + */
>> +typedef struct IOThreadLockAuto IOThreadLockAuto;
>> +
>> +static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char *file,
>> +                                                        int line)
>> +{
>> +    if (qemu_mutex_iothread_locked()) {
>> +        return NULL;
>> +    }
>> +    qemu_mutex_lock_iothread_impl(file, line);
>> +    /* Anything non-NULL causes the cleanup function to be called */
>> +    return (IOThreadLockAuto *)(uintptr_t)1;
> 
> Oh hang on, what black magic is this. Does the compiler do a NULL check
> before calling the cleanup?

Not the compiler, but...

>> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(IOThreadLockAuto, qemu_iothread_auto_unlock)

... this does.  Follow the macros down and you get

>   static G_GNUC_UNUSED inline void _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) (TypeName *_ptr)
>     { if (_ptr) (cleanup) ((ParentName *) _ptr); }                                                       

r~


