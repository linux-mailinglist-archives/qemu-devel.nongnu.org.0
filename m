Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C85445AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:27:39 +0200 (CEST)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDVy-0003cZ-Md
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nzDSA-0001C4-GC
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:23:42 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50256)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nzDS8-0007VL-Sd
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:23:42 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id AC5D440737BE;
 Thu,  9 Jun 2022 08:23:37 +0000 (UTC)
Subject: [PATCH v2 1/3] target/mips: introduce Cavium Octeon CPU model
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Thu, 09 Jun 2022 11:23:37 +0300
Message-ID: <165476301751.40568.12438882180412050686.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
References: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds Cavium Octeon vCPU for providing
Octeon-specific instructions.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

--
v2 changes:
 - vCPU name changed to Octeon68XX (suggested by Richard Henderson)
---
 target/mips/cpu-defs.c.inc |   28 ++++++++++++++++++++++++++++
 target/mips/mips-defs.h    |    1 +
 2 files changed, 29 insertions(+)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 582f940070..7f53c94ec8 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -921,6 +921,34 @@ const mips_def_t mips_defs[] =
         .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSP_R2,
         .mmu_type = MMU_TYPE_R4000,
     },
+    {
+        /*
+         * Octeon 68xx with MIPS64 Cavium Octeon features.
+         */
+        .name = "Octeon68XX",
+        .CP0_PRid = 0x000D9100,
+        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
+                       (MMU_TYPE_R4000 << CP0C0_MT),
+        .CP0_Config1 = MIPS_CONFIG1 | (0x3F << CP0C1_MMU) |
+                       (1 << CP0C1_IS) | (4 << CP0C1_IL) | (1 << CP0C1_IA) |
+                       (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
+                       (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
+        .CP0_Config2 = MIPS_CONFIG2,
+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
+        .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
+                       (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
+                       (3U << CP0C4_MMUSizeExt),
+        .CP0_LLAddr_rw_bitmask = 0,
+        .CP0_LLAddr_shift = 4,
+        .CP0_PageGrain = (1 << CP0PG_ELPA),
+        .SYNCI_Step = 32,
+        .CCRes = 2,
+        .CP0_Status_rw_bitmask = 0x12F8FFFF,
+        .SEGBITS = 42,
+        .PABITS = 49,
+        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
+        .mmu_type = MMU_TYPE_R4000,
+    },
 
 #endif
 };
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 0a12d982a7..a6cebe0265 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -42,6 +42,7 @@
 #define INSN_LOONGSON2E   0x0000040000000000ULL
 #define INSN_LOONGSON2F   0x0000080000000000ULL
 #define INSN_LOONGSON3A   0x0000100000000000ULL
+#define INSN_OCTEON       0x0000200000000000ULL
 /*
  *   bits 52-63: vendor-specific ASEs
  */


