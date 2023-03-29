Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512516CF128
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:32:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZcM-0004hg-Ne; Wed, 29 Mar 2023 13:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcA-0004Qh-TF
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:39 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc9-00019a-A6
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:38 -0400
Received: by mail-oi1-x22b.google.com with SMTP id bm2so12179331oib.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9dn+LO8MBL0SLZEXR7dd+iMRDkWtUdhFi5dGvwyQR4=;
 b=UkGDE9uBzQT+hMK5iJbTMnlC8e4C0JGMclUEYvwFVveBWFlw9kp4YaNxfJcKS7BSBr
 RGjjqHvEQEOdfEhwEhUdQE+7hL0VwraaNrxIqGENBkGcoZSrhd/N9rXfXgIacsF5hszr
 taYjLAD3T34Oltg0tWKrcfXTHEdbQ2601L9qKLruKxDT4CyJMda3WG5eSKMCVlq2ENfQ
 MgDhtqOWokIEQU1itCXzA7fjdbTp7YdH4LOrf+FiHTcLlWAVOq5TGG375Z8GPy3ixGtS
 VW9rPDd28jML3zyF9ByJVVb8w2beQGTlvF6Om95BjrPUQ8SSIWWf05imtbrW3co3CLUQ
 x9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9dn+LO8MBL0SLZEXR7dd+iMRDkWtUdhFi5dGvwyQR4=;
 b=V6atbTbTCsKBl7thI481rt14I7/kVud92Frp92dq/hj3dbUc3TYu+/EA6UBVVYJbBv
 RbfNM+pAsimigWVJadDPBZBtxEA4MFE12txXDaO9kiqk+WaukBdonQ894/X7uv/o3AF0
 VFGz6mRNeq0Py96gjdpOF2d0zT7iiwRao/n5Xj84ldBz4h423aMs7k4t1UzrtirgeYVj
 X9cM9piPgZTGn6E63Q/v5xvG3n0gNiy8Wkzt8KkRrqv8ybOFiPnnyBgtYIm4+5IBgWF9
 eMeY1FVFxpI8iv0siDT+t8N8zSKJUP/LICPvgzg+seoZJGIF7uwCEwRXWWnVpr/KHlCC
 +h4Q==
X-Gm-Message-State: AO0yUKWviwzyLdorxQqa8hncBDqwdylAzeT1BWuuFkw/OWEW150HtizB
 MAU/CfuD/K2x+uLEQmntqlxShM5AzV2Pz9LXeUo=
X-Google-Smtp-Source: AK7set9004OqOmAI/fP7lUdB3LsOoXW6k0SXX44hwpBA9eeKQa7UrKC629shb9aHOIszTyWGplQr2A==
X-Received: by 2002:a05:6808:10d1:b0:387:1b0f:c03d with SMTP id
 s17-20020a05680810d100b003871b0fc03dmr9501573ois.28.1680110975871; 
 Wed, 29 Mar 2023 10:29:35 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 09/20] target/riscv: remove cpu->cfg.ext_i
Date: Wed, 29 Mar 2023 14:28:52 -0300
Message-Id: <20230329172903.636383-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
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

Create a new "i" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVI. Instances of cpu->cfg.ext_i and similar are
replaced with riscv_has_ext(env, RVI).

Remove the old "i" property and 'ext_i' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 15 +++++++--------
 target/riscv/cpu.h |  1 -
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f53400d40f..2156cb380e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -810,13 +810,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
                             riscv_has_ext(env, RVF) &&
                             riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -825,13 +824,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -843,7 +842,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
@@ -1088,7 +1087,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
 {
     uint32_t ext = 0;
 
-    if (riscv_cpu_cfg(env)->ext_i) {
+    if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
     if (riscv_cpu_cfg(env)->ext_e) {
@@ -1442,6 +1441,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVD, .enabled = true},
     {.name = "f", .description = "Single-precision float point",
      .misa_bit = RVF, .enabled = true},
+    {.name = "i", .description = "Base integer instruction set",
+     .misa_bit = RVI, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1464,7 +1465,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
@@ -1575,7 +1575,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ce23b1c431..573bf85ff1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -418,7 +418,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_i;
     bool ext_e;
     bool ext_g;
     bool ext_m;
-- 
2.39.2


