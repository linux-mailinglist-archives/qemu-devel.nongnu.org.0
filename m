Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7F1E6F10
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 00:32:29 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeR4e-0006la-0T
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 18:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQvc-0002W5-2U; Thu, 28 May 2020 18:23:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:43649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQvV-0005sD-Er; Thu, 28 May 2020 18:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1590704581; x=1622240581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSfmtlnUPoc+DRubFLCIUkLA+JbOhAPeXjCFaLFXhWU=;
 b=OUdeqHPrvJYM5tdy7JYyG81wBZmqkcfYHup7GrvvDbxS/6RLPUGJdNa8
 V+fpqq1WkB1Y6VnrQU8eDZy57+Oq6w2w643wKINRRL5sLwXwo6JQaLOjM
 3O3vjAAV8C2UvK9ulcuKPECrwwAjO/CR51YNjRgkT3nRPJrfiA2dbX9iN
 EU7qTpoGegGhyiDvGrmSIo1I5UmmrJISC2UL0pnUy8ElIr5wGukW1ShuW
 y483g+K5L+gtVFzgXc2e4YOMjE1+5D5xWVxh+Wo/d8aorT9z6xP61Hake
 W3l6ey/xud6hpQUWncDxw7SPA9+e5bVCPgYORXb0IJLT+NYq3V9riTr41 Q==;
IronPort-SDR: ln0A5ObGoC+Yzz6waLULf+0x5shLZDgDvVfMXEyUHxt2EytBnq3zHhn+EQlhWQmKgHBYKmSRwZ
 +nvQ1kZXyd6mimQEruJJDGsWwlJwrU5fVGVlRxm0D2f6dDY9C55LWY9AMH/T03zgcqBwIrZfNB
 x7xxMhlbkSWzg44W+CcY6g+lcGdENY1kncS3PraeaGKCUmemL3OFEreETnNc/LV7YIRNTLZbXT
 KDgkrOWj4km1LSacu7ItlxxHjslJzQogcM8JpRzhs7a7w4d7zaSB+Ca2/lpym7CG1eb02kAHya
 dzg=
X-IronPort-AV: E=Sophos;i="5.73,446,1583164800"; d="scan'208";a="138744575"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2020 06:22:56 +0800
IronPort-SDR: uTjoFDptbKPmoCSvnlLTc/mL70a4axeBK+RMRLj1IeCRW6dPcfAxC5reVb0evbpsR6wgRTrYqu
 FCAtpGax3By18t7TzjJk25Xqu9vXcVECI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 15:12:44 -0700
IronPort-SDR: E9C9vKZeKL2aOAAwffPzF732LUHxvBQXhMilpzt8PheUW+OQ/Uhr5duhRJTAPatzd5JhR+QwHX
 mK0FufewaG5w==
WDCIronportException: Internal
Received: from 6xf7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.123])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 May 2020 15:22:57 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 05/11] target/riscv: Add the lowRISC Ibex CPU
Date: Thu, 28 May 2020 15:14:20 -0700
Message-Id: <92832b1e7fc59b4728fd47f7c59456525e6c1936.1590704015.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590704015.git.alistair.francis@wdc.com>
References: <cover.1590704015.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=4104b2603=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:22:54
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ibex is a small and efficient, 32-bit, in-order RISC-V core with
a 2-stage pipeline that implements the RV32IMC instruction set
architecture.

For more details on lowRISC see here:
https://github.com/lowRISC/ibex

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0e7f5b9c5..8733d7467f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -35,6 +35,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 406e8f37d7..6e0d4d1dda 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -152,6 +152,15 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
+static void rv32imcu_nommu_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_resetvec(env, 0x8090);
+    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+}
+
 static void rv32imacu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -611,6 +620,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
-- 
2.26.2


