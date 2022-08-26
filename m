Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A105A2C4A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:27:38 +0200 (CEST)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcBB-0002lU-0C
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRc2C-0007su-63
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:18:16 -0400
Received: from mout.gmx.net ([212.227.15.18]:34847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRc24-0007s6-TD
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661530685;
 bh=jcF4H1cdWhHkwLAVGI+RHhmOtjn9+dXIPJ0NCXu/bq4=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=EdTFEFQzGkRVhLSGaOYY+e3H+fcVd2j8um7gcI6Qg7Ds21uGGW5JOf1ZQ0w4PKf2H
 ArpaWJE51jzu2g9Oa69SyaLR1GbPjc3sXViCkI4UbV/QSvCjLiVxks8dy9s4+4sP3a
 +Kcjj8DcluBvjcYffKFK26uef9T+cWaogOaXW5C4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.171.190]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbgE-1oi3W51iF2-00L0zz; Fri, 26
 Aug 2022 18:18:05 +0200
Message-ID: <e1c80385-f647-9382-a09d-2844b67d1d0c@gmx.de>
Date: Fri, 26 Aug 2022 18:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 03/13] linux-user: Add faccessat2() syscall
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-4-deller@gmx.de>
 <186a174e-e37e-c5b1-b02a-efe31efdba79@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <186a174e-e37e-c5b1-b02a-efe31efdba79@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YmCoA125Ov5PW7/Pi6OWQV9/cjYZLe1iiyqfzIIT8WhN+xOELAo
 zkOU6x9R/3+nvlcgW3wZb4IIjoOOyvFAyjVeAAGuTXMLwFrkxZ736Ossc/I2e72Achl4W3V
 r6G+bZjV1Q9k9nT40CtUhlSP2hOHpEFBl8Tc6rgEnwUMo5+1H3OMixjiUQpsRb/z9rjZdzK
 x7ShjTv22L+07X0OqE8iQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dkKzDsz3SKg=:peRBERHHX9j8RHOUyOcxc/
 IppjK2LirmONmISUYvBXkt7e4azh2ElWKe252gLsZJEa8ULkqZMANWc1ZohfwGOSS8a/sSORX
 u3N/d5ww1Fj4rMXgR1n9QIXx8tiYCjhO3gdyqL+5QIEYZya3zswoVG4tHipMDRzHfRydtq6L0
 pzYq5JQK+h01KCvlMvUzWLehofM8jhk7n7HHh4USVQmcPZUiR8ANC5ESNWk0IHSOGuHYdlBr6
 9ThuSNsaKpc/p8wdVcqQ0AU17TdfWRf8BjFsNOJjgfsyKO06CDE/8Y75Pt5niUcRENrRfvxWQ
 Mf78DbB3y4OK0SjF6YLMbwz8gROWhrVRroLSMJAJYstVXeVveyA9cQvHszlezp7CUmTVzyexW
 PZJmY5jKrcLbLaReMANPE9PmB9T6jgLUx0y+uPXy+KLfKjsYmdDRMRyraAHlF7wPQMnpuEG+p
 IJVSqIKwHEgKOqIn5qz/OhsF89CfVrz3RePyTs+nOpsIdB3sDmVj3mB/dEL5VMMuunrwmKva/
 uarNP0EIffWVkYa3IvwjrDnoe4rtNUGKwrpjB0scgZVw6O7sxBZt8znmaEdBzbJ69RphrLqjA
 RiBRtY9JvO/7PuZY+qAcgOW8LmId4JLIHqUowCN6BSTNJtNYFqHQoOPh4QMCfgymnUcABdBZn
 2xYjRA7Jniy39iJEZ/kSorxzFw6u1ijWfypocy19EUj4dKV7nLtjhSzh/qNveZ5YB7HRfm7Tk
 za3BqKqa+PHbS7jRBoATF1Dj6xevvslU/0BwmWF6UTBOyEl6MjWCwH2Yncp4OLrDqvUdlBDTE
 5Zo7dgH8hQuheyvGDLWMuX59fSc/8N3j0B65JRk+2Vu1Y77kX1+CT9oyP9QO42CwhSfkYv3QX
 FzEtmYRTmgUAd37XwTZriHwR0s906YTMOcEXJYFeHqdwjohxIVdDqS7HIbvtwfZbrkhYF47+D
 ZayxN/CjgRSJmBgxorrFocUqhQv4m9ejZluQZUb7XJ+rS48LU1fbSkaAKnhtNBWVoLEwVqh3X
 pljo8wAngiAFd2hgmpG8teek8z+3voceiHupfwqUY8hTHJVoFJaSnEMBbMJOM7FglLRRMUQnF
 085sbupak3QEJ+Wl9f8XEQQBLKZ6Qa/4iKY0HSbkW2LzTtcZ1FsZ1KjwQ==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/26/22 17:17, Richard Henderson wrote:
> On 8/26/22 07:18, Helge Deller wrote:
>> Add implementation and strace output for faccessat2().
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 linux-user/strace.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 linux-user/strace.list |=C2=A0 3 +++
>> =C2=A0 linux-user/syscall.c=C2=A0=C2=A0 | 12 ++++++++++++
>> =C2=A0 3 files changed, 16 insertions(+), 1 deletion(-)
>
> I've done this one, and cleaned up the code a bit too:
>
> https://lore.kernel.org/qemu-devel/20220729201414.29869-1-richard.hender=
son@linaro.org/

Btw, your patch is missing the strace parts.

Furthermore, IMHO I think it's a bad idea to replace userspace-requested
syscalls with other (emulated) syscalls - UNLESS(!!) we have to.

I'm debugging frequenty failures with qemu-user which happen building
debian packages. For that I often compare native strace output with qemu
QEMU_STRACE=3D1 output. If you replace syscalls with others it makes compa=
ring
differences harder.

And, with your patch, if the target has TARGET_NR_faccessat2, but the host
hasn't (and as such emulate it via the host libc), a configure check in th=
e guest
would return success. I think it's better to let the guest then fall back,=
 not
the host.

I think we should really just emulate the syscalls the host kernel provide=
s.

Anyway, I'm still ok to drop my patch if you want.

Helge

>
>
> r~
>
>>
>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>> index 27309f1106..e8c63aa4c2 100644
>> --- a/linux-user/strace.c
>> +++ b/linux-user/strace.c
>> @@ -1962,7 +1962,7 @@ print_execv(CPUArchState *cpu_env, const struct s=
yscallname *name,
>> =C2=A0 }
>> =C2=A0 #endif
>>
>> -#ifdef TARGET_NR_faccessat
>> +#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
>> =C2=A0 static void
>> =C2=A0 print_faccessat(CPUArchState *cpu_env, const struct syscallname =
*name,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long arg0, abi_long arg1, abi_long a=
rg2,
>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>> index a78cdf3cdf..6e88da7fad 100644
>> --- a/linux-user/strace.list
>> +++ b/linux-user/strace.list
>> @@ -177,6 +177,9 @@
>> =C2=A0 #ifdef TARGET_NR_faccessat
>> =C2=A0 { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL=
 },
>> =C2=A0 #endif
>> +#ifdef TARGET_NR_faccessat2
>> +{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
>> +#endif
>> =C2=A0 #ifdef TARGET_NR_fadvise64
>> =C2=A0 { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
>> =C2=A0 #endif
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index f409121202..f51c4fbabd 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -399,6 +399,9 @@ _syscall3(int, ioprio_set, int, which, int, who, in=
t, ioprio)
>> =C2=A0 #if defined(TARGET_NR_getrandom) && defined(__NR_getrandom)
>> =C2=A0 _syscall3(int, getrandom, void *, buf, size_t, buflen, unsigned =
int, flags)
>> =C2=A0 #endif
>> +#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
>> +_syscall4(int, faccessat2, int, dirfd, char *, pathname, int, mode, in=
t, flags)
>> +#endif
>>
>> =C2=A0 #if defined(TARGET_NR_kcmp) && defined(__NR_kcmp)
>> =C2=A0 _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
>> @@ -9098,6 +9101,15 @@ static abi_long do_syscall1(CPUArchState *cpu_en=
v, int num, abi_long arg1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(p, a=
rg2, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 #endif
>> +#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
>> +=C2=A0=C2=A0=C2=A0 case TARGET_NR_faccessat2:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(p =3D lock_user_strin=
g(arg2))) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -TARGET_EFAULT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D get_errno(faccessat=
2(arg1, p, arg3, arg4));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(p, arg2, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +#endif
>> =C2=A0 #ifdef TARGET_NR_nice /* not on alpha */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_NR_nice:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return get_errno=
(nice(arg1));
>> --
>> 2.37.1
>>
>


