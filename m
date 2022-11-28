Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E733363A73D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 12:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozcMt-0005Zv-7T; Mon, 28 Nov 2022 06:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ozcMr-0005Zi-3l
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:32:09 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ozcMn-000067-Dd
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:32:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w15so3083206wrl.9
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 03:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/pEJHjk7Sp77i82qpiZ5pnuFmLq0Bb4+jey28ScPq1M=;
 b=O2IRFgieODpqdQt0R2YSaqH55JfeSc0utB45VPmV8oCzSvJK/jRkRPcu6HXeyL2X0o
 ALRtwz2P8Tf3GxIZyDa1eOY2M4oeZ00ohBxqe5fiXVxYuq7Yy+ZTzIMVaEyutAkvyewG
 iSrQW0zBphQtQOFAMKiElxdfILnDOhSXLiF75zs3SLNi9x8TyGl7aBNDzgEm6IKogbG7
 jJefxQdiAbNO3Ld8K4rb6BkwEL8uihi7cNzHcPwbLYTqC0RocmWGiHEW0DCz9UmNgfP9
 Io25u9EN02vEogN/MgktmHEXhB+qKBW+4Uura3clHDH/Pr6V7tlo8OaIeVlxRQF3qoGf
 hjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pEJHjk7Sp77i82qpiZ5pnuFmLq0Bb4+jey28ScPq1M=;
 b=qaYTL/y/LOe1tkzvTguAGRh5ysf51aa3W8aA+cQIYXqRiv6b0BN3Hp03QcqGJrY+mi
 pVPrSx7iTMpPLQCOI8PzbSkeuDM4sWJkwJ5EkCiq+ub7idmMIEEdXblsG8WFDQf7q/kz
 FMjCqcRXe6o7X08PxQkntSIhhX8ou/4hYlt+oUStBDjujBVdzYRdZBh65bv9Drm3UoWA
 XN0t/VoP3XFAESc2QHpTlqp/qQroMcmWIccXIKXZpKcTGpjQGiu1u0X34Xo0T9g1GEZ/
 SCP37mBIVnyFYkZ0oVmER5wttDyJc7yMEVrgfXYYkA7cM0aDRAFWKtohujt3nNe5hjiI
 a9CQ==
X-Gm-Message-State: ANoB5pnsKmwoxRZgrjKYFV825v4RA+XpT16g8Pgt42FrjQpnaADbu3v3
 oYVq/mpcPYfFsiJ+dgAqAU7ojQ==
X-Google-Smtp-Source: AA0mqf6Dw8ME6AGvfzx6mdwWsiWv3AezRjXy9E2lhCLQIk4LcsSql5qsBFrPxq602t2OYq+PhGrJog==
X-Received: by 2002:adf:d23a:0:b0:242:1cc2:b1ec with SMTP id
 k26-20020adfd23a000000b002421cc2b1ecmr1074805wrh.565.1669635123013; 
 Mon, 28 Nov 2022 03:32:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6e42000000b0024194bba380sm10471370wrz.22.2022.11.28.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 03:32:02 -0800 (PST)
Date: Mon, 28 Nov 2022 12:32:01 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Atish Patra <atishp@rivosinc.com>,
 Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v2] riscv: Add RISCVCPUConfig.satp_mode to set sv48,
 sv57, etc.
Message-ID: <20221128113201.eylgobxzgdvbdpad@kamzik>
References: <20221125105954.149267-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125105954.149267-1-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Nov 25, 2022 at 11:59:54AM +0100, Alexandre Ghiti wrote:
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

Hi Alexandre,

Please define separate boolean properties for each supported mode, e.g.
sv32, sv48, sv57. We should try to always use booleans for cpu feature
properties, because cpu model expansion users would otherwise need to be
taught legal values. In this case, libvirt would need to be taught these
"sv*" strings and if more are added to qemu, then older libvirt will
report errors for the new valid modes, as it wouldn't be aware of them.
With booleans, libvirt old and new simply asks for each cpu model boolean
property to probe what's available, and then it can try to enable and
disable them to probe what can/cannot be enabled/disabled.

See target/arm/monitor.c:qmp_query_cpu_model_expansion() for an example
of cpu model expansion. We'll eventually want to write a function like
that for riscv too.

Also, as all smaller widths must be supported, then riscv_cpu_realize()
should validate that nobody has done something like sv32=off,sv48=on.
When we get a qmp_query_cpu_model_expansion() for riscv, this same
validation will need to run, so it may be best to add a finalize function
like arm's arm_cpu_finalize_features() now.

Thanks,
drew


> 
> In addition, we now correctly set the device-tree entry 'mmu-type' using
> this new satp_mode property.
> 
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> v2:
> - Use error_setg + return as suggested by Alistair
> - Add RB from Atish
> - Fixed checkpatch issues missed in v1
> - Replaced Ludovic email address with the rivos one
> 
>  hw/riscv/virt.c    | 15 ++++++---------
>  target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  3 +++
>  target/riscv/csr.c |  8 ++++++--
>  4 files changed, 60 insertions(+), 11 deletions(-)
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
> index d14e95c9dc..c86dc5058d 100644
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
> +            error_setg(errp, "Unknown option for satp_mode: %s",
> +                       cpu->cfg.satp_mode_str);
> +            return;
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
> index 5c9a7ee287..d2aab1627e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1109,10 +1109,14 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>  
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> +    vm &= 0xf;
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> +        return valid_vm_1_10_32[vm] &&
> +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> +        return valid_vm_1_10_64[vm] &&
> +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      }
>  }
>  
> -- 
> 2.37.2
> 
> 

