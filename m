Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6C37A4E5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:46:08 +0200 (CEST)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPtu-0003mU-I9
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXf-00038u-TW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXZ-0006V6-3R
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728580; x=1652264580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQcSS1oSxULsvx3rcazGUleTjavqMGxioohI8At+Ha4=;
 b=ApZW1oVHV7YJ2mN3DelI9/mkvO9sptnVfjfyK8k/h3sMEcZjwyyq7B8Z
 ujmTzcmcRcoeIjGl7VBsAVMrPgBK0OmzE2XlxwZ5U1K+etiLNCAgejdfl
 sYBEnAq3WAF5c2Hg2IAnbqZoMJ+t5wF/ngXeKsVZs8A0KjjnwJrX2mGRe
 SkBAHt9jACvwAOfJKHTWIfXG2Tz3cygRDw//bJVGTtqgoHmTLnbtxNZJf
 pWtTBqb34f5oCETtv6W9CY/lQTPH+mdHrn7pnkeadAyy5fhucyIWav4eK
 QjzOLyvtSmOCvt0+25629gkk0g+8K0zfwFGZL6FDNJ8LsRxlwbxUXPW+9 A==;
IronPort-SDR: inYaC1VYrM4fJzMvRjQhh3pmuRIY4uqbm0SJbgs0nRy7zUYLeUt72ifDRWv+mt7skLwl90D2BS
 lJ7b2RKwsGgEueuzMzo9wJNoClN93a2Zq1bF6OU7qyX2nCR/w8MFAUusvrfmUO1RUWM1JgV4e4
 sy7FHiepZYZ+ftf8AA1yYGm/O9JBHgomBdxtPZw27/halghfzilRQPUjlf5hCed0JggCZuKC8T
 JIxMqeuSaKqKJc8y5Lzt/8oZzGZ4Ruzy4gC+0XigGPoS+RgfhzYC751yXHxXA/cuV93pBFxD7l
 3Co=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735499"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:56 +0800
IronPort-SDR: b+LmsIBPBaaJ10CS1U+dlI5UKhT29QIW6hEY9dSERZ13+xZyhwbLfhQeffwxbB1qesZ79U2cRX
 pCUm/NnambXml2j6gOzdus8LE+i6H3zEBGVJ9CzEBpl1AhygJOCXf9H43jDgDZGVnsZAJqG/fy
 wbw7Ln95JigyE/0/J/w9XTG/M5IrWAukzXh4MLLoGRTgMumOm4MyL0qr+rsAdmClxA6dFv/CUI
 7F7C6EXo7e3uyett3jw7KZOzvGJuH45vNZOwt76uPFiXvwW/3vBohYnsXhNYZ4Fd66/Hu22GAo
 AjpL1KQ+vsSLwufvOIiZayqE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:56 -0700
IronPort-SDR: /deeAPNDNxMPf7NPp07z+L1uXv9dt1UqHYfjkBL1skS9cNEbVYmm7rtzUhaBoOuR9VUBFqsgxC
 q9vTixAvtFwE2laKaVVMfmcCUUHaTG1XLbV37+hmWYwwFQp5/0nuRg0t0FZHsx7Zq0ak1w0aC9
 EBN8VjC2zJ5mxrK7bgBf4NDVo/18up7rbenW4WttXNnNRvTXoqQObyspyVCLR/gyrN278zSw0/
 V5IIbSroRdQRccXul3LHEH2TML4PubiX5+984hifF358UmUOXSZHkcxDlbNCwTmWC/yG7omQbl
 YbE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 35/42] target/riscv: Remove the hardcoded HGATP_MODE macro
Date: Tue, 11 May 2021 20:19:44 +1000
Message-Id: <20210511101951.165287-36-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 665f624bfdc2e3ca64265004b07de7489c77a766.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3a0e79e545..d738e2fdbd 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -195,17 +195,6 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
 
-#if defined(TARGET_RISCV32)
-#define HGATP_MODE           SATP32_MODE
-#define HGATP_VMID           SATP32_ASID
-#define HGATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define HGATP_MODE           SATP64_MODE
-#define HGATP_VMID           SATP64_ASID
-#define HGATP_PPN            SATP64_PPN
-#endif
-
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1018c0036d..d9defbdd34 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -413,8 +413,13 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 0;
     } else {
-        base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
-        vm = get_field(env->hgatp, HGATP_MODE);
+        if (riscv_cpu_is_32bit(env)) {
+            base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP32_MODE);
+        } else {
+            base = (hwaddr)get_field(env->hgatp, SATP64_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP64_MODE);
+        }
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
@@ -618,16 +623,17 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 bool first_stage, bool two_stage)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions;
+    int page_fault_exceptions, vm;
+
     if (first_stage) {
-        page_fault_exceptions =
-            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->satp, SATP_MODE);
+    } else if (riscv_cpu_is_32bit(env)) {
+        vm = get_field(env->hgatp, SATP32_MODE);
     } else {
-        page_fault_exceptions =
-            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->hgatp, SATP64_MODE);
     }
+    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         if (riscv_cpu_virt_enabled(env) && !first_stage) {
-- 
2.31.1


