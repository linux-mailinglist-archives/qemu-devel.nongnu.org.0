Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D68C31ADAB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 20:06:51 +0100 (CET)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB0Fm-0002l2-GT
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 14:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1lB0EZ-0002Kj-D9
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:05:37 -0500
Received: from mout.gmx.net ([212.227.17.22]:56867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1lB0EU-0002jm-Nq
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1613243115;
 bh=eaWrUB2yGoIbmN4PFI45V4OUfSjNhQrO59sQvb4MSmQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=k/WmckWluxizq+BRBnc4q7Wc/xi5a60CyBUejYXXMzcuefku4t/WoOmBrqU31qB1b
 f0FbExnRnEBJXLbFx1BHKFliIPeEYuBSYEF9jo77U0qVvUMQ3dx0Sqzqljdb5W3U11
 bf56EG4ikxWz3VJlEb8FRjD5amBtXAwqmcV669to=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.198]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOKc-1m1SvF0UHu-00uv7C; Sat, 13
 Feb 2021 20:05:15 +0100
Subject: Re: [PATCH] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210210061214.GA221322@ls3530.fritz.box>
 <5fb8b28c-a78f-2523-067d-bfc4c06e27af@vivier.eu>
From: Helge Deller <deller@gmx.de>
Message-ID: <2734966e-ab5d-aa38-d3a6-0133e5900457@gmx.de>
Date: Sat, 13 Feb 2021 20:05:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5fb8b28c-a78f-2523-067d-bfc4c06e27af@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nqdZpgGXstwSO90dlPb0uXxPgekFmzBlpRtLxMCaDdwVya/q0Cj
 b/rMKmmKOLCBuYuc6N4H7HAP9ebQystxoJSLQi8QDoa7OTC6JRatxRNfkyuJ3cvbjxCuk1R
 iIQfWk6GiJL0BH0EBSn5KH2Bx3OrbyXcXCk2eITO4D/tcZZJLWP7f8RCWvAnFNsVj6WQc+q
 Y7USMIiIOfELs/aF8GJiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dWN8auswuy0=:gG/6vE+Zq0x3cNRbXLrrrL
 DyvJKikLqmAzm+9hkHhKuy1Ou/0qmDxgvim8ORTCjRqHsQ0+cLhX4t6PWCyCyg0z0gOjxaBGS
 /uZw2HlL2IPIt6VLh1wcn2rssYOq60PV4sICSApLol6NIw7MutatsMtDswim+5IDu21FHvpBs
 BJKlP0dV3505WoxmwdYxsVERcx3Zpyz3oQRkBsTLfcxqJ8JX8cVygkq15zQEOkb1jf3nqim5S
 w2c9l8QQr5A9R8D62Tj6WFLeBPyN+0WFibekbzLAdDmbqjPcXTfsanrHojpnXgyZVqZpaPPwq
 /9ltU5F2ZaCEXqlebbrNgp4Urv0C1HawHY/z8RL+KErF3Fat6RtwAmp55TAKjuHgduVcux0ox
 lKttRdUl6+q2v94eUjxwng7QuJQ2wpn3WY1Jr1a/8eYlkK6gjEiD5gj4nv4oDqwG/KSTBTWPk
 lfeM4WW1xvFnSKiIJxZdFS5CHOuZvAH62gunLS97XnBXBN+Ou3DSNVdWtPOLfH5D27YrIyldB
 phApWCkNGmuBALsXvAL6Q/MQPPl6ve5KKhwq2SM38rLBLpx7eHGSJkugSKSg47aRz2Gyf8fNB
 iA8Jm8DRd3sggHITYfEfd9k5K1HFz/sxI3wP7DbnpiDyDH5gpFZZ2YrXfOfBzZIQ17EQCb425
 NLteUm12dnVVoK/LDfwdVBOmdlJtX1n07k9WPy6/MK3Y0zSCoAxmdosC8I12WW8daBV3stu9t
 lgDqigG12GxvyxJG3WqrNXqc8bWK7O3sqVL6SGGZrn2XoF1Y5onlUnkhcjcdMCt8kU7t5RW/p
 /b/nbdlraV0KNapdG1uHcwSVS5M2MBRZTzB5nOlJSmyPossKN5CC4sISuYTvvPWbXjZRmkGJj
 djCa0kabr/j+XIfxNkKw==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/13/21 5:38 PM, Laurent Vivier wrote:
> Le 10/02/2021 =C3=A0 07:12, Helge Deller a =C3=A9crit=C2=A0:
>> On the hppa target userspace binaries may call signalfd4() and
>> eventfd2() with an old TARGET_O_NONBLOCK value of 000200004 instead of
>> 000200000 for the "mask" syscall parameter, in which case the current
>> emulation doesn't handle the translation to the native O_NONBLOCK value
>> correctly.
>>
>> The 0x04 bit is not masked out before the new O_NONBLOCK bit is set and
>> as such when calling the native syscall errors out with EINVAL.
>>
>> Fix this by introducing TARGET_O_NONBLOCK_MASK which is used to mask of=
f
>> all possible bits. This define defaults to TARGET_O_NONBLOCK when not
>> defined otherwise, so for all other targets the implementation will
>> behave as before.
>>
>> This patch needs to be applied on top of my previous two patches.
>>
>> Bug was found and patch was verified by using qemu-hppa as debian build=
d
>> server on x86_64.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> ---
>>
>> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fc=
ntl.h
>> index 08e3a4fcb0..4eb0ec98e2 100644
>> --- a/linux-user/hppa/target_fcntl.h
>> +++ b/linux-user/hppa/target_fcntl.h
>> @@ -9,6 +9,7 @@
>>   #define HPPA_TARGET_FCNTL_H
>>
>>   #define TARGET_O_NONBLOCK    000200000
>> +#define TARGET_O_NONBLOCK_MASK 000200004 /* includes old HP-UX NDELAY =
flag */
>>   #define TARGET_O_APPEND      000000010
>>   #define TARGET_O_CREAT       000000400 /* not fcntl */
>>   #define TARGET_O_EXCL        000002000 /* not fcntl */
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 27adee908e..3031aa342f 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -273,6 +273,11 @@ static type name (type1 arg1,type2 arg2,type3 arg3=
,type4 arg4,type5 arg5,	\
>>   #define TARGET_NR__llseek TARGET_NR_llseek
>>   #endif
>>
>> +/* some platforms need to mask more bits than just TARGET_O_NONBLOCK *=
/
>> +#ifndef TARGET_O_NONBLOCK_MASK
>> +#define TARGET_O_NONBLOCK_MASK TARGET_O_NONBLOCK
>> +#endif
>> +
>>   #define __NR_sys_gettid __NR_gettid
>>   _syscall0(int, sys_gettid)
>>
>> @@ -7719,7 +7724,7 @@ static abi_long do_signalfd4(int fd, abi_long mas=
k, int flags)
>>       sigset_t host_mask;
>>       abi_long ret;
>>
>> -    if (flags & ~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC)) {
>> +    if (flags & ~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC)) {
>>           return -TARGET_EINVAL;
>>       }
>>       if (!lock_user_struct(VERIFY_READ, target_mask, mask, 1)) {
>> @@ -12508,7 +12513,7 @@ static abi_long do_syscall1(void *cpu_env, int =
num, abi_long arg1,
>>   #if defined(TARGET_NR_eventfd2)
>>       case TARGET_NR_eventfd2:
>>       {
>> -        int host_flags =3D arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOE=
XEC));
>> +        int host_flags =3D arg2 & (~(TARGET_O_NONBLOCK_MASK | TARGET_O=
_CLOEXEC));
>>           if (arg2 & TARGET_O_NONBLOCK) {
>>               host_flags |=3D O_NONBLOCK;
>>           }
>>
>
> You might also update fcntl_flags_tbl[], the first column is the mask.

No, I intentionally did not updated the fcntl_flags_tbl[] entry.
The check in target_to_host_bitmask() is:
         if ((target_mask & btp->target_mask) =3D=3D btp->target_bits)
and the table entry is:
  { TARGET_O_NONBLOCK,  TARGET_O_NONBLOCK,  O_NONBLOCK,  O_NONBLOCK,  },

Application may hand in 000200000 *or* 000200004 as value.
So checking (value & 000200000) =3D=3D 000200000 is correct for both cases=
.

Helge

