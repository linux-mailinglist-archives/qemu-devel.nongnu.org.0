Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A43F0CEA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:45:50 +0200 (CEST)
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSRZ-0005m4-PQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGRrB-0006rB-C3
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:08:13 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGRr9-0006bI-Bm
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:08:13 -0400
Received: by mail-lf1-x12a.google.com with SMTP id o10so7135100lfr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtczUXoDtB+BtnUjDJmonwES/uP63NAbbEwpxHxtOdQ=;
 b=AqCJv7ZmwLZsScVtjy4zl5FTDZim81tPOYI8KYkVGEw1WUlXIhbJbVUQg7fuPlprLR
 kysMmR80dAkZgBAUptKNKLGDVN9QUyYO4IxSFeqt1S6Ywhoj0BC6z/sIQyoqI9HiZH4a
 ewM4XrgpG4/SeSF6BUeg9p103D6QXYvzh8s3iorDfFtCFQAHGocERQ5difpVUl58cG+K
 0yg2W1hmzcJT1OmIcsqDd7T/5RaMU+sMI1DBWdNCuW/hYpKIIT6hTVuxNkJztFUZz8Eq
 LJL4u0We+V3oEDQp9KhFFQNiZN5s35/CkVOMZfs+7QcDJGryJEcWkGPyXRpPKesETUu+
 gDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtczUXoDtB+BtnUjDJmonwES/uP63NAbbEwpxHxtOdQ=;
 b=NVyp0cG5Rr7M5t12Xg2g68c/c0hubbm5g0wfSbW5hmV6gh4jxQJ7e+09b1jhPTAM1J
 uIQK5Yv+28COXm1/BceQfJ4WMc5PSX1Nge8mX9EzXBHR19e1ldxzIpAmyXroRK7QoSBC
 nNqJ81jh2PzkhWLNzJKWecxSSp5Xsr5mr3Oj2I2o0+cecSpHbllr8+wtcr7qaf9UfSI+
 +0a82nuBR+G+FrJY36hGg3bPyf2+ondmatgYQDRVyjfE3z4pQJkFxpEHx157US2jG///
 mp+CHVK8zRffW2hdLXR+PR1iCeu1PTBmNtpfv4jvHfpKF2NnIbietS3aJOrHoJvQMB0a
 M0AA==
X-Gm-Message-State: AOAM532OgISMiQiNQxNkGM1hyIvHUHGfJZe1KTMmzAka0/j3qz2uavUJ
 vhHn/LdMdGRYhP4MFx5Ed/PU0LfPopvfGKYclz0=
X-Google-Smtp-Source: ABdhPJxDjXolvqLwXvMHHU/RoL/aBYW2nVd71BItFQ1RGC39dIkTArUq7FBkWBPqbxHKZi5sJU1UlQ==
X-Received: by 2002:a05:6512:754:: with SMTP id
 c20mr7527026lfs.396.1629317288692; 
 Wed, 18 Aug 2021 13:08:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r145sm63201lff.128.2021.08.18.13.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:08:08 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
Date: Wed, 18 Aug 2021 22:08:01 +0200
Message-Id: <20210818200803.788253-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818200803.788253-1-philipp.tomsich@vrull.eu>
References: <20210818200803.788253-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Aug 2021 16:43:42 -0400
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 1.0.0 (public review) version of the RISC-V bitmanip-instructions
does not define a B-extension, but rather 4 separate Zb[abcs] extensions.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

 target/riscv/cpu.c | 31 ++++---------------------------
 target/riscv/cpu.h |  7 ++++---
 2 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..93bd8f7802 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,11 +127,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_bext_version(CPURISCVState *env, int bext_ver)
-{
-    env->bext_ver = bext_ver;
-}
-
 static void set_vext_version(CPURISCVState *env, int vext_ver)
 {
     env->vext_ver = vext_ver;
@@ -393,7 +388,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int bext_version = BEXT_VERSION_0_93_0;
     int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
@@ -418,7 +412,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
-    set_bext_version(env, bext_version);
     set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
@@ -496,24 +489,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
-        if (cpu->cfg.ext_b) {
-            target_misa |= RVB;
-
-            if (cpu->cfg.bext_spec) {
-                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
-                    bext_version = BEXT_VERSION_0_93_0;
-                } else {
-                    error_setg(errp,
-                           "Unsupported bitmanip spec version '%s'",
-                           cpu->cfg.bext_spec);
-                    return;
-                }
-            } else {
-                qemu_log("bitmanip version is not specified, "
-                         "use the default value v0.93\n");
-            }
-            set_bext_version(env, bext_version);
-        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -584,14 +559,16 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
+    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
+    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
+    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
+    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..77e8b06106 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,7 +67,6 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
-#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -83,7 +82,6 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
 
 enum {
@@ -288,11 +286,14 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
-        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_zba;
+        bool ext_zbb;
+        bool ext_zbc;
+        bool ext_zbs;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.25.1


