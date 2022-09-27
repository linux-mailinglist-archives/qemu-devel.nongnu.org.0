Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1515EBDF0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:01:10 +0200 (CEST)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6Sj-0006sy-5s
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od6Od-0001RT-8K
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:56:55 -0400
Received: from mout.gmx.net ([212.227.17.20]:51847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od6OX-0006IZ-9n
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664269002;
 bh=70OT6iQmCF7KC/XRdRpgGC9DFYh+jw6H9HLX0HZdr+M=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=I0KRAauRUpZcBo3vJPcZoc01muaJgAeh8e3+M/OxpPt9ePK7K5fyScHHvXg3j1IM1
 SKFVWiGhjYrJqAJPvMwnmNa4c0TGLYTIbplnJoP0POx7xtN26DMLtcJtTMF5Nbs3n9
 0NQe1xf+FZrYzxHcbuglE4tsNdiTe27X680NyASQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.138.255]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1pGIp83xwJ-0153fc; Tue, 27
 Sep 2022 10:56:42 +0200
Message-ID: <27ebaa4d-eaa2-0590-92f1-679fd4178485@gmx.de>
Date: Tue, 27 Sep 2022 10:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 00/12] linux-user: Add more syscalls, enhance tracing &
 logging enhancements
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <3fe34e9b-d82d-7d30-b477-f870bdb3e88d@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <3fe34e9b-d82d-7d30-b477-f870bdb3e88d@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SLIrF4OAxgqasx7GM3ex967uRtSGg13HGGUk8SyrIItd91Y875n
 SXNvhpNJxxBThGQRAKI7S8Z1TDDXKHSV1FsVq19JVUwAVYR/J69uamXJeCrhz40Ck4oR7My
 kB/PRStKTjiTeSKcKJ7Tv0dcq3jyxBq/vbwmrWCs77UCpsl09nCdYlU+a58y/Qynol05d7v
 NztzTmDMWJMH7mnPxSBhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VOsgAvwKNXI=:LsAOEm8A+oIRiAwqV5M61h
 xCTuXbaP2uL4OwZ5DdAtTGUjPRqNLiPi+HRvTIBkPwILuRkgmDYh3ah8JMBJXogP5yY5j6htW
 4O7cliIuC2nJT7i/esqF/Xur1dz0R4V+CJWfc1up6AsDi7LH2Ccb6KiZer9yMMC47RsBELRg7
 pXCIvRAm5pHrCGfncblCA2WSudwO/Y3UmlMjpujti4Soc20zvxut8tvP6XsOkKhrEhHp8oFnU
 opeX5yTSIE4S8YgMDJ5WEzJNjb6iV1KYgKs6Jq2qdymsWTd7RZkubheLuSXN4Wvkd0rVk4wWm
 pSt7YEadMujyvy+yg7nzoS/TNZJGhQG7gVsYINeyJiyLdFrLf/BBeFfJF2L59L2zA2U3EW/S3
 RWsoco2nGMQnAIaLQtzSYLTZnQ2SJFGg91wf62bnEVnQa+CRGU3vWeyOw0ah+vVbkePYqCGOZ
 4veDh4e/PCAgm18z+3kcepE0rL4WP9AjA5wi4ADJfB1lii9SFxmY/cqcRGDlCxHLEas1PBjlJ
 wdg6s3GEvjyVQmhV2kBCaZWwQwL5CeEXhOTfYPwPiLud9VqE1yFPqQC5oa+opnaNKckwea+Fx
 5YY68yxDyZ639PqaCAJZd5Vm2S3ac4PhUhmiWh7L0UpfxXNNzonVo3FoUweva6i7Sx6+tjmDa
 lB08T4xu9zcCjjbHnVsLB9Iyg8qYPV3Ba5+AAckXdYHLu3nfBGrug2IaJY+bIK3NsB5guAD8Z
 tpAe2lLgJG2FI5Q83T14yrFHd17Xm/dDf4qMacQfAMIcF0cTY1wPGLTWvgQBjEQvOqapuxLVC
 Z+kiIIQ5aBfayFXCanLw74uRTmTAE2OpuMOgeTqiYE2EGNQRMp/8SIanuETef5ztNfHJAVsG8
 zytAmmf+p44Y0ajb99T4rcR+pLi/gD6O6IWrj+YX4Vy4VIp5dn7XhzbSTchXqqogBde7L4MBA
 v9fn5THbEr892ldNFWAwEH20ko0rrYlN3ykkFekDfwA7pW1JWRSvkL3SGcBCpXHZkD/GYXzPm
 MhSDi7EOVRtTvdagRUWsL7NUUaiRlkNCDtXcFTOJTiodKzNQEk+4hv6wPefXM8lEo2TPdcrX0
 bZ+7Y5L9jNeK44F8P4RODI+Q72aoYZZRyAYTTMX3zlvsXDljq7EM16Mn9kzi4bzmhAvKbtPmC
 6oeSC/mX59bIgPIA5S4PjAd2xW
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/27/22 09:32, Laurent Vivier wrote:
> Le 18/09/2022 =C3=A0 21:45, Helge Deller a =C3=A9crit=C2=A0:
>> Here is a bunch of patches for linux-user.
>>
>> Most of them add missing syscalls and enhance the tracing/logging.
>> Some of the patches are target-hppa specific.
>> I've tested those on productive hppa debian buildd servers (running qem=
u-user).
>>
>> Thanks!
>> Helge
>>
>> Changes to v2:
>> - Fix build of close_range() and pidfd_*() patches on older Linux
>> =C2=A0=C2=A0 distributions (noticed by Stefan Hajnoczi)
>>
>> Changes to v1:
>> - Dropped the faccessat2() syscall patch in favour of Richard's patch
>> - Various changes to the "missing signals in strace output" patch based=
 on
>> =C2=A0=C2=A0 Richard's feedback, e.g. static arrays, fixed usage of _NS=
IG, fix build when
>> =C2=A0=C2=A0 TARGET_SIGIOT does not exist
>> - Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
>> =C2=A0=C2=A0 unconditionally and turn into a switch statement - as sugg=
ested by Richard
>>
>> Helge Deller (12):
>> =C2=A0=C2=A0 linux-user: Add missing signals in strace output
>> =C2=A0=C2=A0 linux-user: Add missing clock_gettime64() syscall strace
>> =C2=A0=C2=A0 linux-user: Add pidfd_open(), pidfd_send_signal() and pidf=
d_getfd()
>> =C2=A0=C2=A0=C2=A0=C2=A0 syscalls
>> =C2=A0=C2=A0 linux-user: Log failing executable in EXCP_DUMP()
>> =C2=A0=C2=A0 linux-user/hppa: Use EXCP_DUMP() to show enhanced debug in=
fo
>> =C2=A0=C2=A0 linux-user/hppa: Dump IIR on register dump
>> =C2=A0=C2=A0 linux-user: Fix strace of chmod() if mode =3D=3D 0
>> =C2=A0=C2=A0 linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for =
hppa arch
>> =C2=A0=C2=A0 linux-user: Add strace for clock_nanosleep()
>> =C2=A0=C2=A0 linux-user: Show timespec on strace for futex()
>> =C2=A0=C2=A0 linux-user: Add close_range() syscall
>> =C2=A0=C2=A0 linux-user: Add parameters of getrandom() syscall for stra=
ce
>>
>> =C2=A0 linux-user/cpu_loop-common.h |=C2=A0=C2=A0 2 +
>> =C2=A0 linux-user/hppa/cpu_loop.c=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>> =C2=A0 linux-user/mmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>> =C2=A0 linux-user/signal-common.h=C2=A0=C2=A0 |=C2=A0 46 ++++++++++++
>> =C2=A0 linux-user/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 37 +--------
>> =C2=A0 linux-user/strace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 142 ++++++++++++++++++++++++++++++-----
>> =C2=A0 linux-user/strace.list=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 +++++-
>> =C2=A0 linux-user/syscall.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 50 ++++++++++++
>> =C2=A0 target/hppa/helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 6 +-
>> =C2=A0 9 files changed, 255 insertions(+), 59 deletions(-)
>>
>
> Series applied to my linux-user-for-7.2 branch,
> except PATCH 11 and 12 that have comments.

Thank you !!
I'll send updated versions for patches 11 and 12 asap.
Btw, where can I find your linux-user-for-7.2 branch?
It would help me to diff the new patches against this branch...

Helge

