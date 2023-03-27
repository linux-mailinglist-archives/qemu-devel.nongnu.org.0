Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8796CA450
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:44:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmC7-0008Av-1z; Mon, 27 Mar 2023 08:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmC3-0008Ae-HF
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:23 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmC1-00027s-Vp
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:23 -0400
Received: by mail-oi1-x22c.google.com with SMTP id w133so6223051oib.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcBA7LXJYSzTcI4ioO/yN8kqidR7az1J8tyV5XXcKnQ=;
 b=d+fsnQAhKJSRS78C6w0fdV0mMwXBt32KnP45h4Pj2KgWzU3wumRZmfO8ihRxiPW6p/
 A4LlX14P0II6rYeXe2j+O+cRe2Ife8JofkBTHA/qL4gwOC9CepnxDEfGG7q5YhqzTXK7
 Ru6KNEdK8cIFQfNCDVmGBIFe2IcZPIClDmNR6wNlEen+KzQgKuxKbA2sXbuxtKew66Tk
 BNMKq+jaogw2EiT3wOCrsfmTymmhInNXqJ7d/+BlhLD9jPN2ais/1Cs/f9TBIwtPyWHu
 SlvxYcAauhacCuI5a/pQa30Tox+EsyPmistji+VkUBcP4VD1RcliWDTdTjUv8ZtCt6oM
 8C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CcBA7LXJYSzTcI4ioO/yN8kqidR7az1J8tyV5XXcKnQ=;
 b=dQQAgOsGmTQMx1+f10okXqjJdJvOGqm1h5PbfkoUFpiFTkSSvb6op7VQqwy8pLFiu/
 rIRoyc1DPfTtgQOVu6ZG4nrr0Tfe9JkkcOr8p8IM3EaM+o+FuOKbqad3/NrZK+56Xamt
 JRpAn8smyG224kJaN1Jkw/xJaNK3d+8sikr5Gz2Vzn536Lht434t0dCRoUKwhOKnjm14
 vJg1BfjNoaE2UxuosEXpt/THOTKn6IFr85r601s2pbI9RaHZvIr9UV/p+Z5HrdAwXVsL
 DRXKY+45brHZD/bCXdYyEe4CS51TnKK2KMT1FZ25AfxLZC/7VxkekxMb5SYSLK493Mm3
 xiUg==
X-Gm-Message-State: AO0yUKUnnvQ56i54l06cHR7Pcy7uW5bJLkZlvTz0I8KMIrYPF/yaig6L
 +X+UmI4xiyW24cHYXXVQN44ooKVpe7wU3Lse2S8=
X-Google-Smtp-Source: AK7set8Q02vdnjyv5lEoPkx7/HqUg/u4i3emHTjuF8Yf1b0gGsGsCkKRiUcZnHy3j0IrHMVdvqSCNQ==
X-Received: by 2002:a05:6808:21a0:b0:386:cb87:d205 with SMTP id
 be32-20020a05680821a000b00386cb87d205mr7146786oib.47.1679921000934; 
 Mon, 27 Mar 2023 05:43:20 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 09/19] target/riscv: remove cpu->cfg.ext_e
Date: Mon, 27 Mar 2023 09:42:37 -0300
Message-Id: <20230327124247.106595-10-dbarboza@ventanamicro.com>
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

Create a new "e" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVE. Instances of cpu->cfg.ext_e and similar are
replaced with riscv_has_ext(env, RVE).

Remove the old "e" property and 'ext_e' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e3d9496405..65e4a76bae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -825,13 +825,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -1091,7 +1091,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
-    if (riscv_cpu_cfg(env)->ext_e) {
+    if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
     if (riscv_cpu_cfg(env)->ext_m) {
@@ -1444,6 +1444,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVF, .enabled = true},
     {.name = "i", .description = "Base integer instruction set",
      .misa_bit = RVI, .enabled = true},
+    {.name = "e", .description = "Base integer instruction set (embedded)",
+     .misa_bit = RVE, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1466,7 +1468,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
@@ -1576,7 +1577,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 573bf85ff1..cc0b9e73ac 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -418,7 +418,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_e;
     bool ext_g;
     bool ext_m;
     bool ext_s;
-- 
2.39.2


