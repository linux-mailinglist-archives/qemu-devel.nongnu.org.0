Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E013E699F8C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 22:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSmEu-000352-7D; Thu, 16 Feb 2023 16:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEq-000341-PN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:56:25 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEp-00025c-5y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:56:24 -0500
Received: by mail-oi1-x235.google.com with SMTP id dt8so3150296oib.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 13:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzcPsSFpo8cDJ6sfm1puhtjJzRJAUmlGMIXLVjavbks=;
 b=YUcGXjs6KNcbJsZvEhjWxAYbfWucm3p3xX/XK7SVo6oAdheKhjKQbyRrqlFlv+Cdli
 MxBCEeFFL5JRrltVnXrPO0DkKFUxTH+Djy4OdNJiOhq6Mg1/37PQbDY5NrRZPv2Gd+dd
 SYsNZcWxDq3J218RuGhiZ/lN4gMca0vZWAVuQXC/A9zNbmRbSUt6OeYNZEB4SGTPb9Sn
 DNHrlQ8JJ14te61xRxxFv2ZMDfPoQRwPgJ4RTyO8l3Ke0YB/Nu470hsx87sNjOOecoIj
 mpqr4UkpxwaAA0QIVHg27N7hFYS4JfWWkR543i/8lWuB7YXFhbIEuLmSStIAkLqZp7Ec
 TdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzcPsSFpo8cDJ6sfm1puhtjJzRJAUmlGMIXLVjavbks=;
 b=ARiWghn5AGz8rZzohWU3rIkVrCF0fYdBVH4uyr42wo+NEhBmK3TqkkZKx7LsowzJ2Q
 vMtYYhkn/2ZNrUw8Js7QyqoJxUIrl/gXYoF+YdtUv5e7YrCV9gpUMUewS653L1vSaafv
 l7ig7MEiuCmEjENEMsq7iiPPuFAlUE5OHOlIrV8ZH0me4HQjHQn9ImeDmDIHWsEwyAn3
 z4TkSdXypDdWTnwE0Qo3DVRUEdv0UJr1OGQnpDSEQoRwPqRQaotw2bRgnt2u707sTv9v
 WAYMNsEd1hLSwKDdyk9tyWIk5ppipR5ypmizs4LXm95E1O1CTj4XdD8NymTmvb9PvK3Z
 +gvQ==
X-Gm-Message-State: AO0yUKXGOdU121dWfknzsPw1UO/4Cn6RQkIwlGC+7iQXRvl50KqN2Py7
 HwJxr1UmWKaRLXN0DKRhbLFiyKkFkld9mxze
X-Google-Smtp-Source: AK7set+vqY4PqchtF7yaTjEOrdKd6wob+HvTprPpyZ5Vg5chjkOPl0HQW/NOSLRtL2UDeYXHPzvp5w==
X-Received: by 2002:a54:409a:0:b0:37e:aa97:4660 with SMTP id
 i26-20020a54409a000000b0037eaa974660mr2834805oii.16.1676584581671; 
 Thu, 16 Feb 2023 13:56:21 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:56:21 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 8/9] target/riscv: remove RISCV_FEATURE_MMU
Date: Thu, 16 Feb 2023 18:55:49 -0300
Message-Id: <20230216215550.1011637-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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

RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
the flag directly instead.

With this change the enum is also removed. It is worth noticing that
this enum, and all the RISCV_FEATURES_* that were contained in it,
predates the existence of the cpu->cfg object. Today, using cpu->cfg is
an easier way to retrieve all the features and extensions enabled in the
hart.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 7 -------
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 4 ++--
 target/riscv/monitor.c    | 2 +-
 target/riscv/pmp.c        | 2 +-
 6 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7b1360d6ba..075033006c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -919,10 +919,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.mmu) {
-        riscv_set_feature(env, RISCV_FEATURE_MMU);
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 119a022af9..0519d2ab0c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,13 +81,6 @@
 #define RVH RV('H')
 #define RVJ RV('J')
 
-/* S extension denotes that Supervisor mode exists, however it is possible
-   to have a core that support S mode but does not have an MMU and there
-   is currently no bit in misa to indicate whether an MMU exists or not
-   so a cpu features bitfield is required, likewise for optional PMP support */
-enum {
-    RISCV_FEATURE_MMU,
-};
 
 /* Privileged specification version */
 enum {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 292b6b3168..eda2293470 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -796,7 +796,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         mode = PRV_U;
     }
 
-    if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d0ab00d870..fcc271c93c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2569,7 +2569,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env)->mmu) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
@@ -2588,7 +2588,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
 {
     target_ulong vm, mask;
 
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env)->mmu) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 236f93b9f5..f36ddfa967 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -218,7 +218,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env)->mmu) {
         monitor_printf(mon, "S-mode MMU unavailable\n");
         return;
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 205bfbe090..a08cd95658 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -315,7 +315,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     }
 
     if (size == 0) {
-        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
+        if (riscv_cpu_cfg(env)->mmu) {
             /*
              * If size is unknown (0), assume that all bytes
              * from addr to the end of the page will be accessed.
-- 
2.39.1


