Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC36F7A88
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtA-000083-Mk; Thu, 04 May 2023 21:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujt8-0008O0-Bg
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:34 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujt5-0007WA-62
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:34 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab0c697c84so8524335ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248729; x=1685840729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTRKBCm4ghHrHqbde39ICtG5ruW14LMud4XOBjlLFVU=;
 b=Q1pCt1a04ohjTCoNlbZfbHu9+8qFOIy7D7K4CDZae5kBM5wBydHYOsDWJDWxI4ryBU
 RClhNiK9YcuyKv/pZ4dgnaMh+Yhg/OYFObf5rR34Mlvc3IyfHM4G1RfcmogeZXZyEjjI
 lzN9tAFBTwae75t1tGfF069llAG+FcbkAO7/jHuyr6qeF0qML7CuVFvTDqXKXQCf/TlL
 IdToiT5CNgva5YxFVL12BTEDp+DOiEY9OtnIE+dwc53OZsLFgZ2Czf/1lazKxv1MeMVE
 3fRAAzw9S912VQKmcJDirHFMVULo8wz+w2NckABZvWHUXohH9ofB6+i9XrzON5C7HpWf
 OBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248729; x=1685840729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTRKBCm4ghHrHqbde39ICtG5ruW14LMud4XOBjlLFVU=;
 b=OSElZhxAL1l+65duK1iVCk3tQtRECOmuDpmzdZxP5C+2rghoHgd9DeS1CupLfoP9Nd
 U0P/89Bg3yqgxFwopQ2U+y3sIoH1t/PeF3nXEClBU2jAMIXvhMrqvkH+HMHsi09pnocf
 Q28dqgO5D3EQLnSXmuuVB8shUoIxw6eqpPtqQbtm3cSrIQDCup2KGNPmxtTxwWxsjvlk
 jHREtdwKezs2RnW2mFOrhp4pyEXeVqYHwTJP+rZFytCqFrZ3Im9ZOdBZ6JtEvWp/jzof
 Lc3q/g4RQLMrL7hsUAzHPZmSv3JAR68qRl/t34c1l4vJV7KhotNcHw2ipH2QY1cid1M8
 2IjA==
X-Gm-Message-State: AC+VfDyrUT2PUuX62g+IASIwKCG1RJHOmbBspeDsTb9++zOlzMuYXx8N
 6T97FQz1BoxOgHImUZ9eWPZooiu6L/gT2g==
X-Google-Smtp-Source: ACHHUZ6wm/6GTRoiMCl2HHLNPG69xFQibSgTiOliDr1Vhfhri46pEOR/Fnkvf0kgqKw2OiJ0s7Ebbg==
X-Received: by 2002:a17:903:503:b0:1a9:765c:77ac with SMTP id
 jn3-20020a170903050300b001a9765c77acmr5332494plb.7.1683248729159; 
 Thu, 04 May 2023 18:05:29 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:28 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 38/89] target/riscv: remove cpu->cfg.ext_c
Date: Fri,  5 May 2023 11:01:50 +1000
Message-Id: <20230505010241.21812-39-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "c" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVC. Instances of cpu->cfg.ext_c and similar are
replaced with riscv_has_ext(env, RVC).

Remove the old "c" property and 'ext_c' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-7-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 -
 target/riscv/cpu.c | 9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1d1a17d85b..9a3847329c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -428,7 +428,6 @@ struct RISCVCPUConfig {
     bool ext_m;
     bool ext_f;
     bool ext_d;
-    bool ext_c;
     bool ext_s;
     bool ext_u;
     bool ext_h;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3770fd4f6f..2e00b8f20a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -407,7 +407,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_c = true;
     cpu->cfg.ext_u = true;
     cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
@@ -957,7 +956,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
-    if (cpu->cfg.ext_c) {
+    if (riscv_has_ext(env, RVC)) {
         cpu->cfg.ext_zca = true;
         if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
@@ -1168,7 +1167,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_d) {
         ext |= RVD;
     }
-    if (riscv_cpu_cfg(env)->ext_c) {
+    if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
     if (riscv_cpu_cfg(env)->ext_s) {
@@ -1498,6 +1497,8 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
 static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
     {.name = "a", .description = "Atomic instructions",
      .misa_bit = RVA, .enabled = true},
+    {.name = "c", .description = "Compressed instructions",
+     .misa_bit = RVC, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1526,7 +1527,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
-    DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1649,7 +1649,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_c = misa_ext & RVC;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
-- 
2.40.0


