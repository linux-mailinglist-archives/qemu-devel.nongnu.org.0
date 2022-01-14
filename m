Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C048E98A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:57:55 +0100 (CET)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8LDO-0004ex-HN
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8LBD-0002R4-LU
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:55:39 -0500
Received: from [2a00:1450:4864:20::434] (port=40947
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8LBC-0003xM-9a
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:55:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id x4so15197973wru.7
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/4PkC9LFwC8jCYuuuNa5ITeMs8d5PdfIukGKhq00K0=;
 b=po+iPlK+I7FlIycnLMNASP2fLyEUAkp0HCmz7lpHn55CJU5R+cSiCfFcHLMHQfJkZF
 CKNGrLZoEZ7gYQRAIvNeKg4BZleFhrKmYi8gGEkCvy3rxNKNyrvxANpC9T8M+i+SPUR0
 YXxEVs7WhTq+9Chwb4GpqnZ3a0G4ElcObQbeb6xkNKp/Z4EFvoGQX+8ASbul6ol+ODcu
 jbZYrfBxED1cZS3cOGvDpolxbAInYpPSqsiuzvJUdgmnKby5i+28KS3QhEK1PXyPeNyS
 nhcjs8CoPk6VCLckQ2itCJ/QS3fe2DdF02nKQ8BXnPbEZYIQwKRb2xNCrCTqECr+w4eg
 KE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/4PkC9LFwC8jCYuuuNa5ITeMs8d5PdfIukGKhq00K0=;
 b=Iioa/FYunmXii+SAWjoqBjd77Tc41dPxUylxPm4EOE1q39oIDQi1dxMuroHnDD10Ik
 eZgrYz162PNLZLbxy4L4Zj6B2ZalZnQcwhXHpu9daK3MUkW5tebU61B4mau97lzAUobN
 MmfVxE3ACTzpYBSVhoqWKsf1bEUizMJ/cDvYUYsupoHEzb08dqxLiQWOvW9mxjhYGtpP
 Emwaryi0rzWFCibJ1h0/tmuQUqhTqGl1q5MGQ07nm5WpGJloPi996WMp1XRNGtXzjguw
 tKOTV1/v4KXZ5tWx57rtwcyRKbiHDxSNnQ1vQIxvk3Q8PoW/yTfes8BbL46u0nbUw6fu
 7WKw==
X-Gm-Message-State: AOAM530otygVjLYp+11VlP9qtjO5FvobgIeGDWLPBZp4U/RVNoOvq9S4
 kljNf3LcGf3F9M+y0ed1KLQryyTgPX9GMaUcp5P5sA==
X-Google-Smtp-Source: ABdhPJw6RrKYZVVtwY4sC9RtV1Z8QGXlb9OLsLIysP1LZ9O3/MsMB0cPNHVqKSD3t5NoXwr1vN5eRyNJuiwx/Sd7USY=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr8401376wrw.2.1642161336767;
 Fri, 14 Jan 2022 03:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-28-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-28-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 11:55:25 +0000
Message-ID: <CAFEAcA-qmK3BNJccDDYznPkG4559f5Kwqz7h7HNom3fuPP1TgA@mail.gmail.com>
Subject: Re: [PATCH 27/30] bsd-user/signal.c: process_pending_signals
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

On Sun, 9 Jan 2022 at 16:57, Warner Losh <imp@bsdimp.com> wrote:
>
> Process the currently queued signals.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/signal.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index c954d0f4f37..1dd6dbb4ee1 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -781,6 +781,40 @@ static void handle_pending_signal(CPUArchState *cpu_env, int sig,
>
>  void process_pending_signals(CPUArchState *cpu_env)

I won't review this, because I favour using the logic that
linux-user does here.

-- PMM

