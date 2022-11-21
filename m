Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D897363176A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 00:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owtyu-0002mg-IS; Sun, 20 Nov 2022 18:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtys-0002mT-Vb; Sun, 20 Nov 2022 18:44:11 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtyq-0004pS-TC; Sun, 20 Nov 2022 18:44:10 -0500
Received: by mail-vs1-xe35.google.com with SMTP id q127so9723834vsa.7;
 Sun, 20 Nov 2022 15:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H27bgExd3YJaD77DXbefeV216L4Ggd2vSj44q93Rlic=;
 b=aHb8LUt1QYci7gB+LY3rtsjZ47mMEAl7ze7w1oCqD+eIMbTZLeDYxAqMFhCakBZx6O
 kPv3LIiCI+XgWslu1kB0ymGqut18buyWSq/XhBeUF83BgqXlnc6Vuj3/h4olHAXDYj0J
 aHs3QRYLrv/Wvhcobj8BthgN/vBpSjYe8SMBDrAFnNOUu0aot6IK93VwrmSWTV04K704
 EncGFjLTJ56mwN+y8c7jBcMzAEuKc7qGxIJUhTuzLEkCn80jhko8YLgTWwu9cJxN7ex/
 6IdWvsTOAYn9RDj7hhrWkEp/iVLRkdFC08d5eZtw75r1dcbF+UFZq6fyKSdXy7xuQ8ss
 oP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H27bgExd3YJaD77DXbefeV216L4Ggd2vSj44q93Rlic=;
 b=j3mfaTF1Dtk7UALx5Kn7QWQPeDipfhA32wm8gx7KNsX0UuCh90LQdg3nFWLlu9dqXL
 wE/v4Qn1j7ik47nD9Y79d/4H3SsGz/WNBFPPXl8309iUQLyZF0+ltV6f9MrSS6vIWBvD
 xkiyTYv3f5CK5KF+suVk9DCYBHUH4NyVu8bZAtOwRk7nqrMF9s4e892dZg4i5s+Ceiwr
 3Eux5Y/WYfbzwawVsnLHrTF1eGOkLuVpvrI5gtqm0xTsV8Yj2czKA8ZL9dhN3mZGpttj
 DQsnyq6h+GGICVRdQiwKjlMAZnz+Sor5DMODneMM+NkpWq0ohloa+dt+vobMtFDK7fSg
 NUPQ==
X-Gm-Message-State: ANoB5pnKRQMj5cDnSJS30PnBTwCeL7qdskFhBuB68uRusTRJIx72eIxT
 ZXibSYeERwBgrAXRfDjjELVw7BIhUfCh5uHbTPI=
X-Google-Smtp-Source: AA0mqf5NjkkHhUKAScS+pHbKFor4bY800ydlsHzlRJ36JGxjwasEs/Brb8ZEloFLYFMgHysT3n7BvlRR+VPHMTZbVuI=
X-Received: by 2002:a67:f7d8:0:b0:358:3594:dfad with SMTP id
 a24-20020a67f7d8000000b003583594dfadmr8447398vsp.54.1668987847535; Sun, 20
 Nov 2022 15:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20221117072841.240839-1-alexghiti@rivosinc.com>
In-Reply-To: <20221117072841.240839-1-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 09:43:41 +1000
Message-ID: <CAKmqyKPU0TidBvwKxgAO0FhgizFMO3W3EEvGLGgN+=MMZ7iB_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISCVCPUConfig.satp_mode to set sv48, sv57,
 etc.
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Ludovic Henry <git@ludovic.dev>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Fri, Nov 18, 2022 at 12:26 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
>
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting the
> "highest" supported mode in the satp_mode property. And the bare mode is
> always supported.
>
> You can set this new property as follows:
> -cpu rv64,satp-mode=sv48 # Linux will boot using sv48 scheme
> -cpu rv64,satp-mode=sv39 # Linux will boot using sv39 scheme
>
> In addition, we now correctly set the device-tree entry 'mmu-type' using
> this new satp_mode property.
>
> Co-Developed-by: Ludovic Henry <git@ludovic.dev>
> Signed-off-by: Ludovic Henry <git@ludovic.dev>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  hw/riscv/virt.c    | 15 ++++++---------
>  target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  3 +++
>  target/riscv/csr.c |  6 ++++--
>  4 files changed, 58 insertions(+), 11 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..77484b5cae 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +236,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  s->soc[socket].harts[cpu].cfg.satp_mode_str);
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..efdb530ad9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -907,6 +907,48 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>  #endif
>
> +    /*
> +     * Either a cpu sets its supported satp_mode in XXX_cpu_init
> +     * or the user sets this value using satp_mode property.
> +     */
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    if (cpu->cfg.satp_mode_str) {
> +        if (!g_strcmp0(cpu->cfg.satp_mode_str, "none"))
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv32") && rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV32;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv39") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV39;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv48") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV48;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv57") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV57;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv64") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV64;
> +        else {
> +            error_report("Unknown option for satp_mode: %s",
> +                         cpu->cfg.satp_mode_str);
> +            exit(EXIT_FAILURE);

You should use error_setg() and return here instead

Alistair

> +        }
> +    } else {
> +        /*
> +         * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
> +         * or sv57 for 64-bit when a MMU is present, and bare otherwise.
> +         */
> +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +            if (rv32) {
> +                cpu->cfg.satp_mode_str = g_strdup("sv32");
> +                cpu->cfg.satp_mode = VM_1_10_SV32;
> +            } else {
> +                cpu->cfg.satp_mode_str = g_strdup("sv57");
> +                cpu->cfg.satp_mode = VM_1_10_SV57;
> +            }
> +        } else {
> +            cpu->cfg.satp_mode_str = g_strdup("none");
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> +        }
> +    }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -1094,6 +1136,9 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +
> +    DEFINE_PROP_STRING("satp-mode", RISCVCPU, cfg.satp_mode_str),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a9e25053f..a6c229470b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -480,6 +480,9 @@ struct RISCVCPUConfig {
>      bool debug;
>
>      bool short_isa_string;
> +
> +    uint8_t satp_mode;
> +    char *satp_mode_str;
>  };
>
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..d26b830f1a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1109,10 +1109,12 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> +    vm &= 0xf;
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> +        return valid_vm_1_10_32[vm] && (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> +        return valid_vm_1_10_64[vm] && (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      }
>  }
>
> --
> 2.37.2
>
>

