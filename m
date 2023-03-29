Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14B6CF131
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:33:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZcL-0004eR-IR; Wed, 29 Mar 2023 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcI-0004WP-Mz
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:47 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcC-0001AE-FE
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:42 -0400
Received: by mail-oi1-x22d.google.com with SMTP id b19so12158410oib.7
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVOC77WZVxf1F+En8iGP01plXj4Py3IcH27UTJzrBDo=;
 b=hMybwtjlKAXA2PMr1ys2PE5G563g/MgI5agSoDhGwKyWyY3sl4cgMX5tbiWc70K5TL
 2zgb3Jqi1UhENsUtqB2NmBDXMqBV6R4vWt02WVaSTFBnFq3BDaf541PY7JWdfK1fapAA
 E0TQQe/Fvyd4vwd6zz1r9gwJrY6Dd4J+3tn1rsTQG42kPiq5xXmi3++zLW3KsaecvMKd
 Fl4RhzNXREJryTET5RmUSL8OwE6cpGNTDhqGmaS8OZiC4HMVz2WED8z/fRLYsCfQ6yD6
 9QMAgk6T+h7zGvucW71AznyFxYwaL0sjfP9fyuTge1kvOjZ0VcXHweoqoaalsFtwUf8O
 wP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVOC77WZVxf1F+En8iGP01plXj4Py3IcH27UTJzrBDo=;
 b=M5XWR9D+Kx+WtfIqJfLCQwbMgGcQWCuX0gMuSls8bj2ozneEyF8Wy2zaPGCyGAoQy2
 6dtD3BrJMp29hI1kevrLcCB7Pq6o87xJ6SPEUDT/DiXqWFnmVNSN4QD0e6Rwvtu4pPs/
 5a7NMUU8BpYR27OE3pt5cFfIpW6WijCbVZCdABcO0UYLOWl/CU5BhYkmRNVY6ozbR6nG
 eOUedkSw7nR02PQ/5HWY920nEf1ttv4NHoXsxt7rMhM1QEuq+9HYMig+9YRlK+I/IZGO
 kVbbCQfrmrPQp4oum7BxqHWB/9OJW4MU/ZsEVyqJydZrv9n5JhHUibAQlgG2q0CSgS35
 z8Ig==
X-Gm-Message-State: AAQBX9e8unQ3Q3FVnPWgUy9sAe5hyXKxyTv2oXGsaVyoXJQhwS6lkLFd
 fvJt+gf69v1wPjvVz4U5oKV8r50MRUHv9Y6vsjk=
X-Google-Smtp-Source: AKy350aMdI6rFU2U+xwOGJDalbIlKO9ZaLc5JFnSzAjzt3/UjcWuvcWV2OscYfYkg8VdNd8dFt+VDg==
X-Received: by 2002:a05:6808:1894:b0:389:4cc1:b1a8 with SMTP id
 bi20-20020a056808189400b003894cc1b1a8mr1669210oib.16.1680110978794; 
 Wed, 29 Mar 2023 10:29:38 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 10/20] target/riscv: remove cpu->cfg.ext_e
Date: Wed, 29 Mar 2023 14:28:53 -0300
Message-Id: <20230329172903.636383-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2156cb380e..9cf3ab3988 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -824,13 +824,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1090,7 +1090,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
-    if (riscv_cpu_cfg(env)->ext_e) {
+    if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
     if (riscv_cpu_cfg(env)->ext_m) {
@@ -1443,6 +1443,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVF, .enabled = true},
     {.name = "i", .description = "Base integer instruction set",
      .misa_bit = RVI, .enabled = true},
+    {.name = "e", .description = "Base integer instruction set (embedded)",
+     .misa_bit = RVE, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1465,7 +1467,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
@@ -1575,7 +1576,6 @@ static void register_cpu_props(Object *obj)
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


