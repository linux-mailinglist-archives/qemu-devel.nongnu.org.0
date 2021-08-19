Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0793F1D39
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:46:22 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkFJ-00006l-Qn
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkDv-0007dG-NL
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:44:55 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkDu-0003NZ-5A
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:44:55 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bq25so13776745ejb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09AWHbcioMW/DmwQQ6riuLDAtSeSqIx5aXQ98j86iek=;
 b=AWobz9gbohmW/sVm1h8NGzVzAniz3a+BmYQpDt2/9KIpAb9rCxebLlphc6WyTbaUGI
 33gZW0W/zk0NDNQvW2H29nTmamQt3scnnECgujOCA8RKAHEaHrkuJXM8/aJqq/+2TsBx
 l6WuFROlxAhFDgBdgSJAsZAcVsCPbddFVvlSACCGVFOj2YdbURyxogEjxeRY3wZiEhDJ
 PequPo2zTO97NUJInRM2fyIOlLEbdUJH+KBe8ckgDSQQtefeQYE7Ca6JgZOu/ysL5fs2
 B+tBKpZQ26r9xZMOUUoElSmMgWItRoi6WDXf9Aus5B1SUX945JN4vNTdZNzo97XyFUIZ
 mdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09AWHbcioMW/DmwQQ6riuLDAtSeSqIx5aXQ98j86iek=;
 b=aM4/RZ2R7Rq6ZX0eR+GC8ldU0S3qMsLmkTLkKfKndCbRCoCi8TKmNC7HXI6/WZR6k7
 CSMcLezjdEsAmt7S3CmjVnfgJV/lCyUfEKXInSDD3PfQxNSTZB0ELJlrRNfWq7kAICh9
 XF6a3B+JSzimutEu+M6W9GnZVWW5svxPBY12be+exEJahmeWQStIWNmuYXTUAwlbgP/7
 c13rh/wfFz8GfOU9cM0uUrpF5jKE5HhTSn1vee1bng3px9KYfi4ExCM+5JmZcRs7tslc
 3izHqaFHL5OrxUVwSURR/jLkjFlRyAtY9tpNxPu/CBXkiZRY0vCqH1nhZEbcYUODLZMS
 wmcA==
X-Gm-Message-State: AOAM532KXIEk9Hh8DqOar/RCK5b7HMhslPQVq2srACqi+lRsgI6BMF2I
 tncbl75n+BU9NskdY6yJl97gpNGFdr8AI95rzalKPQ==
X-Google-Smtp-Source: ABdhPJzqLFUVLsQ/adqNxn+bQ6eWPukiWSXh3DQ1UpjSpEeRBJEYn5aEC6DufM/1ncuwYOgyANkcbHhTjP6yziHSRts=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr16416054ejb.4.1629387892838; 
 Thu, 19 Aug 2021 08:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-12-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:44:06 +0100
Message-ID: <CAFEAcA9tXBUsVuDbWyVCgFeN9-PXwgRp82jZ8JbtCXBB7RSLsg@mail.gmail.com>
Subject: Re: [PATCH v3 11/66] target/ppc: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For simplicity on the linux-user side, always use SPR_DAR.
>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ppc/cpu_loop.c | 2 +-
>  target/ppc/cpu_init.c     | 2 +-
>  target/ppc/excp_helper.c  | 2 ++
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index fa91ea0eed..d72d30248b 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -165,7 +165,7 @@ void cpu_loop(CPUPPCState *env)
>              info.si_signo = TARGET_SIGBUS;
>              info.si_errno = 0;
>              info.si_code = TARGET_BUS_ADRALN;
> -            info._sifields._sigfault._addr = env->nip;
> +            info._sifields._sigfault._addr = env->spr[SPR_DAR];
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
>          case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 505a0ed6ac..84fb6bbb83 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9014,12 +9014,12 @@ static const struct TCGCPUOps ppc_tcg_ops = {
>    .initialize = ppc_translate_init,
>    .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
>    .tlb_fill = ppc_cpu_tlb_fill,
> +  .do_unaligned_access = ppc_cpu_do_unaligned_access,
>
>  #ifndef CONFIG_USER_ONLY
>    .do_interrupt = ppc_cpu_do_interrupt,
>    .cpu_exec_enter = ppc_cpu_exec_enter,
>    .cpu_exec_exit = ppc_cpu_exec_exit,
> -  .do_unaligned_access = ppc_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>  #endif /* CONFIG_TCG */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d7743704ac..08cc474340 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1505,6 +1505,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      CPUPPCState *env = cs->env_ptr;
>
>      switch (env->mmu_model) {

If you add a comment giving the same info the commit message has, eg:

       /*
        * In user-only mode we always set SPR_DAR regardless of CPU type
        * so that the linux-user/ppc code only needs to look in one place
        */

then
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

