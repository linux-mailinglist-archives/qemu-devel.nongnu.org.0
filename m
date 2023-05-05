Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1476F7A9A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtj-0003Gc-D2; Thu, 04 May 2023 21:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtQ-00023C-6D
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:53 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtO-0007ab-Cn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:51 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-51f1b6e8179so748435a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248748; x=1685840748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0HMGYLkLLW+NmuP1q5Nflfs6qIETz2UQ27v4mEd4VY=;
 b=pGYiOViH7Im0RBDJUEYEUG/LpwEfs3RFYt9UIzSP6zzURczE6m5PL6zHAIQbsFAdSa
 L/G2FRu/cl/y6PokaddDKhvK2NkVnQhdXXXqYOxqIYzl0FdLQd2WtJglhhk/j9c9UaeX
 nRogcxIvdwnXQ6GrhD6UKFw0Ho3sonRcG4OFM5k30tHd1pmpSF4WiX/jBNkorGEVkgQf
 eMhiZ2irJyWJvaaE8OJU8s8kC0/KMTia5fYqnd5MGcAO+eaVKCuhKNQQ5OMhEZACDy3G
 mc9SlVEZwV7sduRU/987lwW5Bb/qx0Sh1KoFxHFKqu2O/LdVqy6W65T2jxCq6FyKUBrq
 LMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248748; x=1685840748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0HMGYLkLLW+NmuP1q5Nflfs6qIETz2UQ27v4mEd4VY=;
 b=E2mYegBSMWAZVNzNHapksSmXrUacKOShYFhuDt6k5UyNidC8RDCrZyaV4h6xme6RBq
 EjdB+2HcUlw35TPWnBW+8wai7dBH9LAwp0NN8QbHVRQV4yinoiMjHpMJCK8cqAFklQ+I
 JISXHU/WtlaDcfytWrD4VTF5Xg3Ol+OxfFVcqilZJ93m1SYEnTskXvCFKcvHV4ufXSU9
 LohX7ESeJ7vRH0CWkE7dL7Qh++oo381UHRZpJosMbxP2NjZhKAjPpWiyinAkGfkjjk+5
 FaltWmHnKCuxUL5BcspVX4u/8idKclLrde51137jrRRo37aHg2yLBFF6h1R+XReh783b
 BmiQ==
X-Gm-Message-State: AC+VfDzmZynDOQw5b4hRgaq7rCtxO9g3KqffeSD3hhC4ek57ZszKdesy
 oZHYZkRc85yZQT+YT46NULys85QgEmtAWw==
X-Google-Smtp-Source: ACHHUZ7+Hhyk3tbcZEI9rmd8jezX7yjiN43ZeP4HPE1QDatAY+Inp43//sEoi4vnK+0xZhMt3gCgFw==
X-Received: by 2002:a17:902:7c17:b0:1a6:5487:3f97 with SMTP id
 x23-20020a1709027c1700b001a654873f97mr5057482pll.64.1683248748703; 
 Thu, 04 May 2023 18:05:48 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:48 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 44/89] target/riscv: remove cpu->cfg.ext_s
Date: Fri,  5 May 2023 11:01:56 +1000
Message-Id: <20230505010241.21812-45-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
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

Create a new "s" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVS. Instances of cpu->cfg.ext_s and similar are
replaced with riscv_has_ext(env, RVS).

Remove the old "s" property and 'ext_s' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-13-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/cpu.c | 11 +++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 71540a33ec..8b8e541e5f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_s;
     bool ext_u;
     bool ext_h;
     bool ext_j;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 24640450c7..cded82ac7a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -408,7 +408,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_u = true;
-    cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -843,7 +842,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -855,7 +854,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1168,7 +1167,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
-    if (riscv_cpu_cfg(env)->ext_s) {
+    if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
     if (riscv_cpu_cfg(env)->ext_u) {
@@ -1507,6 +1506,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVE, .enabled = false},
     {.name = "m", .description = "Integer multiplication and division",
      .misa_bit = RVM, .enabled = true},
+    {.name = "s", .description = "Supervisor-level instructions",
+     .misa_bit = RVS, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1530,7 +1531,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
@@ -1647,7 +1647,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
-- 
2.40.0


