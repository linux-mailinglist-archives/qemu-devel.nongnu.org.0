Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03396AD178
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJF0-0001UG-2B; Mon, 06 Mar 2023 17:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZJEx-0001U8-MK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:23:31 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZJEw-0002Ca-2t
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:23:31 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N95mR-1qbyPo0qoB-0167rS; Mon, 06 Mar 2023 23:23:27 +0100
Message-ID: <3ed248db-c521-6ac4-72b5-3f61a0743c9a@vivier.eu>
Date: Mon, 6 Mar 2023 23:23:26 +0100
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
X-Provags-ID: V03:K1:DVyadmli0RhAIZrk7+uisNDge3qO8T4LbYqNjjyIdqAQIwOXeuC
 RuhOoQsPe26owW6aE5n9OsAZ0HddIZzzJeytV/RXQ9XsS9Dl6AbtOHZBoshmc0c0ga+X1bX
 mUV6JFhPK3LAzuIace/se+V1m0UsW6gQAcyvawq9oMrcB6P7GwfA4Jx01fFiZVVTkI9qYUU
 aQVOvfMbwNQ3P/+SptsPg==
UI-OutboundReport: notjunk:1;M01:P0:MnVEsKNc078=;StM8Suco8pU6J4aPcax57Uqg6FW
 FUEv/fpo8NfqaT3QCJ00krUfPwtvIkjfgHMPMnneqmP6eOunZTQNgBhBRc2zQyngcIKj4hygm
 ZT8uNMQQPDfGv6p6CNR2yH5toCPNae83yD1fkJ7zzlJQaWASCJiWk2xOjSzWutYqRERiZSmPR
 6EM2G3/zbfclCDrYbdgyfkl5yfPBMRJWUoiJKx1p3Qnmj5m1VF0x+qL1egUI6g/S1YBSsBPP2
 kkFHOTaEeQh1A9wNtmnfqDMegG8V/vIIpyw8Z0YnlclfMHpobb0p5adk8saNxWLQawHV1xn7z
 4KnMHIWOq/fu4EMz/EL5/vNBigsU593DxEtZZI1id0tDOoYSq8obM+HR/YWj0AOgiyZuB5nSX
 pMHzUgQ4lAXmY9RerriOCzMseamMPwFz6NJgxXFONlmTJPfiQdaXQ5QKo5dL3/Aran/Xwzy5P
 3VbHAhaSAJL+ilt9Ai8u6qEBO3MO4zBXUBvAyzQGU7uhBe+VGBd1aNKgl9wPKZ900KLkpZvga
 xaDLIBMuK0upZoYzu2Ljo+TegrA9XtBtKf5NsyMLsnG5dHQQpldlXN3ADIgvRsCeMOPNUkbbJ
 CsPpR/XX9UaXtN/uCSGQAztUDA52yD7wsJLR9z2hGVoun3rZYEuZu078+sVhs15OCaxHU2ZJh
 TJMWrWvKD6s6QtMNmcBJFGVe9gXgoBhn8VzHBAmRGA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

