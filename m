Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D9471FE6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 05:18:15 +0100 (CET)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwcn0-0007NL-VW
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 23:18:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwclY-0006Mo-9C
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:16:44 -0500
Received: from [2a00:1450:4864:20::42d] (port=42614
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwclW-0002sT-DR
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:16:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c4so24834346wrd.9
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 20:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kr5T/TfAr5RHzp2pbsiukOnL5ToQSl7CSqwITkm4EJA=;
 b=N+vMPjjSS0/hzhWVQGnr0Yk85Y/hPAj1H8um5240b+2x4sljGdN4fz9SqmlVhJ/uD3
 nlvnkOPVPrPspyQzF+yBl2cL9FDC2AppR/4Y8HAzRiFltYAfkKNoDQKlTHQs3sm4do+0
 XwtKFXXbrZC1g2Tr7BshA2MvzBZw+To/HuyMsXG5WuHRjgC4jYBC9G0h4ggFMx2rowtT
 kA4HHEna4ziENLLAg2YynLYcHyJeyEN1/4EUJtu1wVdfHkSv/gMJ280eShq4z6ExBoKF
 QbhMonaNSluDTdOSxD8cm8MFwnVoEgcK+78q0Tj4NRWYTIKX03MknyHzL0vHcM1nzikq
 AP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kr5T/TfAr5RHzp2pbsiukOnL5ToQSl7CSqwITkm4EJA=;
 b=etp5LQ46kD6rUmO6Rb52c+RajJEAAaQ6Zj5Xu04s/mdsx+E2XUAwe9jdzEcWGdsgpr
 88LXyNV8g3Xrt1BGWONbPrec1fg4nbzEF1qb2xw1Yy5TnityXi1PxCc/p9+wjof7bLA6
 KS3SVY5telN90LNE7S18kDY357DmwbhVu5pz0WAekeA2LwWdrJMDBuRAamyATOdJZZSe
 WJy6QEkGn5X5BmbR8Pw679ttrBmSgRz1A6Gr7c285nTmoSPVyZTGfgTaLzqhUefP8uvd
 rCJfy+fXxW3keSiWp9RRjvWjThQPTQFbLSNbXj3kSsaGbdqUdIdyXvAExkDL3pLV+2Nz
 fDKA==
X-Gm-Message-State: AOAM5339fG3tY+MFtRP6bXZYQcb21x6u4RbhyegPD9ETyqlZgZG7+cCA
 EC2ML4W2PnOx/VqnJea5IlJFSKCERIf9uMiaCUxX7Q==
X-Google-Smtp-Source: ABdhPJx8oBuEM7yPZW4YJdFrm+BDOSp3Xvi+sGHOAKArkqFl+YuWykSPhmqaaArV6kxGHuHOVwnThBGv7WHF2i5E2qc=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr13057967wrn.690.1639369000633; 
 Sun, 12 Dec 2021 20:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-5-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-5-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:46:29 +0530
Message-ID: <CAAhSdy124838mMoU61DfPH9T_rQGzvBURj0w57pHbM_Y0YVDRQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] target/riscv: Implement kvm_arch_get_registers
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42d;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c | 112 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index ccf3753048..6d4df0ef6d 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -55,13 +55,123 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>      return id;
>  }
>
> +#define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
> +                 KVM_REG_RISCV_CORE_REG(name))
> +
> +#define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
> +                 KVM_REG_RISCV_CSR_REG(name))
> +
> +#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
> +
> +#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> +
> +#define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
> +    do { \
> +        int ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
> +        if (ret) { \
> +            return ret; \
> +        } \
> +    } while(0)
> +
> +static int kvm_riscv_get_regs_core(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->pc = reg;
> +
> +    for (i = 1; i < 32; i++) {
> +        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        ret = kvm_get_one_reg(cs, id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        env->gpr[i] = reg;
> +    }
> +
> +    return ret;
> +}
> +
> +static int kvm_riscv_get_regs_csr(CPUState *cs)
> +{
> +    int ret = 0;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
> +    KVM_RISCV_GET_CSR(cs, env, sie, env->mie);
> +    KVM_RISCV_GET_CSR(cs, env, stvec, env->stvec);
> +    KVM_RISCV_GET_CSR(cs, env, sscratch, env->sscratch);
> +    KVM_RISCV_GET_CSR(cs, env, sepc, env->sepc);
> +    KVM_RISCV_GET_CSR(cs, env, scause, env->scause);
> +    KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
> +    KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
> +    KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
> +    return ret;
> +}
> +
> +static int kvm_riscv_get_regs_fp(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (riscv_has_ext(env, RVD)) {
> +        uint64_t reg;
> +        for (i = 0; i < 32; i++) {
> +            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +            env->fpr[i] = reg;
> +        }
> +        return ret;
> +    }
> +
> +    if (riscv_has_ext(env, RVF)) {
> +        uint32_t reg;
> +        for (i = 0; i < 32; i++) {
> +            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +            env->fpr[i] = reg;
> +        }
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
>
>  int kvm_arch_get_registers(CPUState *cs)
>  {
> -    return 0;
> +    int ret = 0;
> +
> +    ret = kvm_riscv_get_regs_core(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_get_regs_csr(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_get_regs_fp(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
>  }
>
>  int kvm_arch_put_registers(CPUState *cs, int level)
> --
> 2.19.1
>

