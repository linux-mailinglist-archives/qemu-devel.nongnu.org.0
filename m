Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717D36645B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:24:53 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Q0-0004Hc-BH
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GX-0007Z9-El
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:15:05 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GV-0003R5-Mg
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:15:05 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d10so28513294pgf.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NBOhJAYqVk2o3FB3PePT4zWsA15zhdo9pXBP5hRhnEo=;
 b=XmB1UVpBtXiRGHNuQLhyHqEEjf8AFyDbiHbjdLObuy6XRDL0CaelUlxJ+QKqU8STL/
 P7nlTfcEZSG83ajxomoYYAY7BtmR04XWNnL3Vh32nCIMOgSe0SKwsXe3a70T9VvbU0Wp
 CjKwsBOgxdJuAcj/AXsZ2ekEpP4LNLtvm1kSzEkyC4HykcQcFU40bNG5DSYlHfCQmPFZ
 zjBymxmrXTXcrGmYyZcGPoVwPJREGpSFiv7JRVPg4Xb+l7XtUm2Igp9fozkyK0fLwy0i
 NE2WcGSXlzW9TkMjHVqaTiYN4BMSKaRspk5F//qyMk4Gf3etpNNTxE/wnHaUy+x9TuDJ
 i1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NBOhJAYqVk2o3FB3PePT4zWsA15zhdo9pXBP5hRhnEo=;
 b=nG+nlSDtkXXcDX56NQV3fMX7UQTjwnzs+3eKKQHDT3CYgI7/xhHDLqbsSDJA73DWKL
 G3dC4Q7IzCg0DHz+1bOi8zGMyxy12Tc4OMouJROjpzPGiXGfPaWen+1JLuGL9ZHQ3s2V
 R1Er40A5o7hXQJtQQwCFOJ10cmjFqlfyqeEuqCKqLT2TRjbFtS8TshOquU8JrvWiuGIf
 HxPVFv1h/dVL/b7OD0GeJLgebHvDZTSViq3IWXu1OqJJo0Q0CmYYV9/Tk9P1Dr3nVzwK
 29lBIJIfNf1V64YlEDG+OO0UHAbhTNs/Zxx7BKwYXe3Mmy0sH/8ZFU694l7PtQ12ejJC
 AuUQ==
X-Gm-Message-State: AOAM533sMUygfxaUCVmNgWxRtkoVxAr37J710lh5dMu58i/qXNJS9EEH
 HM8GUfd7ZHH1f4xx3tICuaNJegilziU9hfD7
X-Google-Smtp-Source: ABdhPJzUeQNXZ/wOR1vWjz0N7L4KIJ+aZquA7/b4QofrbQsUZ9HPMGEYjGbj54M8I74ESeyQwCQK9g==
X-Received: by 2002:a17:90a:fd95:: with SMTP id
 cx21mr1789943pjb.137.1618978502128; 
 Tue, 20 Apr 2021 21:15:02 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:15:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 17/17] target/riscv: rvb: add b-ext version cpu option
Date: Wed, 21 Apr 2021 12:13:59 +0800
Message-Id: <20210421041400.22243-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Default b-ext version is v0.93.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 target/riscv/cpu.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8464a152d14..b76c3c07c5f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,6 +127,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
+static void set_bext_version(CPURISCVState *env, int bext_ver)
+{
+    env->bext_ver = bext_ver;
+}
+
 static void set_vext_version(CPURISCVState *env, int vext_ver)
 {
     env->vext_ver = vext_ver;
@@ -380,6 +385,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
+    int bext_version = BEXT_VERSION_0_93_0;
     int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
@@ -404,6 +410,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
+    set_bext_version(env, bext_version);
     set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
@@ -475,6 +482,21 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
         if (cpu->cfg.ext_b) {
             target_misa |= RVB;
+
+            if (cpu->cfg.bext_spec) {
+                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
+                    bext_version = BEXT_VERSION_0_93_0;
+                } else {
+                    error_setg(errp,
+                           "Unsupported bitmanip spec version '%s'",
+                           cpu->cfg.bext_spec);
+                    return;
+                }
+            } else {
+                qemu_log("bitmanip version is not specified, "
+                         "use the default value v0.93\n");
+            }
+            set_bext_version(env, bext_version);
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -553,6 +575,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 97073bb8e27..56de8cb5edd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -87,6 +87,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
+#define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
 
 enum {
@@ -134,6 +135,7 @@ struct CPURISCVState {
     target_ulong guest_phys_fault_addr;
 
     target_ulong priv_ver;
+    target_ulong bext_ver;
     target_ulong vext_ver;
     target_ulong misa;
     target_ulong misa_mask;
@@ -300,6 +302,7 @@ struct RISCVCPU {
 
         char *priv_spec;
         char *user_spec;
+        char *bext_spec;
         char *vext_spec;
         uint16_t vlen;
         uint16_t elen;
-- 
2.17.1


