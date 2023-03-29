Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF426CF121
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZdO-00061c-RW; Wed, 29 Mar 2023 13:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZch-0005Gp-F2
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:13 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcd-0001Cc-Fh
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:10 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r16so12088440oij.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680111004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBApIyy80Zd80U1hBLA/gAj9fr5c28U2VE5AXyFgRA4=;
 b=Z6GoTZl5yC+MAe9TPjb7E8SZYc7ybB/aVDj42CUmv5V7Md0pC8LiUKKnW7/dKU8dZn
 zaT9d1CQ8jYA0duJaSJItjSNspW1yCYaavnqEo85GsZomnaltYMV3BUBGHOaNhacLc3B
 XYBoKBiEcqofEDYGSBXwTb+Ab0/tY42FSXWl8O55hK+CeDteDPHhwvLvY3N0pL1I5YGY
 +9cZdCo9rmbmzzsVstXh8WJeNXB0bYey0+Mvv7/McAACJG5JIXEd6dAe7fyXAL/QbRDF
 h4EKYr4glnJ6oAInY6gBq3F2wMUbM/d1JgasfvsMTHhGzNNgJrFjyLxUwz+sEIwXcgSL
 d6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBApIyy80Zd80U1hBLA/gAj9fr5c28U2VE5AXyFgRA4=;
 b=sJ16uOIktbdAc9yvjNug9YwS0kQ2hWvA90MvNM3FiFbvpKi3oQ/dmz+AjhgL8u0iDh
 Taejn/viAaSA01b1a4oVElZXyVUKX/x8gfnMQMkWwUj396IYGDbspsJjAwHnr/Km7lGs
 0dEI4xwES+Q/+pwz7jPVnGXgVsM7Btht+7Fh3pg1uwtWHXmTAhRXFXwz80cSVd9ZDHwL
 ODX4NLJcXbTZD4G3NWDcfTpwjcIVbicy8WXwdcP70kIli0W0DSxNFXt0ALpnFuqnQZAU
 WB4AwVwUYkT5zWSbCtLoH0L1nEpN+yhObTSGKrp6hCyrZhOX/rpoEuUfgKgPA8+z3C9o
 hUhg==
X-Gm-Message-State: AAQBX9e8iLEMXAPOflOQSH4KPmBZjZY7+3ixZl7yTKkINhL5oOQjJvBg
 u+ofCBOiB8aGI4Zwfn0YgMVYiqjBF/eMFbGTtMI=
X-Google-Smtp-Source: AKy350ZgeLGS/PAZtWQdcipU7/3sySGkGomcXbklk1j98lUUqkj+E2d4CVAgWd1DnCcBqIo4lgqsDw==
X-Received: by 2002:a05:6808:144d:b0:389:4d48:fa09 with SMTP id
 x13-20020a056808144d00b003894d48fa09mr5049832oiv.56.1680111004526; 
 Wed, 29 Mar 2023 10:30:04 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:30:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 19/20] target/riscv: add RVG and remove cpu->cfg.ext_g
Date: Wed, 29 Mar 2023 14:29:02 -0300
Message-Id: <20230329172903.636383-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
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

We're still have one RISCVCPUConfig MISA flag, 'ext_g'. We'll remove it
the same way we did with the others: create a "g" RISCVCPUMisaExtConfig
property, remove the old "g" property, remove all instances of 'cfg.ext_g'
and use riscv_has_ext(env, RVG).

The caveat is that we don't have RVG, so add it. RVG will be used right
off the bat in set_misa() of rv64_thead_c906_cpu_init() because the CPU is
enabling G via the now removed 'ext_g' flag.

After this patch, there are no more MISA extensions represented by flags
in RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 17 ++++++++---------
 target/riscv/cpu.h |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 036d6191ca..6988ff443a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -396,10 +396,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
-    cpu->cfg.ext_g = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
@@ -807,12 +806,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
-                            riscv_has_ext(env, RVM) &&
-                            riscv_has_ext(env, RVA) &&
-                            riscv_has_ext(env, RVF) &&
-                            riscv_has_ext(env, RVD) &&
-                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
+    if (riscv_has_ext(env, RVG) &&
+        !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
+          riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
+          riscv_has_ext(env, RVD) &&
+          cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -1402,6 +1400,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVJ, .enabled = false},
     {.name = "v", .description = "Vector operations",
      .misa_bit = RVV, .enabled = false},
+    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
+     .misa_bit = RVG, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1424,7 +1424,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0280ace2a..ce92e8393d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
@@ -418,7 +419,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_g;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
-- 
2.39.2


