Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604EF6F7A6C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujti-00036y-BC; Thu, 04 May 2023 21:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtd-0002Zu-VH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtc-0007e0-01
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso11257675ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248762; x=1685840762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGV9M7Q3fySnRT5Y8OU1Bm9pFj5qXHNKBUX8c4QcSuQ=;
 b=qQhRSYf4EiFyDRjq9TSbVH84i0fvA7mnA7asxXpEop679Y43vgT8HUGmsevpBeqJOt
 ZUrMD4sj5sntbZBM5o8dZr++6W4EMcLwZnsNy6AG6UdlNvh81QMAEKCDMPv6xmaby+kG
 e+32lD0B5lLfR2gAqu+mirBvUK1C5D0n6r4NklDJ9F12+fD3AX9HBBCvuEOrUcvUNlU0
 Mjknf1r3rMi7rCnrLfgp0olCb10mHfISH9AKJlRA+YMe6txGIBaVg8nL7rN56pzdyT8D
 X5KMQsngfUiMTbQeYMZ+DQpsej5wLL73pfwupCYLeeDjZVEqB0MHL/FO2g9qTkSvvHUh
 N3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248762; x=1685840762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGV9M7Q3fySnRT5Y8OU1Bm9pFj5qXHNKBUX8c4QcSuQ=;
 b=YI9yLqX7h94YnvwwlT0fjqFYGgQ/nbrq/j/A9MLQNrD+CHh0ezeeGcWJ0IG7/78kUA
 BhUQRuRBS8Jt/agfil55K4ajXsEGOSqfzKsaL1I0Z4HVY2Y865R3waQvU2t7GGOKtJTh
 XV7vglEE2F2QfwZWPfaQfE2vZvmGs1tflHucoCJT3uaXJBbUVo2SVzHlur/bNXmzrCVf
 R5QSWD1c5kLg8DtHbRcpWaM8uxyRg5wgki3KT9dVWeYzR4VH5TGOsPQq7mEX1kKGPk9C
 FBXinvll5oTksMZwG6nIqf64JJvUouWZ+mTRhjpHvw1WUfIaJDVvQqGc+PyixNqg9kce
 iXyA==
X-Gm-Message-State: AC+VfDxr/4frA6ErwmqEHi7VzoF89EyIMNy8uO02SqXqX22QFU9IBSYf
 UWsfu/hOMCa4CTKViE4ZH/+4ktvQiKnZ4w==
X-Google-Smtp-Source: ACHHUZ5EOD1wYl80wWEvaBLliljsH2NNdVCpgP7cjsbRqs0vfBtLxTLeO2VDRO7x7/RepCDC9up9Fg==
X-Received: by 2002:a17:903:22c1:b0:1a6:82ac:f277 with SMTP id
 y1-20020a17090322c100b001a682acf277mr6509208plg.14.1683248761694; 
 Thu, 04 May 2023 18:06:01 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:01 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 48/89] target/riscv: remove cpu->cfg.ext_v
Date: Fri,  5 May 2023 11:02:00 +1000
Message-Id: <20230505010241.21812-49-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Create a new "v" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVV. Instances of cpu->cfg.ext_v and similar are
replaced with riscv_has_ext(env, RVV).

Remove the old "v" property and 'ext_v' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-17-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/cpu.c | 12 +++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1aff93ba91..e011cf6ca4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_v;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3bdd6875a8..13ff37250e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -883,7 +883,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1018,7 +1018,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         int vext_version = VEXT_VERSION_1_00_0;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
@@ -1175,7 +1175,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
-    if (riscv_cpu_cfg(env)->ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         ext |= RVV;
     }
     if (riscv_has_ext(env, RVJ)) {
@@ -1513,6 +1513,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVH, .enabled = true},
     {.name = "x-j", .description = "Dynamic translated languages",
      .misa_bit = RVJ, .enabled = false},
+    {.name = "v", .description = "Vector operations",
+     .misa_bit = RVV, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1536,7 +1538,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1638,7 +1639,6 @@ static Property riscv_cpu_extensions[] = {
 static void register_cpu_props(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
@@ -1648,8 +1648,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_v = misa_ext & RVV;
-
         /*
          * We don't want to set the default riscv_cpu_extensions
          * in this case.
-- 
2.40.0


