Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA13F62E6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:42:39 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZVW-0003fB-Ic
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKT-0008FK-6k; Tue, 24 Aug 2021 12:31:14 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKQ-0008W2-P8; Tue, 24 Aug 2021 12:31:12 -0400
Received: by mail-qk1-x731.google.com with SMTP id 22so23825229qkg.2;
 Tue, 24 Aug 2021 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+VhE1dALRmRsR0ovucIXjRJS8VtVL0h+ezrsS9kNGwY=;
 b=aVLHdQmaVnTYw3AzzdTU1GP2FROe1UwX+3eZMileqh6Yf050KpRviHD2Ur2ArSXBLa
 xA861UoWuUQueqQKllwwZ/wOJbmpPt8APZgJ/aoqe0AJsuuI6ldgv9S5hGAojHiaXlzy
 nxwalV1X6Pt0dt5ijnSJftmOW9gabevKHJspQAF8tjpvZnuepA42cCKIVa0UoOdaTGlp
 gbVW8wrF+6n2Z68KdlSmDNG9j5nGhMx+Tycd1WE23xehS+jyoRQeM9+Ml84O1gkNo0Wy
 UF1AQutYBMWCTywBX3otvMDIwE+Nu2pRmIHcVh9I3jE/Twv5zqa3+bRX4jkc13C1G101
 5AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+VhE1dALRmRsR0ovucIXjRJS8VtVL0h+ezrsS9kNGwY=;
 b=f3XegUCWJr4sx9BcVMuEGINlXLHP/yTyWlZvhlDjZ5GDykYJw8FthozuCnEh2l82hf
 M/AstD26JHdP2VQB/AjmYxlldvAVgeYnKxiv0eDXiiLhS4iimigLDRfQcqMwfNOIwk1n
 KqwdwU977FW2pePnwapvNg2rFB0cE1ezRDqbzcO52BwP2ZG9khfIBw1wJltho/Hyl/Ae
 grGA8tTqcmesOkvhH2M5GayFvXkI2D6d4KvA383017UOZebHpOx9zB7WopHPA/bTuDr6
 a8estSQOYYZZTIgScS/ROqMKK4OPZI37A3KWLu6o0Kg72UHI1QL0yjZA5QDIEyWY/yUc
 2Elg==
X-Gm-Message-State: AOAM532FJcYK9cyY2t7z3VMJ+Sw/sHUW3GY7yY0O4yIc6dkNG6U+JKjq
 Hn7AgHOu6AHKRTUWy9u9xjEe/OAT3ZA=
X-Google-Smtp-Source: ABdhPJxjDyBVLzKUPjaFH2uioZBNkVZDf/Qh841XBTYJZb+CjOrGEEoCn+4BE6Y+vBupfDY5zhDEeg==
X-Received: by 2002:a05:620a:38d:: with SMTP id
 q13mr15644360qkm.87.1629822669065; 
 Tue, 24 Aug 2021 09:31:09 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] PPC64/TCG: Implement 'rfebb' instruction
Date: Tue, 24 Aug 2021 13:30:25 -0300
Message-Id: <20210824163032.394099-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An Event-Based Branch (EBB) allows applications to change the NIA when a
event-based exception occurs. Event-based exceptions are enabled by
setting the Branch Event Status and Control Register (BESCR). If the
event-based exception is enabled when the exception occurs, an EBB
happens.

The EBB will:

- set the Global Enable (GE) bit of BESCR to 0;
- set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to the
  effective address of the NIA that would have executed if the EBB
  didn't happen;
- Instruction fetch and execution will continue in the effective address
  contained in the Event-Based Branch Handler Register (EBBHR).

The EBB Handler will process the event and then execute the Return From
Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
redirects execution to the address pointed in EBBRR. This process is
described in the PowerISA v3.1, Book II, Chapter 6 [1].

This patch implements the rfebb instruction. Descriptions of all
relevant BESCR bits are also added - this patch is only using BESCR_GE,
but the next patches will use the remaining bits.

[1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                       | 13 +++++++++++
 target/ppc/excp_helper.c               | 24 +++++++++++++++++++
 target/ppc/helper.h                    |  1 +
 target/ppc/insn32.decode               |  5 ++++
 target/ppc/translate.c                 |  2 ++
 target/ppc/translate/branch-impl.c.inc | 32 ++++++++++++++++++++++++++
 6 files changed, 77 insertions(+)
 create mode 100644 target/ppc/translate/branch-impl.c.inc

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 105ee75a01..9d5eb9ead4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,19 @@ typedef struct ppc_v3_pate_t {
 /* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
 #define CTRL_RUN PPC_BIT(63)
 
+/* EBB/BESCR bits */
+/* Global Enable */
+#define BESCR_GE PPC_BIT(0)
+/* External Event-based Exception Enable */
+#define BESCR_EE PPC_BIT(30)
+/* Performance Monitor Event-based Exception Enable */
+#define BESCR_PME PPC_BIT(31)
+/* External Event-based Exception Occurred */
+#define BESCR_EEO PPC_BIT(62)
+/* Performance Monitor Event-based Exception Occurred */
+#define BESCR_PMEO PPC_BIT(63)
+#define BESCR_INVALID PPC_BITMASK(32, 33)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7b6ac16eef..058b063d8a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1281,6 +1281,30 @@ void helper_hrfid(CPUPPCState *env)
 }
 #endif
 
+#ifdef CONFIG_TCG
+void helper_rfebb(CPUPPCState *env, target_ulong s)
+{
+    /*
+     * Handling of BESCR bits 32:33 according to PowerISA v3.1:
+     *
+     * "If BESCR 32:33 != 0b00 the instruction is treated as if
+     *  the instruction form were invalid."
+     */
+    if (env->spr[SPR_BESCR] & BESCR_INVALID) {
+        raise_exception_err(env, POWERPC_EXCP_PROGRAM,
+                            POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL);
+    }
+
+    env->nip = env->spr[SPR_EBBRR];
+
+    if (s) {
+        env->spr[SPR_BESCR] |= BESCR_GE;
+    } else {
+        env->spr[SPR_BESCR] &= ~BESCR_GE;
+    }
+}
+#endif
+
 /*****************************************************************************/
 /* Embedded PowerPC specific helpers */
 void helper_40x_rfci(CPUPPCState *env)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 47dbbe6da1..91a86992a5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -18,6 +18,7 @@ DEF_HELPER_2(pminsn, void, env, i32)
 DEF_HELPER_1(rfid, void, env)
 DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
+DEF_HELPER_2(rfebb, void, env, tl)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9fd8d6b817..bd0b88b0b6 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -124,3 +124,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
+
+### rfebb
+&RFEBB          s:uint8_t
+@RFEBB          ......-------------- s:1 .......... -   &RFEBB
+RFEBB           010011-------------- .   0010010010 -   @RFEBB
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d45ce79a3e..d4cfc567cf 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7643,6 +7643,8 @@ static int times_4(DisasContext *ctx, int x)
 
 #include "translate/spe-impl.c.inc"
 
+#include "translate/branch-impl.c.inc"
+
 /* Handles lfdp, lxsd, lxssp */
 static void gen_dform39(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/branch-impl.c.inc b/target/ppc/translate/branch-impl.c.inc
new file mode 100644
index 0000000000..2e309e9889
--- /dev/null
+++ b/target/ppc/translate/branch-impl.c.inc
@@ -0,0 +1,32 @@
+/*
+ * Power ISA decode for branch instructions
+ *
+ *  Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+static bool trans_RFEBB(DisasContext *ctx, arg_RFEBB *arg)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
+
+    gen_icount_io_start(ctx);
+    gen_update_cfar(ctx, ctx->cia);
+    gen_helper_rfebb(cpu_env, cpu_gpr[arg->s]);
+
+    ctx->base.is_jmp = DISAS_CHAIN;
+
+    return true;
+}
+#else
+static bool trans_RFEBB(DisasContext *ctx, arg_RFEBB *arg)
+{
+    return true;
+}
+#endif
-- 
2.31.1


