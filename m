Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8D581C72
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 01:37:06 +0200 (CEST)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGU6q-00088j-FZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 19:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGU4F-0006GT-9g
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 19:34:23 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGU4D-0000mr-F3
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 19:34:23 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id d124so10307316ybb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 16:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcv3BerRzS8DVpOuhoIas8P0MgVMpBkfWmBlnwFf+74=;
 b=GryJORAi3eCWU6SwjTigrM6r/SQPQrFsyklQHBkI2kUbR6gMHS2HALlgH2hWZnRGCB
 +/R/CoGHM5KIwFtQINiy9BCrNDVqutOOBrbxVW49OuYJ1QGzyoxPKj7T0sZoyPYJ4SJJ
 5XdcNXIcxUdZ38mbq2ssHLAbb7YIh9OQQv4Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcv3BerRzS8DVpOuhoIas8P0MgVMpBkfWmBlnwFf+74=;
 b=HCFJqJVDENONu8bRs1E7vD3q2BojzbtdlIK6tvMS5eU5P/YyuNjoh277+5kI+06Oh3
 AESBSNl/X7ksbUCh80Xht7CKANAKF/c7/n+lFf2Rc+GSwvLlYuWYfadPlYJgtwA2pWzN
 pU/XZpvRgfaRIh0hZQvJ95sjQolvO9DZPk7tBgMSqBuEr8hSOoS926+XK2we8R2eLmlF
 9sLFKShx2+o1Se4HhmmYqYik4QPxMEoe8H9ptUUhPCGmualNuEL9J6fQxw1pTdvJKliJ
 FuL0ckk9VrAF3LWubp6E2uMuD0mWOWinFScfgxUVb3M8n+Van8OYTHMYi8+GGt/gLzPo
 hjtA==
X-Gm-Message-State: AJIora9ZYfwVLgjeX5/pYNHlmP/DAYLNHmgZKMvPdoGzxI0K6nkvVfw3
 p56RHP8ZMHXnRqRcA7+VyDo2UHIhVTM4+8+ByazA
X-Google-Smtp-Source: AGRyM1uzhTuNY9aWPp59X9u3/Y95iBOoLJQmYnDQC8yhDQkppOdo6FSdeymYwaFcvsLUdT/+915/b96NzSG40VZOLzw=
X-Received: by 2002:a25:e687:0:b0:671:7972:45a7 with SMTP id
 d129-20020a25e687000000b00671797245a7mr3516308ybh.301.1658878459321; Tue, 26
 Jul 2022 16:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220702134149.14384-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNoijHZENxw4dtAK9BfA_-kT8vShrKaC6oero8K4BUCjQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNoijHZENxw4dtAK9BfA_-kT8vShrKaC6oero8K4BUCjQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Jul 2022 16:34:07 -0700
Message-ID: <CAOnJCUJzVwAC7YNQipLV=e+R8D6VYTOOKqoM74Edf3wO3_=MSg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix csr check for cycle{h}, instret{h},
 time{h}, hpmcounter3~31{h}
To: Alistair Francis <alistair23@gmail.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Atish Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2d.google.com
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

On Wed, Jul 20, 2022 at 9:32 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jul 2, 2022 at 11:42 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >
> > - improve the field extract progress

This part is already improved with the PMU series.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg895143.html

> > - add stand-alone check for mcuonteren when in less-privileged mode
> > - add check for scounteren when 'S' is enabled and current priv is PRV_U
> >

These two parts are fine. I am resending the remaining patches for the
PMU series.
Can you please rebase your top and resend it ?

> > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>
> + Atish
>
> Alistair
>
> > ---
> >  target/riscv/csr.c | 76 ++++++++++++++--------------------------------
> >  1 file changed, 22 insertions(+), 54 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 6dbe9b541f..a4719cbf35 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -72,66 +72,34 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >  #if !defined(CONFIG_USER_ONLY)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> > +    uint32_t field = 0;
> >
> >      if (!cpu->cfg.ext_counters) {
> >          /* The Counters extensions is not enabled */
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > -    if (riscv_cpu_virt_enabled(env)) {
> > -        switch (csrno) {
> > -        case CSR_CYCLE:
> > -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> > -                get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_TIME:
> > -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> > -                get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_INSTRET:
> > -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> > -                get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
> > -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        }
> > -        if (riscv_cpu_mxl(env) == MXL_RV32) {
> > -            switch (csrno) {
> > -            case CSR_CYCLEH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> > -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_TIMEH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> > -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_INSTRETH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> > -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> > -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            }
> > +    if (csrno <= CSR_HPMCOUNTER31 && csrno >= CSR_CYCLE) {
> > +        field = 1 << (csrno - CSR_CYCLE);
> > +    } else if (riscv_cpu_mxl(env) == MXL_RV32 && csrno <= CSR_HPMCOUNTER31H &&
> > +               csrno >= CSR_CYCLEH) {
> > +        field = 1 << (csrno - CSR_CYCLEH);
> > +    }
> > +
> > +    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field)) {
> > +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +    }
> > +
> > +    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
> > +        !get_field(env->scounteren, field)) {
> > +        if (riscv_cpu_virt_enabled(env)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        } else {
> > +            return RISCV_EXCP_ILLEGAL_INST;
> >          }
> >      }
> >  #endif
> > --
> > 2.17.1
> >
> >



-- 
Regards,
Atish

