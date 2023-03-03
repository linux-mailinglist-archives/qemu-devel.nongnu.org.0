Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7276A92C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0yw-0007EY-Al; Fri, 03 Mar 2023 03:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yn-0006lV-HG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:31 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yl-0007mg-F4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:28 -0500
Received: by mail-pj1-x1031.google.com with SMTP id kb15so1813245pjb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832886;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2qA3TlwLDKov+3r2kqVjzEEhRt6+MxAW7wsR31Qwbc=;
 b=a+j6TuXiHOZhLEYSt664Qcyzf6h9ifO7ov6U/clWotK+jO/aJZ8mawNDYTY5l0uPcZ
 C7pYseDq9DhB+GxWMGmVpS2yqr3OfVGhAqTWIHE+CsW1fSNaRtnHGsEZYGq7oY56/P4D
 icaT9CA7u4AHnZKgFst/XKXx7qt148BdpGQuIER1pQmFU7WLeTN8UBbXG+g4za+pXHws
 k2eBpwMuBp064nBqQNKMFOAkwfffO0VXWJTbxXi5/xlzIpOAd9pyIBrsimpllSA1rTjw
 7GeDlOt1EjMTBbrOfrN0PgXMKuaXxSFE7pqkYTtagT8M0qSnj9dWxh1O+ZBobT3qxpRz
 MK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832886;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2qA3TlwLDKov+3r2kqVjzEEhRt6+MxAW7wsR31Qwbc=;
 b=Q7X1CjvVf555lxzrabogZ30/dXK31zlShPnJjUMKZ7h3p6WDB+D9285EKvyOrG6zEP
 +0QW7Bcr4BUqO6Afj9Kmw0rTHsGFcuwEi3JrGuoDx2C3OymG8ssg3+R/Z/QxRvha7HZx
 eT0RJFs7nE9L6G8CIrHwnT0MPWMGSsSmBbw02sXXQMZ7jQpeegJOuSOnVTYUcwvsjYtW
 suVQBIkJ+IfLczWC0Qhtp6oGTq3RGdKvRVQViyQ+2ZGs1PSeKuupxvXuwXXGMhfWUr+u
 JGTiPNdZHi6ZbzJ1oJXOrL9hExs1uzv1bL3TD2f6YwpPH3ywv9TZkiPqWWC3D5etNShw
 TwOw==
X-Gm-Message-State: AO0yUKVpFGGLWcni28R48U3mJ6n4EqNOq6FR0aC+vhlCDTSqwz1bDzsH
 fsqEnRh47nZjY+g8DepJDuV9/w==
X-Google-Smtp-Source: AK7set/l2Q6I6Az94nVReDP48CYWAF+3V5pR+pHbWE4SFGep+jNbK2kitHBtoj0aPTlgAvx8nxG9KA==
X-Received: by 2002:a17:90b:350f:b0:235:31e9:e793 with SMTP id
 ls15-20020a17090b350f00b0023531e9e793mr5239254pjb.13.1677832885675; 
 Fri, 03 Mar 2023 00:41:25 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 k11-20020a17090a590b00b0023747b0445fsm2890039pji.14.2023.03.03.00.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:25 -0800 (PST)
Subject: [PULL 04/59] target/riscv: remove RISCV_FEATURE_DEBUG
Date: Fri,  3 Mar 2023 00:36:45 -0800
Message-Id: <20230303083740.12817-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bmeng@tinylab.org>, 
 Andrew Jones <ajones@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

RISCV_FEATURE_DEBUG will always follow the value defined by
cpu->cfg.debug flag. Read the flag instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-5-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c        | 6 +-----
 target/riscv/cpu.h        | 1 -
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 3 +--
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d637b1acd..13e55ec5bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -637,7 +637,7 @@ static void riscv_cpu_reset_hold(Object *obj)
     set_default_nan_mode(1, &env->fp_status);
 
 #ifndef CONFIG_USER_ONLY
-    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+    if (cpu->cfg.debug) {
         riscv_trigger_init(env);
     }
 
@@ -935,10 +935,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.debug) {
-        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
-    }
-
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ca828424c1..dc62554e14 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_DEBUG
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3a9472a2ff..7ae832e829 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -105,7 +105,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
-    if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
+    if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3cb8d2ffad..e220c4a5fd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -437,7 +437,7 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
 static RISCVException debug(CPURISCVState *env, int csrno)
 {
-    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+    if (riscv_cpu_cfg(env)->debug) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c6ce318cce..4634968898 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -226,9 +226,8 @@ static const VMStateDescription vmstate_kvmtimer = {
 static bool debug_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
 
-    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+    return cpu->cfg.debug;
 }
 
 static int debug_post_load(void *opaque, int version_id)
-- 
2.39.2


