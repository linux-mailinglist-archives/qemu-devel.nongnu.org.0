Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827248DEDC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:26:46 +0100 (CET)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86gH-0003A2-C9
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:26:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86c2-0005g5-VZ
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:22:23 -0500
Received: from [2a00:1450:4864:20::42f] (port=37579
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86c1-0004aJ-G7
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:22:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t20so4744425wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Za22PiAYv/g/Uwi4wBM8hDA1fWBkvvaIrvWlq27yEkM=;
 b=Vfxiq0mBNb3BIpskkSoSvumRgjl7Yvp3N3Q8kp5yh8w6HI75zCeZNWFOH2DL/scnXY
 eqm3N29Q/qAMpskfPTCJ2yHYse/RXTGxx56D9OD9vqdnXWpBsGfxSB0CkSZ1RRLnJYDE
 GFmZl3TUTrXlXaBS1vrNlEuM0I93xRgikmOeTHbQbMMxGyDtczJWYbCq1+igHjGdgN7R
 So8xTdJy8Z/f1ITYAJkeLzLpzF6SPR9opZYDbxz3xjPUxv73nPgkqtaXdmxLvGZa8M+P
 eAEIel9si2v4/D0GQFxY6ZOyiY9lx89aYjfSfZY/K+jvb1c1PgqZwI/q48YZngxkYIqT
 JTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Za22PiAYv/g/Uwi4wBM8hDA1fWBkvvaIrvWlq27yEkM=;
 b=ISLN8TE9+ieICGx56h0blEiZa3xWgnQAxW2Aj7dzO1M7o0r8KLYre8NnRdCTZcmssU
 W3pDKa2oMBZHmUB16kIOrYiQ3HtO8UZ1UH6EwC5okiI42M3ThyNuJd+TpENHUEASxuVR
 A6Vwa/DT3bTpL+Kzthx7giXd4PC/1AdEKcaeNxQbgtEANbB0un7ap4kIAWlhBd0/0XOu
 3CTBvTPyIT2EOcZdyjQHhpp7L8mF8NoU9/+onmBoNCcof/WgqKIHTgKrtC3IL80fp8vG
 /cmpv0Tuu8+DyJvAnA44j/970bMAnyi8dTkBQZwyP5cLxi6KzPsZeBbgscrVDqoygKoi
 tr5Q==
X-Gm-Message-State: AOAM531EzTBh4wTh5lQAS5GA+eEnzHAd3oBEV4PvHTg0py3KXV33pd2z
 DcSUJMclLt0OB+rBMKKYJk6Eq7uc6gApGDGXseg1I/xIZjo=
X-Google-Smtp-Source: ABdhPJzqZ6Y4rSpA67+k7lJ//3H7o9vwFMA+5E2PJRQHpIEBU8lRCVJ4gf8upqYKVFD/Hy/AiDMbpLDtgBQ3F9kghgo=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr5570222wrv.521.1642105340168; 
 Thu, 13 Jan 2022 12:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-21-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-21-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:22:09 +0000
Message-ID: <CAFEAcA8ZMSuxyJiHEBbwnZ3cGyBdUrzSBiigLn7=8jWaH1YO4A@mail.gmail.com>
Subject: Re: [PATCH 20/30] bsd-user/signal.c: core_dump_signal
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

On Sun, 9 Jan 2022 at 16:48, Warner Losh <imp@bsdimp.com> wrote:
>
> Returns 1 for signals that cause core files.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/signal.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index a6e07277fb2..824535be8b8 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -92,6 +92,23 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>      }
>  }
>
> +/* Returns 1 if given signal should dump core if not handled. */
> +static int core_dump_signal(int sig)
> +{
> +    switch (sig) {
> +    case TARGET_SIGABRT:
> +    case TARGET_SIGFPE:
> +    case TARGET_SIGILL:
> +    case TARGET_SIGQUIT:
> +    case TARGET_SIGSEGV:
> +    case TARGET_SIGTRAP:
> +    case TARGET_SIGBUS:
> +        return 1;
> +    default:
> +        return 0;
> +    }
> +}

Code is fine, but since this is a static function with no callers
the compiler is going to emit a warning about that. It's a small
function, so the easiest thing is just to squash this into the
following patch which is what adds the code that calls it.

thanks
-- PMM

