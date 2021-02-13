Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AF31ADBA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 20:18:23 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB0Qw-0006jx-Sv
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 14:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0PZ-0006JS-Nj
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:16:57 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:47669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0PX-0003P7-D5
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:16:57 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRmo8-1lICV344AE-00TGSO; Sat, 13 Feb 2021 20:16:48 +0100
Subject: Re: [PATCH] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20210210061214.GA221322@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fb16d5fb-6e86-2723-7899-15df7a4dd659@vivier.eu>
Date: Sat, 13 Feb 2021 20:16:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210061214.GA221322@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6qTm+sK+Bf+vaMg3ZJbbCYTaN6ZMLxpY0MtIh8k6Xjoo5LZhPGW
 DTmicAg/NVWxkS3+p0WjxvTUIeAA8QMSBxuByZDMwiK2xMC7AZuag1wuBv0w8HDyhX85O7O
 AlX3rYo7mNeleAbdV//CTbgsu7iX/wH8ZNgzAb/vwAqO6akqf5wLbPlHyrJ7RVZP5URAfMB
 4iFQQWIZ11+HLuySbZS3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nQKSOHLh62w=:hpMuGKWOxCqOIgR6rbEHdm
 4igw8Eicr25LttZwEeK6EMU9e7HYD/HsebVSKvg/y5XiP0R/jD7kd+tug2ZWlCQ55ztoVa+6O
 l60cKCDQdInjnttfvwqgUXYTWxaFscFy9kjyRnFzDlIi9Byttwkc2TZ4A5wdkjDAev3uzg8E0
 27SJl0MObgMClSeiv72a5wUyJO8VZYaZ89a0OzZTj7JDl03PXDrTFDccaQXwmLYpGGUL4c3Ms
 w4amQsz4QQu3CFelF5L5Z0ZZbRel4nv/cfhFpTIk1Q8pKD+xRsnvzjUEOjeCrD91KZo72aVxQ
 MVkRUNHdFUclQcU1lAuh4iPhCXESSexLwDLsJjSp65c4+E8z/FqdfME94jX7AIM38F6O/fcjK
 exf2c+EVqM17pGVwRA1R+YY+vQuXMVrPhx48LG6jpRW7gMkhG/VcZ6BF5A2TKmY3XBwcS42Qd
 ndyaCz0Fqg==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: John David Anglin <dave.anglin@bell.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/02/2021 à 07:12, Helge Deller a écrit :
> On the hppa target userspace binaries may call signalfd4() and
> eventfd2() with an old TARGET_O_NONBLOCK value of 000200004 instead of
> 000200000 for the "mask" syscall parameter, in which case the current
> emulation doesn't handle the translation to the native O_NONBLOCK value
> correctly.
> 
> The 0x04 bit is not masked out before the new O_NONBLOCK bit is set and
> as such when calling the native syscall errors out with EINVAL.
> 
> Fix this by introducing TARGET_O_NONBLOCK_MASK which is used to mask off
> all possible bits. This define defaults to TARGET_O_NONBLOCK when not
> defined otherwise, so for all other targets the implementation will
> behave as before.
> 
> This patch needs to be applied on top of my previous two patches.
> 
> Bug was found and patch was verified by using qemu-hppa as debian buildd
> server on x86_64.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> 
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
> index 08e3a4fcb0..4eb0ec98e2 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -9,6 +9,7 @@
>  #define HPPA_TARGET_FCNTL_H
> 
>  #define TARGET_O_NONBLOCK    000200000
> +#define TARGET_O_NONBLOCK_MASK 000200004 /* includes old HP-UX NDELAY flag */
>  #define TARGET_O_APPEND      000000010
>  #define TARGET_O_CREAT       000000400 /* not fcntl */
>  #define TARGET_O_EXCL        000002000 /* not fcntl */
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 27adee908e..3031aa342f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -273,6 +273,11 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
>  #define TARGET_NR__llseek TARGET_NR_llseek
>  #endif
> 
> +/* some platforms need to mask more bits than just TARGET_O_NONBLOCK */
> +#ifndef TARGET_O_NONBLOCK_MASK
> +#define TARGET_O_NONBLOCK_MASK TARGET_O_NONBLOCK
> +#endif
> +
>  #define __NR_sys_gettid __NR_gettid
>  _syscall0(int, sys_gettid)
> 
> @@ -7719,7 +7724,7 @@ static abi_long do_signalfd4(int fd, abi_long mask, int flags)
>      sigset_t host_mask;
>      abi_long ret;
> 
> -    if (flags & ~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC)) {
> +    if (flags & ~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC)) {
>          return -TARGET_EINVAL;
>      }
>      if (!lock_user_struct(VERIFY_READ, target_mask, mask, 1)) {
> @@ -12508,7 +12513,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>  #if defined(TARGET_NR_eventfd2)
>      case TARGET_NR_eventfd2:
>      {
> -        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
> +        int host_flags = arg2 & (~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC));
>          if (arg2 & TARGET_O_NONBLOCK) {
>              host_flags |= O_NONBLOCK;
>          }
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent

