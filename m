Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3506CA467
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:46:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmCI-0008KW-1e; Mon, 27 Mar 2023 08:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCF-0008I7-Bi
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:35 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCD-0001wg-O6
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:35 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r84so4930046oih.11
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYHD/dU5AEUk8d0p56l7hhWifzBU2kcS2dCrz8eKOb8=;
 b=L8fCM2LpIplfj5ar3fE7Z0XRcsxveE2M08XZxSFhNzfB7BZLI1q4UOm9u6ydgv3F48
 SDZLsHpXpFI4ECtZNPAsoWCbZf+/cLl3cQATFj8xaXiZvEyr2jVlFdDpg9e5PtMDt0yu
 +9xTs9d7DqZ3ej6dVviyQBEsEa+B78N9a5H9SnbOc+MK6OwyEaPZOPk/AMUphoTI9FXb
 ggOj7P8CyrB6sWmvbfPqbE8Q1IcoicHKNEFZIoatvioHcfEUAUS/7KpvGyTbNXpB4Jp7
 qIf51P/xpaIHUP5gu7rn/j6Fec7aUiplcUl6l5KxAqyhrsjZVPUDJWNTy57YnjfAvHuj
 B3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYHD/dU5AEUk8d0p56l7hhWifzBU2kcS2dCrz8eKOb8=;
 b=yt9HZJKZm0Nfu5Xv1QvcvfAV599VD2XppqKW+RlilUEqjQIIiqbIto4vL+d9m0Ifuy
 tz6GHbmIOj0ynd/p+RyZphMnyn949Mw5IiyYZFVGJiOmb8cVId8Bw+Pe2hHhL5pwbrHr
 na0X0tMTajZYixi72nn+lugQuS0IiAGf0XIidk6o15d4EoCwQAhfJgOzwLvqts4Y4wlk
 qCbmEYwln5c/V0Y16dXuFIjZLHBONDkCPnXPl1Feze1TE8rayP4RpmU/m8DuHHZT+rkm
 xnQhC2TWVkf3AKqWBwYWUZw6l0jQ7L+tcHi/JV5SyIdWnK1Z2vfFFMaW4o8An0UEzyhN
 kMTg==
X-Gm-Message-State: AO0yUKVxA2sysK6ERK56Q7XkvWAAyQvfAieKioM8s64w3sQsW4+IEZYF
 0zPuqUdIlZRYURgZ8PlbzHDoLKu+vM/DCIrP7wM=
X-Google-Smtp-Source: AK7set9oLtHrFh4hgkLAawIG82p2aPG6gd0fQqGvne90tVb1hADDUNmN5qW7+AXC81U3M4TxbKoskA==
X-Received: by 2002:a05:6808:394a:b0:383:d1e3:38f9 with SMTP id
 en10-20020a056808394a00b00383d1e338f9mr5362562oib.16.1679921012788; 
 Mon, 27 Mar 2023 05:43:32 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 13/19] target/riscv: remove cpu->cfg.ext_h
Date: Mon, 27 Mar 2023 09:42:41 -0300
Message-Id: <20230327124247.106595-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

Create a new "h" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVH. Instances of cpu->cfg.ext_h and similar are
replaced with riscv_has_ext(env, RVH).

Remove the old "h" property and 'ext_h' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 12bc307992..90c8fc0f30 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -841,13 +841,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
     }
 
-    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1113,7 +1113,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
-    if (riscv_cpu_cfg(env)->ext_h) {
+    if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
     if (riscv_cpu_cfg(env)->ext_v) {
@@ -1450,6 +1450,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVS, .enabled = true},
     {.name = "u", .description = "User-level instructions",
      .misa_bit = RVU, .enabled = true},
+    {.name = "h", .description = "Hypervisor",
+     .misa_bit = RVH, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1474,7 +1476,6 @@ static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1579,7 +1580,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7b98cf4dd7..f3cb28443c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_h;
     bool ext_j;
     bool ext_v;
     bool ext_zba;
-- 
2.39.2


