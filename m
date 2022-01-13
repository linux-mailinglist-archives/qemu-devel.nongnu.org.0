Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB548DEA7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:10:41 +0100 (CET)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86Qh-0006Lm-AZ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:10:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n860y-00071Y-KX
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:44:04 -0500
Received: from [2a00:1450:4864:20::433] (port=34420
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n860w-00073H-9X
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:44:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id h10so12088651wrb.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nluMz9WR62eoU2LxYErcI6wRfdKMMVjQAiAVQcKheT8=;
 b=vsIzc9u5oLb/Mi6bRb4dihmD6acKC+GsUWMiMlN3qIrscP07RY4iL+ORpmJ3hn0+Kd
 i1jaUix7/lgznRO/x4wAMJ85W70oMFt39A7TQZc/9eU+O+piA+PMebfPoeQwZVInJbc0
 jauY7nTqfVKYaQuSv+jtXXZttKrc19SbEcS1vXY4GRjZxFVzjOIKhn++ztj7fS9LJp8+
 SmY8/FyC3KuZ8jhIlMl/eG4LJ1ozWEphCeKD4Ddut7ucN3APTpmstcOaFW3WiRJruoQm
 52nMDUlVKxd7G4j1JCb2jBLeQ7omvXX1ZgU9cXWvXMzFWM/4D51RDXR6vUXlzS9JoklL
 Roaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nluMz9WR62eoU2LxYErcI6wRfdKMMVjQAiAVQcKheT8=;
 b=qTlYCUBtn3yNVjt9/1qPsYdIqbl1046yEm9HHRZO/45TZqxQizTZVEOVZ/UUYkf4DU
 qNASLiLIXoBtLo3rnsxCFJVJZ9FictvJEQaOASS+iQ/KbCCpemnk3HFxgtjPCg6iC4eM
 a7LsUMS6g9ejLFPfQg2JAUICdEacIF9twHI96iCSd8MAnQxL9PDXbkRM89Ypz8z+NeQI
 K+MWZ314JPFkTPmWHZZyFgTTBD0X8QgLKUJqwpBEIhi76ISxu7LcT6Sr3O1RCOMFUQDo
 sFZGcm07J2562zZiUinSUz3VMEx0Xce7F7EamFwK1G3v4PPQ5AME+szuz/op6T974VV+
 Dcgw==
X-Gm-Message-State: AOAM531n/9w1Nryj+AdloVP+awsaC2/4ErBL7+ADsR0JtOaBx7skJoBn
 WxAsNL3+xwMKBfJufxZI8HL8R1D7aUAKHB7V9NcnPQ==
X-Google-Smtp-Source: ABdhPJwMeyHFytqVL1zIWkfgqCX3aiU8pYMoWK2CPmKLldgfZEXXdTVlRW3mdwceItKVPCp83yZAqRsXlsRNI1Ov8Xo=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr5458859wrv.521.1642103039521; 
 Thu, 13 Jan 2022 11:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-17-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-17-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:43:48 +0000
Message-ID: <CAFEAcA9ikK-GV6fy35wZHpTKZkQ8jD8=xm1z+25OdPG56yS=Ow@mail.gmail.com>
Subject: Re: [PATCH 16/30] bsd-user/signal.c: host_to_target_siginfo_noswap
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

On Sun, 9 Jan 2022 at 16:41, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement conversion of host to target siginfo.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/signal.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 7168d851be8..3fe8b2d9898 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -43,6 +43,43 @@ int target_to_host_signal(int sig)
>      return sig;
>  }
>
> +/* Siginfo conversion. */
> +static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
> +        const siginfo_t *info)
> +{
> +    int sig, code;
> +
> +    sig = host_to_target_signal(info->si_signo);
> +    /* XXX should have host_to_target_si_code() */
> +    code = tswap32(info->si_code);
> +    tinfo->si_signo = sig;
> +    tinfo->si_errno = info->si_errno;
> +    tinfo->si_code = info->si_code;
> +    tinfo->si_pid = info->si_pid;
> +    tinfo->si_uid = info->si_uid;
> +    tinfo->si_status = info->si_status;
> +    tinfo->si_addr = (abi_ulong)(unsigned long)info->si_addr;
> +    /* si_value is opaque to kernel */
> +    tinfo->si_value.sival_ptr =
> +        (abi_ulong)(unsigned long)info->si_value.sival_ptr;
> +    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS == sig ||

Don't use yoda-conditions, please. sig == SIGILL, etc.

> +            SIGTRAP == sig) {
> +        tinfo->_reason._fault._trapno = info->_reason._fault._trapno;
> +    }
> +#ifdef SIGPOLL
> +    if (SIGPOLL == sig) {
> +        tinfo->_reason._poll._band = info->_reason._poll._band;
> +    }
> +#endif
> +    if (SI_TIMER == code) {
> +        int timerid;
> +
> +        timerid = info->_reason._timer._timerid;
> +        tinfo->_reason._timer._timerid = timerid;
> +        tinfo->_reason._timer._overrun = info->_reason._timer._overrun;
> +    }
> +}

I think this will only compile on FreeBSD (the other BSDs having
notably different target_siginfo_t structs); I guess we're OK
with that ?

I also commented on the general setup linux-user has for this
function back in patch 2; I'll let you figure out whether what
you have here is the right thing for BSD.

-- PMM

