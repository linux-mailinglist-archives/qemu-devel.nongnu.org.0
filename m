Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3363828B2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:46:40 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZpf-0004Nc-9e
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liZTp-0000mm-BM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:24:05 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liZTn-0001Iu-EI
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:24:05 -0400
Received: by mail-ed1-x532.google.com with SMTP id h16so6010981edr.6
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NN8UntOfDX46eAxGEjgAwdQ0p4Qooys9g6L+jzz/iQ4=;
 b=PQ+HvJfdX4EIFfavCFup6sHU9jPKDVenwk1S2MYpZZsjuyvd/YwbSDRn7LzQo7D7XK
 z+6uvUWWFOZ0zOBcRe44TvSrxpwFdyFo0NVz6VdpboywOeFUARLNMXNiZLyEDXdCyiVv
 DWIckKz1/Rj2Oi0wUCqgnEdWI76Wm+PgkgPT0/IR8bI61YaPDRB/4jUhpdg1ovqm2rhs
 iFNBQW8P//xlNe3uHD/s2favwsltnodnhXOyKuDXOvE+BiC4a4kPG4d0yvrj7F/qdM/3
 dsC8gVeGffl0r+GXLwzmtXbBY7IZ37CprZTdxg+J/9epCCy7vVhh9+FsJ//47uPXTxdK
 8beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NN8UntOfDX46eAxGEjgAwdQ0p4Qooys9g6L+jzz/iQ4=;
 b=RMMjwMASEo/F0Ep0O9JJquViRn6r7pehg4MHDaWR1d6uFd1bV3voplUOerGWATxdAN
 xa1YEQL8OtW77ZjFIeSH8g0ISDxbctzuwLKX4P8QgLyCPeTq0hT2ePegn0DZkAQojCO/
 ZOW0lB+oSdffLkRoMFlo8bWnKAUu7a6Yb47/XmKsectOBlpzqSb7fpmIHI/kA6qmp5GH
 LfDdzmGNhjGKalHa37sgH4IHFXXzHbhx0Pr1bSvDUQ4ymMvuCdlmpsQNmtZuQZu/74Ly
 c29kDgkM7j4vIZ1q4uYY2bPI+eUCqhgc4NXB3ch6A7GRvjpH6pMcIhrCeqqipn+L1wUT
 HFig==
X-Gm-Message-State: AOAM533QONKxU06xxGmzU2jHmpLocLypYUgLx9vZFqcjnmbHztv6HoFJ
 MoKdzXrFZyU5voWbNZbmkA5zmYdpQ9tM3zsNCWWeaA==
X-Google-Smtp-Source: ABdhPJyPe2X00Pn455fgXS77AOYiETM786y6rElR7jESah7GekvMBAWJzoeLCZaHNPBhQCwOm1ySks8ZqIuLcH9AtbQ=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr2454330edb.100.1621243441726; 
 Mon, 17 May 2021 02:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <1621220021-17199-1-git-send-email-maobibo@loongson.cn>
In-Reply-To: <1621220021-17199-1-git-send-email-maobibo@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 May 2021 10:23:46 +0100
Message-ID: <CAFEAcA_MbNm0QEtnAegW3uCpuvgTymUx7=depcxhqbpTkuEm8g@mail.gmail.com>
Subject: Re: [PATCH] include/qemu/bswap.h: using atomic memory load/store for
 word access
To: Bibo Mao <maobibo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 at 03:54, Bibo Mao <maobibo@loongson.cn> wrote:
>
> virtio ring buffer has lockless ring buffer scheme. When guest vcpu
> reads the memory, qemu io thread may is writing the same address.
> It requiires atomic operation in qemu side, __builtin_memcpy may
> read byte-by-byte.
>
> This patch uses fix this, however it may bring negative performance
> effect on system which does not support hw aligned memory access.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  /*
> - * Any compiler worth its salt will turn these memcpy into native unaligned
> - * operations.  Thus we don't need to play games with packed attributes, or
> - * inline byte-by-byte stores.
> - * Some compilation environments (eg some fortify-source implementations)
> - * may intercept memcpy() in a way that defeats the compiler optimization,
> - * though, so we use __builtin_memcpy() to give ourselves the best chance
> - * of good performance.
> + * Some driver using lockless ring buffer like virtio ring requires that
> + * it should be atomic, since guest vcpu thread is reading the memory.
> + * It may bring out negative performance effect for architectures which
> + * do not support hw memory aligned access like mips, if ptr is not word
> + * alignment.
>   */
>
>  static inline int lduw_he_p(const void *ptr)
>  {
> -    uint16_t r;
> -    __builtin_memcpy(&r, ptr, sizeof(r));
> -    return r;
> +    return *(uint16_t *)ptr;

We rely on these functions handling unaligned pointers, as
the comment you delete notes. This change will not merely
"bring negative performance effect", it will cause crashes
on hosts like SPARC.

(Your change makes these functions have undefined behaviour in C,
which is why it will cause crashes on some systems.)

We do need to add support in various bits of the memory subsystem
for "this really does have to be atomic" (notably so that we can
do atomic read-modify-write actions when doing page table walks),
but that has to be done by adding extra APIs as necessary. And in
some places we already *have* those functions.

Can you describe the problem you're trying to solve in greater
detail? Notably:
 * what are the stacktraces for the accesses that end up in these
   functions ? (ie what is the top level function call or set of
   function calls that need to have must-be-atomic variants?)
 * can we guarantee that the pointers really are aligned there?

thanks
-- PMM

