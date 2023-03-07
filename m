Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267916ADA66
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:32:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZTen-0002oP-Ps; Tue, 07 Mar 2023 04:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZTek-0002mk-4C
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:30:50 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZTei-0003ZU-4c
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:30:49 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N63mC-1qfwKb277w-016M8X; Tue, 07 Mar 2023 10:30:45 +0100
Message-ID: <c6d6c3f7-f7fd-afc1-7f64-c8bfe1f8193e@vivier.eu>
Date: Tue, 7 Mar 2023 10:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: Fix access to /proc/self/exe
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20221205113825.20615-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221205113825.20615-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RqjLcq+dOUBbC6GHs/mBnpRqG0t2PuGpJje6R+cszglkhAkN+z5
 U750RMXw2i+GauQYz0N760StZd9NyVXfmsTS6NsryCGbWtHvorQH9L7vX83EDlO4Zab/lLI
 2CqJpJdW30lqYypwiyGZZU7PcE2kH3hqSRRUcYPSdiDBZ3w7IsPqDG7tZOeP+3TngTI/yIH
 IKFCMCXxW58SBr6PchiOg==
UI-OutboundReport: notjunk:1;M01:P0:/69BHPMQINc=;tzHlY2f/afV0Iadc3v4hrii4V38
 hEEImGzZEQjUuXtLnuq+gr4o67KZmQfguWDmSKRFphMHsxAAC0bshEkL1W+a3sCAqfO+ZDx5Q
 ZRtHw51OInNKkxEjNO4m191bIW4ruF1oFePuu3Qj8/fAaNbPYq2ITlo+zJeADdfiJfwK9Z294
 q4BlP+svDRk47P4DWqN/PRe5lISXZukmwGfeAeV/YOGZS0tZoBehiwq/ySKrCw4sDrf7bIrHn
 xBagISIsCJYW/8eK9L0TzTwvSk3jMhcizzCgUtMTe0z/Y5MTx5lRIo/4BcMIl3f74il4CdJmv
 8d1t3YVCr9t29P1StvSWTauJe/t7jPkpLcQ98BT9FISTF+XK/nPYtSf7VV3T5EFmv4GLy6GQh
 ZOw4zYeRN0WiM6lBwN4mQkc77I3S/LFJnAeUjgHEdI9cqjK+mmTd+9KWPVq3q2kjEfCCpqZ1w
 518HJHdlH4PS+eDHeb0/ZtTriQHHrupxwg2pcG0qd/bLMzKZ5j6GPLKcC/psM6OgDQLPVkQbR
 ikU1t/6eh+jHb42Zr3SWBAhpMpeFCl9rgyNLBQ7IE11ViHflPsCuoWQ8wn8s4wI8YlWsFzNMR
 fQr1oFK4ue1NoJhjD3xtimo9xA5I4c454ewtWF1Rc/ZJATDV7YvAgz2ModW/Wgc2I+K5+WYsj
 CCp0c+5iPh982qLcEnl136UVyvFJSegepH+n5XI6pA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 05/12/2022 à 12:38, Helge Deller a écrit :
> When accsssing /proc/self/exe from a userspace program, linux-user tries
> to resolve the name via realpath(), which may fail if the process
> changed the working directory in the meantime.
> 
> An example:
> - a userspace program ist started with ./testprogram
> - the program runs chdir("/tmp")
> - then the program calls readlink("/proc/self/exe")
> - linux-user tries to run realpath("./testprogram") which fails
>    because ./testprogram isn't in /tmp
> - readlink() will return -ENOENT back to the program
> 
> Avoid this issue by resolving the full path name of the started process
> at startup of linux-user and store it in real_exec_path[]. This then
> simplifies the emulation of readlink() and readlinkat() as well, because
> they can simply copy the path string to userspace.
> 
> I noticed this bug because the testsuite of the debian package "pandoc"
> failed on linux-user while it succeeded on real hardware.  The full log
> is here:
> https://buildd.debian.org/status/fetch.php?pkg=pandoc&arch=hppa&ver=2.17.1.1-1.1%2Bb1&stamp=1670153210&raw=0
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/main.c    |  6 ++++++
>   linux-user/syscall.c | 34 ++++++++++------------------------
>   2 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index aedd707459..e7e53f7d5e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -64,6 +64,7 @@
>   #endif
> 
>   char *exec_path;
> +char real_exec_path[PATH_MAX];
> 
>   int singlestep;
>   static const char *argv0;
> @@ -744,6 +745,11 @@ int main(int argc, char **argv, char **envp)
>           }
>       }
> 
> +    /* Resolve executable file name to full path name */
> +    if (realpath(exec_path, real_exec_path)) {
> +        exec_path = real_exec_path;
> +    }
> +
>       /*
>        * get binfmt_misc flags
>        * but only if not already done by parse_args() above
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 0468a1bad7..71ae867024 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -10011,18 +10011,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>                   /* Short circuit this for the magic exe check. */
>                   ret = -TARGET_EINVAL;
>               } else if (is_proc_myself((const char *)p, "exe")) {
> -                char real[PATH_MAX], *temp;
> -                temp = realpath(exec_path, real);
> -                /* Return value is # of bytes that we wrote to the buffer. */
> -                if (temp == NULL) {
> -                    ret = get_errno(-1);
> -                } else {
> -                    /* Don't worry about sign mismatch as earlier mapping
> -                     * logic would have thrown a bad address error. */
> -                    ret = MIN(strlen(real), arg3);
> -                    /* We cannot NUL terminate the string. */
> -                    memcpy(p2, real, ret);
> -                }
> +	        /* Don't worry about sign mismatch as earlier mapping
> +	         * logic would have thrown a bad address error. */
> +                ret = MIN(strlen(exec_path), arg3);
> +                /* We cannot NUL terminate the string. */
> +                memcpy(p2, exec_path, ret);
>               } else {
>                   ret = get_errno(readlink(path(p), p2, arg3));
>               }
> @@ -10043,18 +10036,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>                   /* Short circuit this for the magic exe check. */
>                   ret = -TARGET_EINVAL;
>               } else if (is_proc_myself((const char *)p, "exe")) {
> -                char real[PATH_MAX], *temp;
> -                temp = realpath(exec_path, real);
> -                /* Return value is # of bytes that we wrote to the buffer. */
> -                if (temp == NULL) {
> -                    ret = get_errno(-1);
> -                } else {
> -                    /* Don't worry about sign mismatch as earlier mapping
> -                     * logic would have thrown a bad address error. */
> -                    ret = MIN(strlen(real), arg4);
> -                    /* We cannot NUL terminate the string. */
> -                    memcpy(p2, real, ret);
> -                }
> +	        /* Don't worry about sign mismatch as earlier mapping
> +	         * logic would have thrown a bad address error. */
> +                ret = MIN(strlen(exec_path), arg4);
> +                /* We cannot NUL terminate the string. */
> +                memcpy(p2, exec_path, ret);
>               } else {
>                   ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>               }
> --
> 2.38.1
> 
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent



