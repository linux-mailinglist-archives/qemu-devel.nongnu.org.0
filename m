Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6416B31ADB0
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 20:14:02 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB0Mj-0005Xp-7s
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 14:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0LX-00052E-5G
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:12:48 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0LS-0002zK-4Y
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:12:45 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MzyAy-1m84VP45zS-00wzYK; Sat, 13 Feb 2021 20:12:30 +0100
Subject: Re: [PATCH] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20210210061214.GA221322@ls3530.fritz.box>
 <5fb8b28c-a78f-2523-067d-bfc4c06e27af@vivier.eu>
 <2734966e-ab5d-aa38-d3a6-0133e5900457@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9153ab76-459b-8dc0-6682-445e2692b54e@vivier.eu>
Date: Sat, 13 Feb 2021 20:12:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2734966e-ab5d-aa38-d3a6-0133e5900457@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JmiNdct09qNwDXAmJJdxwjIU9vanLzKDzjH5jgr02T3V9bu9vy0
 dtG4+DwPLjDdnDfF4Z6ofOcoUrvR2TWxbc0mTKGClQzI2vn0aTJcpoW/2koZar3xplvNMTJ
 gpngCNRjhd4ZkvfdhuLB6OTuewfk4jGdqHeHOQ8QXCD4Cx8eHr3AHKAv7KVbUbA8BfYP0Sj
 gyK1gCYEQFeSh4UdixYkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XP7frJP/0Js=:PpT4C2JsisHL8XbVAi0WcE
 48I+nqyWlNHE97t7q6oiMeUAHZSa1r8xl1epJy9z95AJHlpS+ZTTb37+NF0HrHqSKdX8XShxL
 KOr40pkDLKKdQRe4RoIoebPejyghpqhR73ithVTScXKtL1Keje9/E9pi32Yg1NCPMjizun0vL
 tFgER8nPfTPb95ueSP6c71FeXUw/a1D78qrK9Mpeb4HbIZV0py0MtaiKhxe/QvKd8i1hSnI41
 aeFaaj14BMAuH/bEFHDWfOHmKqaICNmg787UgdNgww+CbmCGfhYxWWmSRCiqrWgu/aFcOHH17
 icGXLb7x3aJ8cSYTV3j0kZRsb6ggGM/mmMMosQ6cg6MyNedZItJV0J7Occ705/u8ZqUTyujJI
 hYeKGR3U9DvMqLjQ67+ab/wu8zr4CvyC8zi4LPgH2Oe8ozNzdQ237dkrf48pYgn2xKKXdyOfs
 eYq1DvNW2w==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 13/02/2021 à 20:05, Helge Deller a écrit :
> On 2/13/21 5:38 PM, Laurent Vivier wrote:
>> Le 10/02/2021 à 07:12, Helge Deller a écrit :
>>> On the hppa target userspace binaries may call signalfd4() and
>>> eventfd2() with an old TARGET_O_NONBLOCK value of 000200004 instead of
>>> 000200000 for the "mask" syscall parameter, in which case the current
>>> emulation doesn't handle the translation to the native O_NONBLOCK value
>>> correctly.
>>>
>>> The 0x04 bit is not masked out before the new O_NONBLOCK bit is set and
>>> as such when calling the native syscall errors out with EINVAL.
>>>
>>> Fix this by introducing TARGET_O_NONBLOCK_MASK which is used to mask off
>>> all possible bits. This define defaults to TARGET_O_NONBLOCK when not
>>> defined otherwise, so for all other targets the implementation will
>>> behave as before.
>>>
>>> This patch needs to be applied on top of my previous two patches.
>>>
>>> Bug was found and patch was verified by using qemu-hppa as debian buildd
>>> server on x86_64.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> ---
>>>
>>> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
>>> index 08e3a4fcb0..4eb0ec98e2 100644
>>> --- a/linux-user/hppa/target_fcntl.h
>>> +++ b/linux-user/hppa/target_fcntl.h
>>> @@ -9,6 +9,7 @@
>>>   #define HPPA_TARGET_FCNTL_H
>>>
>>>   #define TARGET_O_NONBLOCK    000200000
>>> +#define TARGET_O_NONBLOCK_MASK 000200004 /* includes old HP-UX NDELAY flag */
>>>   #define TARGET_O_APPEND      000000010
>>>   #define TARGET_O_CREAT       000000400 /* not fcntl */
>>>   #define TARGET_O_EXCL        000002000 /* not fcntl */
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 27adee908e..3031aa342f 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -273,6 +273,11 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,    \
>>>   #define TARGET_NR__llseek TARGET_NR_llseek
>>>   #endif
>>>
>>> +/* some platforms need to mask more bits than just TARGET_O_NONBLOCK */
>>> +#ifndef TARGET_O_NONBLOCK_MASK
>>> +#define TARGET_O_NONBLOCK_MASK TARGET_O_NONBLOCK
>>> +#endif
>>> +
>>>   #define __NR_sys_gettid __NR_gettid
>>>   _syscall0(int, sys_gettid)
>>>
>>> @@ -7719,7 +7724,7 @@ static abi_long do_signalfd4(int fd, abi_long mask, int flags)
>>>       sigset_t host_mask;
>>>       abi_long ret;
>>>
>>> -    if (flags & ~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC)) {
>>> +    if (flags & ~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC)) {
>>>           return -TARGET_EINVAL;
>>>       }
>>>       if (!lock_user_struct(VERIFY_READ, target_mask, mask, 1)) {
>>> @@ -12508,7 +12513,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>>   #if defined(TARGET_NR_eventfd2)
>>>       case TARGET_NR_eventfd2:
>>>       {
>>> -        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
>>> +        int host_flags = arg2 & (~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC));
>>>           if (arg2 & TARGET_O_NONBLOCK) {
>>>               host_flags |= O_NONBLOCK;
>>>           }
>>>
>>
>> You might also update fcntl_flags_tbl[], the first column is the mask.
> 
> No, I intentionally did not updated the fcntl_flags_tbl[] entry.
> The check in target_to_host_bitmask() is:
>         if ((target_mask & btp->target_mask) == btp->target_bits)
> and the table entry is:
>  { TARGET_O_NONBLOCK,  TARGET_O_NONBLOCK,  O_NONBLOCK,  O_NONBLOCK,  },
> 
> Application may hand in 000200000 *or* 000200004 as value.
> So checking (value & 000200000) == 000200000 is correct for both cases.
> 

Yes, you're right.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


