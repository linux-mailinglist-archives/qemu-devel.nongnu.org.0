Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5836CB1F7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:51:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvfe-0005Zj-CB; Mon, 27 Mar 2023 18:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfK-0005Ui-OO
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:17 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfH-0007fc-H0
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:14 -0400
Received: by mail-oi1-x234.google.com with SMTP id r14so1949341oiw.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fm8T2VInwKSS8NXjERlXNAM8mT5089tADD0iPhzOnZ4=;
 b=UR8U8lwFsHTIECPRdCIUJuZ68/IF7qNF6Eslg8u2MvBWu6uG87InURMbQDbBU2SLzZ
 XcNyFOHTItJthuye7G2K/kZ05CKcoHTQgF00GFiR+8BeV5GVJ2emFQ4xm/xZZEJuLNAC
 4CliYgHcBTdUvxN3Q4kpKgxmcNpdMY8J/94Z65EIg6pX3GTwZISuwu++XnElFGBdibcB
 FV7TK+zZNyYG4x61XW8AvYsBDGJ41Jo4effmWQPPVrT+2cGoRb4zfOaOQ5SahVWS1FKZ
 9GnlvzpU/Nq05VorAO+PdKarl9SVKx8AXLe+zF2d29lPDPEFyiJrZyp75vh4d7mqfiHJ
 k4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fm8T2VInwKSS8NXjERlXNAM8mT5089tADD0iPhzOnZ4=;
 b=6NtfZSwkRuqFwRNklLCuPXieyviyraqZvMVLBjdrnzCL0MHdfYRYz4sg3sVTfGNEDP
 7UNFx7UhOofpDjUScMtHxiEmxbBamdjpPp4KNlzu5JBrkWP5Zez4OBJ1xkrLgffCMWbT
 IcXRS+17OafUBEK5HNv5p5VRfiX4je/ttWpkqKt6JFjWCeoRV3yPhm3/a/aKBqO/zOao
 tQ5CRWpyNasyIT+ISC9H7a95MfB/NfxIo5QW+KiqHk9Ctm4MMwATadVgiQ+PYWj5BlZ+
 SH0Te/HKqlB54V53fr5zFV+dSVV8vz2q7j8W2IO57FSYxY5mqw5/nMOe49G9vgRsu/GH
 MTow==
X-Gm-Message-State: AO0yUKWxtKvzgeyS6WK04bsvEfbpp79rhcah7QcVO+YxtkQ1PwdKUz7H
 V/QInAIX/4fPsP/UJFO+yE3pTi/YZglSxKS3Pzc=
X-Google-Smtp-Source: AK7set/HCZf6zAsau4aR59Dg7QYVfAYZ2DEjZv8w7g7gkYt0ohbwNy0YeQf1DdTj1Z9wz14zopsRnw==
X-Received: by 2002:aca:1915:0:b0:378:2e00:6059 with SMTP id
 l21-20020aca1915000000b003782e006059mr4844534oii.1.1679957405149; 
 Mon, 27 Mar 2023 15:50:05 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 05/19] target/riscv: remove cpu->cfg.ext_c
Date: Mon, 27 Mar 2023 19:49:20 -0300
Message-Id: <20230327224934.363314-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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

Create a new "c" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVC. Instances of cpu->cfg.ext_c and similar are
replaced with riscv_has_ext(env, RVC).

Remove the old "c" property and 'ext_c' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 7 +++----
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd2470bc0b..ae60ff3e5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -401,7 +401,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_c = true;
     cpu->cfg.ext_u = true;
     cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
@@ -1109,7 +1108,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_d) {
         ext |= RVD;
     }
-    if (riscv_cpu_cfg(env)->ext_c) {
+    if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
     if (riscv_cpu_cfg(env)->ext_s) {
@@ -1439,6 +1438,8 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
 static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
     {.name = "a", .description = "Atomic instructions",
      .misa_bit = RVA, .enabled = true},
+    {.name = "c", .description = "Compressed instructions",
+     .misa_bit = RVC, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1467,7 +1468,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
-    DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1581,7 +1581,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_c = misa_ext & RVC;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f703888310..c6dc24d236 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -424,7 +424,6 @@ struct RISCVCPUConfig {
     bool ext_m;
     bool ext_f;
     bool ext_d;
-    bool ext_c;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


