Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9826999DA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh18-0000G5-MR; Thu, 16 Feb 2023 11:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh17-0000Fb-7o
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:53 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh15-0006Bj-EL
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:52 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-16e809949eeso1564725fac.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEoLHmo0Wwd1VEBIJTRfk11UDfKznhZCWuv+sKrLWfU=;
 b=TcDgCoYV0mPWpldIBtvupLA11XYsWxKx24eq8LDj0mRZU7daMj7gi7/DtLkbqj95Ws
 xNkBQMLNdYW3LaA3QlPP/aZgGdmPCaXRBJrJxAtMtuIOTOGKcl/XnxuCXbOF1IaBQyoz
 UVG9iaFsV/5d33CYUa/HekmoNEMnvOU2qhex+w7xyjiIz12ASCYrczyKls2xgTO4wdY3
 ylHqwmpfozOIwY9GjzU8OySGbPYjzef/K5kTU0aiWNPQ8BU2kU+8uADyl6gsieyNVfw2
 jnEE8eYKEVTh9iGfSYAJfjAN9HatRVzD/wOIlt3hW7n0xKFmRhjwTwJ2unxjshi4EQ3z
 PGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEoLHmo0Wwd1VEBIJTRfk11UDfKznhZCWuv+sKrLWfU=;
 b=nZzzRdbFpFLGoHhlz+O8IXaBlH6DFDCxBkKqlvU8tyJr0qPl5b/zst6Cbr/tRY0CT1
 HExnMKk7sXLOltFGbrauE0bdDk9J7xYqjDG2JYkBjuB5U5ABNScANvejYztlvZe/yv8Q
 4wSAXVyr1iJTqZmUjNK/nnv2gbuOgSMtynk0pnDO/qQRc9UDNwrFitCfILVhzVckQicN
 923IFgpVqT+Mi7G75NFQrCPt0NeR4Rrb4yXyirIp54HhXea+xV5alrN+8pgdHrqtN/wq
 KuATe841JCxMD0WCI1OLXJ64dPZOvC1SzDriV0PceJD4aVgrNcr86FSaRmX5XSw6BoQc
 JZfA==
X-Gm-Message-State: AO0yUKWo2kQbFKnU9fmqVskt5z+6xkxsVDtvk8dsXbrEoagQOwdvYudV
 cM0ComCQMmpgzQuF1kTRF2LGqs77Mq7hqTAc
X-Google-Smtp-Source: AK7set98jjsrphgCXPGCHV1i5JJgH6HQtrzJAc1AxEb+7Tk7npQFD89W+laNdjsvxDkfUVIFxXMMmg==
X-Received: by 2002:a05:6870:472c:b0:16e:2e3c:aa4f with SMTP id
 b44-20020a056870472c00b0016e2e3caa4fmr2938006oaq.0.1676564509974; 
 Thu, 16 Feb 2023 08:21:49 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 6/9] target/riscv: remove RISCV_FEATURE_PMP
Date: Thu, 16 Feb 2023 13:21:23 -0300
Message-Id: <20230216162126.809482-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
index 71b2042d73..7b1360d6ba 100644
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
index c87e50e804..bd7ab5fceb 100644
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
index 3a2e85918a..a8a7d0aa34 100644
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


