Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172745438A9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:17:37 +0200 (CEST)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyND-0001RM-R3
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyL8-0007AN-VM
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:15:26 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyKz-0002Xr-Kw
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:15:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id s135so3703331pgs.10
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MUlVMz0mT/KXtuKDaS4V/GZQ3FzUmtpDbT4gk28/bsA=;
 b=n8kNT8py33pCaHgsX0WGfc/MUwRGnboK+iMmEn2UiwEiV3U6MxnWPkn42Xx90qQyrz
 FEvkDlahVEgcpc9aU/UU38u+UPJodzB/Xxt64DpC6UhRzzZA5i4rLqTClkq28wPSSWPu
 CxJjoJS78krvRK86gVjlsqQaJwx8PBraaFvT1/T1w2+OWdfI2NoPebLLdcaKHytcKZdU
 kthycozepUh3PWxURVbghEaEeF95DPzCHbdCA7evbrPhCKCk7NWIGC/omlDSnD9qPgHU
 YiFmS7wqcu3AAH3uv08FKeLwDBKf36V+8irfydYSWetF3K9MSOZ3+D3euWq+GJP8yWxv
 mZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MUlVMz0mT/KXtuKDaS4V/GZQ3FzUmtpDbT4gk28/bsA=;
 b=WeqyyY9A8TlF11+G3ji8KhPs26jCnDz4oU15UyVKv80/DcU/bua+vs8TixVoLUC0GK
 NLiQ0axSHvoK1WUvFcd7vRPmC2XqtluEg5f/wrvrdXoNoofd09gAcCw3nPj6PgMN5J3d
 6U4xQCmET7zFF6YTghfq+uCSeYw0YQUfhnmWZ1HEGHQ/fTQH9ZyJaYiBX6Hbreh4bFXB
 VMAMVNw7g53HhVkj3uXUogE9Z7VdYGUP6HKX7rHRtONUnO3tyn79etUagAUe1ozsjc5I
 /rN9WP4FBnAU3Ff9ybZo+zNhl5Fx94mY+SeOmeCJ62U67f+ZeeEpiUxr7kNrUUM/b5UL
 rfEQ==
X-Gm-Message-State: AOAM532i4Onz7PSbkj5J8wsr+dMUUGCfnnZJ1U+Z5Cyu3aCMBleS7lEV
 Cm9NHrEAbiXwM4YqBq6IU8jmtg==
X-Google-Smtp-Source: ABdhPJw/yYvA/1GsUPZiQF6JRaSqlp2BuP3YmQH5ejs9jUOyZmgL1HrkXo5qg1jDi924RF5OONwSdw==
X-Received: by 2002:a63:2a89:0:b0:3fa:cc62:e00f with SMTP id
 q131-20020a632a89000000b003facc62e00fmr30369832pgq.364.1654704916206; 
 Wed, 08 Jun 2022 09:15:16 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.162.103.97])
 by smtp.gmail.com with ESMTPSA id
 k189-20020a6384c6000000b003fcde69fea5sm13374843pgd.81.2022.06.08.09.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:15:15 -0700 (PDT)
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
Subject: [PATCH v4 1/4] target/riscv: Don't force update priv spec version to
 latest
Date: Wed,  8 Jun 2022 21:44:02 +0530
Message-Id: <20220608161405.729964-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608161405.729964-1-apatel@ventanamicro.com>
References: <20220608161405.729964-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x530.google.com
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


