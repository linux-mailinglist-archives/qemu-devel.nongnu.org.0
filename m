Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E96CA456
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:44:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmBt-00087a-3m; Mon, 27 Mar 2023 08:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBr-000875-I1
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:11 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBp-0002NI-VF
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:11 -0400
Received: by mail-oi1-x22b.google.com with SMTP id r16so6126570oij.5
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lphPf4lH+JzyZgr/nUY1W1Qn9cEYCwvMtSDywTf53DU=;
 b=NznUf9NGPijtOxGOfDNVqXmjhtCvD06w0cXdzFjN6VQze50z2wGJX5m0KLeQAZSsGm
 ETJQ3YJajecS6Uurm6AIjq7zibJ+odGJDlYtwc+IyLSJGLSKG1de5k8IrGtnlwF9RYFJ
 JhT2nISCaORTDogNDJvsziW/vtIZgkh67SNmokzdM5CEBZb0QPNkiNjtR/gYhidu952x
 UjT7rOjTfcBanlVyze7s0XwsxFIEcpztyHDFk3C7XmoH0+O5eMzRK9td3Mky1W0e6B1g
 ph1eKejVNlacDuHmd1tl7C4UPY2yzC3o880qxjuXMjmYoiEavJgZvXMCExRSodNcksUn
 a9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lphPf4lH+JzyZgr/nUY1W1Qn9cEYCwvMtSDywTf53DU=;
 b=bgrzTMoAaH50jxYvm/2xbZfawitcNdz5CwZjB7ykpmQW/a0hlK65PXjDQIzo+L90Ed
 26nfvPR+xQbfv/7aPVkIMZtbEHh/2KEr4QsbHQF/ZAurWCKQIFxSNB8VL91OnNctyw3M
 Lfq+ZZt8CADYCFWURzlE1oRy312TpeGgEGEK0izAX2K4xqknIVt88CN9rFoteR9TwKaa
 Bz3PhZf3vhIaIIqOmJcchMO6VftukHUIa+T5A1QXaT7+rqamfk/aJbtsDLafZFLFDfwM
 XK6e2UrAlRShWI46/QEV+0z0yZodgkpwdShL7194iv897E/aKVrsD8uYbBNbvzWpjqj9
 1nDw==
X-Gm-Message-State: AO0yUKUtGDtUiigT51bo4sbFKmWkitpzJR+zqBOO8q1RtIiiQV8tKvsh
 W3zChJ9Kxi4Gt0ouPpvsDsVArYS14lOBNVVL8Yc=
X-Google-Smtp-Source: AK7set98jmyY0Nj4OFg6FLiyUWXuzBpGupPqQx0N4WY9uSLCihpf6Xy4pPr8DD8/GIYotwbGdZzLfg==
X-Received: by 2002:a54:4418:0:b0:378:6ca0:11e9 with SMTP id
 k24-20020a544418000000b003786ca011e9mr4861392oiw.28.1679920988664; 
 Mon, 27 Mar 2023 05:43:08 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 05/19] target/riscv: remove cpu->cfg.ext_c
Date: Mon, 27 Mar 2023 09:42:33 -0300
Message-Id: <20230327124247.106595-6-dbarboza@ventanamicro.com>
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
---
 target/riscv/cpu.c | 7 +++----
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d2484396c4..694b1fc421 100644
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
 static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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


