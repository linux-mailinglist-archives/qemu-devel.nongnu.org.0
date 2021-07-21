Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933033D0CAA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:08:37 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6A5c-0007n1-Dy
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m69mP-000323-Vk
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:48:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m69mO-0004CW-3R
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:48:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id l6so1073688wmq.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=EpfYfDc0tG7k8C1t+vJN+5Y3qY+l+pz0p0/pwHjzh0M=;
 b=br8etoiU6JlGLdCq+me74tBHOLa4HFcUbYxlHRQ4lMJVMqDPlrO2V3hjmW0DcA2NvB
 TItjCPDeyPrRTG/fYGQIT83mVLqkY0N8icD5sgxJo0x5YrOGcVm1FPVc4j8pNn1gKjTv
 LMGLVVX2BO63z42+swEeEhyooTP4lxOv+7iI5bDqvSrDbV8nlWanLeQ3UTAJJ94qFzPG
 UgvQPKyR/ZoGsy9+nRc0urqvdcMcCglQ8Ol3z0Fy3YCcecYDumXCUlZDeykiI5tHdqez
 rCJgaKS0HW111mNn7XNB+0KGhDlVtn33wxAPwzIUTVZ75vDFeU9Xm29jsuu0GM3Sny8V
 6NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=EpfYfDc0tG7k8C1t+vJN+5Y3qY+l+pz0p0/pwHjzh0M=;
 b=nAXGJb21W+nIY2A3+YEfgzEK2BhlcntlDo+GkqFk0zSm137CucUlaBEJvU7YxsKfcd
 reqxmXn/OIM4zu6Ap0kYiXwO4QFpiKCU5MyP/ytv+jNxTQyW0GAk6vRgtYXNT1D9qjJl
 kvprjfFfYIOkCgrchBa0r+D0S4JvYdGMzn4KHrNgcFogzbFQ4+8MTq9LXdJ12RVLqy/m
 0b8HpKbQA20C3K7KyDwKTG307DlXzbPlGLr31LAoau2MTJswvSr/am+SLs2BVXQxBhs3
 xFtOwORoqBHj5by9LGExqxIy/6TiarrXKNSySaa7lQAm+IQdovWpX53XB9Lc3wc3nplS
 BGyw==
X-Gm-Message-State: AOAM533ZEvjoXooiP6/S6xC3OR7leeClmA3iFVKKCzt1wQoDew6b5tce
 27qYPMUFMhJ5v3YD+wd1PlEXUA==
X-Google-Smtp-Source: ABdhPJxMVQ6HPTEvkAto6gO3m5niG1H8yVVYUToVq9/q/VCGdiEOh9nCwjL6YhXTEyyOaMS4LceTsg==
X-Received: by 2002:a05:600c:ac3:: with SMTP id
 c3mr37745767wmr.4.1626864522539; 
 Wed, 21 Jul 2021 03:48:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm26239309wrx.76.2021.07.21.03.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:48:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89F7C1FF7E;
 Wed, 21 Jul 2021 11:48:40 +0100 (BST)
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-18-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v6 17/17] accel/tcg: Record singlestep_enabled
 in tb->cflags
Date: Wed, 21 Jul 2021 11:38:37 +0100
In-reply-to: <20210720195439.626594-18-richard.henderson@linaro.org>
Message-ID: <878s20kkmv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Set CF_SINGLE_STEP when single-stepping is enabled.
> This avoids the need to flush all tb's when turning
> single-stepping on or off.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h   | 1 +
>  accel/tcg/cpu-exec.c      | 7 ++++++-
>  accel/tcg/translate-all.c | 4 ----
>  accel/tcg/translator.c    | 7 +------
>  cpu.c                     | 4 ----
>  5 files changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 6873cce8df..5d1b6d80fb 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -497,6 +497,7 @@ struct TranslationBlock {
>  #define CF_COUNT_MASK    0x000001ff
>  #define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
>  #define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
> +#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
>  #define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
>  #define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
>  #define CF_USE_ICOUNT    0x00020000
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 5cc6363f4c..fc895cf51e 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -150,10 +150,15 @@ uint32_t curr_cflags(CPUState *cpu)
>      uint32_t cflags =3D cpu->tcg_cflags;
>=20=20
>      /*
> +     * Record gdb single-step.  We should be exiting the TB by raising
> +     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
> +     *
>       * For singlestep and -d nochain, suppress goto_tb so that
>       * we can log -d cpu,exec after every TB.
>       */
> -    if (singlestep) {
> +    if (unlikely(cpu->singlestep_enabled)) {
> +        cflags |=3D CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP |
>      1;

What does CF_SINGLE_STEP achieve that isn't already handled by having:

  cflags |=3D CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;

(btw did we mask CF_COUNT_MASK somewhere else?). Because surely the
CF_COUNT is part of cflags so limits the TB's that could be returned
anyway?


> +    } else if (singlestep) {
>          cflags |=3D CF_NO_GOTO_TB | 1;
>      } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>          cflags |=3D CF_NO_GOTO_TB;
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index bf82c15aab..bbfcfb698c 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1432,10 +1432,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>      QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 !=3D TCG_MAX_INSNS);
>=20=20
> -    if (cpu->singlestep_enabled) {
> -        max_insns =3D 1;
> -    }
> -
>   buffer_overflow:
>      tb =3D tcg_tb_alloc(tcg_ctx);
>      if (unlikely(!tb)) {
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index b45337f3ba..c53a7f8e44 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -38,11 +38,6 @@ bool translator_use_goto_tb(DisasContextBase *db, targ=
et_ulong dest)
>          return false;
>      }
>=20=20
> -    /* Suppress goto_tb in the case of single-steping.  */
> -    if (db->singlestep_enabled) {
> -        return false;
> -    }
> -
>      /* Check for the dest on the same page as the start of the TB.  */
>      return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) =3D=3D 0;
>  }
> @@ -60,7 +55,7 @@ void translator_loop(const TranslatorOps *ops, DisasCon=
textBase *db,
>      db->is_jmp =3D DISAS_NEXT;
>      db->num_insns =3D 0;
>      db->max_insns =3D max_insns;
> -    db->singlestep_enabled =3D cpu->singlestep_enabled;
> +    db->singlestep_enabled =3D cflags & CF_SINGLE_STEP;
>=20=20
>      ops->init_disas_context(db, cpu);
>      tcg_debug_assert(db->is_jmp =3D=3D DISAS_NEXT);  /* no early exit */
> diff --git a/cpu.c b/cpu.c
> index d6ae5ae581..e1799a15bc 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -326,10 +326,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
>          cpu->singlestep_enabled =3D enabled;
>          if (kvm_enabled()) {
>              kvm_update_guest_debug(cpu, 0);
> -        } else {
> -            /* must flush all the translated code to avoid inconsistenci=
es */
> -            /* XXX: only flush what is necessary */
> -            tb_flush(cpu);
>          }
>          trace_breakpoint_singlestep(cpu->cpu_index, enabled);
>      }


--=20
Alex Benn=C3=A9e

