Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207EA4671D7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 07:24:40 +0100 (CET)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt1zq-000430-U5
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 01:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt1xh-0002gI-G3
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 01:22:25 -0500
Received: from [2a00:1450:4864:20::434] (port=37431
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt1xf-0002CT-FX
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 01:22:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id d9so3519065wrw.4
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 22:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8+b5xKsMUDKa+oyyXAeAYgzpjyhIiOxi8EOvVBsToo=;
 b=LbMIA80PU3ifmQ+azi/PlEUXfowc4V2sThUnp3xTk285Mt5ruRy4wVmn3G/+WKUZ2B
 zwpVRFPKHBEjeuvBH6I4+j6/2JNX0Od9FqmV7x9fOCcht5S/dSetRQ6pkA2m69zA07+h
 JFbKoRniDqDlQgemaywApcqiu0OQC3r0XWqbvsuw+rShLGnKDNVTAfueonRqLlevCQTv
 e8fMMMgj6k60rR9AzuJl2jAx/nxmXGTxB9tWDGRagT4VxTRy3AsShpfaaiUvVDikVTmf
 MDmsHSndJxnZIcwH1T3niAe2xGJzihn3K+LBSczQjIeuvAlJBismOr4ZM2Bw0OPm2lbE
 OCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8+b5xKsMUDKa+oyyXAeAYgzpjyhIiOxi8EOvVBsToo=;
 b=sTNjM0pvXGIn1b0Mfff6CcYrnpDAJK+NXpJoGQbksx+gbSnz6xDRMZbww6t6zoOdGE
 7J8U21o86la8Vow6YkUy7FUT1fAR/YyureIuvm14/LrgL3grinh9Md2XDeUZFQjvTFrS
 4iYlkpN8R/1akL4g0BgsRR/oQpYTKkKhCdyojTsodmmgjk29VozuNO+3W9qD4VP3JgBP
 nT7RDjvoXBtX02ArRKAHm+v4uhE25SHbzQvTHLDKrVwSWXOTq6tJB+MzSeJqhiIS0Aka
 OGxdpc04KRQm8yknw8UXzKGssIUlMeO9Q8HwiT1eQshcEzo2XsUknInFEEklkujTxb6A
 aD9Q==
X-Gm-Message-State: AOAM532Exx3MoLeXYv5q9Jb+5JyNZJ4ctlauXIRu49rX2xdQB0eCkoAF
 Lx6tcJoc/3nwc2mPjLU458V+7p7+PLjZe2iNX1//dw==
X-Google-Smtp-Source: ABdhPJwSNcxVh22LA/7Yu3Bp3kFje0KPPgiLoxo0vzQiabe0sG6w/Qr0bzx+Nf+eQjClm6k0UA4QyobGhfN/ay7nWKw=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr18470362wru.89.1638512540993; 
 Thu, 02 Dec 2021 22:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-6-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-6-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 11:52:09 +0530
Message-ID: <CAAhSdy0umeb2Qu=6hJZGy4g1FhW-bsYL=80Msao_pULsJ0+2mw@mail.gmail.com>
Subject: Re: [PATCH v1 05/12] target/riscv: Implement kvm_arch_put_registers
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/kvm.c | 141 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index b49c24be0a..5fe5ca4434 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -90,6 +90,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_core(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    reg = env->pc;
> +    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    for (i = 1; i < 32; i++) {
> +        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        reg = env->gpr[i];
> +        ret = kvm_set_one_reg(cs, id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>  static int kvm_riscv_get_regs_csr(CPUState *cs)
>  {
>      int ret = 0;
> @@ -153,6 +178,69 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_csr(CPUState *cs)
> +{
> +    int ret = 0;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    reg = env->mstatus;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sstatus), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->mie;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sie), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->stvec;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, stvec), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->sscratch;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sscratch), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->sepc;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sepc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->scause;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, scause), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->stval;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, stval), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->mip;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sip), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->satp;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, satp), &reg);
> +    if (ret) {
> +        return ret;
> +    }

Same as the previous patch, there is a common pattern in above
kvm_set_one_reg() calls. Please use a macro to simplify.

Regards,
Anup

> +
> +    return ret;
> +}
> +
>  static int kvm_riscv_get_regs_fp(CPUState *cs)
>  {
>      int ret = 0;
> @@ -186,6 +274,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_fp(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (riscv_has_ext(env, RVD)) {
> +        uint64_t reg;
> +        for (i = 0; i < 32; i++) {
> +            reg = env->fpr[i];
> +            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +        return ret;
> +    }
> +
> +    if (riscv_has_ext(env, RVF)) {
> +        uint32_t reg;
> +        for (i = 0; i < 32; i++) {
> +            reg = env->fpr[i];
> +            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
> @@ -214,7 +336,24 @@ int kvm_arch_get_registers(CPUState *cs)
>
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
> -    return 0;
> +    int ret = 0;
> +
> +    ret = kvm_riscv_put_regs_core(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_put_regs_csr(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_put_regs_fp(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
>  }
>
>  int kvm_arch_release_virq_post(int virq)
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

