Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98648592AE9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:14:14 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNVEg-0005Nm-V7
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNUva-0004H5-Ui
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:54:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNUvZ-0004qM-6J
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:54:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id a89so8626849edf.5
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=/zOrrl41ZeMxZPte40wc8fLDGbwTVlgATQ/g681F1CE=;
 b=aTp/h0+nfG0naQZkU5OtwdlwZEjjbHE+ZQ8irrpa+NyAiqBbKeHNlGT0hf1YKqx1Bu
 kpJQeM0YA2gTFO1G1JzCwDxaMPMMkjbfLC4aFyJdXPI56b4bx2hsCCBXSym12BRLcwV9
 Rt/ivsnt2LtEwAuypE5LF2oxou0f7K28XCEfAlL3yeKP6fP6Cd00mt9ye7Xl0abswF+8
 0vREhlZcI55qh8FWrzs5fsK62oKMwF5VSd3+zYebT8SavMMMSUjno2Fu2C64Q1H2KTVb
 h0mZjZXbRCdK3B7/QdIthwDNXoajGzTmhogS9C/s5pjQBh8/95uKBDUyZ4icmH8Gd1LA
 hNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=/zOrrl41ZeMxZPte40wc8fLDGbwTVlgATQ/g681F1CE=;
 b=SxHhhbykCF7DCqQxr2XIy0upyw26vWtnzc7S+kD52t0X22qKXgOOZlUpjCF0mCigMM
 iGr385D2iz9838vi2763nAaHDeloYi117SrfttZu63bqWOwoL2AyP7nTJ6Fooog481ie
 lq5IL4F5nLx6mBT9ANkL4vcmmvqZ3KWy+dZJqFhZDJfaRtYjAmDyy5pmwYyrz7k9v6u3
 3oqWAVCnpdmjkjhUg3mOVZKGppDjUFT+KG4w0WFt0tumlb5es81Jx5POifdMd2yY/BbY
 LtJ7jgWSWtRrmHEqZQP8uz7x3GyzW9h7xX4I4njcBvP9XXvO+goujp9pdQcouaAVD8Ez
 NWpw==
X-Gm-Message-State: ACgBeo1k7C8+v5OMJ8ln9LmUzwv2JVKNlnQM0psoiztZbZ0cV23Zsf9T
 lduxt0urwiAOTGSVLYZjcxDm0A==
X-Google-Smtp-Source: AA6agR6kGYPK8htRY2VSKi0AOlT50CquFrkZCforcWTbmthD3J/BfGRQJmjiYHvN4b/IlE7GuO1HhQ==
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id
 r4-20020a056402018400b00442fd542a21mr13364467edv.129.1660550059781; 
 Mon, 15 Aug 2022 00:54:19 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 gq17-20020a170906e25100b00730e5397057sm3729169ejb.185.2022.08.15.00.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 00:54:18 -0700 (PDT)
Date: Mon, 15 Aug 2022 09:54:17 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v12 2/6] target/riscv: Simplify counter predicate function
Message-ID: <20220815075417.nhfdzw3b5ysygct3@kamzik>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
 <20220802233307.2106839-3-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802233307.2106839-3-atishp@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Aug 02, 2022 at 04:33:03PM -0700, Atish Patra wrote:
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
> 
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
> 
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 110 ++++-----------------------------------------
>  1 file changed, 9 insertions(+), 101 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9b45c49ab45f..6690b72ea0e7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    target_ulong ctr_mask;
>      int base_csrno = CSR_CYCLE;
>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>  
> @@ -82,122 +83,29 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>          base_csrno += 0x80;
>      }
>      ctr_index = csrno - base_csrno;
> +    ctr_mask = BIT(ctr_index);
>  
>      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>          goto skip_ext_pmu_check;
>      }
>  
> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
>          /* No counter is enabled in PMU or the counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  
>  skip_ext_pmu_check:
>  
> -    if (env->priv == PRV_S) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            }
> -        }
> +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
> +       ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
    ^ there should be another space here

> +        return RISCV_EXCP_ILLEGAL_INST;
>      }
>  
>      if (riscv_cpu_virt_enabled(env)) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                 get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                     get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            }
> +        if (!get_field(env->hcounteren, ctr_mask) &&
> +           get_field(env->mcounteren, ctr_mask)) {
     ^ and here
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }
>  #endif
> -- 
> 2.25.1
> 
>

Thanks,
drew

