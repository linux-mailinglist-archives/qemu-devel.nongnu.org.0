Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B3315D85
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 03:47:38 +0100 (CET)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9fXV-0006Fn-Fm
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 21:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9fW2-0005id-EM; Tue, 09 Feb 2021 21:46:06 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9fVy-0002W6-H2; Tue, 09 Feb 2021 21:46:06 -0500
Received: by mail-ej1-x62a.google.com with SMTP id i8so1280069ejc.7;
 Tue, 09 Feb 2021 18:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=f3++r5LJ1WwwMcBMfnnMLGisNcVCYzFSbnavgR/sYWc=;
 b=B+JYuV8+h5C/eVb8HP04dOaWwS8FFQ/sYKHrqtLLY9tb65vsPfQFd1X7mBiDLEv3vJ
 UCB2z3UwbeeFGhFHrLs1p9P4phh6/26beWirxDq8PBXBvog/5EpeyHWC8irjUz46YZ17
 olsZyGv5TziblMp5Myav7OB0rQxZtCk9/zTi0TMb23WAhSh81QlmAYW8GsJNgqaA8Mli
 H1dSYYr2t3VRCah7tMw7Gspsm06588VRVNL6u6NTdL4RmnLIvrF4NPUsEs15yBDhRqop
 I0Y9r4BjYuUSTb4U4FNgn8VuavleZEMA+jZvaIXEVwm7BVH1q/GtlJcMuvoBOpe/zaMu
 foRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=f3++r5LJ1WwwMcBMfnnMLGisNcVCYzFSbnavgR/sYWc=;
 b=ISUFl1DnVhHlc+AM92sKpAEM5jmDz/Gai4Z55kTL+e21VJHfdSXbWCUj7KUGUWXh8J
 icPCB9Oo9kmPkJMznqfPpyt4d6aZctp7aPUjKjFVKBcQ9pkrhYAirPuZip3Aapu52+ZW
 dv2/ojsHhc1oBdrFez1D1ydJiuO6j2p0Z1Zvpp2odHfpGoZYPLlzIURMs15JPH7tiuKE
 o+U6H0rXT2Rg9zBntJKcC5PkRD84QY2nur9vK6jyK1pEmRQJFjK+gpYoBCPO9JhB8UJA
 koTh2yJ9b8+4Z223uFJLDhl7gVmRy5xGFQICQpyLQxabrjto+ljOEre4FcznKaSdmDZM
 aRlg==
X-Gm-Message-State: AOAM5317+x8tPPM8cF0WuUkBw7XLqeSxYHzJylN8tBnUCswSn+psEh5w
 64YVTOmNWBFXwJ4bJullsmM=
X-Google-Smtp-Source: ABdhPJzImtiBfxK5tVBGUAIb9a2v8fETqmYN18zsl31go+t0EStXHX7ljLmAV+NkmQ8fVPNxU439wg==
X-Received: by 2002:a17:907:d25:: with SMTP id
 gn37mr725126ejc.303.1612925160448; 
 Tue, 09 Feb 2021 18:46:00 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b17sm154405edv.56.2021.02.09.18.45.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 18:46:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH v2] target/ppc: Add E500 L2CSR0 write helper
Date: Wed, 10 Feb 2021 10:45:52 +0800
Message-Id: <1612925152-20913-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
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

---

Changes in v2:
- Add Freescale manual link and clarifications in the commit message

 target/ppc/cpu.h                |  6 ++++++
 target/ppc/translate_init.c.inc | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e40..e77911a 100644
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
index 9867d0a..3ec45cb 100644
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
2.7.4


