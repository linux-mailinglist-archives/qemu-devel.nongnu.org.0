Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE848DE20
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:32:48 +0100 (CET)
Received: from localhost ([::1]:58156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85q3-00071H-6u
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85ln-000572-LA
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:28:26 -0500
Received: from [2a00:1450:4864:20::42b] (port=36863
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85ll-0004mG-BI
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:28:22 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r28so12033441wrc.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bJjcEv78iwo6e+RHCnGqm0+ZR7qW6aFT9ZdM0I4PdUs=;
 b=trDBhgNuXAg6veRWDbY4gB5/oFJFeoeUlqlJqbJYswnatuqxm05fj2ChS2xwsoz3vZ
 DD7w16tobREPx81exHZ6D4r9nS02HMO531zFNDysRsETkkMPT2YSY+V/aBTozOf/eaSJ
 IDN0qXP/w1BLb7qsNjhzGXo2IP1KanC0pM7ms9OltW0jplEwFDW/RP51jRjfwGo0UyDJ
 ZCF4KHhRUk31IFujzABmPvUjFfl5RW9t/UOBH79emD9tAIAB/eSeFESscqmwMqPnborp
 r8PaNPr+4IlL8IRQDOMaP90FJdtsYLYf/IEK4TMWU2KhRwEc6beU3+95S89ttBnkHxru
 20tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bJjcEv78iwo6e+RHCnGqm0+ZR7qW6aFT9ZdM0I4PdUs=;
 b=EHwCZjl035P1lmqdRYK7zfP1aXdmzd0B09YlgxY1mrFdAFWaeK1NrXxTUm4ttMu8G8
 E5OXFDwM1Ux5HEDEKuzLlLjjBDpAhi/t8YC1VsPKqqiXdx9EWmsl6TCGNOpvJ4+xhdHW
 rzCciR6MAKerTERbd0WkAp+mtWqwvTg0N9q2VxFehBS3ShInyquL+EABBaPwx/MDTW9z
 Da8J544AL7MAKJoSQ8CL1cmeqLFGDBvOplFUdcKaG/l/LtjlIFzZWKTVLyn5RWuDV9XX
 RRxGEVumeYk/uj73oTCDI5c71bbS5UtutlktF7yh7Aw1oltz/7lOZkQXDIOIUAO1bCr7
 c0Rw==
X-Gm-Message-State: AOAM530hJbWDFk2u+5AuKiaRKUNckUY9eYIAQCC1YMRvxy3k2mm5w+jC
 uzWQ9g3nv/A8BoJCPSeEHkMsYc9Ubb/lFGnXTfEufg==
X-Google-Smtp-Source: ABdhPJwCelIQ6KjIWKB8vsVQAUlkJAl2GrPxg3WV/T6yFdo/pIoNLirDbvLHhwDzvC3IiRSGMHcQCMTkljCHiJHBSKE=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr5110574wri.295.1642102096665; 
 Thu, 13 Jan 2022 11:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-11-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-11-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:28:05 +0000
Message-ID: <CAFEAcA9eX+f9j8wsrkPP-vap_OHyz70c_CdVPgo8ha71vZQxtw@mail.gmail.com>
Subject: Re: [PATCH 10/30] bsd-user/signal.c: Implement signal_init()
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
>
> Initialize the signal state for the emulator. Setup a set of sane
> default signal handlers, mirroring the host's signals. For fatal signals
> (those that exit by default), establish our own set of signal
> handlers. Stub out the actual signal handler we use for the moment.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  1 +
>  bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)

> +static struct target_sigaction sigact_table[TARGET_NSIG];




>  void signal_init(void)
>  {
> +    TaskState *ts = (TaskState *)thread_cpu->opaque;
> +    struct sigaction act;
> +    struct sigaction oact;
> +    int i;
> +    int host_sig;
> +
> +    /* Set the signal mask from the host mask. */
> +    sigprocmask(0, 0, &ts->signal_mask);
> +
> +    /*
> +     * Set all host signal handlers. ALL signals are blocked during the
> +     * handlers to serialize them.
> +     */
> +    memset(sigact_table, 0, sizeof(sigact_table));

Do you need this memset()? sigact_table is a global, so it's
zero-initialized on startup, and this function is only called once.
The (otherwise basically identical) Linux version of this function
doesn't have it.

> +
> +    sigfillset(&act.sa_mask);
> +    act.sa_sigaction = host_signal_handler;
> +    act.sa_flags = SA_SIGINFO;
> +
> +    for (i = 1; i <= TARGET_NSIG; i++) {
> +        host_sig = target_to_host_signal(i);
> +        sigaction(host_sig, NULL, &oact);
> +        if (oact.sa_sigaction == (void *)SIG_IGN) {
> +            sigact_table[i - 1]._sa_handler = TARGET_SIG_IGN;
> +        } else if (oact.sa_sigaction == (void *)SIG_DFL) {
> +            sigact_table[i - 1]._sa_handler = TARGET_SIG_DFL;
> +        }
> +        /*
> +         * If there's already a handler installed then something has
> +         * gone horribly wrong, so don't even try to handle that case.
> +         * Install some handlers for our own use.  We need at least
> +         * SIGSEGV and SIGBUS, to detect exceptions.  We can not just
> +         * trap all signals because it affects syscall interrupt
> +         * behavior.  But do trap all default-fatal signals.
> +         */
> +        if (fatal_signal(i)) {
> +            sigaction(host_sig, &act, NULL);
> +        }
> +    }
>  }

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

