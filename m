Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECC201911
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 19:08:59 +0200 (CEST)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmKVe-0002Iz-Rz
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 13:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUE-0000hd-Sl
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:30 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUC-0004PZ-AX
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592586448; x=1624122448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZQTwToslAoo6RGSrCI1CsH1WLRCehMn1IkQjkbVRhY=;
 b=i/Gd9g8c4lahAuWieLBDIWlL03rvKfuFq4t7MjN+MoNsGLGSJqKlaodH
 S9q+ySQ4s14pRd80llBJ/WLoIws9XukiK9DGN9mSUSJuSL5Yw92i/djVN
 qfffST47a0Hnuk8QSIqeswl4aS7bO9dVesxcmpz/pqtsydF97qgTQKrx8
 0eVHO35ak8bB+Uf04+j5GDpvHIRZYDiYNYlbMyeQ+bVTgIm4HW3IQM1ts
 yeD/OT/59bdmgqEWpIElELB5CKA3b1lGMsamCM7D2XjVGCJQ8Kwi3DS+R
 8EqEsFsFGZDtdf92nkL+z6qyU5h8w5tdCa7bkR54q/y1FH64cShy/33ry A==;
IronPort-SDR: aLspBdsesnZc9rLNcYQ7OKvQg+wi9uXd16GtbWC01/iLWReWNwrQuzd9b2H0xsHXlPfOVK1yKJ
 cuyqAlbJsmcaHGrOYN5SzUrkVUSwyt8S5GXrPB8NLPm0UQCS1G2KnPj7fHQOidtPurUN4BGXrI
 d+NtkMJdqBuQosp6ne2yppMARKmmIJ030s8GhbbriTLjJHHU80o8Cd5kHeGrBGWbQ+J9SuCFiB
 7sHbUm0ocrfakZECWypM7FoxTTRDusmLZag/ex9WWbOnMEPJ1QmKSklfdwAES2UuQQQ2ET3+ly
 g7Y=
X-IronPort-AV: E=Sophos;i="5.75,256,1589212800"; d="scan'208";a="144763305"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2020 01:07:22 +0800
IronPort-SDR: UjaGOvOP5AfCZ52ITyiowKKFFenlY+Jkq+t9GpRpIEORX8VtPYdwjHn/zfsQQOX4D64CLjgi3c
 xMpKK5fI4Gw4U1/evwdEW5Hv5oYXBF26s=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:55:59 -0700
IronPort-SDR: Ng+q+TvM15u7FZa1Q4jh4oUDNuT9rV6JmqcnHVj0assR4UmGvOjkiAz1KeF1VypWFEmUS/3q/7
 CCRGvXjwCckA==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 10:07:22 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 04/32] riscv: Generalize CPU init routine for the gcsu CPU
Date: Fri, 19 Jun 2020 09:57:49 -0700
Message-Id: <20200619165817.4144200-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619165817.4144200-1-alistair.francis@wdc.com>
References: <20200619165817.4144200-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 13:07:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is no need to have two functions that have almost the same
codes for 32-bit and 64-bit gcsu CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <1591837729-27486-2-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 81cdea8680..437e141ef2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -134,16 +134,16 @@ static void riscv_base_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
-#if defined(TARGET_RISCV32)
-
-static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
+static void rvxx_gcsu_priv1_10_0_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
+#if defined(TARGET_RISCV32)
+
 static void rv32imcu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -173,14 +173,6 @@ static void rv32imafcu_nommu_cpu_init(Object *obj)
 
 #elif defined(TARGET_RISCV64)
 
-static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
-{
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
-}
-
 static void rv64imacu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -599,11 +591,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_gcsu_priv1_10_0_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64imacu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64gcsu_priv1_10_0_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_gcsu_priv1_10_0_cpu_init),
 #endif
 };
 
-- 
2.27.0


