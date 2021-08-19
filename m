Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B243F207C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:21:05 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnb6-00011S-9U
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGnZu-00006C-JQ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:19:50 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGnZr-00044x-A2
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:19:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id dj8so10414046edb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z+ijzJuK3AxkVIhbD9WRW+OuXS8t2Ky23gI2rEggEYo=;
 b=RmeOdUTN/N+KmAKOjJzZTS7QMOvx2oP6TNXbAI16iyQCPOZnxvZL+kbm1TKLL0FYL5
 MQbfHzous6ofovC/CuzRWsAi00jmKEnR1ULuyaWbjhPQ+h+Sp2OsL4hx7dibBh1FVIw8
 AdvBHr5s0RuWMc5eApolKeDD2/DxImojpKRY6nDHw1Xbn9irnXr2o8F2goxy17QysDgG
 J/xYLIH83oFXcQvCLFhrNrNfIltF9H3SIUcHkYMK6Xh1McV7IQFPt5k7439ciclDXxWF
 ScxiRAZmb/8HXMt8QjaQwncyYhJeN3J0PNmdI9npn1LJdpPZzt1JuJ+bMJSs2W0h6HEc
 tJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z+ijzJuK3AxkVIhbD9WRW+OuXS8t2Ky23gI2rEggEYo=;
 b=pt+71OV+HqiYi13mzBDZGSud0S6uQyg+sox1ID4vAszZosmyhYd7jV1A7iwAZpyiC/
 BoRoPJQWdm5yFM8xnbCsKbyVf9YcZXfE0PYenAbifRvj3GZX5vH4i1n6iLmzzFw7v4Pu
 uGUeFSRm4GObnJalxPypmCLas8LoHWmXjCbDJzODjLBxUD/Jj3MMpkjvQg2qdTl93Syp
 20pHYHw6zWmImxs6rmiSE+ypOuKhIyLWgCrT3hWih7lP5IBKu3LCRAy4zNAHJhSrEolN
 BKwY2ww3LlfR/M1AjPa1bjfzftq2jo8+0lr8O7E/huPXB+lhNlLHfenTXLQg7rXOVdtt
 5eqg==
X-Gm-Message-State: AOAM531hjD1l3xY6ow+ogDfareyoq5cmcqlJGE+GA5efSrwMXE5TJI95
 +bJ2nBWY+wF5EhW3swhQdA817Mq8jCFo1OobiIgv0Q==
X-Google-Smtp-Source: ABdhPJxWN8RzTKPWr9snsJ+x5lr7YpcvKyfECxZiWM9tKSBJaAUVHx0XZeFDJy4ZWE4t+WNwXms1fQKqPVZ0eR7i9yc=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr18028073edb.52.1629400785576; 
 Thu, 19 Aug 2021 12:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 20:18:59 +0100
Message-ID: <CAFEAcA9NF0zR8eyzys-V6+VjhfM=7WGLYMYTHkSm-RSH7LHnGA@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNDEFINED and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.

> @@ -9500,7 +9504,25 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      CPUARMState *env = cpu->env_ptr;
>      unsigned int insn;
>
> -    if (arm_pre_translate_insn(dc)) {
> +    /* Singlestep exceptions have the highest priority. */
> +    if (arm_check_ss_active(dc)) {
> +        dc->base.pc_next += 4;
> +        return;
> +    }
> +
> +    if (dc->base.pc_next & 3) {
> +        /*
> +         * PC alignment fault.  This has priority over the instruction abort
> +         * that we would receive from a translation fault via arm_ldl_code
> +         * (or the execution of the kernelpage entrypoint).
> +         */
> +        gen_exception_insn(dc, dc->base.pc_next, EXCP_UDEF,
> +                           syn_pcalignment(), default_exception_el(dc));
> +        dc->base.pc_next = QEMU_ALIGN_UP(dc->base.pc_next, 4);

Just noticed that section G1.16.7 says that when we report
PC alignment faults to AArch32 they should be prefetch aborts,
not UDEF. The fault address and fault status registers also need
to be set (with slightly varying behaviour for when the fault
is taken to Hyp mode).

For AArch64 we should also be setting the FAR, which means
that for consistency it's better to use EXCP_PREFETCH_ABORT
and set exception.vaddress in the translate-a64.c code
(you get better logging in the exception-entry code)
even though these different EXCP_* all boil down to the
same synchronous-exception vector.

-- PMM

