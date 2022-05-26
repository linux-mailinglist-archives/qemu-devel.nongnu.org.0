Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198E534CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:09:32 +0200 (CEST)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAQs-0002XG-Tp
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANN-0007UC-TW
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:05:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANM-0000sF-Df
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:05:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1314436pjt.4
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LWf2NPD9mnY7XjfGUCe+V1G8egaLFjPiPXaI0jytoaU=;
 b=aYhdYFqW7bDVe67gs4UKkfnNiU34zbGUAHGq5ssQtYNrNalRctwDps6/u8V9VmXOUU
 6qPCYyzk3NDD3HvSZx7yJ4cVQSADp0LVJ9sLx94x7ZHYSoBosByv9PW1JrL2FTeDDSFa
 Q65wITo1fQzo+gT3cTue+Y64c+9kgK12Y32m12dXNtOZ1XuFfIV5E3/TTVQ6Bu16PosA
 9Jkq0Opo8+j/0E2sn5rOi9peYnE3G6Jf2PquG6frR94zJvr56J+KP4Ddw5JwB/XCxwL1
 nn/tUn9gD2bzVgnH4gzStPnAd5hHRV9dUli7eDTP9pMg5EENpZuzhHuNVxJyHcNfMAvM
 fvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LWf2NPD9mnY7XjfGUCe+V1G8egaLFjPiPXaI0jytoaU=;
 b=18js9cJiWW4UYfuUUE3hBHX4Jd/Y3yeVzdI07aF/4CIR1i2pkTWmdJLrN3qAoerL66
 eh8EFNYMjWr1gK527PiakvYYdqA3x84Tb0GxkXPWVDDDlPaWAnUFAIxDKlliUJI+EURP
 QYUcBZ6yMvXCPxhzMKuZxshd+RIfzMEZAju5QOvrZwB+w8ILWG0nUu1ZoCdZTw1PrxqD
 g3Wr6dvnNFJNvasYc6FI9BadbClWttI1/fxZP6cYl0HNjpnmnnmpac5MmiSoayh1g5Bp
 EAz3rMo0w5T8N5IAL44aJMLYMJ+yvcGSxcRPfaRqEx+FwzSdyZKBN/po1p+i6X940lpu
 pCGg==
X-Gm-Message-State: AOAM532g8FBuhJmWzaz1Nd7aB9YvagBUdg4MGoT/PBnnPHWMi5R52Hap
 j3ouA80UPlseqVDIDvRGs4rWvA==
X-Google-Smtp-Source: ABdhPJy34YhOzDqrvRhU+y0ydanlQAKLoH+/bEz2ylJWBdaB5Bq139jsNFcl3Gj9QWjUFgufnjtruw==
X-Received: by 2002:a17:902:ccc1:b0:15a:24df:a7cc with SMTP id
 z1-20020a170902ccc100b0015a24dfa7ccmr37324112ple.42.1653559551117; 
 Thu, 26 May 2022 03:05:51 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.94.60])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa793ba000000b0050dc76281e5sm1020126pff.191.2022.05.26.03.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 03:05:50 -0700 (PDT)
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
Subject: [PATCH v3 1/4] target/riscv: Don't force update priv spec version to
 latest
Date: Thu, 26 May 2022 15:35:33 +0530
Message-Id: <20220526100536.49672-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526100536.49672-1-apatel@ventanamicro.com>
References: <20220526100536.49672-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102d.google.com
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
index a91253d4bd..b086eb25da 100644
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


