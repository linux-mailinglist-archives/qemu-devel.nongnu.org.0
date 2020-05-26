Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F264A1DCC67
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 13:49:57 +0200 (CEST)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbji1-0005dP-2i
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 07:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbjhJ-0005Ac-MM; Thu, 21 May 2020 07:49:13 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbjhI-0002Kw-Gq; Thu, 21 May 2020 07:49:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06436846|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0241358-8.11644e-05-0.975783;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03309; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.Hbeu8eH_1590061747; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hbeu8eH_1590061747)
 by smtp.aliyun-inc.com(10.147.41.120);
 Thu, 21 May 2020 19:49:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 62/62] target/riscv: configure and turn on vector extension
 from command line
Date: Thu, 21 May 2020 17:44:13 +0800
Message-Id: <20200521094413.10425-63-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 05:19:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vector extension is default off. The only way to use vector extension is
1. use cpu rv32 or rv64
2. turn on it by command line
   "-cpu rv64,x-v=true,vlen=128,elen=64,vext_spec=v0.7.1".

vlen is the vector register length, default value is 128 bit.
elen is the max operator size in bits, default value is 64 bit.
vext_spec is the vector specification version, default value is v0.7.1.
These properties can be specified with other values.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
 target/riscv/cpu.h |  4 +++-
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 74fc21b1c8..aff3bc4067 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -405,7 +405,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
-    set_vext_version(env, vext_version);
     set_resetvec(env, DEFAULT_RSTVEC);
 
     if (cpu->cfg.mmu) {
@@ -473,6 +472,45 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_v) {
+            target_misa |= RVV;
+            if (!is_power_of_2(cpu->cfg.vlen)) {
+                error_setg(errp,
+                        "Vector extension VLEN must be power of 2");
+                return;
+            }
+            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
+                error_setg(errp,
+                        "Vector extension implementation only supports VLEN "
+                        "in the range [128, %d]", RV_VLEN_MAX);
+                return;
+            }
+            if (!is_power_of_2(cpu->cfg.elen)) {
+                error_setg(errp,
+                        "Vector extension ELEN must be power of 2");
+                return;
+            }
+            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
+                error_setg(errp,
+                        "Vector extension implementation only supports ELEN "
+                        "in the range [8, 64]");
+                return;
+            }
+            if (cpu->cfg.vext_spec) {
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
+                    vext_version = VEXT_VERSION_0_07_1;
+                } else {
+                    error_setg(errp,
+                           "Unsupported vector spec version '%s'",
+                           cpu->cfg.vext_spec);
+                    return;
+                }
+            } else {
+                qemu_log("vector verison is not specified, "
+                        "use the default value v0.7.1\n");
+            }
+            set_vext_version(env, vext_version);
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -510,10 +548,14 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bed3ec32b9..660b98ec1c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -99,7 +99,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
-#define RV_VLEN_MAX 512
+#define RV_VLEN_MAX 256
 
 FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
@@ -286,12 +286,14 @@ typedef struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
 
         char *priv_spec;
         char *user_spec;
+        char *vext_spec;
         uint16_t vlen;
         uint16_t elen;
         bool mmu;
-- 
2.23.0


