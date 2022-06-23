Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F55588EE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 21:33:11 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4SZi-0005YD-3U
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 15:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4SXl-0004Il-Px
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 15:31:09 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4SXf-0004es-8r
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 15:31:09 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i15so817312ybp.1
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WwePLIT928gsV+QuavVvVXgXAJxXenGkNsUer6Z5uho=;
 b=ZtfbC0N0iLgmzbxkqtMF7KoIqtabuklCxTDaZ3FIbHgfys3Aqv/34qMyKT52IPe8Nx
 IZ5ZV2EY38EzdS+q+SHZV7SmN0jhjC79qTD1+s20/aVtv5I1i+o9YLWd9O07XuqHCz/l
 vAM0cfIGj1i+lAl2Gv2TVbwXU1oTtYWKw7HCA8tCPlRN2nqphU719BfEYo6S6SrtQngm
 c8jbbSAMBtvDObsyqxoPvI5ITbFDyGAyu+YUGI1rrMBYaOsMt8/6Sq/KIQ6XaZr5G13n
 PbZkyYEmzw7KRlAEe4h4mSjeC5cRNh8c+5PEbik1Pd7VKbipbCPk58KnvyNP6sFjEDUW
 Dkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwePLIT928gsV+QuavVvVXgXAJxXenGkNsUer6Z5uho=;
 b=0sbCUEjdetTlHrGumN5U4UFX6POTgkR4zP8vntp/xIG+f63pptb3/+Ck5D3NFqg4Xp
 EPkM9O9uROMuhBi7cvcGKKU+6/DqEEQxpNzqFaCIIEKcXWJ36+OYiBSFEgaUxs8sTSWq
 Ge0my+1umZCZxLSdIWANOOya1JZ+ldyip1Tz/e+9XWh6DbzPjdGv0pD4kcMktKauAVUB
 FeFFDO7Uanq60VPL48e7ulcMN2pzkYFAZhA0TfNCHeocCP56oLmJc3dHGJ9BZGYrbNHW
 CeP4LQakgjKuddrVkVWtg2+z+59c275mTz7qmnVevV9hadlcJaYVNywMOMXaf0/YafzM
 dr9Q==
X-Gm-Message-State: AJIora8uKsSaUhxMgnNKi152kz2tVJz7DwkkXP0JlEWvDdic72cZpunW
 ef0Einu6rhzk/Ly5/nLMb6SsgNsdLYm1NpW5cMMuVg==
X-Google-Smtp-Source: AGRyM1vbAdW3v05gSqkTHU2bd9L7ijpqHW0yCkgvW93U1HiGHLkGhoI3cnSldNjkXhfpjuPls32XkwnsNRDvX1G1N2I=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr11147925ybr.39.1656012661642; Thu, 23
 Jun 2022 12:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220623164051.506316-1-thuth@redhat.com>
In-Reply-To: <20220623164051.506316-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 20:30:24 +0100
Message-ID: <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
Subject: Re: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow
 wrappers
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 23 Jun 2022 at 17:41, Thomas Huth <thuth@redhat.com> wrote:
>
> According to commit cec07c0b612975 these wrappers were required
> for GCC < 5.0 and Clang < 3.8. We don't support such old compilers
> at all anymore, so we can remove the wrappers now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Not sure whether it's nicer to remove these to get rid of some lines
>  of code, or whether it's nicer to keep them for the more explicit names...
>
>  include/qemu/host-utils.h    | 235 +----------------------------------
>  accel/tcg/tcg-runtime-gvec.c |  16 +--
>  fpu/softfloat.c              |  10 +-
>  libdecnumber/decNumber.c     |   4 +-
>  target/arm/mve_helper.c      |  18 +--
>  5 files changed, 29 insertions(+), 254 deletions(-)
>
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index bc743f5e32..6224815629 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -366,231 +366,6 @@ static inline uint64_t uabs64(int64_t v)
>      return v < 0 ? -v : v;
>  }
>
> -/**
> - * sadd32_overflow - addition with overflow indication
> - * @x, @y: addends
> - * @ret: Output for sum
> - *
> - * Computes *@ret = @x + @y, and returns true if and only if that
> - * value has been truncated.
> - */
> -static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
> -{
> -#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
> -    return __builtin_add_overflow(x, y, ret);
> -#else
> -    *ret = x + y;
> -    return ((*ret ^ x) & ~(x ^ y)) < 0;
> -#endif
> -}

I think I'd prefer to keep the wrapper functions and just delete
the fallback ifdeffery, but I guess I don't feel really strongly
about it. Richard, do you have an opinion?

-- PMM

