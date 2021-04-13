Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4E35DE37
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:04:26 +0200 (CEST)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHmK-0005eA-VO
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHjX-00043Y-RJ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:01:31 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHjV-0000wo-TT
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:01:31 -0400
Received: by mail-ed1-x535.google.com with SMTP id h10so19030048edt.13
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxhPNX6ob6J+a1RzWiZuQq3L/tjdCeK1ZCrg1qsbniA=;
 b=hXOyq9FvSAwkxFzS0CebPr0argOEb57eFBCN5j/XPZ/7D/8GCe/WY0ryjHnn1BDPzA
 tiZLM78ydPLHan/a6lldTw3UF+l5Bt7sJN3aadDUZ9l6fhCfiWadKynK22h60Z8rYb7H
 ziam6uzD0zLeEVGhJAN34qXFlO+KGSxHOQ1rW27U+czWHjvXyy5oD8qf5tVBEQamHfcl
 kXr6vHs2/Kd9QAc3Y6qytRnF9qgrcoz/0EREpO7tzKTj3xbJ/n4khj6FyRhzUnIaSlXh
 dqL/PYqOrpxiEdXptQcLH5wlBKn5fZBDYFviNNMf3a9JVsJaInsESRB/AGbp69y+Tvk4
 idxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxhPNX6ob6J+a1RzWiZuQq3L/tjdCeK1ZCrg1qsbniA=;
 b=aIHigw8x4wtfWv3TLr98dkBmBug+5Ta/58lS6aG79G6a1mVMtKOmt8ZhbINNAuaf3O
 wKM8saX3tTsvpl2LI9RuC0bB6V+oSulR9C4dgQrMMGwAGBmyPTfKT0c78OWxmCBu5NTt
 6yibCUVO/X9MKxQdK2306hiM1EOXJPWxYBKq6uwhUMelBw/+lAevMLP8m6hI5fLI6Cut
 HeOQgaqWPRCQTa0q50W2ooh3vdGTHyRadiTl9YTtyS0D+4dGt9T8FtKRjnJT5BirRtQ/
 8mCb/yVXIF1BAoN9MiXVMfn2nMG/vndGkusoiJbGsFZ2mL1Mic4BRZ5WkCeYY0tVKnHY
 RGAQ==
X-Gm-Message-State: AOAM5300CJGHfkP5DqwVX9f5mIOoJOl4JGOdkuYWp3OarI6lojU0uGsG
 +MrE8+r9ZQfmbgBJmTSRjOVsDOQab9sC6+Cy6/DEmg==
X-Google-Smtp-Source: ABdhPJypcP9GO/Yzb+inUD3cnqADqvQnSRINlnuJ6KFHbUgjDIFo6sEtOh1VWfiXtz4LuCxul4SzDCDo5VUfumTS8x0=
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr26413192edb.251.1618315288243; 
 Tue, 13 Apr 2021 05:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210413113741.214867-1-pbonzini@redhat.com>
 <20210413113741.214867-3-pbonzini@redhat.com>
In-Reply-To: <20210413113741.214867-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 13:00:42 +0100
Message-ID: <CAFEAcA9W0WEmFT_wts7oKZD=QnGhnjv8Q+-FJ+snHTRoc-KK3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] osdep: protect qemu/osdep.h with extern "C"
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 12:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> System headers may include templates if compiled with a C++ compiler,
> which cause the compiler to complain if qemu/osdep.h is included
> within a C++ source file's 'extern "C"' block.  Add
> an 'extern "C"' block directly to qemu/osdep.h, so that
> system headers can be kept out of it.
>
> There is a stray declaration early in qemu/osdep.h, which needs
> to be special cased.  Add a definition in qemu/compiler.h to
> make it look nice.
>
> config-host.h, CONFIG_TARGET, exec/poison.h and qemu/compiler.h
> are included outside the 'extern "C"' block; that is not
> an issue because they consist entirely of preprocessor directives.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  disas/nanomips.cpp      |  2 +-
>  include/qemu/compiler.h |  6 ++++++
>  include/qemu/osdep.h    | 10 +++++++++-
>  3 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 2b09655271..8ddef897f0 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -27,8 +27,8 @@
>   *      Reference Manual", Revision 01.01, April 27, 2018
>   */
>
> -extern "C" {
>  #include "qemu/osdep.h"
> +extern "C" {
>  #include "disas/dis-asm.h"
>  }
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index cf28bb2bcd..091c45248b 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -11,6 +11,12 @@
>  #define QEMU_STATIC_ANALYSIS 1
>  #endif
>
> +#ifdef __cplusplus
> +#define QEMU_EXTERN_C extern "C"
> +#else
> +#define QEMU_EXTERN_C extern
> +#endif
> +
>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>
>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b67b0a1e8c..3f8785a471 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -57,7 +57,7 @@
>  #define daemon qemu_fake_daemon_function
>  #include <stdlib.h>
>  #undef daemon
> -extern int daemon(int, int);
> +QEMU_EXTERN_C int daemon(int, int);
>  #endif
>
>  #ifdef _WIN32
> @@ -113,6 +113,10 @@ extern int daemon(int, int);
>
>  #include "glib-compat.h"
>
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
>  #ifdef _WIN32
>  #include "sysemu/os-win32.h"
>  #endif

There are some system header includes in osdep.h below this point
(sys/shm.h and sys/uio.h) -- don't they need to be moved up
to go with the other system includes first ?

thanks
-- PMM

