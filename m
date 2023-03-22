Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFBA6C5A48
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6q5-0006T0-R9; Wed, 22 Mar 2023 18:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6q3-0006Se-Kb
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:47 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6ph-0006V5-My
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:47 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1755e639b65so20933051fac.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSXRSE1urT9If2ppkDmMO49HUF93qFb39HFwVFmT1fE=;
 b=fhiwFgyUbuTLBKWb2L+NdQ5dB6MtncBBHLygYRZudfVjWw+sjaZEWXEzYHEQXe5aWY
 /mtWb2RN9TlPD3by3TlZurpAztIj79umittWSsi+bTJpoYRJtdE+xWLveS2JKlM3yZsc
 oWYPBCcs+U3+gXs2F9TguJXYs4oWUZ2ZJKA3aZrYDO6oNe4t8w+NK2VXp1nzLFSy03og
 SfYrV7+r/N7YcwVMATDLZSj9IXREmAuY2SVEmSx3lVFnJ8h9pYkKopyLtSB2Ox/ovgCf
 7JX3jBTC5tc8djci3n5+zthuSPoG/ejC1zUS932DmxfNJx/Zf107/2ptTpMBPdJPhBWv
 2FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSXRSE1urT9If2ppkDmMO49HUF93qFb39HFwVFmT1fE=;
 b=L8rgYy96QAWEfr/k3pRHbKoT0rvYjE99tF8TwTfTm699M2uAOEpu7b3cC6NfQZL453
 f/7hWfGythlW0jf6VajVwvfNtPg9izaFPphE/iypdBRxMRFuM7j1ZP9kzf48Vx/qF9/L
 R76Fbo2VUv3X/DRFtnqr54pYuBPuy4Wg1JtpqzG3iCvgr+rA7IdP1p0qivFKhlR4mvLl
 v0RMWlz56V3bVIS8z9d3huw22mXBbm6yJP/K5WJhmdQVKr97KwamdW16eFYlQN+2+T/7
 L1rZ9xnXMfcxq1jp5MDSI+iixOCGzXWjSuWwI5QXNpoBA+r88ax5TtkcNnsOGCXQ56SJ
 LuQQ==
X-Gm-Message-State: AO0yUKX43H/Gto8vpgHR9eB+eSx7N8yJQnsM34l/FSPHBo3SBlG76DEW
 vHt15kO5tEVLy5bZTE3sYd0Z3EOHvVvIahc1cO8=
X-Google-Smtp-Source: AKy350Y8nSxMPsCo2rDXDXPw1OHjLHvspuVOU+DmlLDXdfTSJ5LRt2p/VUKQCNZkCAQW0cEt7cOqZw==
X-Received: by 2002:a05:6870:304d:b0:177:9e38:96d9 with SMTP id
 u13-20020a056870304d00b001779e3896d9mr792041oau.23.1679523684389; 
 Wed, 22 Mar 2023 15:21:24 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 20/25] target/riscv: make validate_misa_ext() use a
 misa_ext val
Date: Wed, 22 Mar 2023 19:19:59 -0300
Message-Id: <20230322222004.357013-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

We have all MISA specific validations in riscv_cpu_validate_misa_ext(),
and we have a guarantee that env->misa_ext will always be in sync with
cpu->cfg at this point during realize time, so let's convert it to use a
'misa_ext' parameter instead of reading cpu->cfg.

This will prepare the function to be used in write_misa() where we won't
have an updated cpu->cfg object to work with. riscv_cpu_validate_v() is
changed to receive a const pointer to the cpu->cfg object via
riscv_cpu_cfg().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f1e82a8dda..bd90e1d329 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -930,7 +930,8 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
-static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+static void riscv_cpu_validate_v(CPURISCVState *env,
+                                 const RISCVCPUConfig *cfg,
                                  Error **errp)
 {
     int vext_version = VEXT_VERSION_1_00_0;
@@ -1016,41 +1017,43 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
+
+static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
+                                        uint32_t misa_ext,
+                                        Error **errp)
 {
-    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (misa_ext & RVI && misa_ext & RVE) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!(misa_ext & RVI) && !(misa_ext & RVE)) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (misa_ext & RVS && !(misa_ext & RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (misa_ext & RVH && !(misa_ext & RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (misa_ext & RVH && !(misa_ext & RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (misa_ext & RVD && !(misa_ext & RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -1064,13 +1067,13 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
      * 50+ entries of isa_edata_arr[] just to check the RVH
      * entry.
      */
-    if (cpu->cfg.ext_h && env->priv_ver < PRIV_VERSION_1_12_0) {
+    if (misa_ext & RVH && env->priv_ver < PRIV_VERSION_1_12_0) {
         error_setg(errp, "H extension requires priv spec 1.12.0");
         return;
     }
 
-    if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+    if (misa_ext & RVV) {
+        riscv_cpu_validate_v(env, riscv_cpu_cfg(env), &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
@@ -1355,7 +1358,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    riscv_cpu_validate_misa_ext(cpu, &local_err);
+    riscv_cpu_validate_misa_ext(env, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2


