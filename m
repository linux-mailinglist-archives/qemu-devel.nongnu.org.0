Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192A75E943B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 18:10:57 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocUDV-0007vV-2Z
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 12:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocUBu-0006Ws-U6
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:09:14 -0400
Received: from mout.gmx.net ([212.227.17.20]:57867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocUBs-0004ef-NV
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664122150;
 bh=aJmWrrpSEAGp4LoYzVyGkwD0H5w1X6bbhxVdyumRedA=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=XFs9buG5UzIE1eYV0XkRxr59tHKSqKJHwUAtXIaMo++Xztr12nkMZchlkjfkGVzDN
 5u5v9Qh36Lo0bBggxBh3oDv05LXLhHDgk9apjLosjWZiPhgCMjjXDs+ynYpeHm7Mph
 80n3WxyPY4Up8jlQ9Od1hpPZQIZu04/wNYK9Tt08=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1oyZSX3u7s-00mYrp; Sun, 25
 Sep 2022 18:09:10 +0200
Message-ID: <a6563f62-97ba-7e39-6253-5eda1d76bc0e@gmx.de>
Date: Sun, 25 Sep 2022 18:09:09 +0200
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
 <2ccd28da-552b-722e-0534-df41c1962432@gmx.de>
 <12696e40-af64-4dd2-bd47-eb270285edce@vivier.eu>
 <da104054-6d2c-60f1-2098-f5f44d3c83b0@gmx.de>
 <d413f69d-f374-aaaf-c43d-78f91ad10d73@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <d413f69d-f374-aaaf-c43d-78f91ad10d73@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qEMKbj9Lk/iRQj0Lc54wY48KMC7xK2xEkPYWEsy9cpkLOt0T4q8
 1YKy3V64WaOFVfjOyI8TPdvsy1OmY7f6imtRQAyj8skw4XZAeek2hzt4KsRcihKqRd5F+VU
 WKNmS0YD0eH/q6TqhDSMjYhyeo7mDllKN/MAZnUhNobDmME7WvAZrIPzdk5iLaDAUmkLG2p
 qZrDJvOL6Gx1xy8Gm6Bmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pHRDa4N9wkI=:zA31hzkswthcsc7Q5g5zk+
 Ri+qTQuccA2Z9d2f+L0T4QeV3XsUVbyWeZxgO+/ceDbXmclVnVwCZe3JLPXYMEaSHLVpQfa9l
 /0x06L4JgnWsK0UBlI9OisGWm3RV/paj7r1nC/pGY+BYO86cMZAq2a3P8WsZjOD5rcgMwbPij
 LoZLTa9n7LSx3cQ/L7fuMCzyvEdZnHlniU7do53FFRY5yFpTKeQB82eUnyl8m5s4ehyNrzqJ5
 QJcylK6EualzVHx+GuXIsy1W8qe5wI7QaQjBQ28TnOqGS3PVQFuxiZzbeCWzzaGpgR6N/G0LW
 j/DGcl2KdO6pTSWdis3DFKVyGP8n8wSXfm/JbncBe3SVb/kiVC/x/Ow1v5IufzrBmgdxsRbRn
 U6Y8fxDA/teW3ZRVcSuuNpG9Il4tMqzh1X1AEQENMBGDvntNdl+S8wMfGK5hn6qesH64rwGsL
 kQibaeEQiqN0MUa+mKXncyairSy0PcWsY7l/S8bqyFBX7cfPHXOj4H5eORxyfSgPCvxUXjm7E
 +GCk8L6edCB9/w4/x2sf037a2EYxQj3ey0reuwNrLkBqt09GlT+4TkslCFzKe/1NArzNFQ2xv
 L1tiR/iBmS7uCU8PifPGeyI7XDNf+baCmPfTZ0GpEM5md7L9ZOT0OKZoVqhLa0V0F0hHtC8gF
 ZEgq/OLxnSej4NeM6KgmahrFo/7qLfLMn8S6SvW7f+KAEOqXsfwMzNPiehtdZBvENd/sKV8uz
 kNmb4ztWwmSOrzHgX5KlS0ZK0Ba0Y3//+UuYXg+GdTckVJtCT7qN9uy39Ujfz8snOIHFdsrWh
 3F6DAteWEE9XkhOM7bbRhPLgHbzds+L2mjeKoibI2VAm9M5uVi5ZGpXJQSAHgUka8T5YX3gCV
 KJPiXDtBL/AktEE3ZqCMovYenaG2nz0zrUZ1rKEsB1Yf9sFk1xXIyWUdWm1ET87qg6dXHuu36
 ILNffQ6U0kkK+UGiVc+G4ubKMWZo0LWPeBUzLNb9/ge8gvtqiD1Wr/h2xuDdpWDiuGnGe7NKN
 eKwsM+u3R3NIHDqU8aOEyxOfSHSD02ujS4f1mnPyzBYRDL6Wd2/1Si7Kq+logNciRGQNe9fwE
 EjK/y7FvWEPhQGfAUetTDddWkYjGr44n4sKzEqwS0YeclKWXSt6n0B4P2edB1jDYPfO9mHtDJ
 pjM6/A5axy51xGRn2yua3zgRnG
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

On 9/25/22 17:58, Laurent Vivier wrote:
> Le 25/09/2022 =C3=A0 17:53, Helge Deller a =C3=A9crit=C2=A0:
>> On 9/25/22 17:47, Laurent Vivier wrote:
>>> Le 25/09/2022 =C3=A0 17:27, Helge Deller a =C3=A9crit=C2=A0:
>>>> On 9/25/22 17:09, Laurent Vivier wrote:
>>>>> Le 18/09/2022 =C3=A0 21:45, Helge Deller a =C3=A9crit=C2=A0:
>>>>>> Allow linux-user to strace the clock_gettime64() syscall.
>>>>>> This syscall is used a lot on 32-bit guest architectures which use =
newer
>>>>>> glibc versions.
>>>>>>
>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>> ---
>>>>>> =C2=A0 linux-user/strace.c=C2=A0=C2=A0=C2=A0 | 53 +++++++++++++++++=
+++++++++++++++++++++++++
>>>>>> =C2=A0 linux-user/strace.list |=C2=A0 4 ++++
>>>>>> =C2=A0 2 files changed, 57 insertions(+)
>>>>>>
>>>>>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>>>>>> index a4eeef7ae1..816e679995 100644
>>>>>> --- a/linux-user/strace.c
>>>>>> +++ b/linux-user/strace.c
>>>>>> @@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_l=
ong len, int last);
>>>>>> =C2=A0 UNUSED static void print_raw_param(const char *, abi_long, i=
nt);
>>>>>> =C2=A0 UNUSED static void print_timeval(abi_ulong, int);
>>>>>> =C2=A0 UNUSED static void print_timespec(abi_ulong, int);
>>>>>> +UNUSED static void print_timespec64(abi_ulong, int);
>>>>>> =C2=A0 UNUSED static void print_timezone(abi_ulong, int);
>>>>>> =C2=A0 UNUSED static void print_itimerval(abi_ulong, int);
>>>>>> =C2=A0 UNUSED static void print_number(abi_long, int);
>>>>>> @@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *=
cpu_env, const struct syscallname
>>>>>> =C2=A0 #define print_syscall_ret_clock_getres=C2=A0=C2=A0=C2=A0=C2=
=A0 print_syscall_ret_clock_gettime
>>>>>> =C2=A0 #endif
>>>>>>
>>>>>> +#if defined(TARGET_NR_clock_gettime64)
>>>>>> +static void
>>>>>> +print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const str=
uct syscallname *name,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long ret, abi_long ar=
g0, abi_long arg1,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg2, abi_long a=
rg3, abi_long arg4,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg5)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 if (!print_syscall_err(ret)) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(TARGET_ABI_FMT=
_ld, ret);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(" (");
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_timespec64(arg1, =
1);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(")");
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 qemu_log("\n");
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>> =C2=A0 #ifdef TARGET_NR_gettimeofday
>>>>>> =C2=A0 static void
>>>>>> =C2=A0 print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const =
struct syscallname *name,
>>>>>> @@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> =C2=A0 }
>>>>>>
>>>>>> +static void
>>>>>> +print_timespec64(abi_ulong ts_addr, int last)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ts_addr) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct target__kernel_t=
imespec *ts;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ts =3D lock_user(VERIFY=
_READ, ts_addr, sizeof(*ts), 1);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ts) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 print_pointer(ts_addr, last);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("{tv_sec =3D %=
lld"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ",tv_nsec =3D %lld}%s",
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (long long)tswap64(ts->tv_sec), (long long)=
tswap64(ts->tv_nsec),
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_comma(last));
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(ts, ts_addr=
, 0);
>>>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("NULL%s", get_=
comma(last));
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +}
>>>>>> +
>>>>>> =C2=A0 static void
>>>>>> =C2=A0 print_timezone(abi_ulong tz_addr, int last)
>>>>>> =C2=A0 {
>>>>>> @@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, c=
onst struct syscallname *name,
>>>>>> =C2=A0 #define print_clock_getres=C2=A0=C2=A0=C2=A0=C2=A0 print_clo=
ck_gettime
>>>>>> =C2=A0 #endif
>>>>>>
>>>>>> +#if defined(TARGET_NR_clock_gettime64)
>>>>>> +static void
>>>>>> +print_clock_gettime64(CPUArchState *cpu_env, const struct syscalln=
ame *name,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg0, abi_long a=
rg1, abi_long arg2,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg3, abi_long a=
rg4, abi_long arg5)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 print_syscall_prologue(name);
>>>>>> +=C2=A0=C2=A0=C2=A0 print_enums(clockids, arg0, 0);
>>>>>> +=C2=A0=C2=A0=C2=A0 print_pointer(arg1, 1);
>>>>>> +=C2=A0=C2=A0=C2=A0 print_syscall_epilogue(name);
>>>>>> +}
>>>>>> +#endif
>>>>>
>>>>> I think it could be simply:
>>>>>
>>>>> #define print_clock_gettime64 print_clock_gettime where print_clock_=
gettime() is defined.
>>>>
>>>> Unfortunately not, because one uses print_timespec() while the other =
uses print_timespec64().
>>>
>>> The syscall_ret part cannot be shared, but the prefix function can, th=
ey are identical.
>>
>> Ah.. right. I don't know any longer why I didn't that.
>> Maybe because of too much #ifdeffery or to keep the patch simple.
>> Will we leave as-is, will you clean up, or shall I resend that patch?
>
> As you prefer...

I'd suggest to leave as-is for now.

Helge

