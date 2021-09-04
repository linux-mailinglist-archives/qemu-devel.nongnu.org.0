Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57887400CFD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:54:30 +0200 (CEST)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcgH-0006Dq-E9
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcO1-00062w-K7
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:37 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNy-0002yz-Lc
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:37 -0400
Received: by mail-lf1-x136.google.com with SMTP id y34so5328803lfa.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wqsox9YYOmlgC9q1wk77cPlvcrhfgMZHFkpAaB6PE3A=;
 b=owgMIb37WpVqoM+WzHyBO1czvFyUCXMwOcVXgx2AgixHQzUQytxiig3H25/+I7LRDi
 GolwG1y23QbBfRtCQUOzUQ3oJZXIm7H0+ivnkAp/u/s8MEMcUjLhVu8QszXnUc/vAkPJ
 aOh94denyCkER5d1v6c2pz9R1Us8LrmvUicu6c4+/8n8s1OHeDdVC+DIJwGdA4ssjgMA
 fGc4kJ4fybwGZEaUGHXhsPcuaDY//5I99zgqcWvSotR1/N699wBOr1up38HNKv27VscT
 2Rss6/n+qh7Zy8pZ81dLEFuT8V9EmU2MI7Mi4JT3v6wB3AS1QBQNdVt6P8LcxIShxmvj
 aaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wqsox9YYOmlgC9q1wk77cPlvcrhfgMZHFkpAaB6PE3A=;
 b=Q5aQevlh4L3UFOLMngjjEp3rA+8FHLbTplWkbxxHIZ0zMI3EkdbC5L0VNWwe7gwjaF
 DhSOxPEcQlygKlTxvQbUgMSd+luHz6H7TnGHY3aibbioFQoj1MlMd0TVZqIUg5N3BsOd
 lO8poUIA69geLFW67Qz/gAG/GOQ14pJtDC8utv+IqXXJR11ewlXkMmDLBwmwDs81HcU7
 To/369jqIArM+rwlO3Txoxd956J4XsUf/6VyD6CGMUXBdi2wjBQu2UUBCNQvkyglDEVJ
 KxrQr3TAtlsNqUOxY6qBWaetr56QdmNMHAan6p0nDCngkSyq3wDSFQWI87vUKGx4Z4o8
 pgKQ==
X-Gm-Message-State: AOAM531APV+SCnhrX5/2o/+b5RzPloQ1/uYLmhXEjoezcZgWr/9kkDi2
 srgmooDtwaqZJkWbLkpXHBPQ3ne7D2PzwwKLFKA=
X-Google-Smtp-Source: ABdhPJzSh0H2tp6eoYkArpy1olYj0YdU/4ta1aJvxFtvVwLSjnsrz3XnPz08qjoynG/sl68EkQH/1g==
X-Received: by 2002:a05:6512:686:: with SMTP id
 t6mr3934859lfe.49.1630787730735; 
 Sat, 04 Sep 2021 13:35:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:30 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 15/16] target/riscv: Remove RVB (replaced by Zb[abcs])
Date: Sat,  4 Sep 2021 22:35:14 +0200
Message-Id: <20210904203516.2570119-16-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With everything classified as Zb[abcs] and pre-0.93 draft-B
instructions that are not part of Zb[abcs] removed, we can remove the
remaining support code for RVB.

Note that RVB has been retired for good and misa.B will neither mean
'some' or 'all of' Zb*:
  https://lists.riscv.org/g/tech-bitmanip/message/532

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- Removing RVB moved into a separate commit at the tail-end of the series.

 target/riscv/cpu.c         | 26 --------------------------
 target/riscv/cpu.h         |  3 ---
 target/riscv/insn32.decode |  4 ----
 3 files changed, 33 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ceb7e01810..3a56836f1c 100644
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
@@ -496,25 +491,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
-        if (cpu->cfg.ext_b) {
-            int bext_version = BEXT_VERSION_0_93_0;
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
             int vext_version = VEXT_VERSION_0_07_1;
             target_misa |= RVV;
@@ -586,7 +562,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
@@ -597,7 +572,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7c4cd8ea89..77e8b06106 100644
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
@@ -288,7 +286,6 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
-        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index affb99b3e6..2f251dac1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -712,10 +712,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 # instruction, so we use different handler functions to differentiate.
 zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
 
-# *** RV32B Standard Extension ***
-
-# *** RV64B Standard Extension (in addition to RV32B) ***
-
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
-- 
2.25.1


