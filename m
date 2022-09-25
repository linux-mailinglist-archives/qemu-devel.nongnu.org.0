Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DA5E941C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:54:45 +0200 (CEST)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTxs-0004XM-W1
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocTwI-00034U-PK
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:53:06 -0400
Received: from mout.gmx.net ([212.227.17.21]:50505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocTwG-00022a-L4
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664121181;
 bh=okNoZFbWJrDfxgKZd2pH+4UlEbc7P2NX5MuPd121ICk=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=NGE6tuExlevsQiuUXmM/5kv9DiMIv73oEgr5AEdnn8wt3CDOtqfTDlE8v5qU4zuiD
 9Wbn4fUq6p5mfrqrxx2lnvdo2J4mcTnn0iX6Y9kv21odtySFZucsBgEsli2UM/vF0B
 c+FLDJ1KxzBLLijKL4tcq6egBdvMrZX2Pu6M+a3A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1pDTRr1Lc6-00b22c; Sun, 25
 Sep 2022 17:53:01 +0200
Message-ID: <da104054-6d2c-60f1-2098-f5f44d3c83b0@gmx.de>
Date: Sun, 25 Sep 2022 17:53:00 +0200
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
From: Helge Deller <deller@gmx.de>
In-Reply-To: <12696e40-af64-4dd2-bd47-eb270285edce@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:od8ffEanpvq3X1jjqKQI91nueVfp6YKmyxDzWoJbRN1SR1i7CJv
 uApTf4wUfr9VLfB3bOLSYfJNPy5d4zk4sDBRyLH3lpXhnSeDYiypUU+fx71S3fSYswFUDyN
 /b6BfKCeyXRMpPZINntds6Am6u+AT+8bLErjmb+gY0u3D3SRfgu/cMPRUIQp4CMqUbHQgJN
 +9dP+SHxNLKRKPyelhAFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q4lI6MHIVVk=:8nw9dHkY/jrMdv5j+BOG/g
 dIutOOt7yqikvb1O2o/fbec0IeswANr9wkwSkMeo+kNjNP7D3oxjalTfsvhwa4Od//ESaQCjk
 Md3E+OeEFGayafKOpUF2qiffLwdzh22q1EsnhdAFG63Ky0P/jcrtNf/D9jkbf9norC8oWcawe
 +XAwHDRd0uYeLlumaAUZVCHb2NjPEUY2sTeyHto0BjR0eCn9poZMBLF457WX33auj2o4+9Chp
 bFFQU8OVUDBSoBWRLr/ehyjupwM2kM3ZWnjXo3AEfO6EKQG1Wxg1XmD21utQqLN7VC3Pq9u2s
 S1TuIQrSTI8e6qlREHel2SN4kMVpxhg+DNpHKJwS3BZYQ3/fo5GfXlu7ywYcHeLyBrW16706W
 FR9CWyEsahWjzk7JXpxxIGvFMrDqlZbDh1s8DB5etG3xJBxp67eV0uN8qub6W4DRYcF/Z9oB1
 sSNtUJd0qJQ4Nn06dLhOr0oOBYO1lFii+2Zerm0dQ0s7aLWq7tjvyq0j2HxlqRgdHzH8tAe9l
 c3UHtrUIsBZG1YP2pz/U990L702eZmiw5sMF9KL1doXPRjvg1KUDz+qCUsiDSmU4xFhzfHBNv
 DtbBcF6fC00e7bsExEtG3Iygy9nPQIe7GbFUM4ougzp8gaCq+BIvPG4eoqB7caNA6ad6+aa7r
 KITOlRFQsTY4LmavgwqhlqP0udICbQnKf1/HhOZwXkdgbdCpKYTdMK3NUlnuQGHNdz4soxRcL
 gKDGYJpVkdYiXuO4iS33sop+X94lOtMcrlLctpess9RCKlMxO9dRraiBqGJ7ekvuozUZ4PKRV
 lZDNbEX1G8B5Uk6en4OWLiI6K6le6M9hSi3Sx5QglRWbALvPkz3pTe4ysYwX/rHzkgKGTSfWX
 bNgXDPeSLwNl5kiJpELe5n64SIiNFhRTgzO5pUSuiokr14KSMgDbs8QjGPIxzILROTGlpXupF
 Cr3DioIMIXCh6lz93VfUZkn1vBp1VUj0JvM8HH6pB6UAI4h3hSbqARhG5Vl8iEHyVvtRAzW8m
 gWhT4rPfbaAz4iNXxdgji2Q4o1toW80qkaK7GvXS9y6CjCsqrzenoWSHc+sImYaHJvwagg8bm
 cOSMe2wAMRZ7UF1EIYa2fqCoZVfwfZA+2lmOIS4aqGtIsgVjMOhbzWEj712OoSDMPDwFTvZ2v
 7HuTxLjYjhr1Lo0CHE/IXPDP5v
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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

On 9/25/22 17:47, Laurent Vivier wrote:
> Le 25/09/2022 =C3=A0 17:27, Helge Deller a =C3=A9crit=C2=A0:
>> On 9/25/22 17:09, Laurent Vivier wrote:
>>> Le 18/09/2022 =C3=A0 21:45, Helge Deller a =C3=A9crit=C2=A0:
>>>> Allow linux-user to strace the clock_gettime64() syscall.
>>>> This syscall is used a lot on 32-bit guest architectures which use ne=
wer
>>>> glibc versions.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> ---
>>>> =C2=A0 linux-user/strace.c=C2=A0=C2=A0=C2=A0 | 53 +++++++++++++++++++=
+++++++++++++++++++++++
>>>> =C2=A0 linux-user/strace.list |=C2=A0 4 ++++
>>>> =C2=A0 2 files changed, 57 insertions(+)
>>>>
>>>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>>>> index a4eeef7ae1..816e679995 100644
>>>> --- a/linux-user/strace.c
>>>> +++ b/linux-user/strace.c
>>>> @@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_lon=
g len, int last);
>>>> =C2=A0 UNUSED static void print_raw_param(const char *, abi_long, int=
);
>>>> =C2=A0 UNUSED static void print_timeval(abi_ulong, int);
>>>> =C2=A0 UNUSED static void print_timespec(abi_ulong, int);
>>>> +UNUSED static void print_timespec64(abi_ulong, int);
>>>> =C2=A0 UNUSED static void print_timezone(abi_ulong, int);
>>>> =C2=A0 UNUSED static void print_itimerval(abi_ulong, int);
>>>> =C2=A0 UNUSED static void print_number(abi_long, int);
>>>> @@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cp=
u_env, const struct syscallname
>>>> =C2=A0 #define print_syscall_ret_clock_getres=C2=A0=C2=A0=C2=A0=C2=A0=
 print_syscall_ret_clock_gettime
>>>> =C2=A0 #endif
>>>>
>>>> +#if defined(TARGET_NR_clock_gettime64)
>>>> +static void
>>>> +print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const struc=
t syscallname *name,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long ret, abi_long ar=
g0, abi_long arg1,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg2, abi_long a=
rg3, abi_long arg4,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg5)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 if (!print_syscall_err(ret)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(TARGET_ABI_FMT_l=
d, ret);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(" (");
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_timespec64(arg1, 1)=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(")");
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 qemu_log("\n");
>>>> +}
>>>> +#endif
>>>> +
>>>> =C2=A0 #ifdef TARGET_NR_gettimeofday
>>>> =C2=A0 static void
>>>> =C2=A0 print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const st=
ruct syscallname *name,
>>>> @@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 }
>>>>
>>>> +static void
>>>> +print_timespec64(abi_ulong ts_addr, int last)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 if (ts_addr) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct target__kernel_tim=
espec *ts;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ts =3D lock_user(VERIFY_R=
EAD, ts_addr, sizeof(*ts), 1);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ts) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
rint_pointer(ts_addr, last);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("{tv_sec =3D %ll=
d"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ",tv_nsec =3D %lld}%s",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (long long)tswap64(ts->tv_sec), (long long)=
tswap64(ts->tv_nsec),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_comma(last));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(ts, ts_addr, =
0);
>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("NULL%s", get_co=
mma(last));
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>> +
>>>> =C2=A0 static void
>>>> =C2=A0 print_timezone(abi_ulong tz_addr, int last)
>>>> =C2=A0 {
>>>> @@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, con=
st struct syscallname *name,
>>>> =C2=A0 #define print_clock_getres=C2=A0=C2=A0=C2=A0=C2=A0 print_clock=
_gettime
>>>> =C2=A0 #endif
>>>>
>>>> +#if defined(TARGET_NR_clock_gettime64)
>>>> +static void
>>>> +print_clock_gettime64(CPUArchState *cpu_env, const struct syscallnam=
e *name,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg0, abi_long a=
rg1, abi_long arg2,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg3, abi_long a=
rg4, abi_long arg5)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 print_syscall_prologue(name);
>>>> +=C2=A0=C2=A0=C2=A0 print_enums(clockids, arg0, 0);
>>>> +=C2=A0=C2=A0=C2=A0 print_pointer(arg1, 1);
>>>> +=C2=A0=C2=A0=C2=A0 print_syscall_epilogue(name);
>>>> +}
>>>> +#endif
>>>
>>> I think it could be simply:
>>>
>>> #define print_clock_gettime64 print_clock_gettime where print_clock_ge=
ttime() is defined.
>>
>> Unfortunately not, because one uses print_timespec() while the other us=
es print_timespec64().
>
> The syscall_ret part cannot be shared, but the prefix function can, they=
 are identical.

Ah.. right. I don't know any longer why I didn't that.
Maybe because of too much #ifdeffery or to keep the patch simple.
Will we leave as-is, will you clean up, or shall I resend that patch?

Helge

