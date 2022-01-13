Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD048DD1F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:49:05 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84Dg-0004qC-DW
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n84A2-0001KV-55
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:45:18 -0500
Received: from [2a00:1450:4864:20::334] (port=40741
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n849x-0005GO-1i
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:45:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so5875142wmo.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKgLGbZhfYhM4XnaxClShxBWrTF4DaNa3we1DOwC5vQ=;
 b=RhbybnKN2ZVpgi9BC2Je/U+rYtQqLKTS+IZfdRseCe0VNph0pPYNcoULeSxrgT+W6C
 72RIVjjfLrYDMNIcwrHcpgSDoSNoCEXb7wOg6g6cSox6Qut51U2fOOJw3uEqOHeU/461
 4TecJmbefJxFhhd76KzaFfgP2arxU2N1wRJpbcq0TMfsKkMgHbiUHXtOb0DF0gO150mJ
 78hPpEgZweK9CIro+wppFc53RGqSUvaVHeK9oCHr9INBc3LLEOxFlny1vy09yBTsmNUE
 kBe06rgbf8YBYDhb4GDBiVDNdhgYYyTVNk0vvd1IRUyKA0DFrrdf/Jz4Jh3k/wtxUe/X
 BuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKgLGbZhfYhM4XnaxClShxBWrTF4DaNa3we1DOwC5vQ=;
 b=je+vbSOWHsiLsAAINuwOv5JZO/ogZyIwxw9ea8fkHCvcr+7AegcVFc2IQH4eiQgtn5
 LFSPov2jdwGopfaF9x4aDX3m7yO0LyNERtvZTfmZRhwuo1PWv7fEZwIgFvKHL8tsRTpq
 q0SJiRTgoGXmsMxgSK1DdItKKks7rrDEDdh20F9WuWxiTHd7lo7I/pEb2IzDOFlAn2II
 sbIxgok7ewbccSCNZ6BE93C+8iBf/xpztptV6U0ZTgLH5BKiK061h93NDcG63frAenbZ
 g1bKI8R6SCMkcr5uJSxBjcv+OjYTIrs+59spOj42ydFDcVd1oP6R2CETrlrFPfFIYrYb
 GFQw==
X-Gm-Message-State: AOAM531j8l3ZLxRf+BN8IPgp/RM9snz0YG9iHhZwtG4B5CREoFUp/iiG
 3F0q2Xiaz2WQScw1Zr0xlhb7qwtwmRqJEfykSXXBUg==
X-Google-Smtp-Source: ABdhPJzAZ4lOI9BE3B4IdU9Imbi+XO3Dwdp60BGwFIBGgGVqWCXpqgrn0R+jXOD1is3iAAyYiPaQcj1ppMqlFTleMuA=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr12039387wmd.37.1642095905738; 
 Thu, 13 Jan 2022 09:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-10-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-10-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:44:54 +0000
Message-ID: <CAFEAcA-Qy0YuhovTtVApJxz0=-5QCfjZjxEMBideKWzGoCTyQg@mail.gmail.com>
Subject: Re: [PATCH 09/30] bsd-user/signal.c: implement abstract target / host
 signal translation
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement host_to_target_signal and target_to_host_signal.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  2 ++
>  bsd-user/signal.c | 11 +++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 1b3b974afe9..334f8b1d715 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -210,6 +210,8 @@ long do_sigreturn(CPUArchState *env);
>  long do_rt_sigreturn(CPUArchState *env);
>  void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
> +int target_to_host_signal(int sig);
> +int host_to_target_signal(int sig);
>
>  /* mmap.c */
>  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 844dfa19095..7ea86149981 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -2,6 +2,7 @@
>   *  Emulation of BSD signals
>   *
>   *  Copyright (c) 2003 - 2008 Fabrice Bellard
> + *  Copyright (c) 2013 Stacey Son
>   *
>   *  This program is free software; you can redistribute it and/or modify
>   *  it under the terms of the GNU General Public License as published by
> @@ -27,6 +28,16 @@
>   * fork.
>   */
>
> +int host_to_target_signal(int sig)
> +{
> +    return sig;
> +}
> +
> +int target_to_host_signal(int sig)
> +{
> +    return sig;
> +}
> +

This could use a comment:

/*
 * For the BSDs signal numbers are always the same regardless of
 * CPU architecture, so (unlike Linux) these functions are just
 * the identity mapping.
 */

(assuming that is correct, of course!)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

