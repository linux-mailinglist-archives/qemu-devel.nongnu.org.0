Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D277534AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 09:39:40 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu85r-0001wO-Aq
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 03:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nu81r-0008Hc-MA
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:35:34 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:42779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nu81o-0000E4-6P
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:35:29 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i11so1550711ybq.9
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lq2mT/z36TTERjhSMQY/YGBnpj+e+SOGoCr8PZ2RBeY=;
 b=TmyGdGayBn+WaAftSvipCS+g4FXfDR0ivQcC+55KtZ5VrthH4CNpsL5enX52geX0UN
 hwYFx2Myv8czw25tHI2IIOQn+Y3bamb/l0WCPbSkRXSgbMZOv1gUVk9V3w8ji48caEwG
 +R0OwJ7NAMLDjMbkhfAsCUBJ1DBIyPL9EI1Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lq2mT/z36TTERjhSMQY/YGBnpj+e+SOGoCr8PZ2RBeY=;
 b=2gy7WWh6nCy+42tk/prasDu3E4cTgBT5zL8530Hh/t6LhRJ5zCLmJOBepXsos1FqXw
 MGKHxPIKga2o4a14wP8MHwNI03JxE45EQQ7FSlo16+tqX9tLMlpb2D4xc6f45jK8cL+j
 F8UN4m28tLj7+L9SEvDExve3JPnry/pZJyToVQ9tGFrQQOqmdnxNlZF13ip7E4ByiXf3
 0om90wKYmc4lY1vou/ppnhouJRa418vqSE1+TiC2TTT70iTIAHJ56XHJHqK1K58gMcME
 YaU137f5CrYbp/dpmE9qvHrUl26VUhkoeuRHMO6D7jLIOSNtdp3MgOCdLb9K7+vWg7Du
 kp8A==
X-Gm-Message-State: AOAM530X4pKcnt8AgDTcRNlJRwtDqjpPSqYrXu3CDEKCSOYTu7wPZB9n
 ciNvKzEt6sq1M6qCsxV20c+Jim+3V9D0a+xkfjc8
X-Google-Smtp-Source: ABdhPJzbHFPaT1uxINBkv0WQDLx8ufC4x17Ec2dg8FMYgsPPHvim7AMTvfOvUCddwHDAdzCImkVO89rWZ6u7JhmYlII=
X-Received: by 2002:a25:316:0:b0:654:a65f:def4 with SMTP id
 22-20020a250316000000b00654a65fdef4mr9863793ybd.429.1653550527091; Thu, 26
 May 2022 00:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220523235057.123882-1-atishp@rivosinc.com>
 <20220523235057.123882-10-atishp@rivosinc.com>
 <CANzO1D3o2iMV45hJW3-xWFtXW9g-iOO2EsrSUFzm_wDdMBNBSw@mail.gmail.com>
In-Reply-To: <CANzO1D3o2iMV45hJW3-xWFtXW9g-iOO2EsrSUFzm_wDdMBNBSw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 26 May 2022 00:35:16 -0700
Message-ID: <CAOnJCUL0_R18GY3b00tcW3Pez49McuYBL0+Lan2h-w7x1LuOYA@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] target/riscv: Simplify counter predicate function
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb36.google.com
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

On Wed, May 25, 2022 at 3:24 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Tue, May 24, 2022 at 8:02 AM Atish Patra <atishp@rivosinc.com> wrote:
>>
>> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
>> as a unified counter. Thus, the predicate function doesn't need handle each
>> case separately.
>>
>> Simplify the predicate function so that we just handle things differently
>> between RV32/RV64 and S/HS mode.
>>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>  target/riscv/csr.c | 111 ++++-----------------------------------------
>>  1 file changed, 10 insertions(+), 101 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 723b52d836d3..e229f53c674d 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>      CPUState *cs = env_cpu(env);
>>      RISCVCPU *cpu = RISCV_CPU(cs);
>>      int ctr_index;
>> +    target_ulong ctr_mask;
>>      int base_csrno = CSR_CYCLE;
>>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>>
>> @@ -82,122 +83,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>          base_csrno += 0x80;
>>      }
>>      ctr_index = csrno - base_csrno;
>> +    ctr_mask = BIT(ctr_index);
>>
>>      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>>          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>>          goto skip_ext_pmu_check;
>>      }
>>
>> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
>> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>>          /* No counter is enabled in PMU or the counter is out of range */
>>          return RISCV_EXCP_ILLEGAL_INST;
>>      }
>>
>>  skip_ext_pmu_check:
>>
>> -    if (env->priv == PRV_S) {
>> -        switch (csrno) {
>> -        case CSR_CYCLE:
>> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_TIME:
>> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_INSTRET:
>> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        }
>> -        if (rv32) {
>> -            switch (csrno) {
>> -            case CSR_CYCLEH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_TIMEH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_INSTRETH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            }
>> -        }
>> +    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
>
>
> Should we also check PRV_U against env->scounteren here?
>

Ahh yes. That's required while hpmcounter is being accessed from the
userspace. Good catch. Thanks. Will fix it.

> Regards,
> Frank Chang
>
>>
>> +        return RISCV_EXCP_ILLEGAL_INST;
>>      }
>>
>>      if (riscv_cpu_virt_enabled(env)) {
>> -        switch (csrno) {
>> -        case CSR_CYCLE:
>> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> -                get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_TIME:
>> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> -                get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_INSTRET:
>> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> -                get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> -                 get_field(env->mcounteren, 1 << ctr_index)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        }
>> -        if (rv32) {
>> -            switch (csrno) {
>> -            case CSR_CYCLEH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_TIMEH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_INSTRETH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> -                     get_field(env->mcounteren, 1 << ctr_index)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            }
>> +        if (!get_field(env->mcounteren, ctr_mask)) {
>> +            /* The bit must be set in mcountern for HS mode access */
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>          }
>>      }
>>  #endif
>> --
>> 2.25.1
>>
>>


-- 
Regards,
Atish

