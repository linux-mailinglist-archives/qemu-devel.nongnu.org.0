Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9773B74A2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:47:38 +0200 (CEST)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyF1V-0005z4-G0
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEvU-0005DM-Ix
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:41:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEvQ-00005A-D2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:41:24 -0400
Received: by mail-ej1-x62f.google.com with SMTP id o11so23625680ejd.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U1Zvd3xKfQSgXX9N7/hWoHqkrcD9Fzrhn40y1JuIVVk=;
 b=z3PIOkB4VRtPe7/NJRjxzTRcdZGNaEgW/fjqy23SUdurtw/zp3SlQqEONzTaYI1aiV
 PiF3dIEMVzJIgmSbtGyeLw3GYqbhqWygix9P3yugyh94uBAklPY5Vi/pxRlXsZSKJNCM
 2RNlA2GFnwxOln25Q73YsK5nSrGNYO95N6vnr6st3OeBpUJCwVyKCiNoUiXm6GWENkzF
 eECjj2A11Fg2vlI2Ng8jra8pCf6YLHc+U7tUiSGXWPudHbJnZluqr+4cjrNfvsH0zEJt
 7PTb/HzGoNSTIawWrs39HJEe+xmkv6uZwKUJy0kohjF1XAspebuJeAwAtdxjVfvPJXM6
 Q2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U1Zvd3xKfQSgXX9N7/hWoHqkrcD9Fzrhn40y1JuIVVk=;
 b=bu88+Rja5nMZYHOlNCMm9lCjNq19JdexFDKYEkevdzGmtTSZXMgjDhkZu7ofQSmwQF
 MrjbZRDWH0bNe83m4GIF9RLpQtxBjYiZcX5QIVjmnnnqkgaPAi5337yU15/y9y0JbW67
 469TFYqHrl98kdoTXAPDTzSa9wsFepIWxwnIZXI8lUikGkiA61vyNUSzG+jDbesszhaz
 wEyMWCXmSLf4hQAHEd1msl7R/F62Q719g0IQUIAx8w2pMeqn4xZJ9UPA5NOBa3T86GTh
 rIHS3qdMRi0DYhuhHK0naqkERZjfz5INbfFXzOlPRKtlHdRnUAMhd+/zWDc26Q72mwHD
 EerQ==
X-Gm-Message-State: AOAM53024wUXTRaFLv+3ZxxMmLZg4XZZwSOUv6OHQsc4LRCyMjy3MG0s
 nF1CFCEujMPdpkA3Evss5q2s76yRYgR20uyWLRCkCg==
X-Google-Smtp-Source: ABdhPJy/3fX5U3hdHx3Nzgffim0UhsI0g57Kq6m4L7V6rnKkiuTBjioLwFJvyPl5u7+Ool5S6KrD13MGU/ON/tI19lI=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr30058552ejs.4.1624977678344; 
 Tue, 29 Jun 2021 07:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-11-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 15:40:40 +0100
Message-ID: <CAFEAcA9SZmnxcN48_JEcfkSyUDhngcW0Z34DquMpjAaHyPm-cA@mail.gmail.com>
Subject: Re: [PATCH v2 10/23] linux-user/i386: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> Note that x86_64 does not use this code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/i386/target_signal.h   |  2 ++
>  linux-user/x86_64/target_signal.h |  3 +++
>  linux-user/i386/signal.c          | 42 ++++++++++++++++++-------------
>  3 files changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
> index 50361af874..64d09f2e75 100644
> --- a/linux-user/i386/target_signal.h
> +++ b/linux-user/i386/target_signal.h
> @@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
>  #include "../generic/signal.h"
>
>  #define TARGET_ARCH_HAS_SETUP_FRAME
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +
>  #endif /* I386_TARGET_SIGNAL_H */
> diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
> index 4ea74f20dd..4673c5a886 100644
> --- a/linux-user/x86_64/target_signal.h
> +++ b/linux-user/x86_64/target_signal.h
> @@ -21,4 +21,7 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +/* For x86_64, use of SA_RESTORER is mandatory. */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
> +
>  #endif /* X86_64_TARGET_SIGNAL_H */
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index 8701774e37..a83ecba54f 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -337,16 +337,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>          __put_user(ka->sa_restorer, &frame->pretcode);
>      } else {
> -        uint16_t val16;
> -        abi_ulong retcode_addr;
> -        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
> -        __put_user(retcode_addr, &frame->pretcode);
> -        /* This is popl %eax ; movl $,%eax ; int $0x80 */
> -        val16 = 0xb858;
> -        __put_user(val16, (uint16_t *)(frame->retcode+0));
> -        __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
> -        val16 = 0x80cd;
> -        __put_user(val16, (uint16_t *)(frame->retcode+6));
> +        __put_user(default_sigreturn, &frame->pretcode);
>

In the kernel in arch/x86/kernel/signal.c there is a comment:

        /*
         * This is popl %eax ; movl $__NR_sigreturn, %eax ; int $0x80
         *
         * WE DO NOT USE IT ANY MORE! It's only left here for historical
         * reasons and because gdb uses it as a signature to notice
         * signal handler stack frames.
         */

which suggests that we also should continue to fill in the
retcode bytes in the signal frame for gdb's benefit even though
we don't actually execute them any more.

thanks
-- PMM

