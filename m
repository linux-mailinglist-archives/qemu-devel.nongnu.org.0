Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFE6F8312
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:37:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puugt-00072j-1Y; Fri, 05 May 2023 08:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1puugo-0006vX-6w
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:37:34 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1puugk-0005qp-8k
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:37:33 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mbkac-1qVcYF2lzS-00dFG2; Fri, 05 May 2023 14:37:25 +0200
Message-ID: <42cc90f7-8e44-84ba-1ba2-135357b9f400@vivier.eu>
Date: Fri, 5 May 2023 14:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] linux-user: fix getgroups/setgroups allocations
Content-Language: fr
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20230409105327.1273372-1-mjt@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230409105327.1273372-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J5007myLDgkefcZBxP+/drmv/4yylkYfTsKzrhumYbDQrRViY1e
 vvnYJN2yVPZ2Bk5jQhFTLJ771Ho473/AbfRYDJmJM/gxhewW+XwTBkMI4/skUrBTHlw2JTw
 DnP6eOS3JNaOVQGG0M5a1OCEHpAhezhod7RWS28HBAClipOKFk1TBuIgW5vNmHmC1B34l3l
 nt5bG1YwEvrIGu/we2yog==
UI-OutboundReport: notjunk:1;M01:P0:algz+7y7Evc=;jeq+en/GAsBLBVaJ1+hBSc62Ic6
 hAJJUmfcdbsLxDAQCzWcmVn3f9ZNummxwbq/3dYo6C1MhzIzKBsXbBCQhkX+AVp91oG8hzl/K
 sTcGtiRe1/OjzW4hT4/XGyRe9wbAN4xn8InX3A9eVDTTtvsf+wRja7ha29TJbV6VWr+2J3gkO
 hZgUsUE7SSjFCq1ImUun6HYtAXW165jld8yhkMUpBHmPF/VB3xlTjwq1+wbXlA44kPe3Vi1q3
 ay4NSmORYrvknjIHqP7nuE3ZECpE0ByqsQ9KyKVrwvDrRyISc1Rs/zBl9ZYMZlE5xg+n9btNN
 7JEbQ4gCzc9jTJP5vZHRgQQVKGncr9C+7ZZtzkrZwaTrmr+85V/XuJCWHvK4MvkaAQNjkA7W3
 jEdhpbY9LMEKjJ5unzwls/577MQo0AfVmFEuQx5MZGxS4mYZYjGwHlEBSYIPhKSs4KZwUMQT4
 UrDSN6/mVVY9qAE1JkTqgDdYmX5vQdWSxAVrTDlVHnHJr3pe21X++vE9nDTNmw66y77VONaKd
 7VNpNCjFyeALf1apeF0MrEuHaKka6jaD/7MeDz/lB1CKb0EUahOTaoOG4Q+Fy7UVYSm4VjN7X
 pzxNubM50RQlzzxpP8slznkhzG8NEjDG5a16OjN/KDUA1x1Dc6bGW4dSOdYNlY3lk4pA4X7el
 WBIJEGwzYYzsp+4FvqC4HcGvoG9VC5Py9IAvd8BUxA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 09/04/2023 à 12:53, Michael Tokarev a écrit :
> linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
> used alloca() to allocate grouplist arrays, with unchecked gidsetsize
> coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
> is common for an application to allocate NGROUPS_MAX for getgroups()),
> this means a typical allocation is half the megabyte on the stack.
> Which just overflows stack, which leads to immediate SIGSEGV in actual
> system getgroups() implementation.
> 
> An example of such issue is aptitude, eg
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811087#72
> 
> Cap gidsetsize to NGROUPS_MAX (return EINVAL if it is larger than that),
> and use heap allocation for grouplist instead of alloca().  While at it,
> fix coding style and make all 4 implementations identical.
> 
> Try to not impose random limits - for example, allow gidsetsize to be
> negative for getgroups() - just do not allocate negative-sized grouplist
> in this case but still do actual getgroups() call.  But do not allow
> negative gidsetsize for setgroups() since its argument is unsigned.
> 
> Capping by NGROUPS_MAX seems a bit arbitrary, - we can do more, it is
> not an error if set size will be NGROUPS_MAX+1. But we should not allow
> integer overflow for the array being allocated. Maybe it is enough to
> just call g_try_new() and return ENOMEM if it fails.
> 
> Maybe there's also no need to convert setgroups() since this one is
> usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
> this is apparently a kernel-imposed limit for runtime group set).
> 
> The patch fixes aptitude segfault mentioned above.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v4:
>   - the same ret-vs-gidsetsize fix in getgroups32.
> v3:
>   - fix a bug in getgroups(). In initial implementation I checked
>     for ret>0 in order to convert returned list of groups to target
>     byte order. But this clashes with unusual corner case for this
>     syscall: getgroups(0,NULL) return current number of groups in
>     the set, so this resulted in writing to *NULL. The right condition
>     here is gidsetsize>0:
>     -            if (!is_error(ret) && ret > 0) {
>     +            if (!is_error(ret) && gidsetsize > 0) {
> v2:
>   - remove g_free, use g_autofree annotations instead,
>   - a bit more coding style changes, makes checkpatch.pl happy
> 
>   linux-user/syscall.c | 99 ++++++++++++++++++++++++++++++--------------
>   1 file changed, 68 insertions(+), 31 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 24b25759be..c532ee92c1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11433,39 +11433,58 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           {
>               int gidsetsize = arg1;
>               target_id *target_grouplist;
> -            gid_t *grouplist;
> +            g_autofree gid_t *grouplist = NULL;
>               int i;
>   
> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
> +            if (gidsetsize > NGROUPS_MAX) {
> +                return -TARGET_EINVAL;
> +            }
> +            if (gidsetsize > 0) {
> +                grouplist = g_try_new(gid_t, gidsetsize);
> +                if (!grouplist) {
> +                    return -TARGET_ENOMEM;
> +                }
> +            }
>               ret = get_errno(getgroups(gidsetsize, grouplist));
> -            if (gidsetsize == 0)
> -                return ret;
> -            if (!is_error(ret)) {
> -                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * sizeof(target_id), 0);
> -                if (!target_grouplist)
> +            if (!is_error(ret) && gidsetsize > 0) {
> +                target_grouplist = lock_user(VERIFY_WRITE, arg2,
> +                                             gidsetsize * sizeof(target_id), 0);
> +                if (!target_grouplist) {
>                       return -TARGET_EFAULT;
> -                for(i = 0;i < ret; i++)
> +                }
> +                for (i = 0; i < ret; i++) {
>                       target_grouplist[i] = tswapid(high2lowgid(grouplist[i]));
> -                unlock_user(target_grouplist, arg2, gidsetsize * sizeof(target_id));
> +                }
> +                unlock_user(target_grouplist, arg2,
> +                            gidsetsize * sizeof(target_id));
>               }
> +            return ret;
>           }
> -        return ret;
>       case TARGET_NR_setgroups:
>           {
>               int gidsetsize = arg1;
>               target_id *target_grouplist;
> -            gid_t *grouplist = NULL;
> +            g_autofree gid_t *grouplist = NULL;
>               int i;
> -            if (gidsetsize) {
> -                grouplist = alloca(gidsetsize * sizeof(gid_t));
> -                target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * sizeof(target_id), 1);
> +
> +            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
> +                return -TARGET_EINVAL;
> +            }
> +            if (gidsetsize > 0) {
> +                grouplist = g_try_new(gid_t, gidsetsize);
> +                if (!grouplist) {
> +                    return -TARGET_ENOMEM;
> +                }
> +                target_grouplist = lock_user(VERIFY_READ, arg2,
> +                                             gidsetsize * sizeof(target_id), 1);
>                   if (!target_grouplist) {
>                       return -TARGET_EFAULT;
>                   }
>                   for (i = 0; i < gidsetsize; i++) {
>                       grouplist[i] = low2highgid(tswapid(target_grouplist[i]));
>                   }
> -                unlock_user(target_grouplist, arg2, 0);
> +                unlock_user(target_grouplist, arg2,
> +                            gidsetsize * sizeof(target_id));
>               }
>               return get_errno(setgroups(gidsetsize, grouplist));
>           }
> @@ -11750,41 +11769,59 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           {
>               int gidsetsize = arg1;
>               uint32_t *target_grouplist;
> -            gid_t *grouplist;
> +            g_autofree gid_t *grouplist = NULL;
>               int i;
>   
> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
> +            if (gidsetsize > NGROUPS_MAX) {
> +                return -TARGET_EINVAL;
> +            }
> +            if (gidsetsize > 0) {
> +                grouplist = g_try_new(gid_t, gidsetsize);
> +                if (!grouplist) {
> +                    return -TARGET_ENOMEM;
> +                }
> +            }
>               ret = get_errno(getgroups(gidsetsize, grouplist));
> -            if (gidsetsize == 0)
> -                return ret;
> -            if (!is_error(ret)) {
> -                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 4, 0);
> +            if (!is_error(ret) && gidsetsize > 0) {
> +                target_grouplist = lock_user(VERIFY_WRITE, arg2,
> +                                             gidsetsize * 4, 0);
>                   if (!target_grouplist) {
>                       return -TARGET_EFAULT;
>                   }
> -                for(i = 0;i < ret; i++)
> +                for (i = 0; i < ret; i++) {
>                       target_grouplist[i] = tswap32(grouplist[i]);
> +                }
>                   unlock_user(target_grouplist, arg2, gidsetsize * 4);
>               }
> +            return ret;
>           }
> -        return ret;
>   #endif
>   #ifdef TARGET_NR_setgroups32
>       case TARGET_NR_setgroups32:
>           {
>               int gidsetsize = arg1;
>               uint32_t *target_grouplist;
> -            gid_t *grouplist;
> +            g_autofree gid_t *grouplist = NULL;
>               int i;
>   
> -            grouplist = alloca(gidsetsize * sizeof(gid_t));
> -            target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
> -            if (!target_grouplist) {
> -                return -TARGET_EFAULT;
> +            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
> +                return -TARGET_EINVAL;
> +            }
> +            if (gidsetsize > 0) {
> +                grouplist = g_try_new(gid_t, gidsetsize);
> +                if (!grouplist) {
> +                    return -TARGET_ENOMEM;
> +                }
> +                target_grouplist = lock_user(VERIFY_READ, arg2,
> +                                             gidsetsize * 4, 1);
> +                if (!target_grouplist) {
> +                    return -TARGET_EFAULT;
> +                }
> +                for (i = 0; i < gidsetsize; i++) {
> +                    grouplist[i] = tswap32(target_grouplist[i]);
> +                }
> +                unlock_user(target_grouplist, arg2, 0);
>               }
> -            for(i = 0;i < gidsetsize; i++)
> -                grouplist[i] = tswap32(target_grouplist[i]);
> -            unlock_user(target_grouplist, arg2, 0);
>               return get_errno(setgroups(gidsetsize, grouplist));
>           }
>   #endif

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent



