Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF25441FF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 05:34:14 +0200 (CEST)
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8w1-0005Tl-HF
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 23:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8tB-0002eo-TQ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:17 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8t9-0006hG-63
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:16 -0400
Received: by mail-pl1-x633.google.com with SMTP id f9so8793061plg.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 20:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gJjzJDZBDDLWqdWVfbbH08De3mS84zED/ajCKpGjnY=;
 b=Q1hdvOY/2ViitO5kRki08Ji2Fu02p2FqPDxtPzhTSPlEWa/s3UKIQFsOhhATnUDg8e
 nBiaf4EkhT8pGk/a4FuLLzAE8BsPOqSHxD+XOIo7M1qM6SbCwZxay8DTcB8ra4f0cAoc
 pcW04AoFT4hRbnRW6OLk2Le7cyHDKsCnbS+Z4dg8Mebfv1GtsxSWTiG9rp4raJCBS7nf
 Mqx3gjTDAwVe+JUH78ex0gtrHcKPlnsSwG1ksHX3XZvol+WRJyB/XPF10FbxBbCLUSCa
 vO/lflUF2b0kCcGpDj57YkQKxI/f37rxWRzCSNzReOL8zMMOjSjms6NIWfOmQsfKEpQl
 LNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gJjzJDZBDDLWqdWVfbbH08De3mS84zED/ajCKpGjnY=;
 b=mPVx5DwrXoE+PyjDw5aVG7q1Pg8z1E8KKkVP+T5l3jWGE52hgX0g49pRxIHCsPQ7Gg
 14B2zVLQL8sk6tiDsAPlHP9nT/z9VERxxon151hsr1syLkVxT3F2wnwNc5T6s08PAjJV
 OW/oXNQ2eLEl5aihISRmdIWOCC0RVo7MZGOmf8suKnhlN7JjdSqI4NwYrbaERI63SHlW
 SDez9O2tHo6U92eI28uSlO9FLdVIBpS5aIjuaTv7MPvOVQuWIRFPW6j4uOqZnCZgBZXY
 N+9W38QlQ2Lx14J1X88zcx8/JIlqsTNJqFRHCSsyQdALpVkP5pDRsFHlVz2yVfLw9Bkz
 f8wQ==
X-Gm-Message-State: AOAM533T5vFePeYWh1P/MMUKVrotd36NSTyD28++ohepPVYaJ5fCogen
 ivQQDvkr2M/fysbB3X1/gTfeQA==
X-Google-Smtp-Source: ABdhPJxD3ej6r5u1kQS87lcN8BO/EQUomzCJoIUJ/f1EFj9grf6K/R5ZqTp81DeuJv1Tl9hCjBwnTg==
X-Received: by 2002:a17:902:c651:b0:164:127:cdfd with SMTP id
 s17-20020a170902c65100b001640127cdfdmr38155875pls.154.1654745473822; 
 Wed, 08 Jun 2022 20:31:13 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.182.198.228])
 by smtp.gmail.com with ESMTPSA id
 ei13-20020a17090ae54d00b001e31c7aad6fsm15053964pjb.20.2022.06.08.20.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 20:31:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 1/4] target/riscv: Don't force update priv spec version to
 latest
Date: Thu,  9 Jun 2022 09:00:08 +0530
Message-Id: <20220609033011.752714-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609033011.752714-1-apatel@ventanamicro.com>
References: <20220609033011.752714-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x633.google.com
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

The riscv_cpu_realize() sets priv spec version to v1.12 when it is
when "env->priv_ver == 0" (i.e. default v1.10) because the enum
value of priv spec v1.10 is zero.

Due to above issue, the sifive_u machine will see priv spec v1.12
instead of priv spec v1.10.

To fix this issue, we set latest priv spec version (i.e. v1.12)
for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
spec version only when "cpu->cfg.priv_spec != NULL".

Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0497af45cc..9f9c27a3f5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -169,6 +169,8 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -204,6 +206,8 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -509,7 +513,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = 0;
+    int priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -533,10 +537,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (priv_version) {
+    if (priv_version >= PRIV_VERSION_1_10_0) {
         set_priv_version(env, priv_version);
-    } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
-- 
2.34.1


