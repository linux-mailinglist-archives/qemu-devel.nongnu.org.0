Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEA76D9F70
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:05:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTye-0001JU-Qp; Thu, 06 Apr 2023 14:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTya-0001E0-FI
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:48 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyY-0000dG-RW
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:48 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17aa62d0a4aso43232206fac.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poHf77vQ3VNnHuESrhfohTdDZ+AufSDEZlCfhUB/J+s=;
 b=CgtrCqHq2jBLxOwfJUIeFmPTGNFOiEYWBglD2fLnKOzs1G8H0rzO6phTEi9/1TlIAL
 dQOYzUG3m39dIc7aHT+SqzbuMg3uJdTHG/gBqSAuqo9UcZvwi0oL6OQHXZeVtB0yD/JV
 KiMzmPgieLou52PMXeFExEC1b6kpBSdcPTbpQoYBXb8IFD7vh8wjtmYJQQudFA7T/Lvk
 JT6QXyFiY8hhABiZ4BecL/GSFtODOB+fs34wZlCQhCf8D3EZ0xPM3Ph/284eGfMKf620
 W2qShEn9Gjs+Kqv/CgjhMEWvV4GCEZcOv0KXbGZNYa9/8z0QtwKpSLaL/zcOjHHkke3C
 ARbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poHf77vQ3VNnHuESrhfohTdDZ+AufSDEZlCfhUB/J+s=;
 b=lsnV8WlvfqaDvXqyw74mKO/ydVEKz4wCC4Tnw+wae/kFhsp1QicHbkoTt8UWywYOt6
 1c4/04bRdZBeUeT6LH8MoUZZCO2jSqHgH32lz3yfeeH3AWKLpzj5etvICRMt737LxqVN
 xv94GmdqB3oeDi5nYf74RayG3vG8YGh848/pNhJ0bnBxvH4iU6fSnbpFox1VzSThIN8f
 qZ9R4X4O+bFRnptsuxw+QvVT/LTufzjPxZ0aUofd+bPI3vAQNFW/7zd6QzaPHWa6bl6h
 mI+ZuQQa1mDm+GSiqax71Iu0SfFrZ2C3zzu+E64rasTBKufjjexcJHj6zOM0620RbK8N
 Ah8g==
X-Gm-Message-State: AAQBX9dA0T7TDBwNXligFLwfMXBrB+woThXbe7zLToaRXbo5VwxFHbck
 cXN5tWjXtCnxk3WQ3ipv6ARket4+wA20aoB60Uw=
X-Google-Smtp-Source: AKy350ZpbCeXu1Bm664BV6kMsdxmFsRbj4dXcVTWB2mu70x3HcCIveJA3BAfEMV75LnaKYfLdX6VxA==
X-Received: by 2002:a05:6870:3909:b0:177:a97c:ecde with SMTP id
 b9-20020a056870390900b00177a97cecdemr137065oap.22.1680804285816; 
 Thu, 06 Apr 2023 11:04:45 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 15/20] target/riscv: remove cpu->cfg.ext_j
Date: Thu,  6 Apr 2023 15:03:46 -0300
Message-Id: <20230406180351.570807-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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

Create a new "j" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVJ. Instances of cpu->cfg.ext_j and similar are
replaced with riscv_has_ext(env, RVJ).

Remove the old "j" property and 'ext_j' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 +++---
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6291224905..3bdd6875a8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1178,7 +1178,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_v) {
         ext |= RVV;
     }
-    if (riscv_cpu_cfg(env)->ext_j) {
+    if (riscv_has_ext(env, RVJ)) {
         ext |= RVJ;
     }
 
@@ -1511,6 +1511,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVU, .enabled = true},
     {.name = "h", .description = "Hypervisor",
      .misa_bit = RVH, .enabled = true},
+    {.name = "x-j", .description = "Dynamic translated languages",
+     .misa_bit = RVJ, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1607,7 +1609,6 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
 
     DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
     DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
@@ -1648,7 +1649,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
          * We don't want to set the default riscv_cpu_extensions
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 823be82239..1aff93ba91 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_j;
     bool ext_v;
     bool ext_zba;
     bool ext_zbb;
-- 
2.39.2


