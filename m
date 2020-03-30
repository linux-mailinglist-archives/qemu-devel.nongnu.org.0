Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F948197C76
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 15:08:22 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIu9N-00027q-4E
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 09:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jIu8L-0001B6-PI
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 09:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jIu8K-0003kw-C2
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 09:07:17 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:32781)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jIu8K-0003jy-1y
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 09:07:16 -0400
Received: by mail-oi1-x241.google.com with SMTP id m14so15623250oic.0
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N9kafDzItByaOJgeiXXAocdwy9zkWyh6uH03myYBXi8=;
 b=q2DRcg003lIzIt4qr4qLLzhprWqRI72/HbDgA7X060z0UO53Yyd7qoCk5w/Dz1sfyE
 hYLNCETWlHSTapt6kLIZWvqwYdyhSxKEck6RSovl0orEeGuhDIvB5py0E2VEN0yl57bX
 XwSMuYBqto++M7gAF3kib4Q7h+bZhXxesfzAQPbyam9RTd+jWALgGHoj62HIgqvpcEsY
 D9NRtAn9Boshc80WG/AWhtlRdldQL5qfhAgUzW8vTmESTdDHic+ZXe4baYmt1DKV/mRi
 mHEds3aR/F0PMRj5CUWtRUY3jIPa1gQ0Gzu2QM32vvAcifwWZMSncAmJ64sznE3VEVle
 SwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N9kafDzItByaOJgeiXXAocdwy9zkWyh6uH03myYBXi8=;
 b=t3qYASMY6e3PjOaTDGtNRgJ8D6G4KB71hL5YHg0urMm/rzuHImvX0IBHOgaApEkZb9
 UrGFcOh0pM6IFNXZ35wMnGXCa0p1hvvhmTwnDMp7EoatsWBW8OWhTWY6TXI94dDfXQHc
 x2TBIStycc3icvFoz0rvFc8P+h4ZTiFsCE6CYULjI4FMu0azKAsxrk9vQM41TdoGxt75
 VUr6kgypeoPNmMbpk8/BIiH3KQGW/2k6MEDFGy0QDpWWnugXDEYHjYBdl15hccVDUf9A
 4qHYGz4/X8GvGXYPGjzC8cIIunpDoXRsB5S1UTjLf8BPPFnfue/7tRLk8veoSGDrVsX1
 TmTw==
X-Gm-Message-State: ANhLgQ3MEVxIzTGCMF3gAk03YOLsCHrfB0RjzEh3MSd8FcIR11OoyopF
 zXOy67Tw+vle6TmrmzoTAOdX66NGJZjBbnj3R40cQA==
X-Google-Smtp-Source: ADFU+vsGj8ysKF96hHAylAfIGqiljqkHSf2FyDYUSEq79ErldEXuppocUJjy50G/llp5kgQBFeoTGcxQ9MOppHEzlnc=
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr7187724oih.146.1585573634743; 
 Mon, 30 Mar 2020 06:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200328140232.17278-1-changbin.du@gmail.com>
In-Reply-To: <20200328140232.17278-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Mar 2020 14:07:03 +0100
Message-ID: <CAFEAcA8B=WB9ow3ZU4jcf7Z+dXizPRpsGp_BB7KPG4hfhH-cUw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix incorrect current EL bug in aarch32
 exception emulation
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 28 Mar 2020 at 14:02, Changbin Du <changbin.du@gmail.com> wrote:
>
> The arm_current_el() should be invoked after mode switching. Otherwise, we
> get a wrong current EL value, since current EL is also determined by
> current mode.
>
> Fixes: 4a2696c0d4 ("target/arm: Set PAN bit as required on exception entry")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b7b6887241..163c91a1cc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9172,7 +9172,6 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>
>      /* Change the CPU state so as to actually take the exception. */
>      switch_mode(env, new_mode);
> -    new_el = arm_current_el(env);
>
>      /*
>       * For exceptions taken to AArch32 we must clear the SS bit in both
> @@ -9184,6 +9183,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>      env->condexec_bits = 0;
>      /* Switch to the new mode, and to the correct instruction set.  */
>      env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> +
> +    /* This must be after mode switching. */
> +    new_el = arm_current_el(env);
> +
>      /* Set new mode endianness */
>      env->uncached_cpsr &= ~CPSR_E;
>      if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
> --
> 2.25.1



Applied to target-arm.next, thanks.

-- PMM

