Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B9C6D9F76
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:06:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTyr-0001MP-7E; Thu, 06 Apr 2023 14:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTye-0001L3-Iv
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:52 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyc-0000bX-5v
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:51 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-17aeb49429eso43239034fac.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Mgql+kTJwKO8IFxJFExkT4T9FA8hB8atR2o11uBQrY=;
 b=N9J763Qcep8NgBLYxWt3nQSmxW7O2+0d+QpyybZD8Uic2Kg4q9+oUwXnVR11hp79IH
 rrR+MR4bzIJizFpz5igdGrq2Gqq+080lGv5oS0Zq3HAtFfpqrNnutDo2xlBJIrtLkGLD
 WRm2eoDmcZ+tEkHbcGU3stSaRto8Bpf9CPos69RSCWiGw2zEt0sFYAyuNzXZD9ir8wvU
 tSS1AaRCd2/IzgkQc+Bn8esdLGAx2hTtikmgfhKKFAndfYO7cDbJXCAxMGqpEw21LAAN
 W4eMmSSgBi621hVJY5iqqN6OF+rFeoQx7OCAd+RKwjfBj1UlFS68xdAOUvZXr7ednXOy
 n+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Mgql+kTJwKO8IFxJFExkT4T9FA8hB8atR2o11uBQrY=;
 b=tLTGXjNMcRo1Df5kA+JwMSwInJpXywPQTzLuWeT1TGfWPZc+uTFh6hlNwpFNOj0Kb2
 EbHunj+7k6VJvz3sy0ZjONB/iV1gtyVCkUeoHk9fpGMh9FdA+lV7YWgyjHTZToN+/lvS
 jyU60QZh+cYr8bpIFhG4S7L7ZLCxg+3fpkzqHb+Tzs3ks8DDhh15BB5C+rIUs++kH3Js
 YqZkLSfQYKXPf+VBTHBuXQ34ye+cV8gDQjC8Tu1je/kA8nskcj0I+DML/L4U28uojNy4
 iG92lOUY9FmreXZx5/lmKI7r4uJl3TKAcOdmzX0Nn42DWVtTkCm4pGfBPnWWzZIhZsz6
 o0BA==
X-Gm-Message-State: AAQBX9eFw1PxYleALMW+iSLWvFBO5H29x0IE7jD4jhsKojkKTiWTxAdD
 adH+/Vh0PB95r4MLOdjyN74KtNrelTaY2dByK2U=
X-Google-Smtp-Source: AKy350ZX2xleF9w+p9tujIlNq59MIhenTXYcUhcAACzhs+XuUETeHiCXfgbP1Xx4wJ5g3pYmbSIe0w==
X-Received: by 2002:a05:6870:3416:b0:172:289b:93c5 with SMTP id
 g22-20020a056870341600b00172289b93c5mr3691091oah.0.1680804289154; 
 Thu, 06 Apr 2023 11:04:49 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 16/20] target/riscv: remove cpu->cfg.ext_v
Date: Thu,  6 Apr 2023 15:03:47 -0300
Message-Id: <20230406180351.570807-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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

Create a new "v" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVV. Instances of cpu->cfg.ext_v and similar are
replaced with riscv_has_ext(env, RVV).

Remove the old "v" property and 'ext_v' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 12 +++++-------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3bdd6875a8..13ff37250e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -883,7 +883,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1018,7 +1018,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         int vext_version = VEXT_VERSION_1_00_0;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
@@ -1175,7 +1175,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
-    if (riscv_cpu_cfg(env)->ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         ext |= RVV;
     }
     if (riscv_has_ext(env, RVJ)) {
@@ -1513,6 +1513,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVH, .enabled = true},
     {.name = "x-j", .description = "Dynamic translated languages",
      .misa_bit = RVJ, .enabled = false},
+    {.name = "v", .description = "Vector operations",
+     .misa_bit = RVV, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1536,7 +1538,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1638,7 +1639,6 @@ static Property riscv_cpu_extensions[] = {
 static void register_cpu_props(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
@@ -1648,8 +1648,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_v = misa_ext & RVV;
-
         /*
          * We don't want to set the default riscv_cpu_extensions
          * in this case.
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1aff93ba91..e011cf6ca4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_v;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
-- 
2.39.2


