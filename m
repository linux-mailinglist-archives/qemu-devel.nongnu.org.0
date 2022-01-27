Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86EE49E49B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:29:34 +0100 (CET)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5mH-00051W-VK
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5UE-0002VL-Px
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:10:54 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5UC-0001nK-QB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:10:54 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MSKq6-1movop0IwK-00SiI8; Thu, 27 Jan 2022 15:10:51 +0100
Message-ID: <22a4629f-6c1a-a6b1-d662-365a13bf4842@vivier.eu>
Date: Thu, 27 Jan 2022 15:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user: Fix inotify on aarch64
Content-Language: fr
To: Paul Brook <paul@nowt.org>, qemu-devel@nongnu.org
References: <20220126202636.655289-1-paul@nowt.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220126202636.655289-1-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y8dvVIfa47CLv75Huciae23uKF4WKeqk9kWbrRD3rswkH6IGTpg
 IZpeWHGyrfLzd4PBnCa2gZlaWoXKFvojXh34mVTsJo6jtRCgSfTQH4kiFtUk9NeacrzI50W
 i0WUkpx5I8p5LdyFNJfs1zgK5ChjbpFHwggrYwYqbcZIpINq9LxbUHUhIULCGYsBc8JJqJh
 dAHDFJgNgW7jA1g/gFWNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ezeymR9zgTA=:6cctEhoi8BWTdqzkvE071E
 Z0CyuYCDzfMWZJPzrBfoEMeRvr8UI0Ly0gsFX+d1uu658T4mMU877KZjdl8a4QFevAKZRVyXY
 +zMcsv48TRKmimdg/yAvuYX1imzLoMuV2uiaEKn7Oj2qMXM3h1TjKy5nwvvHNJM9QpVNXcnKC
 r/4zVmK8Qqt3RA/agrkoQ+2Belq0m7BMW03BPUorX+4fJLFrf8lrk7Y4wCcyB0JVect6AYpij
 /qnfFSrwtMq67xBLVsBPi+cDU3s0wGBYUk6SsRLIyd3I2CLGLsHe4JDxmOxb84XAU1Y6dHaBb
 c+4ee/c0XyXr/47WQULAVodjWAHg8fktImubtqjb55OzB9gNRQByAZOk+0CpSVOEvIUVSMZFv
 ciRYXSyJufLMmnUrn86NsxjjuwsDjlcG8B1qS9U4dwkftkwgCHORZixO9Kvvu2mM9z+q4tuSU
 tkDK2xsODEXEHKSVAPM8K6Urk6DRtF0ZCfYMBQpaitdwG5wqYKDi7iqbPWfWs7eAFsSMh2ODa
 S7Rm1qgfu8U+FFfSpGhWoGKCMeKIE2WC/zi8zAfl1Keu32ybg/49+DueCGtR8JCqrzc68fKKY
 VAWlwpmJRaDddVkxC3lt71M6uXL6Fvbk+SIDVz+U4vFRd3usTwZR62AZbIoAgEcoR4g72GZLG
 asbPMLhgXV0A2Frqs6WviKtXjLCeo75uEsM74ZMvTyxj+pjO0vp8G/rbRt412t1NW8xU=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/01/2022 à 21:26, Paul Brook a écrit :
> The inotify implementation originally called the raw host syscalls.
> Commit 3b3f24add0 changed this to use the glibc wrappers. However ifdefs
> in syscall.c still test for presence of the raw syscalls.
> 
> This causes a problem on e.g. aarch64 hosts which never had the
> inotify_init syscall - it had been obsoleted by inotify_init1 before
> aarch64 was invented! However it does have a perfectly good glibc
> implementation of inotify_wait.
> 
> Fix this by removing all the raw __NR_inotify_* tests, and instead check
> CONFIG_INOTIFY, which already tests for the glibc functionality we use.
> 
> Also remove the now-pointless sys_inotify* wrappers.
> 
> Tested using x86-64 inotifywatch on aarch64 host, and vice-versa
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>   linux-user/fd-trans.c |  5 ++---
>   linux-user/syscall.c  | 50 +++++++++----------------------------------
>   2 files changed, 12 insertions(+), 43 deletions(-)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 6941089959..30e7b49112 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1460,9 +1460,8 @@ TargetFdTrans target_eventfd_trans = {
>       .target_to_host_data = swap_data_eventfd,
>   };
>   
> -#if (defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)) || \
> -    (defined(CONFIG_INOTIFY1) && defined(TARGET_NR_inotify_init1) && \
> -     defined(__NR_inotify_init1))
> +#if defined(CONFIG_INOTIFY) && (defined(TARGET_NR_inotify_init) || \
> +        defined(TARGET_NR_inotify_init1))
>   static abi_long host_to_target_data_inotify(void *buf, size_t len)
>   {
>       struct inotify_event *ev;
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56a3e17183..17cc38fe34 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -272,9 +272,6 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
>   #if defined(__NR_futex_time64)
>   # define __NR_sys_futex_time64 __NR_futex_time64
>   #endif
> -#define __NR_sys_inotify_init __NR_inotify_init
> -#define __NR_sys_inotify_add_watch __NR_inotify_add_watch
> -#define __NR_sys_inotify_rm_watch __NR_inotify_rm_watch
>   #define __NR_sys_statx __NR_statx
>   
>   #if defined(__alpha__) || defined(__x86_64__) || defined(__s390x__)
> @@ -447,33 +444,6 @@ static int sys_renameat2(int oldfd, const char *old,
>   
>   #ifdef CONFIG_INOTIFY
>   #include <sys/inotify.h>
> -
> -#if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
> -static int sys_inotify_init(void)
> -{
> -  return (inotify_init());
> -}
> -#endif
> -#if defined(TARGET_NR_inotify_add_watch) && defined(__NR_inotify_add_watch)
> -static int sys_inotify_add_watch(int fd,const char *pathname, int32_t mask)
> -{
> -  return (inotify_add_watch(fd, pathname, mask));
> -}
> -#endif
> -#if defined(TARGET_NR_inotify_rm_watch) && defined(__NR_inotify_rm_watch)
> -static int sys_inotify_rm_watch(int fd, int32_t wd)
> -{
> -  return (inotify_rm_watch(fd, wd));
> -}
> -#endif
> -#ifdef CONFIG_INOTIFY1
> -#if defined(TARGET_NR_inotify_init1) && defined(__NR_inotify_init1)
> -static int sys_inotify_init1(int flags)
> -{
> -  return (inotify_init1(flags));
> -}
> -#endif
> -#endif
>   #else
>   /* Userspace can usually survive runtime without inotify */
>   #undef TARGET_NR_inotify_init
> @@ -12263,35 +12233,35 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_futex_time64:
>           return do_futex_time64(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
>   #endif
> -#if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
> +#ifdef CONFIG_INOTIFY
> +#if defined(TARGET_NR_inotify_init)
>       case TARGET_NR_inotify_init:
> -        ret = get_errno(sys_inotify_init());
> +        ret = get_errno(inotify_init());
>           if (ret >= 0) {
>               fd_trans_register(ret, &target_inotify_trans);
>           }
>           return ret;
>   #endif
> -#ifdef CONFIG_INOTIFY1
> -#if defined(TARGET_NR_inotify_init1) && defined(__NR_inotify_init1)
> +#if defined(TARGET_NR_inotify_init1) && defined(CONFIG_INOTIFY1)
>       case TARGET_NR_inotify_init1:
> -        ret = get_errno(sys_inotify_init1(target_to_host_bitmask(arg1,
> +        ret = get_errno(inotify_init1(target_to_host_bitmask(arg1,
>                                             fcntl_flags_tbl)));
>           if (ret >= 0) {
>               fd_trans_register(ret, &target_inotify_trans);
>           }
>           return ret;
>   #endif
> -#endif
> -#if defined(TARGET_NR_inotify_add_watch) && defined(__NR_inotify_add_watch)
> +#if defined(TARGET_NR_inotify_add_watch)
>       case TARGET_NR_inotify_add_watch:
>           p = lock_user_string(arg2);
> -        ret = get_errno(sys_inotify_add_watch(arg1, path(p), arg3));
> +        ret = get_errno(inotify_add_watch(arg1, path(p), arg3));
>           unlock_user(p, arg2, 0);
>           return ret;
>   #endif
> -#if defined(TARGET_NR_inotify_rm_watch) && defined(__NR_inotify_rm_watch)
> +#if defined(TARGET_NR_inotify_rm_watch)
>       case TARGET_NR_inotify_rm_watch:
> -        return get_errno(sys_inotify_rm_watch(arg1, arg2));
> +        return get_errno(inotify_rm_watch(arg1, arg2));
> +#endif
>   #endif
>   
>   #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


