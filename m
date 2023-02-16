Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D286999DD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh17-0000FP-EI; Thu, 16 Feb 2023 11:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh15-0000Cw-5g
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:51 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh13-0006AJ-9K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:50 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-16cc1e43244so3054834fac.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh23YR+MTb3Z95gd9Zx/XoNgfzFVu0diZGWAULwkKw8=;
 b=JuWAG+rBxbZq8ALDs2bOjCg/CQc+V4Vbk/LYNIl1/9I33PVTQccjQGJbdjsDqLP6z7
 9+BhMjXMYctJrk6CuVx6Xdmm7WoU4g8nqTxvR8RD5SBn89OCLsvJwOzPkmniXB3OzoGS
 JfrLS8V/ZWAZUszBCK+YN1glv+t4em856tsJcrGBEr3I2mtUJmW8FPFrSqj/7bXTQ96O
 AOe3absJXizGdojiCcQHT+/h0qYloVYNjuZQIKXQc6gFvD8kWgk6Us8tMgNA0PVIJXja
 LarKGGF/+Loh9Ivwgc5F2lSbWimArORfL4x4S21iSG6TcNPlFnfKmqaUh7R/gEbCc9DE
 YHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh23YR+MTb3Z95gd9Zx/XoNgfzFVu0diZGWAULwkKw8=;
 b=A1ZE/Mj0rD4iaNnhtRkvvQqq3iOBM0gLKB92of/tKb4F3x/4kLvhTa+PmqLIO17NDp
 FV8I1FXbQlliFLvbNQk5qZBZW17hjj7eRDYe6qzcSj5/flXIVxdf1WBrugG4PuAxrtD4
 gcUuS5/NyyqrSI64NBda9tO3h8rI67BJDXAdDu101coQIhTShDJRYG5eRrCxNssLMEs0
 B43tL68Ho6S3oGfSoVi/P+NbXCXdPOtzxKhgOhbgS98G/3NZZV1MHQJb23IEgCj9GkTX
 UrlLOr+3rnq6gxNIK29dHIQaFqNpnBHE/rD8VLFfy6EF46DtEXGhvaibAJoGq1hA2lFt
 JzzQ==
X-Gm-Message-State: AO0yUKXKYGc0FzZaMq+5Gv6LQDfvSH1SkmcsKkti0WpSogq8E6Kl4yrC
 moa6aVWvdbP+CkTuhfRMGsMwLOoxR00v6EGG
X-Google-Smtp-Source: AK7set9LCztqzTCDFdsS0sUH+je/2JKKaZ39kvRfDmk0cei4WjSD1t0X3I7dk6P2XU3OIQovdtnoCg==
X-Received: by 2002:a05:6870:a44c:b0:161:239b:5a92 with SMTP id
 n12-20020a056870a44c00b00161239b5a92mr1331122oal.13.1676564507135; 
 Thu, 16 Feb 2023 08:21:47 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 5/9] target/riscv: remove RISCV_FEATURE_EPMP
Date: Thu, 16 Feb 2023 13:21:22 -0300
Message-Id: <20230216162126.809482-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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

RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
flag. Use the flag directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++-------
 target/riscv/cpu.h |  1 -
 target/riscv/csr.c |  2 +-
 target/riscv/pmp.c |  4 ++--
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4585ca74dc..71b2042d73 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -927,17 +927,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_PMP);
     }
 
-    if (cpu->cfg.epmp) {
-        riscv_set_feature(env, RISCV_FEATURE_EPMP);
-
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (!cpu->cfg.pmp) {
-            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-            return;
-        }
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return;
     }
 
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7326aaed27..c87e50e804 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,7 +88,6 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_EPMP,
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 90dc28e22e..3a2e85918a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -428,7 +428,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
 static RISCVException epmp(CPURISCVState *env, int csrno)
 {
-    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (env->priv == PRV_M && riscv_cpu_cfg(env).epmp) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 4bc4113531..bb54899635 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     if (pmp_index < MAX_RISCV_PMPS) {
         bool locked = true;
 
-        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (riscv_cpu_cfg(env).epmp) {
             /* mseccfg.RLB is set */
             if (MSECCFG_RLB_ISSET(env)) {
                 locked = false;
@@ -239,7 +239,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
-    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (riscv_cpu_cfg(env).epmp) {
         if (MSECCFG_MMWP_ISSET(env)) {
             /*
              * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
-- 
2.39.1


