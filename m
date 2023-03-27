Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D236CA44F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:44:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmBw-00088F-2p; Mon, 27 Mar 2023 08:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBu-00087s-CT
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:14 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBs-00027G-OC
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:14 -0400
Received: by mail-oi1-x22b.google.com with SMTP id l18so6187733oic.13
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3PH2TFnkeB901Qn7wyy8VwwnpPrKXV0pkbhUywbe3I=;
 b=eXxlbEtVq/2YjzY4EWcM09EbFSx44UolK3nmqb7O0kLERrclZupJ90+GSmvwyzGxl+
 GMwSXVhbaYzxb+G1NVhkjCeyDfuUyX547etJmOQJ51DxD5/f9/Puz+FtqSUvHzsAogMW
 pr30t+QZ6cHQ0G2zQgvndSdfI7GH/aZWlP2tAyQcoxg2IwKjSxrH2za5s804Y5N4PqtX
 NRRNo6QL7XWFiE+oYOMk+q1hxNKvp+/cFAo0DHz18NXNG7tVq2kXaP7Jz06rRrUZwc7U
 IAeI3w1Ltm58csZU6p2K1RSquhrILhdlPPbH65EtAUeoWBI0OiSpB5ydltwiMWT3bNIC
 FL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3PH2TFnkeB901Qn7wyy8VwwnpPrKXV0pkbhUywbe3I=;
 b=d58l+Te1BUc0Jp/V3dLcYyrIorAo9xUC/C12CgEz3X9HFiT+VzP8PHAAKTJPIYTWpR
 O462hO9HdE0PxZPTwZuGm0AVrnwj6OIaw3O91Cz6K3Puhbi8655bO/M/FwUC+k0RWUcp
 4Tlptn1HKhy1jlOv1lE8JIWphr957SiZJuDnZf0UbzQ80SLFWQ0SfJSdltdSCY1k08uN
 pH6C/4gdHQaaVn4iuHbBuRqims38TpShxnYQ3Q44uQIJggqxzkqrSOwVxVOlHeIftSHR
 csx5H1pcMseOPSRwQ4hyvfYybc/I+8w2UReZNPRInoiIEqRLgCCchfAv7dVTXaYKqFNX
 EzkQ==
X-Gm-Message-State: AO0yUKWIKOkjlUvoJPLkgXnFjyl0obkgwTxyhvgZrb23V8b/KycFMakI
 8YJDtC+OmS/4ZwqolyunPZXlvTlgMKhNut/iEvQ=
X-Google-Smtp-Source: AK7set+mOcYLOAU4qxzHkfZ8YJlzhPm0ulmlp3KviybiNgZFkEz1LXdVbm1Ee0/CDyte8klFYrEfHQ==
X-Received: by 2002:a05:6808:23c7:b0:386:c241:c43b with SMTP id
 bq7-20020a05680823c700b00386c241c43bmr6316680oib.20.1679920991628; 
 Mon, 27 Mar 2023 05:43:11 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 06/19] target/riscv: remove cpu->cfg.ext_d
Date: Mon, 27 Mar 2023 09:42:34 -0300
Message-Id: <20230327124247.106595-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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

Create a new "d" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVD. Instances of cpu->cfg.ext_d and similar are
replaced with riscv_has_ext(env, RVD).

Remove the old "d" property and 'ext_d' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 13 ++++++-------
 target/riscv/cpu.h |  1 -
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 694b1fc421..701441b822 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -813,13 +813,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
+                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -875,7 +874,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -895,7 +894,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
@@ -1105,7 +1104,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_f) {
         ext |= RVF;
     }
-    if (riscv_cpu_cfg(env)->ext_d) {
+    if (riscv_has_ext(env, RVD)) {
         ext |= RVD;
     }
     if (riscv_has_ext(env, RVC)) {
@@ -1440,6 +1439,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVA, .enabled = true},
     {.name = "c", .description = "Compressed instructions",
      .misa_bit = RVC, .enabled = true},
+    {.name = "d", .description = "Double-precision float point",
+     .misa_bit = RVD, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1467,7 +1468,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1579,7 +1579,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c6dc24d236..e4cf79e36f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ struct RISCVCPUConfig {
     bool ext_g;
     bool ext_m;
     bool ext_f;
-    bool ext_d;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


