Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9D4C0B28
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 05:35:46 +0100 (CET)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMjNR-0006wP-6j
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 23:35:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMjLj-0005Z2-Ai; Tue, 22 Feb 2022 23:33:59 -0500
Received: from [2607:f8b0:4864:20::d35] (port=33403
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMjLh-0000lw-1S; Tue, 22 Feb 2022 23:33:58 -0500
Received: by mail-io1-xd35.google.com with SMTP id 195so12818560iou.0;
 Tue, 22 Feb 2022 20:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5/idmmEmQBlrcywWa3OO3ziM7haTVY4RZD6OM/lUS24=;
 b=GhonPsBv2BSFHzdpkSHDnAg7zzxRPVeSngNm5ZabzDD9ASZwLqmkySiglVXmRKBs3b
 jBT76QH7cbBMT4iAKmvB5Pt88tciLwAXFOuAt8TCrKBne9frOrcUGLPVHhjqbntH5fRm
 P/G/xXHfqaVpY3cz2xFdx58BElwuQBwS1yEzZo/qYD/2l690eag90ngSN+kcvMQ1Yh21
 cJL0Fa7ymTvvXl9WMeQr7bhmV5+rQKtUhwjV/TIiSslggj9U6ZBE9O0BzpkYjvzzjKKs
 I7EH1CVkApQVSOlkJnvZ2WhgJVACWfcKEWajsRwbGWMHwymkydSRWR0uQC52aQLbl9ku
 jWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5/idmmEmQBlrcywWa3OO3ziM7haTVY4RZD6OM/lUS24=;
 b=vc84Y248zyke4vmueMxcXspEgkpn7F1wV8bYRlE3z4KMC1gP4ggTAUZCWhunKX662v
 EDdssOX9FG+QiUiENgpDpXN+3LaCq79tQnYN9tqO/qo75pXAbsKi0pi9+Dsbd7BhC9hR
 XLOvMjt7XKEMvyCAF5owVO7i1CwLfWMp7FYQ7sDFanZCMxBIQ8fvULBv6L5xdz4dXgVY
 J0ALPYNj9yN829M39j0N7I4pseKUBSDp+x7XSVBqqMwuE0YJyeBWmido2lh3nS4ZQINt
 6cjS9DTUFf19M9f2ywpqMdCx5LSZtwNtjvbFbRS/Cx5S4JBtoFR4Z0QmrHxBB+LmCvXT
 rSEQ==
X-Gm-Message-State: AOAM531/rucs9Rf0BpEkXRQzCPAUIklRbdFs3s4/bzi9WyesQvpR1k3X
 0zZUFbbavVv2rKFC7GLCGtww3oRoPHlnD4Vp6EE=
X-Google-Smtp-Source: ABdhPJyD27HIfsj6qILYDe4Mhex1kvEBkl3sU1F1kpyE33K+F/sYpvgwNzFJGMsS8K5IsS8gcU00hYbETPXLwkRkTKw=
X-Received: by 2002:a05:6638:218a:b0:30f:ade1:d2e0 with SMTP id
 s10-20020a056638218a00b0030fade1d2e0mr21378311jaj.267.1645590835558; Tue, 22
 Feb 2022 20:33:55 -0800 (PST)
MIME-Version: 1.0
References: <20220222220704.2294924-1-atishp@rivosinc.com>
 <20220222220704.2294924-6-atishp@rivosinc.com>
In-Reply-To: <20220222220704.2294924-6-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 23 Feb 2022 14:33:29 +1000
Message-ID: <CAKmqyKM4LxJvE+4KOVQzJAxJYDFfrnQe9KKcv4o9OiKULXTBvQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] target/riscv: Add *envcfg* CSRs support
To: Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 8:09 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The RISC-V privileged specification v1.12 defines few execution
> environment configuration CSRs that can be used enable/disable
> extensions per privilege levels.
>
> Add the basic support for these CSRs.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Do you mind rebasing this on:

https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.h      |   5 ++
>  target/riscv/cpu_bits.h |  39 +++++++++++++++
>  target/riscv/csr.c      | 107 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c  |  24 +++++++++
>  4 files changed, 175 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0741f9822cf0..e5c8694cf081 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -303,6 +303,11 @@ struct CPURISCVState {
>      target_ulong spmbase;
>      target_ulong upmmask;
>      target_ulong upmbase;
> +
> +    /* CSRs for execution enviornment configuration */
> +    uint64_t menvcfg;
> +    target_ulong senvcfg;
> +    uint64_t henvcfg;
>  #endif
>
>      float_status fp_status;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 89440241632a..58a0a8d69f72 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -202,6 +202,9 @@
>  #define CSR_STVEC           0x105
>  #define CSR_SCOUNTEREN      0x106
>
> +/* Supervisor Configuration CSRs */
> +#define CSR_SENVCFG         0x10A
> +
>  /* Supervisor Trap Handling */
>  #define CSR_SSCRATCH        0x140
>  #define CSR_SEPC            0x141
> @@ -247,6 +250,10 @@
>  #define CSR_HTIMEDELTA      0x605
>  #define CSR_HTIMEDELTAH     0x615
>
> +/* Hypervisor Configuration CSRs */
> +#define CSR_HENVCFG         0x60A
> +#define CSR_HENVCFGH        0x61A
> +
>  /* Virtual CSRs */
>  #define CSR_VSSTATUS        0x200
>  #define CSR_VSIE            0x204
> @@ -290,6 +297,10 @@
>  #define CSR_VSIEH           0x214
>  #define CSR_VSIPH           0x254
>
> +/* Machine Configuration CSRs */
> +#define CSR_MENVCFG         0x30A
> +#define CSR_MENVCFGH        0x31A
> +
>  /* Enhanced Physical Memory Protection (ePMP) */
>  #define CSR_MSECCFG         0x747
>  #define CSR_MSECCFGH        0x757
> @@ -654,6 +665,34 @@ typedef enum RISCVException {
>  #define PM_EXT_CLEAN    0x00000002ULL
>  #define PM_EXT_DIRTY    0x00000003ULL
>
> +/* Execution enviornment configuration bits */
> +#define MENVCFG_FIOM                       BIT(0)
> +#define MENVCFG_CBIE                       (3UL << 4)
> +#define MENVCFG_CBCFE                      BIT(6)
> +#define MENVCFG_CBZE                       BIT(7)
> +#define MENVCFG_PBMTE                      BIT(62)
> +#define MENVCFG_STCE                       BIT(63)
> +
> +/* For RV32 */
> +#define MENVCFGH_PBMTE                     BIT(30)
> +#define MENVCFGH_STCE                      BIT(31)
> +
> +#define SENVCFG_FIOM                       MENVCFG_FIOM
> +#define SENVCFG_CBIE                       MENVCFG_CBIE
> +#define SENVCFG_CBCFE                      MENVCFG_CBCFE
> +#define SENVCFG_CBZE                       MENVCFG_CBZE
> +
> +#define HENVCFG_FIOM                       MENVCFG_FIOM
> +#define HENVCFG_CBIE                       MENVCFG_CBIE
> +#define HENVCFG_CBCFE                      MENVCFG_CBCFE
> +#define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_PBMTE                      MENVCFG_PBMTE
> +#define HENVCFG_STCE                       MENVCFG_STCE
> +
> +/* For RV32 */
> +#define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
> +#define HENVCFGH_STCE                       MENVCFGH_STCE
> +
>  /* Offsets for every pair of control bits per each priv level */
>  #define XS_OFFSET    0ULL
>  #define U_OFFSET     2ULL
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 18fe17b62f51..ff7e36596447 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1366,6 +1366,101 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +/* Execution environment configuration setup */
> +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->menvcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV64) {
> +        mask |= MENVCFG_PBMTE | MENVCFG_STCE;
> +    }
> +    env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->menvcfg >> 32;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
> +    uint64_t valh = (uint64_t)val << 32;
> +
> +    env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->senvcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> +
> +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->henvcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV64) {
> +        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> +    }
> +
> +    env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->henvcfg >> 32;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> +    uint64_t valh = (uint64_t)val << 32;
> +
> +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>                                  uint64_t *ret_val,
>                                  uint64_t new_val, uint64_t wr_mask)
> @@ -3069,6 +3164,18 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
>      [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
>
> +    /* Execution environment configuration */
> +    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
>      /* Supervisor Trap Setup */
>      [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
>                                                read_sstatus_i128                 },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 9895930b2976..4a50a05937fa 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -220,6 +220,29 @@ static const VMStateDescription vmstate_kvmtimer = {
>      }
>  };
>
> +/* TODO: henvcfg need both hyper_needed & envcfg_needed */
> +static bool envcfg_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return (env->priv_ver >= PRIV_VERSION_1_12_0 ? 1 : 0);
> +}
> +
> +static const VMStateDescription vmstate_envcfg = {
> +    .name = "cpu/envcfg",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = envcfg_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.menvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> +        VMSTATE_UINT64(env.henvcfg, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> @@ -280,6 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_pointermasking,
>          &vmstate_rv128,
>          &vmstate_kvmtimer,
> +        &vmstate_envcfg,
>          NULL
>      }
>  };
> --
> 2.30.2
>
>

