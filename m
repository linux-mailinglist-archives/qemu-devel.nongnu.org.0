Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AA485B0C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:50:26 +0100 (CET)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EAq-0001ws-0f
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:50:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5E6s-0005ZF-3w
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:46:19 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=43567
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5E6q-0006oi-Ai
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:46:17 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id p15so1721811ybk.10
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5USgIA2nAiUdSLBoxwlrKOM0//qGpuQCArlzEii5Zo=;
 b=qQgy+VUivfDkL9Q3CGfcfl9mEWiLwUkG+qMiR6USQqP4oFkk+G1LixXBbyG9AgIvvH
 xMHri8pWvdVqBJbNWGctihjdYfC/Svb2OaLl68DrypVPSPWdzeAdEDmg1ake1+Rtez25
 T9Q15iMD47a6qNvh/BSEm/ppEymWkshj0hi+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5USgIA2nAiUdSLBoxwlrKOM0//qGpuQCArlzEii5Zo=;
 b=WqEH8kE2vEKtiZTLxF7UkCSw42+wFsmJtHBKqZ3rt4DEqMJJc3eHwKU5eAecfl0oLL
 eJZW0M3UqBYnsKZ3Kt8zQbl/ulybB/lcCPBF+E4RN5nOY3awxaKLttnlrLvt29dxvHRT
 CP04kHHzGnlwNNpO41AW1hYjTxVVjSus6DBeHv3atoxq0MX53YheeMVL450VJq310bH5
 BfOL0UFalZS+INczzr7npZ4dua8FOXgjzQyzZRHlQ3a0geYJinjJ58haey5+nZlrSpBm
 AGN5+iaRO7VaCXqDihenk0UHldSLMARR6XePAJZMmsLXpvvHLE9ReJqAveCaogVXOtZA
 GkHw==
X-Gm-Message-State: AOAM531rOBfHOYa4FmRbFBhCSW/MblCH1X1S6sogOntPjFFsAGvTloVw
 cOy1tyGTyRwak4bxs+CsmbIfiR/kQSg/u8UTn8Yx
X-Google-Smtp-Source: ABdhPJyM11w0w1h3dK6WUMdncVv1qP8OxjU78eGfMr1e0FpzvmZ9KY61NUktH6E8KpSQtrjMmxGkQjUY47o+dBNxsso=
X-Received: by 2002:a5b:ec2:: with SMTP id a2mr54150994ybs.713.1641419174873; 
 Wed, 05 Jan 2022 13:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-3-atish.patra@wdc.com>
 <CAEUhbmUOBq4-tguGbGixXADGdstJ2azKr-WK=6y2J83Ye9AbBQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUOBq4-tguGbGixXADGdstJ2azKr-WK=6y2J83Ye9AbBQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 5 Jan 2022 13:46:04 -0800
Message-ID: <CAOnJCULrd-UnkYMriK7fE0dz+6Ch_Bxn49XqD+1Rgiw8umMmjg@mail.gmail.com>
Subject: Re: [ PATCH v3 02/10] target/riscv: Implement PMU CSR predicate
 function for
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 4:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 3:56 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
>
> The commit title is incomplete
>

Oops. Fixed it.

>
> > Currently, the predicate function for PMU related CSRs only works if
> > virtualization is enabled. It also does not check mcounteren bits before
> > before cycle/minstret/hpmcounterx access.
> >
> > Support supervisor mode access in the predicate function as well.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 1ec776013435..de484c74d3b4 100644
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
> > +            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_TIME:
> > +            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_INSTRET:
> > +            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > +            ctr_index = csrno - CSR_CYCLE;
> > +            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
>
> The above switch..case can be simplified with the logic of last case
> as the same one applies to all cases.
>

I did not condense it because I wanted to keep it analogous to the
virtualization case.
But I agree that it should be much shorter in both cases. I will add a
separate patch to simplify the entire function for
all the cases.


> > +        }
> > +        if (riscv_cpu_is_32bit(env)) {
> > +            switch (csrno) {
> > +            case CSR_CYCLEH:
> > +                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_TIMEH:
> > +                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_INSTRETH:
> > +                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > +                ctr_index = csrno - CSR_CYCLEH;
> > +                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
>
> ditto
>
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> >      if (riscv_cpu_virt_enabled(env)) {
> >          switch (csrno) {
> >          case CSR_CYCLE:
> >
>
> Regards,
> Bin
>


--
Regards,
Atish

