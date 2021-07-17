Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7A3CC519
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 20:01:51 +0200 (CEST)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4odK-000598-Hz
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 14:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oaz-0003Pp-34
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:59:26 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oax-00052e-3v
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:59:24 -0400
Received: by mail-ej1-x62e.google.com with SMTP id v20so20405624eji.10
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OvrUz2BuNGgeYhK2kRwzeL1p09l46eJhPIZD6gRVdk=;
 b=tq0w7zK7F7Yxf9YeZkuS8oV++HBTTbci3YLqsYgMGLMvs+ISonwB9pV4mTaiTSt23a
 Hixr4We8u7tAhaSiFevgjvCgVVcsc0mgUYrSuN24KF3ajbeCFqrGrcYaZjuTFb6LZxDT
 +TFTcKYEVHJ1wrV14OpnEwW/f8a+9XBpXZa+5y3LZ9qRUwRYZTmZ6xyYtsr4pUTFWn7F
 g7IUGfFqcv7wBZtrY+GWJYwf0e/8j/3cr/19HIS+Htl3gwHOOYwHv3al8kr1yNWTMUBu
 RrncQ7JynnTZ924HdWDrndW1I98d/dXjFDwiqEKO0tn6nRXfQBj8mtEmMWPMuHuwHMn7
 SDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OvrUz2BuNGgeYhK2kRwzeL1p09l46eJhPIZD6gRVdk=;
 b=biqAWdsBbRwJTaRLJvzVFhHwbuwdlCXxkcx3xZkS5DeiM1tKo9jRf3ovfke4tdvOYp
 3rlmjxL0SwA2Fdotp+yWgAQWBqsly9jnlbnlqi/4cJ+IQoqnKrsE57Uj0EoCBGmf5b4T
 o53IXkCby5WVS2Lb2S8EGb0n0zTCgL42mBVt0PidRVfkCyv7Ku1iU61fEgGC5uLwRNNk
 x6pIwfmoiAjnvO7ksHKh1z5nazYnc+xoMmGuS8u/SuxvQduLgL17CyLtER0z3Ojoot4s
 5Jq2hJtV3oS59h/AJWrYdeTvZnhH7uSL3R+hUuYP5v0EudGgIPqgUYirlq00yC9ZAZDn
 7kMw==
X-Gm-Message-State: AOAM530L/X0tlj1j+itEiZMEKT1x7klDVxqLZmCwXjUAvcWZ+dkgCaix
 PhuMyuDuKK5AVr/kzGDtEc2Z82k8w+lfn6MdoJ+Tsg==
X-Google-Smtp-Source: ABdhPJzhPCJFvo0ZgUE0sgKHh1KwhIg+UinspkXOe09fx+Z9iDOSGL7/m8IwukLUR6A2WdupVjJ6jvZ50eGDjCau6ZA=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr18932582ejd.250.1626544760730; 
 Sat, 17 Jul 2021 10:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-11-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:58:40 +0100
Message-ID: <CAFEAcA_HdOyPdbrQ+EeGYAP88-0L_RQEbB10-7KmMqpUASzYbA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] accel/tcg: Encode breakpoint info into tb->cflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Having this data in cflags means that hashing takes care
> of selecting a TB with or without exceptions built in.
> Which means that we no longer need to flush all TBs.
>
> This does require that we single-step while we're within a page
> that contains a breakpoint, so it's not yet ideal, but should be
> an improvement over some corner-case slowdowns.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h   |  7 ++++
>  accel/tcg/cpu-exec.c      | 68 ++++++++++++++++++++++++++++++-
>  accel/tcg/translate-all.c |  4 --
>  accel/tcg/translator.c    | 85 +++++++++++++++++++++------------------
>  cpu.c                     | 24 -----------
>  5 files changed, 119 insertions(+), 69 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 6873cce8df..7ab2578f71 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -502,9 +502,16 @@ struct TranslationBlock {
>  #define CF_USE_ICOUNT    0x00020000
>  #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
>  #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
> +#define CF_BP_MASK       0x00300000 /* See below */
> +#define CF_BP_SHIFT      20
>  #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
>  #define CF_CLUSTER_SHIFT 24
>
> +#define CF_BP_NONE       (0 << CF_BP_SHIFT) /* TB does not interact with BPs */
> +#define CF_BP_SSTEP      (1 << CF_BP_SHIFT) /* gdbstub single-step in effect */
> +#define CF_BP_GDB        (2 << CF_BP_SHIFT) /* gdbstub breakpoint at tb->pc */
> +#define CF_BP_CPU        (3 << CF_BP_SHIFT) /* arch breakpoint at tb->pc */
> +
>      /* Per-vCPU dynamic tracing state used to generate this TB */
>      uint32_t trace_vcpu_dstate;
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 4d043a11aa..179a425ece 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -222,6 +222,65 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
>      }
>  }
>
> +static uint32_t cflags_for_breakpoints(CPUState *cpu, target_ulong pc,
> +                                       uint32_t cflags)
> +{
> +    uint32_t bflags = 0;
> +
> +    if (unlikely(cpu->singlestep_enabled)) {
> +        bflags = CF_BP_SSTEP;
> +    } else {

Won't this ignore breakpoints when singlestepping ?

-- PMM

