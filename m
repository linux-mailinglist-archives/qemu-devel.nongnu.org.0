Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2825A6BFC96
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:06:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcns-0005GK-9J; Sat, 18 Mar 2023 16:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnq-0005CO-E3
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:22 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcno-00071F-Ld
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:22 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 p11-20020a9d454b000000b0069d8eb419f9so4292255oti.4
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYMlE/F1S0n9ko7FKmrIGnYN/pdSAseR81vgrE7fIjY=;
 b=FYIP7lzgrPg4DX8DNVP1GhTNpscbAX701BGtqWvack5Yh+0qUNGJTnkZ/QBByecbvp
 fmhM5GeKfeHIg/sOFP834LGV/sZHSYez64flKKa0dDiF8xSefW5B+fTjpqZuiq5VG+vA
 8MAUEvyKk8wIPk1YxlQJtDH+xfC6/ybWTR/DemDF0ITHhwmJf7wuIBiNm5ZSvcCl9+KC
 bRxOBJwKSqeoZWrd+BEa8t4pNMEZymVFAaGOZusL3btoDiTNhCe0pCFXo56mrEyTXE+F
 xTu34ovMK0PQ+9SMfl5lvDm+DKAYEdGoEKl19YXUQ4009VvcMx0lWteZqw2u7/MQ9+g/
 EwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYMlE/F1S0n9ko7FKmrIGnYN/pdSAseR81vgrE7fIjY=;
 b=M7VYiY/1Aq+80aXGEkY1WTbVHOaC8F05yXhsEeVk9zvP/y0kC4ClsJP9ANgrn1jfPY
 +4pQvILr6XnfWZxUk/izojz4hXXdT1+sFBVfLIqXnlRScG2cKO312k2oYSTEjl6uTRyb
 +Tv1fDDTOL8p3usSO+fqGR6LdBkcxiaPmV/pD4o0CZd2GOBaHWJlWi7KfxP5S4pBe4Tu
 dbnN9dy9OQ7fmz8D6oMnTBhOOhvQCPxZG500dAIgSVvYyluUMoDHTRbWsEPugcKgPoWs
 jmfkWS9ySmjFS3IfFHNwVHIEAuU1jSteGG22R7oXhpxZjb01+5rIt1cAgfQSxD1Dlqjf
 bN+Q==
X-Gm-Message-State: AO0yUKUsNBOOZTcjLkxDbt8VGLmW5/d/6B2oLqkjYpoKJ9w3ycyMe85B
 Q6I6Ic4oLcWE9/qffVjBjkdgK8Un54gQ53rjsQs=
X-Google-Smtp-Source: AK7set9uHWrVSJn7nreF7Tqf6gDVZjlppQLR/FExFpA4pBKTxN4TNZGPY/6kszjaWmWiAuQfmQUP3w==
X-Received: by 2002:a9d:77c9:0:b0:686:5c66:1ff0 with SMTP id
 w9-20020a9d77c9000000b006865c661ff0mr1572604otl.5.1679169919336; 
 Sat, 18 Mar 2023 13:05:19 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 13/26] target/riscv: put env->misa_ext <-> cpu->cfg
 code into helpers
Date: Sat, 18 Mar 2023 17:04:23 -0300
Message-Id: <20230318200436.299464-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The extremely tedious code that sets cpu->cfg based on misa_ext, and
vice-versa, is scattered around riscv_cpu_validate_set_extensions() and
set_misa().

Introduce helpers to do this work, cleaning up the logic of both
functions a bit. While we're at it, add a note in cpu.h informing that
any future change in MISA RV* bits should also be reflected in the
helpers as well.

We'll want to keep env->misa_ext changes in sync with cpu->cfg during
realize() in the next patches, and both helpers will have a role to play
in that.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 120 ++++++++++++++++++++++++---------------------
 target/riscv/cpu.h |   3 +-
 2 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b5096d25e..28d4c5f768 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -234,10 +234,69 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
-static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
+static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
 {
-    RISCVCPU *cpu;
+    uint32_t ext = 0;
 
+    if (cfg->ext_i) {
+        ext |= RVI;
+    }
+    if (cfg->ext_e) {
+        ext |= RVE;
+    }
+    if (cfg->ext_m) {
+        ext |= RVM;
+    }
+    if (cfg->ext_a) {
+        ext |= RVA;
+    }
+    if (cfg->ext_f) {
+        ext |= RVF;
+    }
+    if (cfg->ext_d) {
+        ext |= RVD;
+    }
+    if (cfg->ext_c) {
+        ext |= RVC;
+    }
+    if (cfg->ext_s) {
+        ext |= RVS;
+    }
+    if (cfg->ext_u) {
+        ext |= RVU;
+    }
+    if (cfg->ext_h) {
+        ext |= RVH;
+    }
+    if (cfg->ext_v) {
+        ext |= RVV;
+    }
+    if (cfg->ext_j) {
+        ext |= RVJ;
+    }
+
+    return ext;
+}
+
+static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
+                                       uint32_t misa_ext)
+{
+    cfg->ext_i = misa_ext & RVI;
+    cfg->ext_e = misa_ext & RVE;
+    cfg->ext_m = misa_ext & RVM;
+    cfg->ext_a = misa_ext & RVA;
+    cfg->ext_f = misa_ext & RVF;
+    cfg->ext_d = misa_ext & RVD;
+    cfg->ext_v = misa_ext & RVV;
+    cfg->ext_c = misa_ext & RVC;
+    cfg->ext_s = misa_ext & RVS;
+    cfg->ext_u = misa_ext & RVU;
+    cfg->ext_h = misa_ext & RVH;
+    cfg->ext_j = misa_ext & RVJ;
+}
+
+static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
+{
     env->misa_mxl_max = env->misa_mxl = mxl;
     env->misa_ext_mask = env->misa_ext = ext;
 
@@ -251,25 +310,7 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
         return;
     }
 
-    /*
-     * We can't use riscv_cpu_cfg() in this case because it is
-     * a read-only inline and we're going to change the values
-     * of cpu->cfg.
-     */
-    cpu = env_archcpu(env);
-
-    cpu->cfg.ext_i = ext & RVI;
-    cpu->cfg.ext_e = ext & RVE;
-    cpu->cfg.ext_m = ext & RVM;
-    cpu->cfg.ext_a = ext & RVA;
-    cpu->cfg.ext_f = ext & RVF;
-    cpu->cfg.ext_d = ext & RVD;
-    cpu->cfg.ext_v = ext & RVV;
-    cpu->cfg.ext_c = ext & RVC;
-    cpu->cfg.ext_s = ext & RVS;
-    cpu->cfg.ext_u = ext & RVU;
-    cpu->cfg.ext_h = ext & RVH;
-    cpu->cfg.ext_j = ext & RVJ;
+    riscv_set_cpucfg_with_misa(&env_archcpu(env)->cfg, ext);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1156,42 +1197,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      */
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 
-    if (cpu->cfg.ext_i) {
-        ext |= RVI;
-    }
-    if (cpu->cfg.ext_e) {
-        ext |= RVE;
-    }
-    if (cpu->cfg.ext_m) {
-        ext |= RVM;
-    }
-    if (cpu->cfg.ext_a) {
-        ext |= RVA;
-    }
-    if (cpu->cfg.ext_f) {
-        ext |= RVF;
-    }
-    if (cpu->cfg.ext_d) {
-        ext |= RVD;
-    }
-    if (cpu->cfg.ext_c) {
-        ext |= RVC;
-    }
-    if (cpu->cfg.ext_s) {
-        ext |= RVS;
-    }
-    if (cpu->cfg.ext_u) {
-        ext |= RVU;
-    }
-    if (cpu->cfg.ext_h) {
-        ext |= RVH;
-    }
-    if (cpu->cfg.ext_v) {
-        ext |= RVV;
-    }
-    if (cpu->cfg.ext_j) {
-        ext |= RVJ;
-    }
+    ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
 
     env->misa_ext_mask = env->misa_ext = ext;
 }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ebe0fff668..2263629332 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,7 +66,8 @@
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /*
- * Consider updating set_misa() when adding new
+ * Consider updating riscv_get_misa_ext_with_cpucfg()
+ * and riscv_set_cpucfg_with_misa() when adding new
  * MISA bits here.
  */
 #define RVI RV('I')
-- 
2.39.2


