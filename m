Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D311E6D9F6D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTyF-00010z-KN; Thu, 06 Apr 2023 14:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyA-00010T-Et
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:22 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTy8-0000dG-GY
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:21 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17aa62d0a4aso43230634fac.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1J6FTvFFpDwL9i7EaiFwf0EbrXineCdby9XYALskoQ=;
 b=pGog8+EF/hKw/3gtveZzd8DvP6fr30K6C65ANRZBvHWj1R18KrRIWGveuDvtguhCoE
 3E/nHmf2B+8PX/K0quIN0/ADDtghR8yOXepzSHR+gnDpwCO95Eo61nhrn7uFKwnSfYwr
 03OLxB1PyUjGEO6zjaDmu+phvH+KV3Ml+Ra+PZlXFayZtt6GlD9mHosWNx4efzozNawC
 DKjZSqL0TG4whkjwn+9Tnydhv0pxAhBwrW7NQ9YcTmrpN/kTdvYmgOszJZoaDgPlp7ez
 qjDHRkbbDtJff97Buap0zJoQBbawlrkVIoJ6SSPhAEE7CJQQJrHAM2lv9tqVEmTVlW32
 PHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1J6FTvFFpDwL9i7EaiFwf0EbrXineCdby9XYALskoQ=;
 b=iSUUyGc8kpmi6TJHoMrxtS0GgkcqF20O/qmHbDom+iE3Mf7lCtHThgD8vsYG9hdP+g
 ICoeCyAjZ+oFob9XzR0WRAycQ7o+kocvRWztcapsvKOs0y2Z3tyGiYzQbHh/GLhyeBAv
 QNzOWpebg9rQysRjCvTWDkfdlh9N7ZhdZNpk0q+nBmoAT93OJSMq96BzBTvlWusAId7j
 6y0HZFT/B9Bz+hmxkV8h4THO0KRpmcXfmazhI89jMFu8aJV/t/kArb4Ns6AwbCz/y8hM
 1bAThEAoY96742fk6mzy6rOUls9v+R+zOI8FjhB9EK4by6eHegouH0T9nVU/yNFB4DJA
 pLlQ==
X-Gm-Message-State: AAQBX9fT9vMe2pkM9Cwg2K2jT5dR0YFSryvtkOr6DAw5aqAid0tzj+nu
 h3OoOqtr2vRQwLM9FM/G6nwAAsNmdGt1SuRAQUY=
X-Google-Smtp-Source: AKy350ae4SLV4apv+M+OB7lO2pGIajUQA7udOmjAhAl84M+Mp/6srLgqXT00J1ELFDY40CFdbCfJoA==
X-Received: by 2002:a05:6870:a11a:b0:177:b64e:517f with SMTP id
 m26-20020a056870a11a00b00177b64e517fmr148632oae.20.1680804258356; 
 Thu, 06 Apr 2023 11:04:18 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 06/20] target/riscv: remove cpu->cfg.ext_c
Date: Thu,  6 Apr 2023 15:03:37 -0300
Message-Id: <20230406180351.570807-7-dbarboza@ventanamicro.com>
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

Create a new "c" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVC. Instances of cpu->cfg.ext_c and similar are
replaced with riscv_has_ext(env, RVC).

Remove the old "c" property and 'ext_c' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 9 ++++-----
 target/riscv/cpu.h | 1 -
 2 files changed, 4 insertions(+), 6 deletions(-)

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
-- 
2.39.2


