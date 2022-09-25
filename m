Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9145E93F6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:29:33 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTZU-0002pC-Qu
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocTXY-0000Hh-Iw
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:27:34 -0400
Received: from mout.gmx.net ([212.227.17.22]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocTXW-0006Xq-Cd
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664119646;
 bh=IR2Pf1ar4zDG/hxvgIDXS/yVayl7PUot43SW189uSCY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=kZnj673BfGRMkNyCF1KYUnNz2nUIE1UB3izA1S0/olsXEiSdPqBe2qrKHeHJe1bti
 Ih038MceusG3aQbmsUq+oDaufVuBQmZM9K50N56ItURQent7qW7SoBR1yZQpT24sYV
 Scyr7p2J4mR/JaJJw4Q03Dc2xy7Fb8Fse/Ff1VYg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKhm-1osLQN43QY-00OrZn; Sun, 25
 Sep 2022 17:27:26 +0200
Message-ID: <2ccd28da-552b-722e-0534-df41c1962432@gmx.de>
Date: Sun, 25 Sep 2022 17:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 02/12] linux-user: Add missing clock_gettime64()
 syscall strace
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-3-deller@gmx.de>
 <5499dddd-4e60-ae0c-eaf4-ad56561f3585@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <5499dddd-4e60-ae0c-eaf4-ad56561f3585@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6CsErSpzsoL9+pPjlL9McWKy4b+ryk+ZeQQKn7fC8jsUNb6Q7V7
 GModWmRl2yy9pSB29oTaiUTbtVV7Bep3z37bJmf80RRNZmfi3jgE4XR+zVseZ/r8nWX2Cut
 pjglgNdIOrmmGZZd6XLvPifhgWMICkyiekhrn+QAoRpMGl4qnYf9W/BmxkcPdp4v1mjn4Ci
 Z9Pkbl+uG4UW5PcYeM/xg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g30K6F8E1Wo=:HBfWyafeAWGab1c1XK3jCZ
 JO7bg5WEvw7kMQCYx9rR20GWJLXkbF9o0lpkIK/++IQMHdKjd47KosEwwCA9yS5/Z5q7PwPnI
 LvaxX8F10IYL2xRKTFp4fmlZfLZMvoOO1ie/xmvrxuHPpo1msUxPN+quHWuB4mwcewbbA5m8o
 eDOlkd92tG/M3zdkoVdiGGVCE8TcDujA2sT+MPKJMC6f7MUq0PP4SWGBo90VtoefIv3K2uOLa
 KpEC2bQM6hdbxne44g7ZXH9fjrAPxcpsckj32OQpp39KEXmae3qK5UAHx6Buf9rarVK3xIvMy
 CI8Wny5hnTKXolUIst5w9Hltkvnoadmv3ROUCchf+h1BadVZA2XIYytnUFV61IgzGS7zpUrwn
 Ubk7qQZxVzXV8CfaQ9ZrkmMChRq80ewpPauzrOQcaFga4agKZLLiGqM/vPSgRDHWfPtsMwOtH
 bmuTiaLWFqqUNy4HQ4vz/LoJldH9XQd0sF3ZlEYQsR+UTyiNj1uSi1AUBjh03o54N+tt1DpAd
 maf8imnzofYM5lhXrvw1j81VWLZgt3afKY5iAoqKN3mLLd+TRt3bDolXDl78RwZozLUIt8eub
 /HKq6+iBeuIzA1i7j79/BsocQ023OCSqCoBJJSa6uxuoclnGtQuJ+a10Te98/PKjOp2sJx97g
 JKwruOPyi5+T/yd64Zx76v3jRgDoAf01VLUsKfmar3jAvpAajN5CKjaVTbQJ6xdcfEoiGlwe8
 C10r+9DR5STbF4JMW01myxjExzRLT+qaUo8w2DmBL2Mg0cDv8c6RvORGc7uX81Dwv4DWk1j51
 58YvbFlHUZ+JPj0m/ykiKaQ6xN5t8S0bYohpvewuYwYRJEpvs3odQkdPLd0qRvhazJlwZX3N2
 zrlyljq1xFecVc1Aj2Hqg82TJwV+5RxY8u0H+rlTejuNg8ah+GZ2wcITnIzEyM2a3PHYWHE8D
 n+vCZTz2RAVkTR8+Kf5S6Db2Rd+uN6fyZZEwTl+RPKiRVCPxZaaLMH5juoYMtgf6ZKQEQA4ex
 ew4TaSky7i0WYqXatRgTapcyUPUmWv5FtSBQXY+342rSJ6WpEY0xG06yHV9v21Tgw5SSU6lYq
 oEha+Z3MHjeAe6iwS0POh/STfvX6l5szvpLTNq6vqt6a8B7vbqdM7GnbvJKbrqohyuyRja4dU
 9GncRyB2iPzX8Ey2a7JH/NqUcP
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.766,
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

On 9/25/22 17:09, Laurent Vivier wrote:
> Le 18/09/2022 =C3=A0 21:45, Helge Deller a =C3=A9crit=C2=A0:
>> Allow linux-user to strace the clock_gettime64() syscall.
>> This syscall is used a lot on 32-bit guest architectures which use newe=
r
>> glibc versions.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 linux-user/strace.c=C2=A0=C2=A0=C2=A0 | 53 +++++++++++++++++++++=
+++++++++++++++++++++
>> =C2=A0 linux-user/strace.list |=C2=A0 4 ++++
>> =C2=A0 2 files changed, 57 insertions(+)
>>
>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>> index a4eeef7ae1..816e679995 100644
>> --- a/linux-user/strace.c
>> +++ b/linux-user/strace.c
>> @@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_long =
len, int last);
>> =C2=A0 UNUSED static void print_raw_param(const char *, abi_long, int);
>> =C2=A0 UNUSED static void print_timeval(abi_ulong, int);
>> =C2=A0 UNUSED static void print_timespec(abi_ulong, int);
>> +UNUSED static void print_timespec64(abi_ulong, int);
>> =C2=A0 UNUSED static void print_timezone(abi_ulong, int);
>> =C2=A0 UNUSED static void print_itimerval(abi_ulong, int);
>> =C2=A0 UNUSED static void print_number(abi_long, int);
>> @@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cpu_=
env, const struct syscallname
>> =C2=A0 #define print_syscall_ret_clock_getres=C2=A0=C2=A0=C2=A0=C2=A0 p=
rint_syscall_ret_clock_gettime
>> =C2=A0 #endif
>>
>> +#if defined(TARGET_NR_clock_gettime64)
>> +static void
>> +print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const struct =
syscallname *name,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long ret, abi_long arg0,=
 abi_long arg1,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg2, abi_long arg3=
, abi_long arg4,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg5)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (!print_syscall_err(ret)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(TARGET_ABI_FMT_ld,=
 ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(" (");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_timespec64(arg1, 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(")");
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 qemu_log("\n");
>> +}
>> +#endif
>> +
>> =C2=A0 #ifdef TARGET_NR_gettimeofday
>> =C2=A0 static void
>> =C2=A0 print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const stru=
ct syscallname *name,
>> @@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>>
>> +static void
>> +print_timespec64(abi_ulong ts_addr, int last)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (ts_addr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct target__kernel_times=
pec *ts;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ts =3D lock_user(VERIFY_REA=
D, ts_addr, sizeof(*ts), 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ts) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
nt_pointer(ts_addr, last);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("{tv_sec =3D %lld"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ",tv_nsec =3D %lld}%s",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (long long)tswap64(ts->tv_sec), (long long)tsw=
ap64(ts->tv_nsec),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_comma(last));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(ts, ts_addr, 0)=
;
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("NULL%s", get_comm=
a(last));
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> =C2=A0 static void
>> =C2=A0 print_timezone(abi_ulong tz_addr, int last)
>> =C2=A0 {
>> @@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, const=
 struct syscallname *name,
>> =C2=A0 #define print_clock_getres=C2=A0=C2=A0=C2=A0=C2=A0 print_clock_g=
ettime
>> =C2=A0 #endif
>>
>> +#if defined(TARGET_NR_clock_gettime64)
>> +static void
>> +print_clock_gettime64(CPUArchState *cpu_env, const struct syscallname =
*name,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg0, abi_long arg1=
, abi_long arg2,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg3, abi_long arg4=
, abi_long arg5)
>> +{
>> +=C2=A0=C2=A0=C2=A0 print_syscall_prologue(name);
>> +=C2=A0=C2=A0=C2=A0 print_enums(clockids, arg0, 0);
>> +=C2=A0=C2=A0=C2=A0 print_pointer(arg1, 1);
>> +=C2=A0=C2=A0=C2=A0 print_syscall_epilogue(name);
>> +}
>> +#endif
>
> I think it could be simply:
>
> #define print_clock_gettime64 print_clock_gettime where print_clock_gett=
ime() is defined.

Unfortunately not, because one uses print_timespec() while the other uses =
print_timespec64().

> except that:
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks!
Helge

