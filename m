Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACE320EDE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 02:04:50 +0100 (CET)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDzeb-0006b3-M2
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 20:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lDzdC-0005jq-GD; Sun, 21 Feb 2021 20:03:23 -0500
Received: from mout.gmx.net ([212.227.15.18]:56405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lDzdA-0007iY-H0; Sun, 21 Feb 2021 20:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1613955797;
 bh=qSG8HScilh30HbqPmdtVzMwzSrOesDAFb8UDFj8fL0M=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=AqMi6vzNHaRXqdn2xg+N1T+UKwc9awWJbIPJXCf8PtWRRSC+4xYhgC+e4cRDhoexk
 new8oEHX8Nn0fGGDZFK9z+ztMO94AEP/YpyLDmdqs3x4pZc9yNi3dOMzXQ3gZxhYD3
 6P7/4+5gswC1e5a5swmca91345wmeCmxmwDwwR34=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.210]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf0BM-1lkbM71G9q-00gYyM; Mon, 22
 Feb 2021 02:03:17 +0100
Subject: Re: [PATCH] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
To: qemu-stable@nongnu.org
References: <20210210061214.GA221322@ls3530.fritz.box>
 <fb16d5fb-6e86-2723-7899-15df7a4dd659@vivier.eu>
From: Helge Deller <deller@gmx.de>
Message-ID: <194053d3-eea4-6e6d-0be3-870136bee23b@gmx.de>
Date: Mon, 22 Feb 2021 02:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fb16d5fb-6e86-2723-7899-15df7a4dd659@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p9q/Tgg0pZP/HX5vMDzb9vWMF/azFR7tikdmvdGeSt6ZdEL4x3V
 HvmKRMGab+NnN+CPwiUjOMqGq9avOdMw2jvPQEy1I+sp48Uuh6YagTFP8Vx70seFTPZvx4I
 5ih2v5J2kdB+pJzIntGHqGUnAB2++yGsg5IGsBEFzoki7t18RRTkllcDMIxtqWy7+5UMBXM
 yrnyTHHpptsnrkUSFMN5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dJzjq4qkK48=:FV6E7kpeOQ7vPxFO/rB9du
 MdoXd5QDSstlCS6kbt8Ff1yNyRyb60vJXfmNgH1p5hYPZRRhT4YPBlYKKATi+THJQErgWlNrJ
 gh/WKEOU1VTcbyhTxLF4Iha/pxvNiaZzVjAC8SqiUnz52i++PjpZa4N0ew3l4+07xdLwrBCXC
 6GKNCS2v01jdRg32NhUSozFSxRqpw/G1ENLfWwZzeYDdfbBpW/nnMne1X6dPBvL13cYHIby+c
 sBQr03n9oVLCnfUM2N4Q/tihTTIBHICu65t7dJWvUSmdOMWW/fovRkSjSB0s+jcFncWbh7hqI
 FQfJmMtlTnBLaaGPakSvoBbb/8uXLa8iHOd/98z4fhAWZcvvv5c4Mh3e4UQdNWIPNuTmKLjJv
 dbWOJ0UfTlCOv00xjNysR3lQBqflUZUl96JzPsKAIdu6ulRnZRTEHqqM7eeMvxS59XTIqAr9r
 PEjpThOzTt9PRDteL28UrKlUrREGT2iToYOt1QEcXYan4fpAaAf7lEfgOM2W6njspBvxE8h1W
 6zHaVl8d7c1VKMtMhFPFEOVnUHC8GEQn5L6dCL24plKFyGW2hw9SZjZNTrQ6uVGRtUfE+D4o+
 6C4pZcnCqwff9wJWRaoa8aAkn+Q2ApejpExtgY55nyHZ2IaIvCSIRw01DQFqTDhfbaq4YleIA
 d3ECQugHhfLw03Pv986OuXsCiO0Xjr/2tm7SVi5VG6Og0rTYegIwFcL/d8/pK20ygPwue2VZt
 GnkQ0MrWwe8PO01cPqeFUP2ftc8manLB7MyH+75l9+toO/Ma5nENA1sGpmb14POymzbO/BuD+
 +9p05S+4K6FVXOWuVOLKnwhnh0+uMhdp+APJxFZUXpG5k+Eps1+Y0L8rbFTBDX5TcQukAuPoQ
 E/pMB55Ak+rBDD7YpVaA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear qemu-stable,

can you please consider adding this patch to the qemu-stable branch.
Upstream commit 78721301138114cf37fb179a6cf73a27c1b3a927
Thanks,
Helge


On 2/13/21 8:16 PM, Laurent Vivier wrote:
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
> Applied to my linux-user-for-6.0 branch.
>
> Thanks,
> Laurent
>


