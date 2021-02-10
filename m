Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97031315F82
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:34:14 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j4n-000352-DC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipB-0001pC-VU; Wed, 10 Feb 2021 01:18:06 -0500
Received: from ozlabs.org ([203.11.71.1]:58655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipA-0000RP-23; Wed, 10 Feb 2021 01:18:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gq1f0rz9sWY; Wed, 10 Feb 2021 17:17:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937863;
 bh=RYUEzEzrJ2xfcxGHKwvhXCnhllTzQI/NcsA5f6qpXRI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LU/7hL5Jfuf98myJNTILDNplnImrdmWYZqnU3nADCO/rrRL/2NtONczoXFLp9ktWK
 dFrAsoCroCI8P84fFsGGSW3B4WxXGYCJq+lJaqVyvAQE5TQk50pe4z2OJYWLSvGZtl
 /Db13V6bTcDxF7UK1f2YxwtaQr91ej1jaVe2gN4o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/19] target/ppc: Add E500 L2CSR0 write helper
Date: Wed, 10 Feb 2021 17:17:35 +1100
Message-Id: <20210210061735.304384-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per EREF 2.0 [1] chapter 3.11.2:

The following bits in L2CSR0 (exists in the e500mc/e5500/e6500 core):

- L2FI  (L2 cache flash invalidate)
- L2FL  (L2 cache flush)
- L2LFC (L2 cache lock flash clear)

when set, a cache operation is initiated by hardware, and these bits
will be cleared when the operation is complete.

Since we don't model cache in QEMU, let's add a write helper to emulate
the cache operations completing instantly.

[1] https://www.nxp.com/files-static/32bit/doc/ref_manual/EREFRM.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>

Message-Id: <1612925152-20913-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h                |  6 ++++++
 target/ppc/translate_init.c.inc | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cb00210288..e73416da68 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1919,6 +1919,7 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_750FX_HID2        (0x3F8)
 #define SPR_Exxx_L1FINV0      (0x3F8)
 #define SPR_L2CR              (0x3F9)
+#define SPR_Exxx_L2CSR0       (0x3F9)
 #define SPR_L3CR              (0x3FA)
 #define SPR_750_TDCH          (0x3FA)
 #define SPR_IABR2             (0x3FA)
@@ -1974,6 +1975,11 @@ typedef PowerPCCPU ArchCPU;
 #define   L1CSR1_ICFI   0x00000002  /* Instruction Cache Flash Invalidate */
 #define   L1CSR1_ICE    0x00000001  /* Instruction Cache Enable */
 
+/* E500 L2CSR0 */
+#define E500_L2CSR0_L2FI    (1 << 21)   /* L2 cache flash invalidate */
+#define E500_L2CSR0_L2FL    (1 << 11)   /* L2 cache flush */
+#define E500_L2CSR0_L2LFC   (1 << 10)   /* L2 cache lock flash clear */
+
 /* HID0 bits */
 #define HID0_DEEPNAP        (1 << 24)           /* pre-2.06 */
 #define HID0_DOZE           (1 << 23)           /* pre-2.06 */
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9867d0a6e4..3ec45cbc19 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -1735,6 +1735,16 @@ static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
 }
 
+static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
+                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+
 static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
@@ -5029,6 +5039,12 @@ static void init_proc_e500(CPUPPCState *env, int version)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_e500_l1csr1,
                  0x00000000);
+    if (version != fsl_e500v1 && version != fsl_e500v2) {
+        spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_e500_l2csr0,
+                     0x00000000);
+    }
     spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
-- 
2.29.2


