Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB948DC29
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:46:43 +0100 (CET)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83FK-0004Wd-T4
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:46:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83Ce-0002xl-9l
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:43:56 -0500
Received: from [2a00:1450:4864:20::32c] (port=39777
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83Cc-00030f-II
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:43:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso5775697wma.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 08:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J1GtZaDXQAjUBk5zuR3rvKMW0iMDugjZj4P1YauCIYg=;
 b=W0HaFPGoauDly5PDV8l2o+f7b0rjGj6ITo9kV58kNF0aH9zE75poJL+yKMFvv/W+8B
 83V68ARl/uWjivbG+2mgplJqFcHdqOr3sa+cDHTXuAnRA1/Dsz1ca4/b1FSJuHoQHN2m
 x4d+88wyzuwCM5W5+sHf2hV8kTQ5cTLryQ691ZNQXFVTiRPglxq75+Yytz9BiYWlh8mB
 UpZnxZv+c5KHEnMAYL7CHjYIbJuJfY1aUR6Nnb1amKeyyD5+ltVG8MlYhodgITodLqEd
 wD/gbrmHWbmHKMfZrrJ6LkuYqZuovp2UcBxQMJK+v3EjDTGODoISrHPV3xycn7Q3I29N
 RvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1GtZaDXQAjUBk5zuR3rvKMW0iMDugjZj4P1YauCIYg=;
 b=UiSyMtOIbhB3RVMbMM0Iq5yPxkXEf4hcB9tv8AdUcKZ/B2Kao45ah8/emyREyUfilB
 8D7lGoKTzqfXk9Y3xzJGnAfVcLXWkX6LcpZduBFVIe0q7pG2S5Q1UyWt6adF8qEkF6tx
 wFh+y3mwyFdQZRdIScB8IV6NEa07ZZI2iGYTYgYGzv7C9qnNqmQumPKT8jbpPazu/lQj
 P8Q4/4epi+JGy44wOrU7Um6wDvINMRJLdLTuhhBg5pCL5gGd3F7ezbZAQaA4lnoFNoj2
 AagB4mxHw9wvd2kwP60HzAro4jAbAvcc5czUaiD2bUfr1umWc0x80Za58aAwDUjo3iXe
 QkzA==
X-Gm-Message-State: AOAM531OBQdKFW3/h9CelvtzWmsYeb040IhOPaKsqlf9SP21M+IqXrNY
 9hbTiBaJJHKKl+tPb+k8Kav0C+2htnoR4DI98TestQ==
X-Google-Smtp-Source: ABdhPJwOz5s9qW7/4FDc3aqUhfGlPczSJxdLI2VItmdy+nIZ+vs2nAeo1BJ3OSM/KGUxR8ZxUxIkzM67BEMfDKPgCjU=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr4674872wms.32.1642092232776; 
 Thu, 13 Jan 2022 08:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-3-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-3-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 16:43:41 +0000
Message-ID: <CAFEAcA-zcpwAx-aGOR717j7NNgWUeP1SC1Usqv66dnG_c27XQQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] bsd-user/signal.c: implement force_sig_fault
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:23, Warner Losh <imp@bsdimp.com> wrote:
>
> Start to implement the force_sig_fault code. This currently just calls
> queue_signal(). The bsd-user fork version of that will handle this the
> synchronous nature of this call. Add signal-common.h to hold signal
> helper functions like force_sig_fault.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

> +/*
> + * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
> + * 'force' part is handled in process_pending_signals().
> + */
> +void force_sig_fault(int sig, int code, abi_ulong addr)
> +{
> +    CPUState *cpu = thread_cpu;
> +    CPUArchState *env = cpu->env_ptr;
> +    target_siginfo_t info = {};
> +
> +    info.si_signo = sig;
> +    info.si_errno = 0;
> +    info.si_code = code;
> +    info.si_addr = addr;
> +    queue_signal(env, sig, &info);
> +}

In the linux-user implementation of this function, we pass in an extra
argument to queue_signal(), which is a QEMU_SI_* value (in this case
QEMU_SI_FAULT). The reason we do this is that the siginfo_t struct,
at least on Linux, is a pain: it has a union, and which field of the
union is the valid one is awkward to determine. Within the real
Linux kernel, the high bits of si_code are used to track what field
of the union is live, but those are masked out before handing the
signal to userspace. The effect is that QEMU sometimes has to
deal with siginfo_t structures where it knows exactly which field
of the union is valid because it generated the structure itself,
and sometimes with ones it got from guest userspace where it
has to make a best-guess. linux-user code deals with that using
the QEMU_SI_* codes: when we generate a siginfo_t ourselves and
know what field of the union is valid, we put the QEMU_SI_* into
the top part of si_code, and later when we need to byteswap it
for the guest we use tswap_siginfo(), which uses that to make a
known-correct choice. When we have to byteswap a siginfo_t which
we got from guest userspace, we use host_to_target_siginfo_noswap(),
which makes a best-guess based on things like the signal number.
And when we hand a siginfo_t to guest userspace, we mask out the
top part of si_code again, like the real kernel.

I'm not sure how the BSDs handle this, but at the moment in
this patchset you add both a host_to_target_siginfo_noswap()
(patch 16) and a tswap_siginfo(), but you've given them both
the guess-which-union-field-is-valid logic.

You don't need to address this in this patch series, but I wanted
to lay out the logic of why linux-user is doing things the
way it does so you can determine whether bsd-user needs to do
the same or not. (That might depend on which BSD: judging by
the target_siginfo definitions in bsd_user, freebsd puts
si_pid/si_uid in top-level struct fields, but netbsd and
openbsd put them in sub-fields of the union the same way
Linux does. For eg a SIGSEGV sent via kill() you want to swap
the pid/uid fields, but for a SIGSEGV generated by QEMU
you want to swap the si_addr. The other thing to check is
to what extent the BSD kernel ABI lets userspace spoof the
si_code field in a siginfo_t: Linux's rt_sigqueueinfo syscall
is quite lax in this regard.)

Anyway, for this patch:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

