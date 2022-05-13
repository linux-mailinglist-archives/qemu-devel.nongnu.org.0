Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B818452692C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:24:01 +0200 (CEST)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZxI-0000Ky-Qi
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZtj-00037u-NO
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:20:20 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:43111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZtd-0000gF-1e
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:20:19 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ec42eae76bso98478007b3.10
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 11:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0sXzrqcKcf3tDaxu1ixrFLf0edjxpfgfyVXLoLF5xc8=;
 b=eVwrsqwpkAsGNZt98I7FTeoZcLz+C4MSYwAnq4QP8O1j81mcKgXMKpSN1SolqpW4Dl
 tziNVtVAM+dKc364DlQPggH+9i4VIiOC+7NZ9a9QqnxzyJtqS1Nb7fPDRHA/l1JiuqL8
 KzHUbdf5efilAfUHoSRbIhjn+76IvzIX4xgZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0sXzrqcKcf3tDaxu1ixrFLf0edjxpfgfyVXLoLF5xc8=;
 b=W80/ONDDid/oJv+HIPrVgjr+ELCEo1YUXpJQk9GbMhEaRsTuoDwhYN1JtDdmGpNn5q
 03zXNiA/6Q6NgNpDGIihFRoTEt6cHadtRrgyobo6F+B7y5Rt4H8hClEP5De4nSUhPwvK
 vyL5i9FTkFhrlGo1tIaBl/3wEo4gyTRL0NI0S10VB6PbLmvDsZ43dFxD5UsBUyXlFSqK
 vAI5dJntoYdb8da64bVn9phF4F0LjktJXxP3IgPesRaPI8TA0pCQ83f2+LfQhQjdakX/
 MdzIEDQ2QNdv7PHle5ZEUeQFduLBczbjCgFxnCOkh7Rl+coMHHor7N69WCCB2FJ73xni
 6K7w==
X-Gm-Message-State: AOAM5301fIO2TMHpRKehq4x4fiAxL/arlPCLgEHFDb1OBjJuY5rC7BC3
 4xKTxCmxXSEj8jrNos+2EtDKeBg10XhnIOgr6g3A
X-Google-Smtp-Source: ABdhPJylPZb4mrDBVDg96bf9yD+8SjoNZHALQBXIOsJ/J2EifKyrDAaPEwJPb2kRspbVqQfoOEM6BzpE6G5dXX36Z0k=
X-Received: by 2002:a81:54e:0:b0:2fe:c027:1ca7 with SMTP id
 75-20020a81054e000000b002fec0271ca7mr3201785ywf.249.1652466008445; Fri, 13
 May 2022 11:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-2-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 May 2022 11:19:57 -0700
Message-ID: <CAOnJCUJ6fKPBgM-Hs2nrXn4dNO_naPCj=MxiU_0ZDqLBA249aQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] target/riscv: Fix csr number based privilege
 checking
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 7:46 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
> the riscv_csrrw_check() function should generate virtual instruction
> trap instead illegal instruction trap.
>
> Fixes: 0a42f4c44088 (" target/riscv: Fix CSR perm checking for HS mode")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3500e07f92..2bf0a97196 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>      int read_only = get_field(csrno, 0xC00) == 3;
>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    int effective_priv = env->priv;
> +    int csr_priv, effective_priv = env->priv;
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          effective_priv++;
>      }
>
> -    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
> +    csr_priv = get_field(csrno, 0x300);
> +    if (!env->debugger && (effective_priv < csr_priv)) {
> +        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> --
> 2.34.1
>

It seems Alistair has already queued a similar fix
https://www.mail-archive.com/qemu-devel@nongnu.org/msg886861.html

-- 
Regards,
Atish

