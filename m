Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E43D0348
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:47:25 +0200 (CEST)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5weB-00045q-NJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wdE-0003Kf-Vg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:46:24 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wdD-00087K-9m
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:46:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id ec55so30106372edb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dV2y4ev8TKD2jmqnFB35ki08nbFPCADvHqzNi3ugXtY=;
 b=Ql0Hggb112wrXBgNhclHvFDfO+Q47X7URAAzcakvDyKc6mKSbKSmsBYYHh8XnGG4Vs
 na21MBQqddnKjMEZhhwW4ChX5C+2NL71uFhPPRBNrMSPShlXV5H1G2Q/yT3o12WaD82c
 NGfE8d9+oxquYIz4UVsCc3G1gwS899ioU+NrBN9I9OnMtw/3jL5w2hJDMXyEsGPCzJeC
 MU/TNnlXKlnCsevWG8j+CZkNw8npTAjnMEnsnuWLT3XA55M7tILLI/Kdv6Q5TLf2RMbX
 /ts31t7E65Y27AUufGHUgwT9ANJpI6uZcSsHJcMZdccSQRCpGC6v6iJUCHAf+jz+npi5
 zypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV2y4ev8TKD2jmqnFB35ki08nbFPCADvHqzNi3ugXtY=;
 b=OmqKJJJMEsQQI6NVFY+Imx6Es3NW/2GC8F/P9jcb/eVbUMA+e/tkNSaNcwzqTTJ8Fn
 ZKDpZqKYKfVSFO9rxyk8vKK6688aAVUuvrTnE9v0jaDKfIfiwzxU/v662cUjSRYjqAST
 El30wys7hAkbeOrFKW1zTBLoOa1ivF7Lm+hYiwgckSW474M5eCCLqn6OrMkYNq56w7/+
 neJLodamAo+y/0wKbfG0LAwW5pIShC9s/tXmLB107sCrWH72otS8ijSz+gvQG5u/fJYF
 KLHQx7FDeqgcZezLqkge0drfYkAYKOnjYA5MmTrfRkwuyYq0lT11MjRHpzYFk34deJzp
 dnCg==
X-Gm-Message-State: AOAM531XuRYVCxshuMRhio26ttiugZVKLh+2w3NkJUbX5thHgu586+rX
 Ryv2wqCeZOCSNGTnyBmSLpf+fpTFuZv/X4pv2gHmAA==
X-Google-Smtp-Source: ABdhPJz9wgDI7BrjSn1X5jxlpX7hd8htLqpgPpfd9WD50Jml93g6FQMuEVHch7zeWNgqaGULQqoejYwXzdgqAHFK85w=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr43644165edb.52.1626813981454; 
 Tue, 20 Jul 2021 13:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-16-richard.henderson@linaro.org>
In-Reply-To: <20210720195439.626594-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 21:45:40 +0100
Message-ID: <CAFEAcA8aiY0_G4NOdrZDwCJWo9NYp7yErjyBZMtXzJJPqeteTg@mail.gmail.com>
Subject: Re: [PATCH for-6.1 v6 15/17] accel/tcg: Remove
 TranslatorOps.breakpoint_check
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 20:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The hook is now unused, with breakpoints checked outside translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/translator.h     | 11 -----------
>  target/arm/helper.h           |  2 --
>  target/alpha/translate.c      | 16 ----------------
>  target/arm/debug_helper.c     |  7 -------
>  target/arm/translate-a64.c    | 25 -------------------------
>  target/arm/translate.c        | 29 -----------------------------
>  target/avr/translate.c        | 18 ------------------
>  target/cris/translate.c       | 20 --------------------
>  target/hexagon/translate.c    | 17 -----------------
>  target/hppa/translate.c       | 11 -----------
>  target/i386/tcg/translate.c   | 28 ----------------------------
>  target/m68k/translate.c       | 18 ------------------
>  target/microblaze/translate.c | 18 ------------------
>  target/mips/tcg/translate.c   | 19 -------------------
>  target/nios2/translate.c      | 27 ---------------------------
>  target/openrisc/translate.c   | 17 -----------------
>  target/ppc/translate.c        | 18 ------------------
>  target/riscv/translate.c      | 17 -----------------
>  target/rx/translate.c         | 14 --------------
>  target/s390x/tcg/translate.c  | 24 ------------------------
>  target/sh4/translate.c        | 18 ------------------
>  target/sparc/translate.c      | 17 -----------------
>  target/tricore/translate.c    | 16 ----------------
>  target/xtensa/translate.c     | 17 -----------------
>  24 files changed, 424 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

