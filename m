Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE16BFC98
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcoV-0006ph-Dx; Sat, 18 Mar 2023 16:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoS-0006Tp-GW
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:06:00 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoQ-0007Gw-3d
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:06:00 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 v2-20020a056830090200b0069c6952f4d3so4717725ott.7
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zD0xvzavcMOlqDmOuShYZOckRPbY+zDaBi9jT5/rz+A=;
 b=IeJVIH/q/jq9RoSzYObuC817WaFDlXTEdiHOndp5Te0CbGEo8ND/7OJjNDwhoFo/km
 NrhNgWC7QUPnoWg3opQsNJbKtOzthDZ/Qz5bUnpDovBO9VWRuZSeL5q8hkzjJFsIZmlW
 /jj3ylnyvxREqs7ZS3K9/9IDVfpKb17b9W2gb0WaFlS43xbrhDwqKeG2fkk1qTjuPS3U
 fOl7n0t76d5Im716ecFbqtaXOG0i9FiFMLF8d00nOH9fPsuYtFDA1sooIzrZQQpSZPmO
 M8S9+KNb0oqRr+uQnt0rjDEywNEtukeY2OQRh7vIrBvJ3LCdTUj2CuUM8vyKebspIq2l
 axig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zD0xvzavcMOlqDmOuShYZOckRPbY+zDaBi9jT5/rz+A=;
 b=HEWKaIdumiCBA6Uj/PBD2UHJpP7/xNmnc/fKM6JJ/H9tjWbe0hKx1G9stYfltYxNtY
 9Qp32VyqLv/9NaDJ9IKUpiGM44IUz4rdhiw1WA39yMn6kX7pDPg6a9Afgx6RbdEKRM+Z
 FgAw6sXPwOAcmqptjU9nHAqTmO0JHpz4ZQFAVqC4H0yR83lGAp3hqFWiv/hoK6Pj3ppE
 Bl+CweCzHuEMojOV/EjK1TKCgLp6Rj+0UgkWS2psxvC0UGposI2+qwD8DRRdgG9XkgT4
 d57MmIFAAJcOJVDb/2TQRuyBSzq1/mcqOCl4Is9mdxDMNKHhtjYk4CliGCmqEBIVEua9
 0mSA==
X-Gm-Message-State: AO0yUKU+j1JhSFUB4M6IG/AFsmE9IUw4DKpIuHaQhH6782f2/iXxjPK+
 60Zx0BET8zLquH3p7zQPFX5lz/qm/3jH1v5LX+U=
X-Google-Smtp-Source: AK7set9DILmrHXBNblRkySraNmNTt5EkG6fc926qHkwEgteNDgMCcpTxCB3o5eYH14AwvpEd8vzU2Q==
X-Received: by 2002:a9d:75c5:0:b0:693:db45:8b71 with SMTP id
 c5-20020a9d75c5000000b00693db458b71mr1500717otl.8.1679169956435; 
 Sat, 18 Mar 2023 13:05:56 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 26/26] target/riscv: allow write_misa() to enable
 RVV
Date: Sat, 18 Mar 2023 17:04:36 -0300
Message-Id: <20230318200436.299464-27-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

Allow write_misa() to enable RVV like we did with RVG. We'll need a
riscv_cpu_enable_v() to enable all related misa bits and Z extensions.
This new helper validates the existing 'env' conf by using the existing
riscv_cpu_validate_v(). We'll also check if we'll be able to enable 'F'
by checking for ext_zfinx.

As with RVG, enabling RVV is considered to be a standalone operation in
write_misa(). This means that we'll guarantee that we're not being
inconsistent in riscv_cpu_enable_v() and that we're okay with skipping
regular validation.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 35 +++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  1 +
 target/riscv/csr.c | 14 ++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 73a5fa46ee..9c16b29f27 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -983,6 +983,41 @@ static void riscv_cpu_validate_v(CPURISCVState *env,
     env->vext_ver = vext_version;
 }
 
+target_ulong riscv_cpu_enable_v(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    RISCVCPUConfig *cfg = &cpu->cfg;
+    Error *local_err = NULL;
+
+    riscv_cpu_validate_v(env, cfg, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return 0;
+    }
+
+    if (cpu->cfg.ext_zfinx) {
+        error_setg(errp, "Unable to enable V: Zfinx is enabled, "
+                         "so F can not be enabled");
+        return 0;
+    }
+
+    cfg->ext_f = true;
+    env->misa_ext |= RVF;
+
+    cfg->ext_d = true;
+    env->misa_ext |= RVD;
+
+    /*
+     * The V vector extension depends on the
+     *  Zve32f, Zve64f and Zve64d extensions.
+     */
+    cpu->cfg.ext_zve64d = true;
+    cpu->cfg.ext_zve64f = true;
+    cpu->cfg.ext_zve32f = true;
+
+    return env->misa_ext;
+}
+
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3ca1d4903c..45e801d926 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -600,6 +600,7 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
 void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
 
 target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp);
+target_ulong riscv_cpu_enable_v(RISCVCPU *cpu, Error **errp);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4335398c19..e9e1afc57e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1395,6 +1395,20 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         goto commit;
     }
 
+    if (val & RVV && !(env->misa_ext & RVV)) {
+        /*
+         * If the write wants to enable RVV, only RVV and
+         * its dependencies will be updated in the CSR.
+         */
+        val = riscv_cpu_enable_v(cpu, &local_err);
+        if (local_err != NULL) {
+            return RISCV_EXCP_NONE;
+        }
+
+        val |= RVV;
+        goto commit;
+    }
+
     /*
      * This flow is similar to what riscv_cpu_realize() does,
      * with the difference that we will update env->misa_ext
-- 
2.39.2


