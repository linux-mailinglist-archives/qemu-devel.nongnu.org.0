Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7768B2D5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 00:22:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOoL1-0003MZ-Mt; Sun, 05 Feb 2023 18:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoL0-0003MK-3w
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:22:22 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoKx-0006lZ-Og
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:22:21 -0500
Received: by mail-vs1-xe30.google.com with SMTP id k4so10996979vsc.4
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 15:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xVQ9QDcZ90holuk+mPU4A5+2Ap46oraToHehPYLm28k=;
 b=Yezi17tcwtv7eGjHcysrP9Tck1dV6vSFnYufS4d1b7HrfZXPqnwF19rs4ZeXWGB3VX
 OC7+jANbn0lTqZIcJ5gBc56OECkFeJjgH8+WYSslFSCisijEmldQjG4DqDWdb3Zhkz2X
 lXUMOrpob6VFikvV03s9AifYsggjwtTMLZ4j+yE120OIEOpeTOaHrTxPJT2mPIXQwZ5y
 wPoeaGD0FDvtZllWjF+mEjLgqBNCyW+FDq29TjWG/Sf40uauqm+z4hE6dXV48bUQtkYq
 bOOk0Va3TRfUe6HMVWr506loFhvS8ui9o7PEK9tmzbYyJxJlT6c5/APsMVhVdtbqkbz+
 4uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVQ9QDcZ90holuk+mPU4A5+2Ap46oraToHehPYLm28k=;
 b=eWBCS6WJYt35uA55XrPBXdKaupcRXShW6zbsMmLjZghtDNUu2m8OULPoCWYRLgr20w
 HUIkG0495JxZ9V0YXFhpoHSLrXarSGLGc8YO6YxiFOvgLO4Me5mZfKu23DLyXobFY7Mo
 d71zPRYBpNtHI4/5qO4PIAa71zVbRTLGZECjis0H2uEGkQHayuPdys519Ic0n8JIpD08
 GfLJdozuk+4DJFAPf7GkCqe3eK4WIlt3TeMycoAVY8k/yGetzjOsxruirj1W0a0VuOQJ
 hAK5/pJutlnTP/B/cQFCo09/x5T7sVZPhxXC8wmrD0H7hjfcWOhGYhwKh0u1dCsLdGOM
 bRGg==
X-Gm-Message-State: AO0yUKVLGAzKB2SCiVC7bAesAxYoDfBeJv/M8BJ96ld9Y/ZwA47nmoAr
 8lvCM3lwAh3Fkv/vBGv3w90BdY1bpl2f+TWABev+F3SlRik=
X-Google-Smtp-Source: AK7set+JsTvbqRebnXf2PjfO/uak9z9mmiUb4z8hhjxe+FQL0ewTZnkLK+kr69rQEfpiBQB1Zh3vl8/IHTcVRImmzTY=
X-Received: by 2002:a67:e102:0:b0:3f0:89e1:7c80 with SMTP id
 d2-20020a67e102000000b003f089e17c80mr2193895vsl.72.1675639337702; Sun, 05 Feb
 2023 15:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20230127191758.755844-1-debug@rivosinc.com>
In-Reply-To: <20230127191758.755844-1-debug@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 09:21:51 +1000
Message-ID: <CAKmqyKO-+Jxy7zicMY3G9EDHLJM1sy-Pmif+=wg-9k5J9TLu3A@mail.gmail.com>
Subject: Re: [PATCH: fix for virt instr exception] target/riscv: fix for
 virtual instr exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Jan 28, 2023 at 6:36 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> commit fb3f3730e4 added mechanism to generate virtual instruction
> exception during instruction decode when virt is enabled.
>
> However in some situations, illegal instruction exception can be raised
> due to state of CPU. One such situation is implementing branch tracking.
> [1] An indirect branch if doesn't land on a landing pad instruction, then
> cpu must raise an illegal instruction exception.
> Implementation would raise such expcetion due to missing landing pad inst
> and not due to decode. Thus DisasContext must have `virt_inst_excp`
> initialized to false during DisasContxt initialization for TB.
>
> [1] - https://github.com/riscv/riscv-cfi
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..76f61a39d3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>      ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero = tcg_constant_tl(0);
> +    ctx->virt_inst_excp = false;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.25.1
>
>

