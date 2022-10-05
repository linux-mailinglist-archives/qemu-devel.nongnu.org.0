Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE55F5993
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 20:12:33 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og8sh-0004pv-Ac
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 14:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1og8gq-0003rU-7y
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 14:00:17 -0400
Received: from mout.gmx.net ([212.227.17.20]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1og8gl-0002Uj-2e
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 14:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664992806;
 bh=nHuf+VMf4YhOEuKWKGjTGy9HkVzwwffsPeTCF8cFCb0=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ByXEtlROsXVMGK79RIpL6y20law7SnyrTjcIkv+ZGoqsRDYAFGjZj8t7gdx4yy56x
 oc6rXxuv/lx3u4Y/z9FDMtS8I4lsCd5QZeG1hMq7HqUVSou28NkYVl4g5YsXrolgXM
 cbb35/dlC5dMjijsw/pC7GxtM0284NHK8T2Dal9s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.44]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1oxfZW2vlA-00HimE; Wed, 05
 Oct 2022 20:00:06 +0200
Message-ID: <1a57af83-2a7b-a71f-3dc5-ac8dbe323026@gmx.de>
Date: Wed, 5 Oct 2022 20:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] linux-user: fix pidfd_send_signal()
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20221005163826.1455313-1-laurent@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221005163826.1455313-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lCBjAkYahMbIRjJn9Fi7fHe0ci/l6IX9ntgqGl0S0KOrQ5r68zQ
 f4nWV2A/RZ/pWQljSrw56/rPtdohbOKkR6JqDui/S2xFdLVAojnl5Q3DwXDoBzZJvOVdntt
 4HNOchlDYXjUV2V970Qf9l3pb0zT+Pl87s/i3DmB3L/ZPfou5kyfePsoT8SjXGgNKgfIXv2
 dp+ZBZLDNjM6k0MRf384w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vrr8hW6DnMw=:vYwkr5KxCDPvr8fDUQ10Za
 YhekkN343OcDYUdA5lJpOJspuE6zY8FZtc1YyuNrqGx4TEXsCpM+xtohtZCFlCw2ZlEaZeoMp
 K3UF+sET65I/euxPkiPxQT8O38k3AdU4e2rmtFXq5rqGItVF5svCJcwFw2ok97jcbIKEszGXB
 a+mc7CireWybOPPpeqmLpUA2gxglKhxE3Lf4xmhLIB9G3aG1683BxMRybRyork6ltxcGnmd5t
 gweD9LGiQplNrNri8Ax07AfY7Dib89Z1Hzzib0HimggClhgCV81FxVOo2YREsy5YazcYZQxU1
 OMiSVMydIOGvOyU9eGecFnPRfnIIfa/L9r+jHkXwjXO+QtHGrCOhRt1JmvboCrfD6ZZ7Qkt6v
 LNFF9EOthKD5dRiLudyhd3fCQ+YB3p7e3HNpBYJPLaWZ+qfvNR/LLxkOdEO3RpNR3ZRI3P2bM
 +pUMhrEvdeiJqQzrEMS91B2pjc095vm+buwLP9QYYuxTBHCUDkAubmXnD/1ObP0sYXtF0aX8P
 a0f7gJfMFWVdBPHlsFLfR/BUUiNXBWD+CpxAzng3POOMUNEcjCnvkDNBeXfrG3UN3MNr16JTw
 oarB4PP+KD3vqAhxh9K5cYAyoyiZ7JTRIzaZ1EGvbBNNgguhDAxLO4/uD6+LsQfYf+SusNYb0
 cFg5hz1rB0B52Wa5v2pQQLggDTJ6nIEf7LuMLe94mJm3Iv3e8nF2y9psEXPEsSrLxodOnH8wT
 L1dpPKwy7WDLvztQJvE6Npn99YqWyIEDIOX63hEVVEdPbhh15jau9v3s4mbJE0ddwLULDxbGL
 oturWkJRUpHonoTwMpFNhY7X6H2ibRv9b0LXaSuySIt8+pQiJLHiiQDUyzC2XkZt97E6S/k2D
 lde/mOJ8/6Mss4ZgwchGCl8bKN2+Obxn4bjnoZFeyJjB0dzCdu56FIP1ketIGifgC17R/hmIN
 5Br9F2lJZ14gyOiLmZvmZEO39w8gyd/NyCpfe5sAVijQmtHhMPKl+j1lcQlXcRupbyDqS5K1A
 F5INcVIL6wXFX4tHsBfigiuNvX4F6Q5Ozhz1dIbqNLlLPv03mpiKF9vn9G91vlLijGu1Br6Ez
 w95BUDLspNcBT11vT8Xd8WBpW+t6OpFO2a/255yQT67je5MvArfIV6vkLWbf8Zy4fJf8yDcFq
 zc+8RzgRpo4vUTutjkqgNaLP4Q7RhtSyiqhT5HlEo1Qqb+A0dDZ7z0j9mt6sHJYK2KLXYJ1pf
 I0+VPxYbG3KplHQQURFlfFHAzfIkhiuNAr5kEh3jr+CjJ4rl1YuaZt8sd0G4FKvsyDkw4ND9/
 5a6wPpef60v2TuvgC4wVnszuNDMTqVHGY/XqjnMEho0AIUgSM2r3XHgCBjK2U5gXaavl89k/h
 dd3xyD70SYAF/dqUOeo3vXFMAWkBawjN4Wq67hfQL7Bze3Ax+hDw39m6yoJ67IQ9jxcNSURJ9
 KJFaBC7rKcY3VOCQs3WtHl1J2k0amz95o4EmqJrUYOiYUQtEIQNHSH5KsCgue/IMwAYpc81nV
 0WHz7nRmsuAIjA/oH2zPIV/oslegPjXqCj4eQYASS7DM8
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 10/5/22 18:38, Laurent Vivier wrote:
> According to pidfd_send_signal(2), info argument can be a NULL pointer.
> Fix strace to correctly manage ending comma in parameters.
>
> Fixes: cc054c6f13 ("linux-user: Add pidfd_open(), pidfd_send_signal() an=
d pidfd_getfd() syscalls")
> cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>


Reviewed-by: Helge Deller <deller@gmx.de>



> ---
>   linux-user/strace.c  |  4 ++--
>   linux-user/syscall.c | 19 ++++++++++++-------
>   2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 37bc96df9bb6..86c081c83f74 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3383,10 +3383,10 @@ print_pidfd_send_signal(CPUArchState *cpu_env, c=
onst struct syscallname *name,
>
>           unlock_user(p, arg2, 0);
>       } else {
> -        print_pointer(arg2, 1);
> +        print_pointer(arg2, 0);
>       }
>
> -    print_raw_param("%u", arg3, 0);
> +    print_raw_param("%u", arg3, 1);
>       print_syscall_epilogue(name);
>   }
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd9e..b1493917ee07 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8679,16 +8679,21 @@ static abi_long do_syscall1(CPUArchState *cpu_en=
v, int num, abi_long arg1,
>   #if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_si=
gnal)
>       case TARGET_NR_pidfd_send_signal:
>           {
> -            siginfo_t uinfo;
> +            siginfo_t uinfo, *puinfo;
>
> -            p =3D lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t)=
, 1);
> -            if (!p) {
> -                return -TARGET_EFAULT;
> +            if (arg3) {
> +                p =3D lock_user(VERIFY_READ, arg3, sizeof(target_siginf=
o_t), 1);
> +                if (!p) {
> +                    return -TARGET_EFAULT;
> +                 }
> +                 target_to_host_siginfo(&uinfo, p);
> +                 unlock_user(p, arg3, 0);
> +                 puinfo =3D &uinfo;
> +            } else {
> +                 puinfo =3D NULL;
>               }
> -            target_to_host_siginfo(&uinfo, p);
> -            unlock_user(p, arg3, 0);
>               ret =3D get_errno(pidfd_send_signal(arg1, target_to_host_s=
ignal(arg2),
> -                &uinfo, arg4));
> +                                              puinfo, arg4));
>           }
>           return ret;
>   #endif


