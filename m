Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F346B12D9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0GC-00082m-I9; Wed, 08 Mar 2023 15:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GA-000829-E0
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:19:38 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0G8-0002SF-Qx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:19:38 -0500
Received: by mail-oi1-x230.google.com with SMTP id bj30so13126727oib.6
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0P1UnDjGy/z/U1aQi6eJShdM9aLBbZfiZBKn3C8EKc=;
 b=S5UztB6HOpAE75hStorc8hS8RBX+AyVbDp8ygLc3fHWFEnaG4R7KvtYWetr9KyARFn
 K0bgz4zvJimiC9bRwtTJYtUYrqajA87HJNWF0QxrqSg20U7qm7/yHe+Tj2on7zYiZv4N
 xtSE8JVUUG6fQXdu7siEQb5YL2UHldz1sVPO6KEEw0lU71RyzZbSyPT5WDs7GVkLYw2y
 bq8SZAxE9LaWbk4SYrUeNHUmqFvsm5myqXBj3O0Q3C1suFkeuZOQe5f6WSs573rSaBLI
 vHjcvSqHACX8eObX7bsgJ8g9o7o31itPQ668jX8wr5APlY/zKe42c//x/foywukZf5W4
 lMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0P1UnDjGy/z/U1aQi6eJShdM9aLBbZfiZBKn3C8EKc=;
 b=y9l/nanSYQ9GPoMmz7sexg6a7JFApvRNvU3faAMQkf7sTCAeentWG/UbQGuBRNZpZw
 mHOF7OY2cwa4QTJGU5GFTeYK3O1UAb/nOU6eIsurh4S+98m6/oJ0ZClU/260r3VsNEd3
 J18wyGFGijID4WXYWpnu6yEMpIjMMBTzT4A6dMwTHrwLdATZkXdFK6IEgretWLTBMYEQ
 LPkOsqhygZuijmUpnJ5SahqwuJfGQoKX6OhuHys85R4h3B+m3nfu8XAHUGQSJsBXx8/l
 NzGaPoD1nbHHDJjtQZpmf71ax4Tcg+m1ZELFGz7bgmvy4frt2+RBQATWfX7UI5NkqWGA
 gd8A==
X-Gm-Message-State: AO0yUKV5OccwoCaBI9r0Ij4INOnDtknl2iDCmdUiEddR5l9VwgTxOeZE
 H7BA6cO4p0XLsaDhdwiZaED17zOJw37wM2epxP8=
X-Google-Smtp-Source: AK7set8pZ5HYEkcxDHCTqvxnTmKWOK3KOP/vhuBGikudeCR/iWUWL4qIdUbMTNxsPITTXWuZTOywBA==
X-Received: by 2002:a05:6808:344:b0:384:6ae4:afe8 with SMTP id
 j4-20020a056808034400b003846ae4afe8mr9004426oie.47.1678306775420; 
 Wed, 08 Mar 2023 12:19:35 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:35 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 01/17] target/riscv/cpu.c: add riscv_cpu_validate_v()
Date: Wed,  8 Mar 2023 17:19:09 -0300
Message-Id: <20230308201925.258223-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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

The code that validates ext_v in riscv_cpu_validate_set_extensions() is
not properly indented - we're missing an extra indent level right after
the first check that uses cfg->elen.

In the end the 'v' verification is a bit too large in comparison with
the others, and can be put in a separated function to enhance the
readability of riscv_cpu_validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 83 ++++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..5060a98b6d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -802,6 +802,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+                                 Error **errp)
+{
+    int vext_version = VEXT_VERSION_1_00_0;
+
+    if (!is_power_of_2(cfg->vlen)) {
+        error_setg(errp, "Vector extension VLEN must be power of 2");
+        return;
+    }
+    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
+        error_setg(errp,
+                   "Vector extension implementation only supports VLEN "
+                   "in the range [128, %d]", RV_VLEN_MAX);
+        return;
+    }
+    if (!is_power_of_2(cfg->elen)) {
+        error_setg(errp, "Vector extension ELEN must be power of 2");
+        return;
+    }
+    if (cfg->elen > 64 || cfg->elen < 8) {
+        error_setg(errp,
+                   "Vector extension implementation only supports ELEN "
+                   "in the range [8, 64]");
+        return;
+    }
+    if (cfg->vext_spec) {
+        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
+            vext_version = VEXT_VERSION_1_00_0;
+        } else {
+            error_setg(errp, "Unsupported vector spec version '%s'",
+                       cfg->vext_spec);
+            return;
+        }
+    } else {
+        qemu_log("vector version is not specified, "
+                 "use the default value v1.0\n");
+    }
+    set_vext_version(env, vext_version);
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly, doing a set_misa() in the end.
@@ -993,44 +1033,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        int vext_version = VEXT_VERSION_1_00_0;
-        ext |= RVV;
-        if (!is_power_of_2(cpu->cfg.vlen)) {
-            error_setg(errp,
-                       "Vector extension VLEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
-            error_setg(errp,
-                       "Vector extension implementation only supports VLEN "
-                       "in the range [128, %d]", RV_VLEN_MAX);
-            return;
-        }
-        if (!is_power_of_2(cpu->cfg.elen)) {
-            error_setg(errp,
-                       "Vector extension ELEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-            error_setg(errp,
-                       "Vector extension implementation only supports ELEN "
-                       "in the range [8, 64]");
+        Error *local_err = NULL;
+
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
             return;
         }
-        if (cpu->cfg.vext_spec) {
-            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-                vext_version = VEXT_VERSION_1_00_0;
-            } else {
-                error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                return;
-            }
-        } else {
-            qemu_log("vector version is not specified, "
-                     "use the default value v1.0\n");
-        }
-        set_vext_version(env, vext_version);
+
+        ext |= RVV;
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.39.2


