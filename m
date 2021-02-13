Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6F31AD2A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:39:48 +0100 (CET)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxxS-00057D-MA
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxwI-0004gl-KG
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:38:34 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:53813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxwD-0008Gd-Pj
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:38:34 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7ayR-1lEZUp0t5B-00809d; Sat, 13 Feb 2021 17:38:22 +0100
Subject: Re: [PATCH] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20210210061214.GA221322@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5fb8b28c-a78f-2523-067d-bfc4c06e27af@vivier.eu>
Date: Sat, 13 Feb 2021 17:38:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210061214.GA221322@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xUbGQn3MKqNKrGEa6sjnmjwqmsKdW4E/4vfc1Rny1ao8n+2zwPt
 4N3oHczPD12NHw2wfPKf9NqONIZ4Hj1vwOT9MTweanX2VZkSQCATuxjMfum6BD0Xqn/zFCk
 6JAP6YnTgJBF/WuGGEf37kx9bwigGI8hVVTCdACuOTS0g8IGCQfSt1VV/iPypLxlc8nm203
 UU1p+p2REh6EsqxidN+lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Al3g2LQCrY=:0l/VtSiqRoa+W8d3JMHLqQ
 azotxUXt5nBc8iCK53Tp8rJ6hiTNtmCR4qeCIfT1PtDXxW1WyAXSWCRiDKL0Bm+L0HKOseB2w
 e9ZLh7SMWXPUjNp1hMhkTP639lzTVF7IyIKmaRnYN3V19nELX0hszeYH5OntjdrBzIfr9lxBb
 nRp7K6z9NT9/ZJCH/+INV9Rc3mq6Z6V1g3cDSgT5q1yon4vuaRpbSFW9q5V2ZrJrQi6LlEU0h
 OUg8NcaRjQ+VLEa9yishqKqagDlrvTw/xyuRIk/9pUFqAHsXcjszgBPz7KF3T2rTRKhWt0rsr
 C2xqMP3tUqKDcEIr4RcRgarYXxUzJb1sjerWUQHS+kTrP/Bkh6LZ8+u6+nG9e5H/6uzeD0WSt
 3WooWvmEL4ni3bCgv83RuAfO0KR9E3V9TR57sAUch+FPouD+9jZBAAlhIlcoioxqS12AZfjpu
 0d2GqNqiuw==
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

You might also update fcntl_flags_tbl[], the first column is the mask.

Thanks,
Laurent
-

