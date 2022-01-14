Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B39848E981
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:56:59 +0100 (CET)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8LCU-0003HK-6I
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:56:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8LAX-0001cM-DE
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:54:57 -0500
Received: from [2a00:1450:4864:20::42a] (port=34515
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8LAU-0003dE-65
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:54:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h10so15221454wrb.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJzcV0SWhl8RK+XLbpyeUP9g9LFly0TJzrt6V7cZAeA=;
 b=aXPg4sMnZbt7mQtTrYkD0U0nOo6ew5laEPOC6SeEGitX3pDopz7Z3HWE4I6Pm3ndRM
 tfqPinTAMySpVo+JYsIOPv/F8nhxoS1P4p/x9ZuIDbFvgI08xwBSc0zqbnK3fFWzSkFL
 hzD82GDQwnFjFlZcw6seP061l+u4peksqCVOBFH14UoZjl1B5sHlCl2Ols2csv45E/bB
 22gl+uCjXk6OoPErM9HvAowylD8DWWk91RamHzykwIAFwQxnJUciS2OJtiUYdmsMRv4l
 qaeI8sRiX1Uh+vZRCf+6TWnpQJcPZu0qISvOvExeEUwtUZPt3Ul/HbBKoV+D+ELiRPmc
 4Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJzcV0SWhl8RK+XLbpyeUP9g9LFly0TJzrt6V7cZAeA=;
 b=7jitFANM1wOfNJPXbvtUoccawXYxnFpqU2JBuvurYhmDFb7MDssu5Dh7tGPRBAhI0I
 XeDOUco9reXgrKHk7Gcepc1p1iRwoiUEkwp8jP84VaXk+r42sJKs4k8vQthhvwdyke7T
 O8/vo4KWIjQD9uc/nnrwaj8FWykrK60infgV+ThgW+Jaa0BgLJMF9pING7OcFtwC1rVP
 ezceAyMCaIQB8kiV5/HmkPRaDMt8ImVg9N53xEy2aMVW3/efy4AQPwu5WbHIc0tvBq7w
 +rEhmKbLzxTagKDsVcGYncFb/cJ4gJgXFUu6KkkVGPgdxbHu9iG3k51UDeIYjzRNfDrV
 owyA==
X-Gm-Message-State: AOAM531vUqBMvALOVrAjaLJOZrGApu1WzC68UIA7E+v7f25O7S5ble4B
 dwpF/dCo+EE4sbcBAG1djNwOpGDfRlE2k3eMG1ViZA==
X-Google-Smtp-Source: ABdhPJwVG6ptA/rRYXY1iRqpjV94Z2nxjFUDoY+Hh4tjmcXstvyIWBiVwQNdmHYjAVnGrmvDQ30UrW+FjLCzrXcXx2A=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr8398689wrw.2.1642161292239;
 Fri, 14 Jan 2022 03:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-27-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-27-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 11:54:41 +0000
Message-ID: <CAFEAcA-dyMGhX-+=EKAbB1BB3DCma7UuC+SKE6L_JBuXAU=u6Q@mail.gmail.com>
Subject: Re: [PATCH 26/30] bsd-user/signal.c: tswap_siginfo
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 9 Jan 2022 at 16:56, Warner Losh <imp@bsdimp.com> wrote:
>
> Convert siginfo from targer to host.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/signal.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 934528d5fb0..c954d0f4f37 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -197,6 +197,40 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>      }
>  }
>
> +static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
> +{
> +    int sig, code;
> +
> +    sig = info->si_signo;
> +    code = info->si_code;
> +    tinfo->si_signo = tswap32(sig);
> +    tinfo->si_errno = tswap32(info->si_errno);
> +    tinfo->si_code = tswap32(info->si_code);
> +    tinfo->si_pid = tswap32(info->si_pid);
> +    tinfo->si_uid = tswap32(info->si_uid);
> +    tinfo->si_status = tswap32(info->si_status);
> +    tinfo->si_addr = tswapal(info->si_addr);

This implicitly assumes FreeBSD target_siginfo_t, because
(a) all the field names are different on eg NetBSD
(b) if, like NetBSD, the pid and uid fields are inside the same
union as the addr, you can't just swap all of them unconditionally
but need different logic to handle them as part of the "which bit
of the union is valid" code.

FreeBSD-only is fine for now, but you might want to add a comment.

> +    /*
> +     * Unswapped, because we passed it through mostly untouched.  si_value is
> +     * opaque to the kernel, so we didn't bother with potentially wasting cycles
> +     * to swap it into host byte order.
> +     */
> +    tinfo->si_value.sival_ptr = info->si_value.sival_ptr;
> +    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS == sig ||
> +            SIGTRAP == sig) {
> +        tinfo->_reason._fault._trapno = tswap32(info->_reason._fault._trapno);
> +    }
> +#ifdef SIGPOLL
> +    if (SIGPOLL == sig) {
> +        tinfo->_reason._poll._band = tswap32(info->_reason._poll._band);
> +    }
> +#endif
> +    if (SI_TIMER == code) {
> +        tinfo->_reason._timer._timerid = tswap32(info->_reason._timer._timerid);
> +        tinfo->_reason._timer._overrun = tswap32(info->_reason._timer._overrun);
> +    }
> +}

You had a call to this already in the previous patch, which presumably
means that it didn't compile at that point in the series, so this
patch should be moved earlier.

My reply to patch 2 has the higher-level commentary about handling
of target_siginfo_t.

thanks
-- PMM

