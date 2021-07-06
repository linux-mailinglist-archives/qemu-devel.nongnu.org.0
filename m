Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238923BD803
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:47:16 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lPv-0001Xx-1V
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0lNv-0008Ob-IV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:45:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0lNs-00048s-Ja
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:45:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so1767223wmq.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lqKzuu1aXJCePaK7rib4FW+HdsXE8YKFLRhSPASx580=;
 b=oUIpUFtE5ZX45IByFKcfmve58OgOX/vnimsRFOi60YWj+mAqz8lRBvwbG5XHEN3cmr
 jqJt92ZhXjxDGS59OCkbGxlPqFOpBl0oM+3Hy65WyQvXKZb7HGGQ8FXaDg1jAc6k8L0d
 D1eEpIuPIs0c+pqTMNiXB4YwE9NkO+T4H5CSFXPxtgOf8dRjTdN5hktltpEJuAwQkveQ
 R9vJRZILlSuKw4yeo6nQdi3+jGODWWy2i9RKor82kSj8s3ZTESWvGAIp95g93BQCZXf7
 EZ3rqSHVvlNOyKCq8IRZwg0gJzadhWu1U93tRyyx6HnA37+jSrth5myNFx2k3gxrzdUe
 AfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lqKzuu1aXJCePaK7rib4FW+HdsXE8YKFLRhSPASx580=;
 b=XBV/Ok7sNxCX3jjrw68QzCCCcpLg4Jo47F4EdaAy2Ws37e5hCh6Wpr96r4oVs+yw48
 isvHQQEnhiLbfqbQjCdP5OfChjJgZDLQ36Dg7+cSc08isu/v44c5spwLktmN3heXvtao
 n66e6Na8E7h/Uqz/Ix97zvqtP82qJAcIwo/KChEuIeZ8tYhIJJhKtWq78sbae6Z9fiTX
 SzNLYhs71gp6PhIbpiF7owD67x+AGOqOw3bm93zN40a1khwBLsLrcK2DrO8nrJh/yhLU
 r78GZU0JOUTUl7gG2eXUXIcSTj2VUCYYLfUUj+1yBDfHvaN3IOnTd1JAGZwQgGV+nCJj
 m2qA==
X-Gm-Message-State: AOAM532nHAYd4m3DQlpNCCkWwqzLEgiI/mjENWF+5BXWLmidOdl+LOKn
 tDKr89MSBdpMwZCgrfKIEPI=
X-Google-Smtp-Source: ABdhPJxGtr4xtaRrEjV3ASCT+NYz/hOvMvYmch0JN3lzEhX50Rn2PHmOSm6bLmylhbWHyXANj41QRw==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr873036wmh.152.1625579107005; 
 Tue, 06 Jul 2021 06:45:07 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b187sm2955152wmh.32.2021.07.06.06.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:45:06 -0700 (PDT)
Subject: Re: [PATCH v2] target/mips: Rewrite UHI errno_mips() using switch
 statement
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210706130723.1178961-1-f4bug@amsat.org>
 <143016a0-710d-90c6-4dd8-d7be4d4157b6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe9f9cd0-f111-489f-367f-d22fdce0f6e9@amsat.org>
Date: Tue, 6 Jul 2021 15:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <143016a0-710d-90c6-4dd8-d7be4d4157b6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Leon Alrae <leon.alrae@imgtec.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 3:35 PM, Thomas Huth wrote:
> On 06/07/2021 15.07, Philippe Mathieu-Daudé wrote:
>> Linking on Haiku OS fails:
>>
>>   
>> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>
>>    error:
>> libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is
>> too large (0xffff405a bytes)
>>   
>> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>
>>    final link failed: memory exhausted
>>    collect2: error: ld returned 1 exit status
>>
>> This is because the host_to_mips_errno[] uses errno as index,
>> for example:
>>
>>    static const uint16_t host_to_mips_errno[] = {
>>        [ENAMETOOLONG] = 91,
>>        ...
>>
>> and Haiku defines [*] ENAMETOOLONG as:
>>
>>     12 /* Error baselines */
>>     13 #define B_GENERAL_ERROR_BASE              INT_MIN
>>     ..
>>     22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE
>> + 0x6000)
>>    ...
>>    106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE
>> + 4)
>>    ...
>>    211 #define ENAMETOOLONG                     
>> B_TO_POSIX_ERROR(B_NAME_TOO_LONG)
>>
>> so the array ends up beeing indeed too big.
>>
>> Since POSIX errno can't be use as indexes on Haiku,
>> rewrite errno_mips() using a switch statement.
>>
>> [*]
>> https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130
>>
>>
>> Reported-by: Richard Zak <richard.j.zak@gmail.com>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Supersedes: <20210704170736.617895-4-f4bug@amsat.org>
>> ---
>>   target/mips/tcg/sysemu/mips-semi.c | 24 +++++++++---------------
>>   1 file changed, 9 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/mips/tcg/sysemu/mips-semi.c
>> b/target/mips/tcg/sysemu/mips-semi.c
>> index 77108b0b1a9..b4a383ae90c 100644
>> --- a/target/mips/tcg/sysemu/mips-semi.c
>> +++ b/target/mips/tcg/sysemu/mips-semi.c
>> @@ -74,25 +74,19 @@ enum UHIOpenFlags {
>>       UHIOpen_EXCL   = 0x800
>>   };
>>   -/* Errno values taken from asm-mips/errno.h */
>> -static const uint16_t host_to_mips_errno[] = {
>> -    [ENAMETOOLONG] = 78,
>> +static int errno_mips(int host_errno)
>> +{
>> +    /* Errno values taken from asm-mips/errno.h */
>> +    switch (host_errno) {
>> +    case 0:             return 0;
>> +    case ENAMETOOLONG:  return 78;
>>   #ifdef EOVERFLOW
>> -    [EOVERFLOW]    = 79,
>> +    case EOVERFLOW:     return 79;
>>   #endif
>>   #ifdef ELOOP
>> -    [ELOOP]        = 90,
>> +    case ELOOP:         return 90;
>>   #endif
>> -};
>> -
>> -static int errno_mips(int err)
>> -{
>> -    if (err < 0 || err >= ARRAY_SIZE(host_to_mips_errno)) {
>> -        return EINVAL;
>> -    } else if (host_to_mips_errno[err]) {
>> -        return host_to_mips_errno[err];
>> -    } else {
>> -        return err;
>> +    default:            return EINVAL;
>>       }
>>   }
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I assume you'll do the number fixup (your previous "target/mips: Fix UHI
> error values" patch) on top of this now?

The semihosting errnos are incorrect since the feature got introduced,
so I suppose nobody really uses this code, and fixing it is not urgent.
Since soft-freeze is close, I prefer to simply unblock Richard build.

Thanks for the simple suggestion and review!

Phil.

