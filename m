Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD26C5A95
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7Pn-0000G0-FQ; Wed, 22 Mar 2023 18:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Pl-0000FO-GH
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:58:41 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Pj-0003b6-Ob
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:58:41 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-544b959a971so331000817b3.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6M3MReCgnUZXNMksGOWsfeTro2kCwbSHmO2GLp7GTIU=;
 b=VdUrYhZe3/IEX0qgi2fcTV8QuVazmbNIkxJzatmNV+T/eTgHk4HsXbDPt/fkzGiHk8
 Sus82rYB3Gfry0tL6JRRyBtBeJl7mG88oAVXoEfdHdqJ9p1vOr5+B8EvuYRDrO86XJio
 bssEbhwV0NVtSPwxEq0BA+SR/guJ/fYAG57buypsjcbL9GLf93RoAWybme8/VBbsUFU9
 U04kLALvtgfMxvhKecmZhYHG5p4im5yHTixy+vXM/O3q9oenyXFlAQS4KXMbtqy/2SFM
 Y4dxwTVTzL3I9XmopTBoONsLBwil1Xxc7gsnsVq3fenR3BZfWXMQ1noY5UXYGvFhJAny
 U2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6M3MReCgnUZXNMksGOWsfeTro2kCwbSHmO2GLp7GTIU=;
 b=eLP4q2vdwFchflCQGDzJ8qFWBzUS+F0YMA3yYcUt9lwzmzafYk5IkslATe0xYxAv20
 LHVfoRqLi31DGVBHVtZNkg17sXTOqthoAlV8c6BdyjI6uWyEGbCo7rgwb9KILeT7bIf/
 j+wgg89uZAM/o0h6xPlm+ROJMIsTydxN8Kc//5xQLOmQf+VL57pFOVWUWbs++5zptv/Q
 jisbW6wOwLlY/P32AZvpTQgFqLwDWo9IC5TilnNbVOtNiHO72qNzTfdv7b3kIdgiY8l4
 vKEG17vrqmE9Ml/qDdSUxSg9RVt/DOaQdqWqwjusswTarcle+uMUXIc1BCMA1i4CBFbv
 qpgA==
X-Gm-Message-State: AAQBX9fow++QbekuXxfMwS5Dx/hDMJRqSSaq1XkdhgtBPYOj7IDdjWxR
 0NANGCiVoSu3KyzUdo/xiWFG3hDpgTLjagval8o=
X-Google-Smtp-Source: AKy350Yyvb2E25Vl7brEKHyDKOwHPz1tZuoCF2/cdDE2DxdoH/vrJitIy32fWs6p6SJY9hOdYSXEcg==
X-Received: by 2002:a05:6870:7010:b0:177:777d:307d with SMTP id
 u16-20020a056870701000b00177777d307dmr785613oae.57.1679523659282; 
 Wed, 22 Mar 2023 15:20:59 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 12/25] target/riscv/cpu.c: redesign
 register_cpu_props()
Date: Wed, 22 Mar 2023 19:19:51 -0300
Message-Id: <20230322222004.357013-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1134.google.com
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
index df5c0bda70..0e56a1c01f 100644
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
@@ -472,7 +472,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -485,7 +485,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -572,7 +572,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
 }
 #endif
 
@@ -1554,44 +1554,16 @@ static Property riscv_cpu_extensions[] = {
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


