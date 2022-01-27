Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E7249EE8A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 00:08:51 +0100 (CET)
Received: from localhost ([::1]:59226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDso-0001XE-36
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 18:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nDDqC-0000BL-7S
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:06:13 -0500
Received: from [2607:f8b0:4864:20::436] (port=35614
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nDDpu-00070V-6H
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:06:07 -0500
Received: by mail-pf1-x436.google.com with SMTP id u130so4364665pfc.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 15:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FeeZ8uhOWBu6wg3OsoX6WVrZFI8POcBbx993A3lsmvE=;
 b=b7LKWizZ3621u17Ukd6RlUITL5ugLhP+ffbCVTIl8BgDewuwOYY7nYuRpRiy/TmxEF
 B5GvN+FyqL82pTUTCdPRGiORHe1yZTvtJDQVTJr8cqbOlid2IaUghM0MLote+EauvChO
 CwzskpvtrBF8NnoIBqMb3RZbt+cBqaMMj2vK+kLBykEMKRn+UNrcnOaJuF/Nwlp5NZ+m
 B+Nb1JOaQjteig7KoKJdVath349fTid7Vkgq57BJh7vZIlY7NY4YJyKztxf+sB4T8/Uv
 WuNNmT7ceR1J+Z+tsT4+MH1Piyp7QLlbyaftLQiBiwzAFur9IuMtlwqKL+YaXoQzkKIS
 Qd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FeeZ8uhOWBu6wg3OsoX6WVrZFI8POcBbx993A3lsmvE=;
 b=pq7Po2HKgFBqQcK4O/ZOh83iUsHFA8v1t/w1+vzqg8xAw6oLyyNbMBRgJfMuSva4R8
 CCnD+yazPA0S7mFAZcf71hzcZDPJZUBW3HV4APmxyQGWY5HpTgR1dc8ReN1RE1BFeF8G
 SRAkyaofT4MeQ6OWEiCLNCgrWSqBVUrkDgagFaop8OaD4rUXGYBOEcokt89bZ+dT1HAt
 6uQfYtqdnHePCI5Vk59+ebw0rHMm6t3q1NKnoR18sEik48V21rkrmc3ErxxrCXZTNamW
 XBbxEgAWoew7bkXUlXhzDLBaJfJoCQKf/bE0NoiY6wBmp7xsDYQ6dJ7tsYa8ntC1wDXs
 maWg==
X-Gm-Message-State: AOAM532ewb3wCZ44vIqd3dYVKhgACeLKsNtHbFBib55wiuyUwnxCYGqQ
 a/5FIUy0lYBH0EPBNYe7o73Kdw==
X-Google-Smtp-Source: ABdhPJxwDDeEHGo+F9BRQaFfPmdASQdcHlDjGNOlQzEqFN6LJzfe1Bfs9CFbaFiQbDQzVPjFlMl+9A==
X-Received: by 2002:a63:e615:: with SMTP id g21mr4307582pgh.619.1643324721583; 
 Thu, 27 Jan 2022 15:05:21 -0800 (PST)
Received: from smtpclient.apple ([2603:300b:6:5100:9cd4:545b:aed0:18bd])
 by smtp.gmail.com with ESMTPSA id f16sm7174986pfa.147.2022.01.27.15.05.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 15:05:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v2 35/40] bsd-user/signal.c: implement do_sigreturn
From: Warner Losh <wlosh@bsdimp.com>
In-Reply-To: <20220125012947.14974-36-imp@bsdimp.com>
Date: Thu, 27 Jan 2022 16:05:19 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <72AEE6E0-C9D6-4350-99C7-DE3AC04ED511@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-36-imp@bsdimp.com>
To: Warner Losh <imp@bsdimp.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=wlosh@bsdimp.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "def@freebsd.org" <def@FreeBSD.org>, "jrtc27@freebsd.org" <jrtc27@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 24, 2022, at 6:29 PM, Warner Losh <imp@bsdimp.com> wrote:
>=20
> Implements the meat of a sigreturn(2) system call via do_sigreturn, =
and
> helper reset_signal_mask. Fix the prototype of do_sigreturn in qemu.h
> and remove do_rt_sigreturn since it's linux only.
>=20
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
>=20
> PENDING COMMENTS: from 	Peter Maydell <peter.maydell@linaro.org>
>=20
> do_sigreturn() itself shouldn't be setting the active signal
> mask, at least if you follow the linux-user design. It just
> sets the thread's signal_mask field in the TaskState by
> calling set_sigmask(), and then on our way out in the
> main cpu loop we'll call process_pending_signals() which
> sets the real thread signal mask to that value. (This, together
> with do_sigreturn() calling block_signals() before it starts
> work, avoids some race conditions where a host signal is delivered
> as soon as we unblock, I think.)

I think this is correct. We=E2=80=99re already setting the signal_mask =
element
in a mostly similar way to linux-user, so all I need to do is to remove =
the
setting the actual signal mask. The rest of this is already in place. =
I=E2=80=99ll
included in v3.

Warner

> ---
> bsd-user/signal-common.h |  2 +-
> bsd-user/signal.c        | 56 ++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
> index ee819266f54..786ec592d18 100644
> --- a/bsd-user/signal-common.h
> +++ b/bsd-user/signal-common.h
> @@ -11,7 +11,7 @@
>=20
> long do_rt_sigreturn(CPUArchState *env);
> abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, =
abi_ulong sp);
> -long do_sigreturn(CPUArchState *env);
> +long do_sigreturn(CPUArchState *env, abi_ulong addr);
> void force_sig_fault(int sig, int code, abi_ulong addr);
> int host_to_target_signal(int sig);
> void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 9ec4354d232..05caf812ccb 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -626,6 +626,62 @@ static void setup_frame(int sig, int code, struct =
target_sigaction *ka,
>     unlock_user_struct(frame, frame_addr, 1);
> }
>=20
> +static int reset_signal_mask(target_ucontext_t *ucontext)
> +{
> +    int i;
> +    sigset_t blocked;
> +    target_sigset_t target_set;
> +    TaskState *ts =3D (TaskState *)thread_cpu->opaque;
> +
> +    for (i =3D 0; i < TARGET_NSIG_WORDS; i++)
> +        if (__get_user(target_set.__bits[i],
> +                    &ucontext->uc_sigmask.__bits[i])) {
> +            return -TARGET_EFAULT;
> +        }
> +    target_to_host_sigset_internal(&blocked, &target_set);
> +    ts->signal_mask =3D blocked;
> +    sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);
> +
> +    return 0;
> +}
> +
> +/* See sys/$M/$M/exec_machdep.c sigreturn() */
> +long do_sigreturn(CPUArchState *env, abi_ulong addr)
> +{
> +    long ret;
> +    abi_ulong target_ucontext;
> +    target_ucontext_t *ucontext =3D NULL;
> +
> +    /* Get the target ucontext address from the stack frame */
> +    ret =3D get_ucontext_sigreturn(env, addr, &target_ucontext);
> +    if (is_error(ret)) {
> +        return ret;
> +    }
> +    trace_user_do_sigreturn(env, addr);
> +    if (!lock_user_struct(VERIFY_READ, ucontext, target_ucontext, 0)) =
{
> +        goto badframe;
> +    }
> +
> +    /* Set the register state back to before the signal. */
> +    if (set_mcontext(env, &ucontext->uc_mcontext, 1)) {
> +        goto badframe;
> +    }
> +
> +    /* And reset the signal mask. */
> +    if (reset_signal_mask(ucontext)) {
> +        goto badframe;
> +    }
> +
> +    unlock_user_struct(ucontext, target_ucontext, 0);
> +    return -TARGET_EJUSTRETURN;
> +
> +badframe:
> +    if (ucontext !=3D NULL) {
> +        unlock_user_struct(ucontext, target_ucontext, 0);
> +    }
> +    return -TARGET_EFAULT;
> +}
> +
> void signal_init(void)
> {
>     TaskState *ts =3D (TaskState *)thread_cpu->opaque;
> --=20
> 2.33.1
>=20


