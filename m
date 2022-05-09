Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC25205A6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:04:24 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no9cF-00045y-94
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1no9aH-00034z-Pe
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:02:21 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:36359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1no9aG-0005n0-8U
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:02:21 -0400
Received: by mail-yb1-xb33.google.com with SMTP id x17so6422637ybj.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qE4ERdu6cnODdKn6FhQv9w8Z6PxEzdHOvMSLHR/77/I=;
 b=sSh4/+RmE6jSJ0edhFcRMgBHEMyONcxvao8Tq5WDsPacFqkHRF6vhkPC48aPi0f3wW
 vpvIHK7a903crvyh1svn33q6BHAnUu79EnZt8DFP8mgJAAg3mOTSs02Qy+weztCY1ycH
 XHDnP59vmXiU6A1umz2W/3di8gghpCT8L6ccI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qE4ERdu6cnODdKn6FhQv9w8Z6PxEzdHOvMSLHR/77/I=;
 b=mpndArMaLXFo/IsjcSN429HAgi74wvYDuEhWl42x2hEILi+KC7fBa7LnL6gMY6K+gs
 Z/lrwIx2V6bs5Pni8fRC6DhwGCi584ii+jAKfXurLN6qJPI7LnExD26n+ZfH/cMBPncx
 exp4+oPYTlWu7W0LsoMbgVS5tJgrDOhlasE2FXjsaPNkNcsnijBP3cEJ1tXH8iCRqyoc
 mkuSE2V8kQzkP5ECxySriNM2eZ8Z46r0b8W6F5yX2XikwomDWsc1lEz5gzqnYwSX6xDy
 EArQjJqYRmj7NbG4+ZjDTqeOGMLtTjv1iecauT95RjL6ev8de6/4KVjMc2glyWbJOEa3
 7TlA==
X-Gm-Message-State: AOAM5316a7tOwahvZzUepz9xzNNvh6EnXrJXYSLMCjhJm3QvMXt0AZeI
 9S9LYjLn4/svcmJYMLKXSjzYzFDSgyGaKhWlF923
X-Google-Smtp-Source: ABdhPJx1Jsgqcf31yBuaoFU0OqBEMWBhs0dTH2TDpSITzLZsGxzEXSWOV8T24w50gFQyvruxwLZsWFp6dzt/IrjAJto=
X-Received: by 2002:a25:3fc5:0:b0:64b:3a:d29a with SMTP id
 m188-20020a253fc5000000b0064b003ad29amr1383670yba.236.1652126539045; 
 Mon, 09 May 2022 13:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-2-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 May 2022 13:02:08 -0700
Message-ID: <CAOnJCU+=V2Rm1SeJM58pmMFpQdnHq7dq4rjoMgWu_-gDJxYWmA@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Don't force update priv spec version to
 latest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Apr 29, 2022 at 8:35 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The riscv_cpu_realize() sets priv spec verion to v1.12 when it is
> when "env->priv_ver == 0" (i.e. default v1.10) because the enum
> value of priv spec v1.10 is zero.
>
> Due to above issue, the sifive_u machine will see priv spec v1.12
> instead of priv spec v1.10.
>
> To fix this issue, we set latest priv spec version (i.e. v1.12)
> for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
> spec version only when "cpu->cfg.priv_spec != NULL".
>
> Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f0a702fee6..02ee7d45d8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -169,6 +169,8 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> +    /* Set latest version of privileged specification */
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -204,6 +206,8 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> +    /* Set latest version of privileged specification */
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
> @@ -509,7 +513,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      CPUClass *cc = CPU_CLASS(mcc);
> -    int priv_version = 0;
> +    int priv_version = -1;
>      Error *local_err = NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -533,10 +537,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> -    if (priv_version) {
> +    if (priv_version >= PRIV_VERSION_1_10_0) {
>          set_priv_version(env, priv_version);
> -    } else if (!env->priv_ver) {
> -        set_priv_version(env, PRIV_VERSION_1_12_0);
>      }
>
>      if (cpu->cfg.mmu) {
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

