Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC4A696A25
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyQB-0003Cb-H7; Tue, 14 Feb 2023 11:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRyQA-0003CR-6l
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:44:46 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRyQ8-000802-JG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:44:45 -0500
Received: by mail-pl1-x62a.google.com with SMTP id m2so17625148plg.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U39z6gRkEQHC8GxhfWe5xhGgJlH6IVFRSzLRMCrrmtA=;
 b=U4dBmxwo9U7DHk4DKCquuHWkQFh2oVsvCUQTAv8wBESbW7nDHUWnDEl64PK8kE1mWm
 ckRgNr1E8jEGfTkSrx6n6rdbNgLgJ/dthljQ8J/itZcgxsh0sGqEP1l3qkUKCBAek66w
 2QQykh54GWl1DiDd6X1+tKJT0opwpJ/rm6YqEUo+7JvUHkS+7x/SmzkkgI6GRrPrupny
 Ej7Zj/xxjSXZWaovoUwpV4jFcq89b52O0tkc8sQhekcgIIDuDiIY38LY9QqAFMeUKNdv
 NY3/IVtGYQv9hW8/1dnaduD0kNHiEG50f9H1C3pLL1jq1mat27L5cMKBZSOkInWm6EQA
 k6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U39z6gRkEQHC8GxhfWe5xhGgJlH6IVFRSzLRMCrrmtA=;
 b=OzqHwJBMaDg9IGAsB3KbL3dJf/Y4HCQF/5zU/p5ex80sOYj9zLXJMECQzFk8Es4MeN
 CP93gHbfXzLST5xw4UTeU37Wps955gFMcOcI7CmY2VzckvDjlRPI/iNvGEbVdXzNP7G/
 q4wYU3FGKYhwHZ23IR2W14sgIJMtmUGO3nM7Fz36AKtE1i9it7dqv8Awa1DLSGizkTfg
 HzTLbwNs4gPjlrwaxaFH4PJ0d7+JZ1Owy7VjMSUbSaIxSRGEyU/XWVAGQpzHM2aPLvTU
 eoqfLpIfdvggYN2SGBbPCvinXBhIgTxwmwgOWgkjjMVisWKNJW3H7IxaZqCquJwhT/Tz
 GaNA==
X-Gm-Message-State: AO0yUKWvp2xyB+ITkJ8jqUndaIsHR1biidwvbJF3LObW5NmXgciJ1t1a
 t9ikeXItjVpfIwjbauNW9sD/WuZ6WPJqt91LMo/XGA==
X-Google-Smtp-Source: AK7set9f1owOogtopV9KHvcSeLWdRJQ/Ehun9qOBclOxOG4KAE6VXKjWXVoywASOCGy9fXzp31XHYe1rlIbsiDNC99A=
X-Received: by 2002:a17:90a:7809:b0:233:e796:757b with SMTP id
 w9-20020a17090a780900b00233e796757bmr33797pjk.26.1676393082598; Tue, 14 Feb
 2023 08:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-2-pierrick.bouvier@linaro.org>
In-Reply-To: <20230213161352.17199-2-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 16:44:31 +0000
Message-ID: <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
Subject: Re: [PATCH 1/4] util/cacheflush: fix illegal instruction on
 windows-arm64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 richard.henderson@linaro.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 at 20:50, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> mrs instruction fails as an illegal instruction.
> For now, no cache information is retrieved for this platform.
> It could be specialized later, using Windows API.

Unless I'm misreading the code, there's a sys_cache_info()
implementation that's only guarded by if defined(_WIN32), so
presumably we're using that on AArch64 also. Does it return
sensible values ?

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  util/cacheflush.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/util/cacheflush.c b/util/cacheflush.c
> index 2c2c73e085..149f103d32 100644
> --- a/util/cacheflush.c
> +++ b/util/cacheflush.c
> @@ -121,8 +121,9 @@ static void sys_cache_info(int *isize, int *dsize)
>  static bool have_coherent_icache;
>  #endif
>
> -#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
> +#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
>  /* Apple does not expose CTR_EL0, so we must use system interfaces. */
> +/* Does not work on windows-arm64, illegal instruction using mrs */

This comment should be better integrated with the previous, because
the reason for the illegal instruction exception on Windows is the
same as for macos -- the OS doesn't expose CTR_EL0 to userspace.

>  static uint64_t save_ctr_el0;
>  static void arch_cache_info(int *isize, int *dsize)
>  {
> @@ -225,7 +226,7 @@ static void __attribute__((constructor)) init_cache_info(void)
>
>  /* Caches are coherent and do not require flushing; symbol inline. */
>
> -#elif defined(__aarch64__)
> +#elif defined(__aarch64__) && !defined(CONFIG_WIN32)

This will cause us to not use the generic aarch64 flush_idcache_range(),
which uses DC CVAU and IC IVAU. Does that not work on Windows?

If it doesn't then I think the ifdeffery would be more clearly
structured as

#elif defined(__aarch64__)

ifdef CONFIG_DARWIN
[macos implementation of flush_idcache_range]
#elif defined(CONFIG_WIN32)
/* Explanation here of why the generic version doesn't work */
#else
/* generic version */
#endif

#elif defined(__mips__)

etc

thanks
-- PMM

