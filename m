Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B682C6CB1F5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:51:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvfk-0005z9-7d; Mon, 27 Mar 2023 18:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfY-0005ZB-IV
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:29 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfV-0007xw-Hf
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:28 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 o15-20020a4ae58f000000b00538c0ec9567so1607251oov.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vmxXX4B9ojTU7YEoSUoEnqboy+QNt7bZ8H9fwQEr2yQ=;
 b=PL3PLdKx25UF3kz8e/AXL5XHMuBU93DMJpZ5ZS5AXnJfATwT66w1Hp3LU9NIzK0Mly
 Ikq22jhm1pskgj8h/ZqseR9cBgpqI314dw82BktA7JVWkmBKgAO7uVsrPtwwoXeyW/+x
 /viIE/iPmJB3829HfWSy/wkHf/6eXdCsf6on8lhBgTalKpJYIXeuj39tY3t2lhif72oB
 DVnrsVg9OJ4/39/bFsojY3qCqJuKqXKBS/JDngURn1SmfwWQr50Likkf9HOLRiIKiQfN
 TK4eTJoOB84QzlFzvE9I3hXn8c9MrOI16Oz8Re9/De0Z/AnU4cEAMVsDIIvVJ9PVXDdX
 Encw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vmxXX4B9ojTU7YEoSUoEnqboy+QNt7bZ8H9fwQEr2yQ=;
 b=BIsn10H1BxasZMxs5LslFx1CPKUTkK9pQfV0KHN90ckWMLStDGvwzG5KIcKkvqvIOM
 Q5rn6vA3E5azKMqIGptpbE3w1uttgyExqtiDFWsb9oR/LkxwdjCbJjtpZQMnwrVgK5u4
 2ObmmWRd1h3heQ8aOCzC9sXyJ0E6Cn2Jnfdi3iPXw0QnO6Mi0wZf+Jq/SCZMElXoykdy
 ByC4NRSUw0YxCwst/F6mOUozpVGaUhaT510yRuAh0paRIHjj62tWh5JNRDOBUVRY58FR
 oY0K4VMukPZum/K6bS5fQNrlqQxbU0A8eccf0g5k/dExJ8pcPp1V93muFHQsVAMLuxNi
 qLYg==
X-Gm-Message-State: AO0yUKX65kfQXTP4OH4ibOVp0xDGwV6wN/Fi9+3QBF+ipHTnPVv8+ybC
 BBgdxlp6Pwftac6ORX6Mrn6ManTYEXODsC/ZiHQ=
X-Google-Smtp-Source: AK7set8VwAOXGo/w5XMWOLT6o4hZomEwFintcR/uYNMPN8+R/neIeQlt0XezLCjGPDisnLuHS3h8Ag==
X-Received: by 2002:a4a:52d4:0:b0:53b:8b5:48d0 with SMTP id
 d203-20020a4a52d4000000b0053b08b548d0mr6902135oob.1.1679957419990; 
 Mon, 27 Mar 2023 15:50:19 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:19 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 09/19] target/riscv: remove cpu->cfg.ext_e
Date: Mon, 27 Mar 2023 19:49:24 -0300
Message-Id: <20230327224934.363314-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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
index 61ee3c72eb..3b580eee9a 100644
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
@@ -1444,6 +1444,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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


