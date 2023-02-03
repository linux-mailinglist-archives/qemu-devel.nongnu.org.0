Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2D68A519
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO445-00023L-9L; Fri, 03 Feb 2023 16:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO443-000238-Gm
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:57:47 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO440-0007RK-Vq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:57:47 -0500
Received: by mail-pg1-x535.google.com with SMTP id e10so4560785pgc.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bd09PBdXRHXZAabz4Lo9pEB7bbbE9buHJyzO7/ppFWw=;
 b=sOu17xSU/740mBLVWAgTo4kvQEGAi5yFSPxqLMIr3e4LQX/UveGFw/CitGFbrKRk+x
 w8aAGJyDBD5tkW7Azki+Le9E0BWZhu3UbHEIlMLATzBwrvcAzbZRqJwBOkJqV1ejJxYm
 ZvHdThz3QyWAFh9BL+hwdolpS63fOMo7F9qm/nq74WtwDlou5U/4q7rDrCeCRco7A3/5
 y36MiSscj7//pVJRCaWU+nL04obDJKkae/rS1yv1AaLdpjaLFBN2uJlpQznNWiCn1Zlm
 /YDR0n2vGat7NCI8h7rtUwFuJmXLvbZYgZFOVZU0e9yVzFUqj97WH74wJ4Syl17jSTfj
 bfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bd09PBdXRHXZAabz4Lo9pEB7bbbE9buHJyzO7/ppFWw=;
 b=kk5v9x8Rt4hxeOyokr4JCpZv+AjqgU1HrGVlrghKc7Zz479kNY6TmaekvZXRo/lb6U
 2tYlzZuegYTtVsqObGCifgychFdU401wd1IkQPoTEoN+0u9Ge1WO6Weas5+U4sxj5Png
 e6wxba4pIsX7KvbMD6ZB1qH7C3kTWmPZG5g9AWEQe9BgAA2EUkJyCdVzLGNHuD71AtRO
 IV+sxOQY/LEgzHaIfVPL2yKyVe73a1bKKlJ2OziXviBbe1EY3atF/LRE9IbAHv6TNeZH
 mq8zB/3Y/DOtlB86I2CQsyYufH8VvIpm48numZbUmfbSfyA/lmzx6YRnJVho/84B29Wj
 ri5A==
X-Gm-Message-State: AO0yUKVHoqQVFDRxPKL+7l049UDdOVTXDEcE9Wff820OlqJYwySdH7C3
 POVESJTScB7ym6FhxS4JnCDxSg==
X-Google-Smtp-Source: AK7set//yL2hJPdwq8nX/kZpB393sN36qiVJyUKVCHz7cDyma1QJK9/wXiLwI2tQaIaLuYtle2+NZA==
X-Received: by 2002:a62:ae0d:0:b0:592:d9e4:1b5d with SMTP id
 q13-20020a62ae0d000000b00592d9e41b5dmr11298720pff.6.1675461463349; 
 Fri, 03 Feb 2023 13:57:43 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 z65-20020a626544000000b0058d926cef4csm2318480pfb.7.2023.02.03.13.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 13:57:42 -0800 (PST)
Message-ID: <128e1f17-b069-b45d-5b2a-1a2fceeabe27@linaro.org>
Date: Fri, 3 Feb 2023 11:57:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] linux-user: fix getgroups/setgroups allocations
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org
References: <20221217093127.3085329-1-mjt@msgid.tls.msk.ru>
 <8ce38f3c-1f24-c3fb-bf49-deb265418163@vivier.eu>
 <3027627c-e8ce-c2fc-1ffe-85850968b131@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3027627c-e8ce-c2fc-1ffe-85850968b131@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 11:49, Laurent Vivier wrote:
> On 1/25/23 14:18, Laurent Vivier wrote:
>> Le 17/12/2022 à 10:31, Michael Tokarev a écrit :
>>> linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
>>> used alloca() to allocate grouplist arrays, with unchecked gidsetsize
>>> coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
>>> is common for an application to allocate NGROUPS_MAX for getgroups()),
>>> this means a typical allocation is half the megabyte on the stack.
>>> Which just overflows stack, which leads to immediate SIGSEGV in actual
>>> system getgroups() implementation.
>>>
>>> An example of such issue is aptitude, eg
>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811087#72
>>>
>>> Cap gidsetsize to NGROUPS_MAX (return EINVAL if it is larger than that),
>>> and use heap allocation for grouplist instead of alloca().  While at it,
>>> fix coding style and make all 4 implementations identical.
>>>
>>> Try to not impose random limits - for example, allow gidsetsize to be
>>> negative for getgroups() - just do not allocate negative-sized grouplist
>>> in this case but still do actual getgroups() call.  But do not allow
>>> negative gidsetsize for setgroups() since its argument is unsigned.
>>>
>>> Capping by NGROUPS_MAX seems a bit arbitrary, - we can do more, it is
>>> not an error if set size will be NGROUPS_MAX+1. But we should not allow
>>> integer overflow for the array being allocated. Maybe it is enough to
>>> just call g_try_new() and return ENOMEM if it fails.
>>>
>>> Maybe there's also no need to convert setgroups() since this one is
>>> usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
>>> this is apparently a kernel-imposed limit for runtime group set).
>>>
>>> The patch fixes aptitude segfault mentioned above.
>>>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> ---
>>> v2:
>>>   - remove g_free, use g_autofree annotations instead,
>>>   - a bit more coding style changes, makes checkpatch.pl happy
>>>
>>>   linux-user/syscall.c | 99 ++++++++++++++++++++++++++++++--------------
>>>   1 file changed, 68 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 24b25759be..8a2f49d18f 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -11433,39 +11433,58 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, 
>>> abi_long arg1,
>>>           {
>>>               int gidsetsize = arg1;
>>>               target_id *target_grouplist;
>>> -            gid_t *grouplist;
>>> +            g_autofree gid_t *grouplist = NULL;
>>>               int i;
>>> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
>>> +            if (gidsetsize > NGROUPS_MAX) {
>>> +                return -TARGET_EINVAL;
>>> +            }
>>> +            if (gidsetsize > 0) {
>>> +                grouplist = g_try_new(gid_t, gidsetsize);
>>> +                if (!grouplist) {
>>> +                    return -TARGET_ENOMEM;
>>> +                }
>>> +            }
>>>               ret = get_errno(getgroups(gidsetsize, grouplist));
>>> -            if (gidsetsize == 0)
>>> -                return ret;
>>> -            if (!is_error(ret)) {
>>> -                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 
>>> sizeof(target_id), 0);
>>> -                if (!target_grouplist)
>>> +            if (!is_error(ret) && ret > 0) {
>>> +                target_grouplist = lock_user(VERIFY_WRITE, arg2,
>>> +                                             gidsetsize * sizeof(target_id), 0);
>>> +                if (!target_grouplist) {
>>>                       return -TARGET_EFAULT;
>>> -                for(i = 0;i < ret; i++)
>>> +                }
>>> +                for (i = 0; i < ret; i++) {
>>>                       target_grouplist[i] = tswapid(high2lowgid(grouplist[i]));
>>> -                unlock_user(target_grouplist, arg2, gidsetsize * sizeof(target_id));
>>> +                }
>>> +                unlock_user(target_grouplist, arg2,
>>> +                            gidsetsize * sizeof(target_id));
>>>               }
>>> +            return ret;
>>>           }
>>> -        return ret;
>>>       case TARGET_NR_setgroups:
>>>           {
>>>               int gidsetsize = arg1;
>>>               target_id *target_grouplist;
>>> -            gid_t *grouplist = NULL;
>>> +            g_autofree gid_t *grouplist = NULL;
>>>               int i;
>>> -            if (gidsetsize) {
>>> -                grouplist = alloca(gidsetsize * sizeof(gid_t));
>>> -                target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 
>>> sizeof(target_id), 1);
>>> +
>>> +            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
>>> +                return -TARGET_EINVAL;
>>> +            }
>>> +            if (gidsetsize > 0) {
>>> +                grouplist = g_try_new(gid_t, gidsetsize);
>>> +                if (!grouplist) {
>>> +                    return -TARGET_ENOMEM;
>>> +                }
>>> +                target_grouplist = lock_user(VERIFY_READ, arg2,
>>> +                                             gidsetsize * sizeof(target_id), 1);
>>>                   if (!target_grouplist) {
>>>                       return -TARGET_EFAULT;
>>>                   }
>>>                   for (i = 0; i < gidsetsize; i++) {
>>>                       grouplist[i] = low2highgid(tswapid(target_grouplist[i]));
>>>                   }
>>> -                unlock_user(target_grouplist, arg2, 0);
>>> +                unlock_user(target_grouplist, arg2,
>>> +                            gidsetsize * sizeof(target_id));
>>>               }
>>>               return get_errno(setgroups(gidsetsize, grouplist));
>>>           }
>>> @@ -11750,41 +11769,59 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, 
>>> abi_long arg1,
>>>           {
>>>               int gidsetsize = arg1;
>>>               uint32_t *target_grouplist;
>>> -            gid_t *grouplist;
>>> +            g_autofree gid_t *grouplist = NULL;
>>>               int i;
>>> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
>>> +            if (gidsetsize > NGROUPS_MAX) {
>>> +                return -TARGET_EINVAL;
>>> +            }
>>> +            if (gidsetsize > 0) {
>>> +                grouplist = g_try_new(gid_t, gidsetsize);
>>> +                if (!grouplist) {
>>> +                    return -TARGET_ENOMEM;
>>> +                }
>>> +            }
>>>               ret = get_errno(getgroups(gidsetsize, grouplist));
>>> -            if (gidsetsize == 0)
>>> -                return ret;
>>> -            if (!is_error(ret)) {
>>> -                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 4, 0);
>>> +            if (!is_error(ret) && ret > 0) {
>>> +                target_grouplist = lock_user(VERIFY_WRITE, arg2,
>>> +                                             gidsetsize * 4, 0);
>>>                   if (!target_grouplist) {
>>>                       return -TARGET_EFAULT;
>>>                   }
>>> -                for(i = 0;i < ret; i++)
>>> +                for (i = 0; i < ret; i++) {
>>>                       target_grouplist[i] = tswap32(grouplist[i]);
>>> +                }
>>>                   unlock_user(target_grouplist, arg2, gidsetsize * 4);
>>>               }
>>> +            return ret;
>>>           }
>>> -        return ret;
>>>   #endif
>>>   #ifdef TARGET_NR_setgroups32
>>>       case TARGET_NR_setgroups32:
>>>           {
>>>               int gidsetsize = arg1;
>>>               uint32_t *target_grouplist;
>>> -            gid_t *grouplist;
>>> +            g_autofree gid_t *grouplist = NULL;
>>>               int i;
>>> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
>>> -            target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
>>> -            if (!target_grouplist) {
>>> -                return -TARGET_EFAULT;
>>> +            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
>>> +                return -TARGET_EINVAL;
>>> +            }
>>> +            if (gidsetsize > 0) {
>>> +                grouplist = g_try_new(gid_t, gidsetsize);
>>> +                if (!grouplist) {
>>> +                    return -TARGET_ENOMEM;
>>> +                }
>>> +                target_grouplist = lock_user(VERIFY_READ, arg2,
>>> +                                             gidsetsize * 4, 1);
>>> +                if (!target_grouplist) {
>>> +                    return -TARGET_EFAULT;
>>> +                }
>>> +                for (i = 0; i < gidsetsize; i++) {
>>> +                    grouplist[i] = tswap32(target_grouplist[i]);
>>> +                }
>>> +                unlock_user(target_grouplist, arg2, 0);
>>>               }
>>> -            for(i = 0;i < gidsetsize; i++)
>>> -                grouplist[i] = tswap32(target_grouplist[i]);
>>> -            unlock_user(target_grouplist, arg2, 0);
>>>               return get_errno(setgroups(gidsetsize, grouplist));
>>>           }
>>>   #endif
>>
>> Applied to my linux-user-for-8.0 branch.
> 
> I'm going to remove this patch from my branch because it breaks something.
> 
> When I execute LTP test suite (20200930), I have:
> 
> getgroups01    1  TPASS  :  getgroups failed as expected with EINVAL
> **
> ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion failed: 
> (cpu == current_cpu)
> Bail out! ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion 
> failed: (cpu == current_cpu)

Which host+guest?

I've had several reports of this, but can't replicate it locally.  The cpu_exec_setjmp 
function is now quite small and easy to analyze -- the only way I can see that this could 
fail is if there is some stack smashing issue...


r~

