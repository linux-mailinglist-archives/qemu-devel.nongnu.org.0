Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0C40789E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:06:49 +0200 (CEST)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3ea-0002Pg-VM
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3Ya-0002SI-IX
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:36 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YY-0005iE-LA
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:36 -0400
Received: by mail-lf1-x12b.google.com with SMTP id h16so10350962lfk.10
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V3Di16mq3sAs/SIti4HFdegqnnEikGmGzYCGubw18Mk=;
 b=QKYnUBDfL3500v/EF20idN5kwTf9zDgTOizUW6DqW94CRZ9P5qfC9rFCt1E0MO+mlL
 5PlE030NVu6x7t1cBLGoGqiId+B8KnglO/mVpthhe99AM+D9ywG98JKPaW19hQAgef5y
 iPkuJeCFzmfK9zW6M1WBoRL/rpMbCGwj5ng5sjy3DKgBUYbxrTJ1cl1qcX/pgTuvi4+J
 voOIWNXkj6SSasiIk/F1I0tacudInSWlr5ITuZIeknESzpBvCNk3aeistL59Lx30Qd9V
 KvJkh1H59haw95DbTMHPVN/Iecb9RjOzSCi3zbXP9SiSDK8dDRx4BmTYeGIq2kQXnBpw
 d2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V3Di16mq3sAs/SIti4HFdegqnnEikGmGzYCGubw18Mk=;
 b=3i60m/Fn1sigtBK36CdNbz2yv1CFGwkxQdTKJyY2ayTLq2BTHKfub5e92vnFsy1rHU
 kTLWhu+ZkCKusIr6bzej0i2BgFkGkhhOx9PWa1DZ3DVAvTAN/iw/EvgCuqRPxcloAesN
 wOSJfC0eMHZ+31k9QdvKEChAr3I5IGkrWZd4v8S4JfUMOTi/jgOaxrfv2lLEubXEm3h2
 srKyfU+NQqa2TqI+SuVWyKJiDRA11+UH0tN7IrfAvGqoplTjCZ0qdu6QX5qDE1kvLZk+
 H/W6iotDCC391HcnwIF+OXGtgV13eWADGBHaRDe+CrBJMGZWYYE+9/4/n7cx4BYphv6x
 TQOw==
X-Gm-Message-State: AOAM5312+6NkZekt8HF7sSduVc8tWxOwMHLJV0XxaLgi2f3FnoqTCvFM
 Se3f2KSqEGQbXQGmMtKla30QrqEKpmBd8q3q
X-Google-Smtp-Source: ABdhPJz0IR9HZTOdhbiq3Kq1YRi8t0hyibFzFwI5LtLC0tSwPkujISPgfZ1PfWGLeMGCG5+DQSR6jA==
X-Received: by 2002:a05:6512:c15:: with SMTP id
 z21mr2239846lfu.193.1631368832242; 
 Sat, 11 Sep 2021 07:00:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:32 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 15/16] target/riscv: Remove RVB (replaced by Zb[abcs])
Date: Sat, 11 Sep 2021 16:00:15 +0200
Message-Id: <20210911140016.834071-16-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


