Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF96BFC91
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcnp-00059x-L0; Sat, 18 Mar 2023 16:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnn-00059E-Kp
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:19 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnl-00079A-UQ
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:19 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 x24-20020a4aca98000000b0053a9bbbe449so244491ooq.9
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CguAyFnXN900gJ747DQtBtymkQ6WmWSHf4CsQ4yPU5I=;
 b=AenRMaXUro/8lGtPotP5lLo2RcOkFfs/g/lkEMJwCZ64gZMcARLsYSvSErIpGcIK0Q
 E6kKQRwrcpzi1bbwv819jFvRAuZRf3QLVDrp5ImVrvUPttHQdECIMVlAeXnAaqDQ3H1g
 xwmL/nAgPsFkfUP1WuqhPhgfM2xv7nI9lo04MD2iWN9/qq/PoMG6wJj1KtqsxzwxbBHf
 YpUSjAC4+bAzIYMmnPX4EyND8ANDQgRA4X3nzkuJlUcVTaGq5QHG1j0ZS4UQWeUTgiGn
 K4+sfX1yx6LAsExPSra5pcA0X8CETNDkCy8hXKTluSXh1OqMZrd2hckbuu95ox4qKpWz
 +Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CguAyFnXN900gJ747DQtBtymkQ6WmWSHf4CsQ4yPU5I=;
 b=1Ajqz6+w1DauRet5QrMePKiYnuoEUB+Fl2RFY+/aeoQ413bMJx5nVws6knUMexuJNJ
 Uwl7Njuc/ObxjzMB2hRhYUOqhZWgFNLQJb88gbn0QII3p2YQBBzQ6dK+TpM7uQCVF36w
 wf3Ja81awK1E+wdIjqnZkH9mSozRX5r3mEoQc/xKLnT7ghwURoqxVhyaLZJMMzt1iDK1
 AvEFJoDy/i3RDwWFmGk4EVhqWt22r6tlz+TXV6vl3t3z67aIp3sRzuh2xKK7Rj6T5Y2Z
 Xcub/kPeyCiOBErFznfFHyP0vGpKB+bdMcmNGOwvZ/0IAJZ2KOsqY55EddHvajH4Djse
 r1DQ==
X-Gm-Message-State: AO0yUKU2Mv+2qWio9b9w3eOjv9QPTvfTW9u9axdbWdvGoORXxT5GBaFU
 6qpg2tMqLMflsh0GAR9LUSCpkR1aTgLX2fbiUWk=
X-Google-Smtp-Source: AK7set9vcFPLCoV5PFzkepxNhgUX9ztNitfHSHf7VJcyUdYI2HPehEfNwkLB+wb8JDK1c/Ggy9lTew==
X-Received: by 2002:a4a:49d7:0:b0:538:57d4:2d62 with SMTP id
 z206-20020a4a49d7000000b0053857d42d62mr1366726ooa.2.1679169916561; 
 Sat, 18 Mar 2023 13:05:16 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:16 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 12/26] target/riscv/cpu.c: redesign
 register_cpu_props()
Date: Sat, 18 Mar 2023 17:04:22 -0300
Message-Id: <20230318200436.299464-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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

Now that the function is a no-op if 'env.misa_ext != 0', and no one that
are setting misa_ext != 0 is calling it because set_misa() is setting
the cpu cfg accordingly, remove the now deprecated code and rename the
function to register_generic_cpu_props().

This function is now doing exactly what the name says: it is creating
user-facing properties to allow changes in the CPU cfg via the QEMU
command line, setting default values if no user input is provided.

Note that there's the possibility of a CPU to set a certain misa value
and, at the same, also want user-facing flags and defaults from this
function. This is not the case since commit 26b2bc58599c ("target/riscv:
Don't expose the CPU properties on names CPUs"), but given that this is
also a possibility, clarify in the function that using this function
will overwrite existing values in cpu->cfg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 48 ++++++++++------------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7841676473..6b5096d25e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -221,7 +221,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(Object *obj);
+static void register_generic_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -386,7 +386,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -475,7 +475,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -488,7 +488,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -575,7 +575,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
 }
 #endif
 
@@ -1557,44 +1557,16 @@ static Property riscv_cpu_extensions[] = {
 };
 
 /*
- * Register CPU props based on env.misa_ext. If a non-zero
- * value was set, register only the required cpu->cfg.ext_*
- * properties and leave. env.misa_ext = 0 means that we want
- * all the default properties to be registered.
+ * Register generic CPU props with user-facing flags declared
+ * in riscv_cpu_extensions[].
+ *
+ * Note that this will overwrite existing values in cpu->cfg.
  */
-static void register_cpu_props(Object *obj)
+static void register_generic_cpu_props(Object *obj)
 {
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
-    /*
-     * If misa_ext is not zero, set cfg properties now to
-     * allow them to be read during riscv_cpu_realize()
-     * later on.
-     */
-    if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
-        cpu->cfg.ext_e = misa_ext & RVE;
-        cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_a = misa_ext & RVA;
-        cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
-        cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_c = misa_ext & RVC;
-        cpu->cfg.ext_s = misa_ext & RVS;
-        cpu->cfg.ext_u = misa_ext & RVU;
-        cpu->cfg.ext_h = misa_ext & RVH;
-        cpu->cfg.ext_j = misa_ext & RVJ;
-
-        /*
-         * We don't want to set the default riscv_cpu_extensions
-         * in this case.
-         */
-        return;
-    }
-
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.39.2


