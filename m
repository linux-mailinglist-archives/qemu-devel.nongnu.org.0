Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1D523634
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:52:20 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonhL-0002zi-9X
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonc2-0002Bj-Ij
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonc0-0001Dk-Uj
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:50 -0400
Received: by mail-pl1-x634.google.com with SMTP id n8so2118144plh.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnIJjDgh3bHop5ZAYtcGfmn1Q0AVEeirrNZPW/QsPio=;
 b=TJNy2tqXKs8SwnmbLsBDNk6+m+L2oaT6pqDKuF0okaabi6mSrlRR5JMMWDGQPa1edo
 frbd33EtJMZHDqlOUWdqqJWy7FdN4Dfp6Cgq4hKJEIIG+UmgpvGp9WQwvYHotDlwSYcL
 Iyh6575C1ZowFgPfJEWp3o/cSER1Nra1kbOEroC3byvjBYQ8pG5sW64K70gRkLsnKtFc
 HJaSF2TChcc0SuCOttpOS3pMrch4TbG/HG/iyaPGN4QUCvgaTYJbT8/WmbF69QD6Pfe/
 VMlYUXdW05vXKULTgt1mZELKzlRI4VWEyb0iC8UXXao233SYmAsafreCq+QSM/KYg7cF
 RM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnIJjDgh3bHop5ZAYtcGfmn1Q0AVEeirrNZPW/QsPio=;
 b=zZ61TW9sOJtbuKLChyTSp9+ZsLd6IIK315xaqk/7oqjuKYNe4awtLugHuW02cflqi+
 MLEdViwKrCem38i4OH3XStmt0zALmp6K+2KMAQp69vNWY4CD8DWlWGu61GgEq02sy67L
 mbr1QrQfSEFNGYGAUe39gmd1a/xGxNjLosfufQ8Iy7Vm26yPEoZZu0QCaKYjv0spFhvc
 yREscd5HTs4tIlCanTmf6vNkjZGWtFOOKkJxMZkMcWO2LBK2XMag21ty5nrhdO0yb2HC
 TYs1Q7Ip9Bu742ifaPTFzWnDMuDT6Q3xgYtay5AAfvjzVOmKJDKB2inkPscIIg6b6hDi
 4GUw==
X-Gm-Message-State: AOAM530o0udqsyHfWTFZz/D1fzVAV+gS4EVLgypNFKM/BqRl0TRgxwS1
 ZJYNJEt0vQM6Ju8z8GUPKk/NxqCiJF6WJw==
X-Google-Smtp-Source: ABdhPJymHur2iOHc9BMuKB124GlG6z+tRrfO+1XqjpwhSSQ+RXnNMDrUL1Ry+6dbVSyYsVT6cBIrOw==
X-Received: by 2002:a17:90b:4c09:b0:1dc:6c30:f230 with SMTP id
 na9-20020a17090b4c0900b001dc6c30f230mr5816166pjb.110.1652280407467; 
 Wed, 11 May 2022 07:46:47 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 5/8] target/riscv: Don't force update priv spec version to
 latest
Date: Wed, 11 May 2022 20:15:25 +0530
Message-Id: <20220511144528.393530-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x634.google.com
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

The riscv_cpu_realize() sets priv spec verion to v1.12 when it is
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
---
 target/riscv/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9a5be9732d..f3b61dfd63 100644
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


