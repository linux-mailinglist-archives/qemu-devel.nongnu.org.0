Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFA30BCAB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:09:54 +0100 (CET)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tZB-0000cB-FE
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXV-0007v9-Pt
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:08:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXT-00058T-4u
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:08:09 -0500
Received: by mail-ej1-x62d.google.com with SMTP id rv9so29253723ejb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a7hqaW6hEJtiOm4/CE4cMAH+PRLbyPDVjjwBBVgIOJE=;
 b=GAh+5urbEiNQGe3AyZwZCXjyESdDJqj5GXRrNPgV/V9V+s7xDkG0i2cnkhf6Pji4Xe
 PJbpXrthh3QJt2OgBGZZdmUaDHXpy01SO+2f9F31JtW6kbg3U708cGHVRjWbSk4eeW2C
 LtKXMvnY6vmft9kAj6euDdWFYjU9MkmdqDCj0AdRr/bH0BDZN6L+xbYvTHz7gX1XX8cK
 EptlrVYWfQFEPOZV4uUgHi4nAfv6tunzRgSQLqd2xf/4EVb8OOZ6aciPeV9rHLfgTEEf
 Z+CclTdwmcyjEC2g6JBb7ckSiGaJQLhUgtoubx4V5VpRkQBG+MHvXAoZBxKaG243jiQQ
 5w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a7hqaW6hEJtiOm4/CE4cMAH+PRLbyPDVjjwBBVgIOJE=;
 b=DbG5aPNajUU9JgxApE0WkTCVgt6+y2YJY9IPKM2X7fy4TBXF4Z4IAuz01Qdzfe8W7U
 4lsnb4gex9TmQiMS8IZwH85mb1pt2mJmECdmwLA0ZvREI0QmNQeC1WTeQEM3Rjeg5fIH
 JVtV8wiMlhedh4jg494zfYs3xywQktE3YTCPrfNcxVT3NyoaWcws8af6FJa7ZKMRKl+I
 JF1Rte0aN6CGkrRXkyprx6yfRIru2u3tLJiy4hLJisYqKuobYXHWdV1VitpuAYlUG+XZ
 KC+rYSVQvX3NPibl6k/cKdfHHwWd3AlzNTh06ReB6qPP9hvXA7Eiikq7aVrvZo558iZc
 bUnA==
X-Gm-Message-State: AOAM532hVscaWCZRRb3HN2eekX5H3EZZyqTYKo7rzQ1xjZu26WG9jDRQ
 4sr+siQWTgm48PrLUpY20DpRWZUyP1mP9rQvFUDOCQ==
X-Google-Smtp-Source: ABdhPJwPsJaRJG5mINxoE8At/p4WNZUctf6xmoKRKgC4jF/KJd+8MHWfs1+/qTrzEh7FwNLv55H0xw9SIKhxCZVGsDw=
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr21712605ejv.4.1612264085619; 
 Tue, 02 Feb 2021 03:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20210128033655.1029577-1-iris@modwiz.com>
In-Reply-To: <20210128033655.1029577-1-iris@modwiz.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:07:54 +0000
Message-ID: <CAFEAcA8806xXHXjVA5bSSwcAowiqKKdu0L-VQNttULmTtTnq=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix buffer size reporting with
 FIFO disabled
To: Iris Johnson <iris@modwiz.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 03:36, Iris Johnson <iris@modwiz.com> wrote:
>
> Currently the Exynos 4210 UART code always reports available FIFO space
> when the backend checks for buffer space. When the FIFO is disabled this
> is behavior causes the backend chardev code to replace the data before the
> guest can read it.
>
> This patch changes adds the logic to report the capacity properly when the
> FIFO is not being used.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913344
> Signed-off-by: Iris Johnson <iris@modwiz.com>
> ---
>  hw/char/exynos4210_uart.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

