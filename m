Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DF40EA45
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:52:57 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwVF-0002hJ-08
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwQB-0007Sc-2P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:47:43 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwQ9-0000u1-B3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:47:42 -0400
Received: by mail-qk1-x734.google.com with SMTP id t190so9530800qke.7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fw0ckO/c4YoOZkh9qK9ECXyTrA103RGu0ONUbSGPmoI=;
 b=I3FakBEJR9Fvobh3mgNPHpGR6Li7qgqH3iW7yjo6metqXMKyYQ5TRbQeuJ2ttOVtGK
 dPVQbmhb7OCVw9dS5isfG5c5Nzb3nYD5EfHdgQWT2IaS/EqOGNR2CrL6eK/M/zKm/YHT
 h0Ai/rDQzUJXbKw/fOF2A5H2CsrJQAYiijMgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fw0ckO/c4YoOZkh9qK9ECXyTrA103RGu0ONUbSGPmoI=;
 b=pUOzLm3yW1rn6EAFYGVAVW+HbobOhiwwL3tsE1J1HWLQdh8yQIyjRdUvE7ZH3Obs+h
 thnlCVVpXrbRpk9xRrpNqAq6OAVe3EHzccY3tQJoLsZZs2vgQmyH0iAAYjEnCST4jM5t
 nEH1ezTIQPj1QOe3xUs+H+Wwn52MhrzRbFFj1FGK1tCexv5ZnJBK63EpOCbLfMsJacrL
 EE8PyBo5oLWmvznBS5bx+0ZAhPBjXPJWwHvWT2EmXGBfOhqnYboMFwcBPDfeXIKtaPhz
 kwXRKD9WxOxdFb5ZL1EWfdcFKKiFADPAG2fvjmhihZ59/kSHncNVPhbeQ0ovqZn7V8Jy
 Gd1w==
X-Gm-Message-State: AOAM531YpJ+4btbsvqRVJ37aU6xXEndFRNiZvWZFy2qofkep8nSZLKGm
 l/5HBICkEjdt9OlYeXMKcZYzLTM5ugB2TzYX/tQI
X-Google-Smtp-Source: ABdhPJzrCElJ1rHZTp5ZIqI20GptFU61Wq0X8OuNEYX5whAZIgao9q7uKGz19iQAXikO5iLmhEoiiA+kRupkz7dIzOA=
X-Received: by 2002:a25:44d:: with SMTP id 74mr9743173ybe.54.1631818060068;
 Thu, 16 Sep 2021 11:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-5-atish.patra@wdc.com>
 <CAEUhbmUgEaxsT+FmkJ6E_A2mQASh8GwBsAD7=214snZsSjOXNg@mail.gmail.com>
In-Reply-To: <CAEUhbmUgEaxsT+FmkJ6E_A2mQASh8GwBsAD7=214snZsSjOXNg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Sep 2021 11:47:29 -0700
Message-ID: <CAOnJCUKJY2JApp=x6Ume8DfB+H+BQxDOveR5YZX7Q7jAtNrL2g@mail.gmail.com>
Subject: Re: [ RFC v2 4/9] target/riscv: Implement mcountinhibit CSR
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=atishp@atishpatra.org; helo=mail-qk1-x734.google.com
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

On Wed, Sep 15, 2021 at 7:54 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 10, 2021 at 4:29 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > As per the privilege specification v1.11, mcountinhibit allows to start/stop
> > a pmu counter selectively.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/cpu.h      |  2 ++
> >  target/riscv/cpu_bits.h |  4 ++++
> >  target/riscv/csr.c      | 25 +++++++++++++++++++++++++
> >  target/riscv/machine.c  |  5 +++--
> >  4 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0e2e88f3bbea..bdb488cdbccc 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -219,6 +219,8 @@ struct CPURISCVState {
> >      target_ulong scounteren;
> >      target_ulong mcounteren;
> >
> > +    target_ulong mcountinhibit;
> > +
> >      target_ulong sscratch;
> >      target_ulong mscratch;
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 7330ff5a194c..ac519dcdc4df 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -275,6 +275,10 @@
> >  #define CSR_MHPMCOUNTER29   0xb1d
> >  #define CSR_MHPMCOUNTER30   0xb1e
> >  #define CSR_MHPMCOUNTER31   0xb1f
> > +
> > +/* Machine counter-inhibit register */
> > +#define CSR_MCOUNTINHIBIT   0x320
> > +
> >  #define CSR_MHPMEVENT3      0x323
> >  #define CSR_MHPMEVENT4      0x324
> >  #define CSR_MHPMEVENT5      0x325
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index fa014bac72ab..a155a4370d6b 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -766,6 +766,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
> > +                                         target_ulong *val)
> > +{
> > +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
>
> This should be RISCV_EXCP_ILLEGAL_INST
>

Argh. Not sure how this happen :(. My bad.

> > +    }
> > +
> > +    *val = env->mcountinhibit;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
> > +                                          target_ulong val)
> > +{
> > +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
>
> ditto
>
> > +    }
> > +
> > +    env->mcountinhibit = val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
> >                                        target_ulong *val)
> >  {
> > @@ -1781,6 +1803,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> >      [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
> >
> > +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,
>
> missing 't' in the register name

Thanks. Will fix it in the next version.

>
> > +                                                       write_mcountinhibit },
> > +
> >      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
> >      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> >      [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 16a08302daff..20dea0843604 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
> >
> >  const VMStateDescription vmstate_riscv_cpu = {
> >      .name = "cpu",
> > -    .version_id = 2,
> > -    .minimum_version_id = 2,
> > +    .version_id = 3,
> > +    .minimum_version_id = 3,
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> >          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> > @@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          VMSTATE_UINTTL(env.mtval, RISCVCPU),
> >          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
> >          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> > +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> >          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > --
>
> Regards,
> Bin
>


-- 
Regards,
Atish

