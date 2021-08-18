Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D63F0CF8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:50:37 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSWC-0000cC-BC
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGSEt-0001Xx-GY
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:32:43 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGSEq-0006xE-Sr
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:32:43 -0400
Received: by mail-lf1-x131.google.com with SMTP id r9so7363676lfn.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8CdU0niWf/a7w4j4XERXvt/5YDd5o5V30t8FBzhOIj8=;
 b=m0OCsy1h2Vwo8IBxp4QsT2mzGdlcChLe+cgshxe6woSX8ljwAqEcqNVF8YaQ0Zc/ZE
 /Cs7h3yfPKqQHuwXHNikE2M0gwz+12W/CcZQDJvYKHU+qf506iF1VPJBWQ4ia+eNIpx8
 Afb0mKt6Dpyz/M35rC3yV4u2R1yjOjRmAKCV3g41x9brfirILNR8Fzn8z05rfJ2BsNVB
 6GR1nwSo2zv82aUNe8yvuHj9ekr/Utv2FweeU8FAjyKCFBLZAvwLnbSFC8erHuzrxpZ5
 v7Hg2fTIU+5c37P6JqGSpVTVQJisxEAy33mV5N7F/Bh8THPgDW95OaVAeko+IZF7o5t8
 kUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8CdU0niWf/a7w4j4XERXvt/5YDd5o5V30t8FBzhOIj8=;
 b=dXSPDH/8XDhF2GWgwRTvWWiW5Wc7FdjGlAMTipZ86cSPXKAPnKZDqQLqrrgfKOGWXB
 7u2emW8DjcQAcTMVURZ/CaYy1U1H57qd7hd5j/YDTOdSziQ65ZuuqF+P9oT/R2wXgVOb
 p0mu9DU2m3ZEOY2P0bOCCu8PxTMyw8poP0kt1kHN1hMkCvt+VsQX5KYuDlMT2/7QnME8
 fsZI7VOlv44w70nbkPsa1+tB2DaeSf6nLpJhQeo05WOUTjzooHtgEu/LHaX4nMq6m+rP
 QRlVUjxo74lqaZ3bzsKODKzxoBg1Xkr20FrkvFkzS2YZmTqO67eCFGLOvdd2alj2RXyN
 efdg==
X-Gm-Message-State: AOAM533BSyof/8PFqp+nrsE63CrTLv3LZttORSdYU3oofHTu0vtL0cM4
 e3k+rY13jtWeNAotB+ud08KXsxQpZboecIj8hHY=
X-Google-Smtp-Source: ABdhPJyYVCH4Eviu3Cu+QMXPQAlUXZ9HZI5q2OUej2PfrO1Eq+rtOuFzNqFJ71zGFU+vbHvTOcM5tA==
X-Received: by 2002:ac2:5b9d:: with SMTP id o29mr7756876lfn.26.1629318758813; 
 Wed, 18 Aug 2021 13:32:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c2sm92831lji.57.2021.08.18.13.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:32:38 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Wed, 18 Aug 2021 22:32:31 +0200
Message-Id: <20210818203233.791599-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
References: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Aug 2021 16:43:43 -0400
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

(no changes since v1)

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


