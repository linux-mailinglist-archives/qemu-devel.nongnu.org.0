Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B640618340D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 16:05:17 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCPOd-0003RD-Tj
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 11:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCPN1-0002Uc-0o
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:03:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCPMu-0002Fn-3T
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:03:34 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43894)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCPMt-0002BA-Iu; Thu, 12 Mar 2020 11:03:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07501148|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_alarm|0.0122184-0.000164815-0.987617; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=11; RT=11; SR=0;
 TI=SMTPD_---.H-NBThK_1584025395; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-NBThK_1584025395)
 by smtp.aliyun-inc.com(10.147.40.26); Thu, 12 Mar 2020 23:03:15 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v5 02/60] target/riscv: implementation-defined constant
 parameters
Date: Thu, 12 Mar 2020 22:58:02 +0800
Message-Id: <20200312145900.2054-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: guoren@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vlen is the vector register length in bits.
elen is the max element size in bits.
vext_spec is the vector specification version, default value is v0.7.1.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 7 +++++++
 target/riscv/cpu.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c0b7023100..6e4135583d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -106,6 +106,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
+static void set_vext_version(CPURISCVState *env, int vext_ver)
+{
+    env->vext_ver = vext_ver;
+}
+
 static void set_feature(CPURISCVState *env, int feature)
 {
     env->features |= (1ULL << feature);
@@ -364,6 +369,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
+    int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -389,6 +395,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
+    set_vext_version(env, vext_version);
     set_resetvec(env, DEFAULT_RSTVEC);
 
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0c1f7bdd8b..603715f849 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -84,6 +84,8 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
+#define VEXT_VERSION_0_07_1 0x00000701
+
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
@@ -119,6 +121,7 @@ struct CPURISCVState {
     target_ulong guest_phys_fault_addr;
 
     target_ulong priv_ver;
+    target_ulong vext_ver;
     target_ulong misa;
     target_ulong misa_mask;
 
@@ -281,6 +284,8 @@ typedef struct RISCVCPU {
 
         char *priv_spec;
         char *user_spec;
+        uint16_t vlen;
+        uint16_t elen;
         bool mmu;
         bool pmp;
     } cfg;
-- 
2.23.0


