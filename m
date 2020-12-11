Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320A2D76A5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:35:24 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniZv-0003Zl-EQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kniYI-0002h3-UP
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:33:43 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:46584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kniYG-0007Tj-0D
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:33:42 -0500
Received: by mail-ej1-x644.google.com with SMTP id bo9so12321552ejb.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p3E+2tdhcsalJlYFMqDfpyXcQAdE6AWnQpzhBJoX4m8=;
 b=QwSEUpOYl0gQq46YhyMCtHNOf4FB/gpHgB5+MAhpdj7Kx+Hp2v6ZrEa+jHoi7DqMNO
 DL7GqPn6hzxNMPsb82eso7PCHq2OaSLiKnLwAEmw/M23I6KVFxokM0sqkMwXpO5mTJrU
 TtJMoWTBt4WyARepzupn4/wqWmApaTuoteSYedYdeW4FDIoC5nrrHhJIeTWk7H4fVSih
 caQMV/Ob7adyDZSfspeRM7tT49/WNK2iYGQS7bzUtq5Hks7mWOulbp2+u3bQnG3uU7sT
 rFevAAeg9nY46xIIQjqYELjUkhhH7V9JEMmqomW+uEXqmZd0zFdV8K2ESdkQfHCJZsLE
 MrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p3E+2tdhcsalJlYFMqDfpyXcQAdE6AWnQpzhBJoX4m8=;
 b=JZDY4lThRQXJBA1ZJyPk2ntz1PFH2DJiJJCoNVKyjW6Utv/zpIVZNYQycZaZk5kLkr
 d583BAiS4kzczW8H0zXlmr+B0rVbTiqGntJyfF36WJBuxx9aDSjUCugZzFMuy5ZYmaxW
 a4jcZhjPy00Jn3EAG0iNi6GbWv1Ccxx9ZaoM9NbPJp1mqYSTYYDEqnSFXSgtlFXMbvno
 GcD7N49BxwhDvpqQiTkJ+DSMy8bgBsRS0RWE39gr6BvyKAhYdyfi42ppKd+0OCTmfnF7
 JGvyoYzyPmvYdo1YwWKw35Lmw/TS30z6f07XzrDFXQncY8SzPzks7sGG7gtsqJFjuKk1
 rZBw==
X-Gm-Message-State: AOAM533AL0XU7faPkWzwvuNQ3J03gNjeS6oFwhd/Hdfordt9eqH3BITn
 SX8UciSkGTTkUu3f0hvd9SXhsqf99nZ+D7Mvhi7yag==
X-Google-Smtp-Source: ABdhPJxGrCBZPHW7t0l/PyYsqOMrTnI4/IoUAOnD+sG8Cfc8QLxqUTFPQcHJmv2B8O78e27dP0i0ukGyiMl1FYOeyQo=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr11087465ejb.56.1607693618496; 
 Fri, 11 Dec 2020 05:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20201211131346.473882-1-philmd@redhat.com>
In-Reply-To: <20201211131346.473882-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 13:33:27 +0000
Message-ID: <CAFEAcA-xn2QfcJ9pWx6SW=sjh3GeNZ_aOA_SHoycqC=zE-5ozQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 13:13, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >=3D 4.8.
>
> (clang >=3D 3.4 advertizes itself as GCC >=3D 4.2 compatible and supports
> __builtin_expect too)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> [PMD: #error if likely/unlikely already defined]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Supersedes: <20201210134752.780923-4-marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c76281f3540..ae1aee79c8d 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -43,14 +43,11 @@
>  #define tostring(s)    #s
>  #endif
>
> -#ifndef likely
> -#if __GNUC__ < 3
> -#define __builtin_expect(x, n) (x)
> +#if defined(likely) || defined(unlikely)
> +#error building with likely/unlikely is not supported

When exactly will the system headers have 'likely' defined,
and when would they define it to something other than the
obvious __builtin_expect() definition the way we do?

likely() and unlikely() in my view fall into a category of
macros like "container_of()" which aren't defined by a system
header but which do have a standard known set of semantics.

I think there are two reasonable approaches:
 (1) just define the macro, on the assumption that the
system headers won't have done (because these aren't standard
macros)
 (2) as we do with container_of() currently, wrap our
definitions in #ifndef whatever, so that we assume that
whatever version we might have got from the system is fine

I don't think there's any point in explicitly #error-ing here:
in fact, it makes the diagnostic to the user less useful,
because instead of the compiler complaining about the macro
being defined twice and giving both locations where it was
defined, now it won't tell the user where the other definition
was...

I think my preference would be "just drop the ifdef", but
there isn't much in it really.

thanks
-- PMM

