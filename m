Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AC40EA25
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:43:32 +0200 (CEST)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwM7-0003hj-MZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwI9-00016y-OU
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:39:27 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwI7-0002PJ-LD
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:39:25 -0400
Received: by mail-qk1-x736.google.com with SMTP id f22so9483268qkm.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QG1d80ZSFNwzQ78CXqH2EmSI/8n0iLw5YU/daRZnQ/Q=;
 b=CwcOu5v1UGcnGyUgjmHg9XF8Ua2WXpA9IGYU3t7D7K+TQ6osGghbdf6i4FAMYhs9TR
 BRbDOHycpqMRvblr+cC/oeJMnbS60Q/0dRX84B/dn2z7pe8TcFrMsIHCLDorsXfn1QaG
 gVbowAwwjNVbUh4jmTWtBtVAGcc/7ODw9tRfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QG1d80ZSFNwzQ78CXqH2EmSI/8n0iLw5YU/daRZnQ/Q=;
 b=wDlvt/KjTql+0r+XoH+xrEL88De/zxuqwXQGedovVcZWplEJdViiUDzHdpEHtnhIa/
 7VOdSOLYX/xwp0YJN75HkDgEsjK1OzSQFXXbVFaBQ0U2oF9/TJ+vuPkIH+pHAmGNsfzK
 fBiG/vf1KtLq4q1XG7LeOgb/UY5KvwACzlwRB4doVpGRH2RkR7MZWSlccDIWI6M1vHmr
 nyg2vpHHYqCEz+95r0IbrS8EOkI2knMCbpBhKEPsi4CItjaBX4dwoWd2RoblxoZsqXV4
 J8Bti+7EnNwzAnz9h1wMr2rxnAqBtM1wcB6x9p/bh787pJc8n61BL8s8c6Sau/hDRD03
 31UA==
X-Gm-Message-State: AOAM530eVRnh1uHLhA0hT7QqDELAmLf+bUtbr3WiluO4iZ2QCrbQYF+P
 ygNegWBVPWseNTKnCNV2NCv4ofiPxX26TUWtFuk+
X-Google-Smtp-Source: ABdhPJxXQGzpwOpKdE2KJB3cJ0wnsAhN5XXjfzjO6k419Fo/TbcJrtsy4+zP9itdnpARjwzlpQt9Cq5GPi8KFXoEcQo=
X-Received: by 2002:a25:1683:: with SMTP id 125mr8496897ybw.164.1631817562105; 
 Thu, 16 Sep 2021 11:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-2-atish.patra@wdc.com>
 <CAEUhbmXEiLiskioH=ZZa7W=naZHWC8288GAkbeakTfC21MEAUg@mail.gmail.com>
In-Reply-To: <CAEUhbmXEiLiskioH=ZZa7W=naZHWC8288GAkbeakTfC21MEAUg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Sep 2021 11:39:11 -0700
Message-ID: <CAOnJCUK+8trfTaB3R3-awE4_iEzq9m+uq6jDu+iFgfjJDegBmA@mail.gmail.com>
Subject: Re: [ RFC v2 1/9] target/riscv: Fix PMU CSR predicate function
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=atishp@atishpatra.org; helo=mail-qk1-x736.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 7:51 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 10, 2021 at 4:27 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Currently, the predicate function for PMU related CSRs only works if
> > virtualization is enabled. Ideally, they should check the mcountern
> > bits before cycle/minstret/hpmcounterx access. The predicate function
> > also calculates the counter index incorrectly for hpmcounterx.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/csr.c | 62 +++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 58 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 9a4ed18ac597..0515d851b948 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -62,12 +62,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >  #if !defined(CONFIG_USER_ONLY)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> > +    int ctr_index;
> >
> >      if (!cpu->cfg.ext_counters) {
> >          /* The Counters extensions is not enabled */
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > +    if (env->priv == PRV_S) {
> > +        switch (csrno) {
> > +        case CSR_CYCLE:
> > +            if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_TIME:
> > +            if (!get_field(env->mcounteren, HCOUNTEREN_TM)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_INSTRET:
> > +            if (!get_field(env->mcounteren, HCOUNTEREN_IR)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > +            ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> > +            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        }
> > +        if (riscv_cpu_is_32bit(env)) {
> > +            switch (csrno) {
> > +            case CSR_CYCLEH:
> > +                if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_TIMEH:
> > +                if (!get_field(env->mcounteren, HCOUNTEREN_TM)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_INSTRETH:
> > +                if (!get_field(env->mcounteren, HCOUNTEREN_IR)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > +                ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
> > +                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> >      if (riscv_cpu_virt_enabled(env)) {
> >          switch (csrno) {
> >          case CSR_CYCLE:
> > @@ -89,8 +141,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >              }
> >              break;
> >          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
> > -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
> > +            ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
>
> ctr_index = csrno - CSR_CYCLE;

Will update it.

>
> > +            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > +                get_field(env->mcounteren, 1 << ctr_index)) {
>
> This fix (along with the H part below) should be put in a separate patch.

Sure.

>
> >                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >              }
> >              break;
> > @@ -116,8 +169,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >                  }
> >                  break;
> >              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> > -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> > +                ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
>
> ctr_index = csrno - CSR_CYCLEH;
>
> > +                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > +                    get_field(env->mcounteren, 1 << ctr_index)) {
> >                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >                  }
> >                  break;
> > --
>
> You may need to rebase the patch on:
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210915084601.24304-1-bmeng.cn@gmail.com/
>

Sure.

> Regards,
> Bin
>


-- 
Regards,
Atish

