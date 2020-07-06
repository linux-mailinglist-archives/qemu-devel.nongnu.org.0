Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05E215606
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 13:03:11 +0200 (CEST)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsOty-0007Fk-94
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 07:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsOtE-0006qS-0I
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:02:24 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsOtB-0004ze-Ft
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:02:23 -0400
Received: by mail-ot1-x342.google.com with SMTP id 95so20692961otw.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tYfG6sqlNtbGZ093DOP5+S26tmkxyqo9ErRc+U9zh7I=;
 b=n6htDz3qZOWBBmxlJV4mQ/d+NiosBj5r1gwSjnZBRCX9jFLH9mTvYEOKU2yF1xl3ra
 5NjOYhT7cLexOC2UUBE+oVxsPwBDIs3lF3+zkZZO6ufp6LG/fNIh+Rz6kMKB1hkX6U+V
 Sl455W4PjH/NocfpetVioL+UFzm58Lwv3xtkVZFKUP0aBCKD17cOBnM1Lo0aWV6hyg00
 CzWImnW/8Sg2Q1nZ+/y0a1XAfOKe+/FGlYR9UkPkc4GRdJgdztlR5xMMQvBfhZeUQwWt
 NzIApyLLHzDGTU7sxnp+l1pmucIgZbuI2dq9Hh5w8x0T6ZG4lucadF7zAd7omBaq1ZoB
 T8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tYfG6sqlNtbGZ093DOP5+S26tmkxyqo9ErRc+U9zh7I=;
 b=L/D+xSKkhH1g+6XAkIANN/SBZxJqUkQmWZpkE6T653FLDKCI4wnhxIj6Z1cfl6CVpz
 xtLyeRifXffMXIClULQoPgbkSi+ZglPPsaFBC4jEv2pTu+C5nHFK3w1KEUYxaUMRCHYZ
 UwNQ/hv5mS/ACAA10gl9U01cMNXVuwg/ivXifbdAUBLJIYBZbAenhmbZ58xsdPxfRh1L
 rUgXCs4eh1SxHuHTvt/B6j+onIc9Tk51XO3su7CzCiByVqjEhHnBVqkiC8gYrweVyezk
 pEHp/bOjz2A/EWHuc8XQDWSO1W4D8zpn5rH87Qk+KlGVBZJ195901bWFWFAA+yC2n/Mo
 V+FA==
X-Gm-Message-State: AOAM533iWy26u0/vv8B9OsByWbvliP+uMcjujJ7NZH+qaVLTirdPoWQI
 MXG/+WkYreaGA+399egDXdWs56MrS9W1RCVkujLMTQ==
X-Google-Smtp-Source: ABdhPJxgeIBLNJ/Gy6tEyRECGyfejDT/9UA1VuyWeQ7MU4hdwXKhOnnTWk3sIYyjcxPbx/rusNQ40blxdWsvJfAJXGg=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr33428376oto.135.1594033339896; 
 Mon, 06 Jul 2020 04:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200520172800.8499-1-richard.henderson@linaro.org>
 <20200520172800.8499-2-richard.henderson@linaro.org>
In-Reply-To: <20200520172800.8499-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 12:02:08 +0100
Message-ID: <CAFEAcA_fjbyGHyOGDZZrMnEfZuw-iLkDR76Df875a4oaJMJUeg@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] linux-user/aarch64: Reset btype for signals
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 May 2020 at 18:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The kernel sets btype for the signal handler as if for a call.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index cd521ee42d..2c596a7088 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -506,10 +506,16 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
>              + offsetof(struct target_rt_frame_record, tramp);
>      }
>      env->xregs[0] = usig;
> -    env->xregs[31] = frame_addr;
>      env->xregs[29] = frame_addr + fr_ofs;
> -    env->pc = ka->_sa_handler;
>      env->xregs[30] = return_addr;
> +    env->xregs[31] = frame_addr;
> +    env->pc = ka->_sa_handler;
> +
> +    /* Invoke the signal handler as if by indirect call.  */
> +    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
> +        env->btype = 2;
> +    }
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

