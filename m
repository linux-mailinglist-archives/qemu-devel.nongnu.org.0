Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F068A4EE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3wJ-0008W6-JX; Fri, 03 Feb 2023 16:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pO3wI-0008Vr-Ch
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:49:46 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pO3wD-0004YB-8C
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:49:43 -0500
Received: from [192.168.100.30] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MfHIb-1oiQj726N1-00glKE; Fri, 03 Feb 2023 22:49:34 +0100
Message-ID: <3027627c-e8ce-c2fc-1ffe-85850968b131@vivier.eu>
Date: Fri, 3 Feb 2023 22:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: fix getgroups/setgroups allocations
Content-Language: en-US
From: Laurent Vivier <laurent@vivier.eu>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <20221217093127.3085329-1-mjt@msgid.tls.msk.ru>
 <8ce38f3c-1f24-c3fb-bf49-deb265418163@vivier.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8ce38f3c-1f24-c3fb-bf49-deb265418163@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4kBirLpcu4BNjs6vwmHEA6FdmU6ekQNKpG6GyuSePF/1lO18j/u
 A1O8ELhNCJlxfo9mZoSS1YKFajMQ2PwDejLvKC2G9fx5In6xVSyXfwpBmA4JwQ8T1bnI69E
 pMyOodIo90wEXXPHGdojevmcLOl0qdbV+QUOUnaEbMzy5HFgnK4sa6XsJ7mm2ZEZwljCCHT
 d+d6YYDQnA60tLzeBCRDQ==
UI-OutboundReport: notjunk:1;M01:P0:lnM/2aepKvw=;yQ9plXMoMT8doxsXDVnKYjHtEiY
 81yaGqi1qbLKbUkw9Qlos4EZNZyBLUEOazeIZnTcfRnB/DMclSiwrNqucGQ31NttfgQN7ypHH
 +LmBPxNv5BGOpTKm0nU3ajgcs+fFF4ALoq21MGeZRJyOo4rGIHoqnq2k0Jh89ZQtxSSO/B5Mf
 gvigXzK0AOy7PSqJu/dJlvUCd74BiJ+cv/7gX1C6gfJ6RmAJ4WXz+DvnOuEHYxz6c/K7KR65J
 Zo5UOsVqFIZZ3zrV2ALNSD/j1ar37Nr9NgGqlYdBbdLvmLKIP8h8F5P4lQ6lNvqJw5VeOHyFD
 aKL20VaohbI/Kh6ceA5ud3hn9CS8qOGEjxtmM4jL1tEhO980oeYuY1+Ban/SBQkW3Pe6ykEjq
 2OQxYoI4iy4OPxYsQ7ePJCYVu7258EleL+fpHhlss5JMr/eGxsOXdRKDad6Z+gfv8C980T0e6
 bPjG9Tefs1kobZXqd6eR8e5Y5BgVuKpdAL4cvYXKHb0D+9IdfgEhrCNoHSUSzZGLQGWklN4/r
 rmBjJMNRpfVkKE+AamMr2OcwOBO2qyGEevnPL0LFc0iXZRxxA9jqARp8OeGAJAL1TGkGwUDJC
 ngnT89cX0d/fWQ22yo5Ro3SsIzYVganLRwPIylbDjoWq9NK8u7KevNYUbGB7LF/2xP2vv6pfY
 1R8mUzpWPXnIa0Ti0f7zLEAFmJ9tA+BTLzYjQBcPkg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 1/25/23 14:18, Laurent Vivier wrote:
> Le 17/12/2022 à 10:31, Michael Tokarev a écrit :
>> linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
>> used alloca() to allocate grouplist arrays, with unchecked gidsetsize
>> coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
>> is common for an application to allocate NGROUPS_MAX for getgroups()),
>> this means a typical allocation is half the megabyte on the stack.
>> Which just overflows stack, which leads to immediate SIGSEGV in actual
>> system getgroups() implementation.
>>
>> An example of such issue is aptitude, eg
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811087#72
>>
>> Cap gidsetsize to NGROUPS_MAX (return EINVAL if it is larger than that),
>> and use heap allocation for grouplist instead of alloca().  While at it,
>> fix coding style and make all 4 implementations identical.
>>
>> Try to not impose random limits - for example, allow gidsetsize to be
>> negative for getgroups() - just do not allocate negative-sized grouplist
>> in this case but still do actual getgroups() call.  But do not allow
>> negative gidsetsize for setgroups() since its argument is unsigned.
>>
>> Capping by NGROUPS_MAX seems a bit arbitrary, - we can do more, it is
>> not an error if set size will be NGROUPS_MAX+1. But we should not allow
>> integer overflow for the array being allocated. Maybe it is enough to
>> just call g_try_new() and return ENOMEM if it fails.
>>
>> Maybe there's also no need to convert setgroups() since this one is
>> usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
>> this is apparently a kernel-imposed limit for runtime group set).
>>
>> The patch fixes aptitude segfault mentioned above.
>>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>> v2:
>>   - remove g_free, use g_autofree annotations instead,
>>   - a bit more coding style changes, makes checkpatch.pl happy
>>
>>   linux-user/syscall.c | 99 ++++++++++++++++++++++++++++++--------------
>>   1 file changed, 68 insertions(+), 31 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 24b25759be..8a2f49d18f 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -11433,39 +11433,58 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, 
>> abi_long arg1,
>>           {
>>               int gidsetsize = arg1;
>>               target_id *target_grouplist;
>> -            gid_t *grouplist;
>> +            g_autofree gid_t *grouplist = NULL;
>>               int i;
>> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
>> +            if (gidsetsize > NGROUPS_MAX) {
>> +                return -TARGET_EINVAL;
>> +            }
>> +            if (gidsetsize > 0) {
>> +                grouplist = g_try_new(gid_t, gidsetsize);
>> +                if (!grouplist) {
>> +                    return -TARGET_ENOMEM;
>> +                }
>> +            }
>>               ret = get_errno(getgroups(gidsetsize, grouplist));
>> -            if (gidsetsize == 0)
>> -                return ret;
>> -            if (!is_error(ret)) {
>> -                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 
>> sizeof(target_id), 0);
>> -                if (!target_grouplist)
>> +            if (!is_error(ret) && ret > 0) {
>> +                target_grouplist = lock_user(VERIFY_WRITE, arg2,
>> +                                             gidsetsize * sizeof(target_id), 0);
>> +                if (!target_grouplist) {
>>                       return -TARGET_EFAULT;
>> -                for(i = 0;i < ret; i++)
>> +                }
>> +                for (i = 0; i < ret; i++) {
>>                       target_grouplist[i] = tswapid(high2lowgid(grouplist[i]));
>> -                unlock_user(target_grouplist, arg2, gidsetsize * sizeof(target_id));
>> +                }
>> +                unlock_user(target_grouplist, arg2,
>> +                            gidsetsize * sizeof(target_id));
>>               }
>> +            return ret;
>>           }
>> -        return ret;
>>       case TARGET_NR_setgroups:
>>           {
>>               int gidsetsize = arg1;
>>               target_id *target_grouplist;
>> -            gid_t *grouplist = NULL;
>> +            g_autofree gid_t *grouplist = NULL;
>>               int i;
>> -            if (gidsetsize) {
>> -                grouplist = alloca(gidsetsize * sizeof(gid_t));
>> -                target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 
>> sizeof(target_id), 1);
>> +
>> +            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
>> +                return -TARGET_EINVAL;
>> +            }
>> +            if (gidsetsize > 0) {
>> +                grouplist = g_try_new(gid_t, gidsetsize);
>> +                if (!grouplist) {
>> +                    return -TARGET_ENOMEM;
>> +                }
>> +                target_grouplist = lock_user(VERIFY_READ, arg2,
>> +                                             gidsetsize * sizeof(target_id), 1);
>>                   if (!target_grouplist) {
>>                       return -TARGET_EFAULT;
>>                   }
>>                   for (i = 0; i < gidsetsize; i++) {
>>                       grouplist[i] = low2highgid(tswapid(target_grouplist[i]));
>>                   }
>> -                unlock_user(target_grouplist, arg2, 0);
>> +                unlock_user(target_grouplist, arg2,
>> +                            gidsetsize * sizeof(target_id));
>>               }
>>               return get_errno(setgroups(gidsetsize, grouplist));
>>           }
>> @@ -11750,41 +11769,59 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, 
>> abi_long arg1,
>>           {
>>               int gidsetsize = arg1;
>>               uint32_t *target_grouplist;
>> -            gid_t *grouplist;
>> +            g_autofree gid_t *grouplist = NULL;
>>               int i;
>> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
>> +            if (gidsetsize > NGROUPS_MAX) {
>> +                return -TARGET_EINVAL;
>> +            }
>> +            if (gidsetsize > 0) {
>> +                grouplist = g_try_new(gid_t, gidsetsize);
>> +                if (!grouplist) {
>> +                    return -TARGET_ENOMEM;
>> +                }
>> +            }
>>               ret = get_errno(getgroups(gidsetsize, grouplist));
>> -            if (gidsetsize == 0)
>> -                return ret;
>> -            if (!is_error(ret)) {
>> -                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 4, 0);
>> +            if (!is_error(ret) && ret > 0) {
>> +                target_grouplist = lock_user(VERIFY_WRITE, arg2,
>> +                                             gidsetsize * 4, 0);
>>                   if (!target_grouplist) {
>>                       return -TARGET_EFAULT;
>>                   }
>> -                for(i = 0;i < ret; i++)
>> +                for (i = 0; i < ret; i++) {
>>                       target_grouplist[i] = tswap32(grouplist[i]);
>> +                }
>>                   unlock_user(target_grouplist, arg2, gidsetsize * 4);
>>               }
>> +            return ret;
>>           }
>> -        return ret;
>>   #endif
>>   #ifdef TARGET_NR_setgroups32
>>       case TARGET_NR_setgroups32:
>>           {
>>               int gidsetsize = arg1;
>>               uint32_t *target_grouplist;
>> -            gid_t *grouplist;
>> +            g_autofree gid_t *grouplist = NULL;
>>               int i;
>> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
>> -            target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
>> -            if (!target_grouplist) {
>> -                return -TARGET_EFAULT;
>> +            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
>> +                return -TARGET_EINVAL;
>> +            }
>> +            if (gidsetsize > 0) {
>> +                grouplist = g_try_new(gid_t, gidsetsize);
>> +                if (!grouplist) {
>> +                    return -TARGET_ENOMEM;
>> +                }
>> +                target_grouplist = lock_user(VERIFY_READ, arg2,
>> +                                             gidsetsize * 4, 1);
>> +                if (!target_grouplist) {
>> +                    return -TARGET_EFAULT;
>> +                }
>> +                for (i = 0; i < gidsetsize; i++) {
>> +                    grouplist[i] = tswap32(target_grouplist[i]);
>> +                }
>> +                unlock_user(target_grouplist, arg2, 0);
>>               }
>> -            for(i = 0;i < gidsetsize; i++)
>> -                grouplist[i] = tswap32(target_grouplist[i]);
>> -            unlock_user(target_grouplist, arg2, 0);
>>               return get_errno(setgroups(gidsetsize, grouplist));
>>           }
>>   #endif
> 
> Applied to my linux-user-for-8.0 branch.

I'm going to remove this patch from my branch because it breaks something.

When I execute LTP test suite (20200930), I have:

getgroups01    1  TPASS  :  getgroups failed as expected with EINVAL
**
ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion failed: 
(cpu == current_cpu)
Bail out! ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion 
failed: (cpu == current_cpu)
**
ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion failed: 
(cpu == current_cpu)
Bail out! ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion 
failed: (cpu == current_cpu)

Thanks,
Laurent



