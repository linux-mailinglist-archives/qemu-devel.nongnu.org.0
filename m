Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D302B691FE8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:39:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTaI-0005Q2-Ku; Fri, 10 Feb 2023 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaH-0005Pd-2n
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:37:01 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaF-0007WD-CA
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:37:00 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15f97c478a8so6601488fac.13
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+EWABRJswhDjUy7aBOXLg2A2/6WAQTTrdb7zLVEHcY=;
 b=FZn5Jk3CVDiMUth+gkmyzxNaVSbJ/96kEgwppL4gYxndhfUCpVtX2q6xgQkx+KS+FI
 7ySAVhe2eJiWvwHeiebnHy5qTE2mR9sVd5kb9Xr83udriL/vxNS5Pe0mVFnMz+Nfxs55
 DqropxMP7DV5oss0o5OtzWcRLlo3/6vsgfPyCUeGV9cxLmuuApFhCXnOUN7NsGNmjUu1
 moU7bLJXxgnniOY0Whh4Q8uL9YUfEJu/vwhZLmP2JGJc53IdJssyQY8QcT2BgCznpZth
 r3PwsHMlSY0ogSEthKwhzB+0hgt3+WlnVLxyV3iKpIxU+POh/Vw6YU9bjkCLX961EDhU
 eB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+EWABRJswhDjUy7aBOXLg2A2/6WAQTTrdb7zLVEHcY=;
 b=79gub3Mn1gMgVZg/OOpeAeqmX2aqZJvDqjIJapteFY/i76H7fjTV6FVs6CSM/DhIXY
 /Pqg6IznJ/SsGL5SwzOpq/G+7Oa9c4qL+LikTEPCcB1nqLzDhDxIBVE31AsFOGYKWEeW
 YABF96R93XAmVnD5pTfY+nKagBYuDaY20M9kTkOwff8wHfeVkWs4NoCha3usN3jWJ+Vz
 Ncm4PBrHQgT/AxFFVXvMzWMphs/3Wi7femXKWofZKfLYScx4j6fNzU240wDyOVdJ+ntV
 uMLluqjvBYBQwMJv9NC1PeZY97jhDEmGEo9t450Kz2d2a14DBRbdqbhEg7lPrlug4jUY
 kJRA==
X-Gm-Message-State: AO0yUKWjCpUf2qTDMmJIV8H6n7JcHN+I5YZusqBkyNGAgG2y9INZgufJ
 declYY5TxYHSduhbaZ51+/6SnBow06JtGl9J
X-Google-Smtp-Source: AK7set/7hajQiXo78wVQC8YeYYI9n7HEWB8qvasDjzbn0InG16nyvcVrn+aDCxBzK2prjtoKEljVcw==
X-Received: by 2002:a05:6871:442:b0:163:1969:1ae2 with SMTP id
 e2-20020a056871044200b0016319691ae2mr8582592oag.25.1676036218414; 
 Fri, 10 Feb 2023 05:36:58 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 08/11] target/riscv: remove RISCV_FEATURE_PMP
Date: Fri, 10 Feb 2023 10:36:32 -0300
Message-Id: <20230210133635.589647-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

RISCV_FEATURE_PMP is being set via riscv_set_feature() by mirroring the
cpu->cfg.pmp flag. Use the flag instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 1 -
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 3 +--
 target/riscv/op_helper.c  | 2 +-
 target/riscv/pmp.c        | 2 +-
 7 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 430b6adccb..a803395ed1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -923,10 +923,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
-    if (cpu->cfg.pmp) {
-        riscv_set_feature(env, RISCV_FEATURE_PMP);
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0de11fd41..62919cd5cc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -87,7 +87,6 @@
    so a cpu features bitfield is required, likewise for optional PMP support */
 enum {
     RISCV_FEATURE_MMU,
-    RISCV_FEATURE_PMP,
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4cdd247c6c..15d9542691 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -706,7 +706,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     pmp_priv_t pmp_priv;
     int pmp_index = -1;
 
-    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
+    if (!riscv_cpu_cfg(env).pmp) {
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5b974dad6b..3d55b1b138 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -419,7 +419,7 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
-    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+    if (riscv_cpu_cfg(env).pmp) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 4634968898..67e9e56853 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -27,9 +27,8 @@
 static bool pmp_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
 
-    return riscv_feature(env, RISCV_FEATURE_PMP);
+    return cpu->cfg.pmp;
 }
 
 static int pmp_post_load(void *opaque, int version_id)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 48f918b71b..f34701b443 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -195,7 +195,7 @@ target_ulong helper_mret(CPURISCVState *env)
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
 
-    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+    if (riscv_cpu_cfg(env).pmp &&
         !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index bb54899635..1e7903dffa 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -265,7 +265,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
         }
     }
 
-    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
+    if (!riscv_cpu_cfg(env).pmp || (mode == PRV_M)) {
         /*
          * Privileged spec v1.10 states if HW doesn't implement any PMP entry
          * or no PMP entry matches an M-Mode access, the access succeeds.
-- 
2.39.1


