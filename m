Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9945DD1E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:16:00 +0100 (CET)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGTf-0004uo-Bk
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:15:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMk-0003Nq-0i; Thu, 25 Nov 2021 10:08:50 -0500
Received: from [2607:f8b0:4864:20::929] (port=44605
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMg-00023q-7M; Thu, 25 Nov 2021 10:08:49 -0500
Received: by mail-ua1-x929.google.com with SMTP id p2so12867879uad.11;
 Thu, 25 Nov 2021 07:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMMYRmFQnYNgkPtDchZ6nLq0mLdtchFnKluavIDwVCM=;
 b=Dcm/9IOnCGh0q+Z1K0Xr4+qJ4YVOGk4lJDKx519EaeasBYSwoXochvJ4i2fUBNmxFy
 sm+oqmFlZ2CJeSok/Ktr5RzCBBRtmQHvpQel6G7rJLhVle+50+Y1pRsVsVAoVbPBMrub
 Ex/YXiC9V+wX1LNFNLCyJ8N1YoVJYvUR7wwQvPEoiKGt0iULBuPIcz9vi2RX1ErSAcYw
 L7VHrZYGEqccQf5p8nPLBdx/PrqIy29+5uRevwEMPwvjyyQCR+/SHZIoEWiM1ozzbU+P
 NS3vBi+98GhAqukLFzTE/2lz9231icU4Av7FJ45W9SWhWoDtylszxc5BzZRAVd8UnADA
 3/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMMYRmFQnYNgkPtDchZ6nLq0mLdtchFnKluavIDwVCM=;
 b=Qi/mXlE6p+GD5RiVh7Rs31EKhgA/P2QP7xcL3pQ5w2xcc5A/m/sJUYNbzGI1pqL08N
 /eRrBa1U4KW7cPjsJ1+At6ytQ281MLVfR8qdCiHglGZzE8WGbQra3u45K8eW+Lm8PnNq
 DRk0f6lZyX2CzLBSR7l/oo6GRQJQX6opnPJggFxN2FPvqgyqtJVTtNfrCms5XgdRgKK+
 LspC58WIzCe7YCFm/Q9IPJfOFk2q11XW5PG58pJo1vPMmUfjG0o/f+qTH9+ZAL5Sohan
 +gKNz/g70Ytphp513zFg+g4vhRCzzGmBlIJx/uZO9YFxdPq7afdflj6GNSlMytYr05+j
 0Epg==
X-Gm-Message-State: AOAM533+c35+bqOxVd8Ad16+o0u1GRoSWVK0CY7Fa2bquo14B7mlH4M5
 3u38YKUL+v4TcUu8Tf3lANHvodACql8=
X-Google-Smtp-Source: ABdhPJxyfZl1981mRcL+nj5TbLbSX2USRfXc71QumAHbXuJIXpS9q3LXHRZfRiRA4CHJf0mXsNfgoA==
X-Received: by 2002:a67:ab4c:: with SMTP id k12mr10097751vsh.73.1637852924833; 
 Thu, 25 Nov 2021 07:08:44 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:44 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/10] PPC64/TCG: Implement 'rfebb' instruction
Date: Thu, 25 Nov 2021 12:08:15 -0300
Message-Id: <20211125150817.573204-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125150817.573204-1-danielhb413@gmail.com>
References: <20211125150817.573204-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An Event-Based Branch (EBB) allows applications to change the NIA when a
event-based exception occurs. Event-based exceptions are enabled by
setting the Branch Event Status and Control Register (BESCR). If the
event-based exception is enabled when the exception occurs, an EBB
happens.

The following operations happens during an EBB:

- Global Enable (GE) bit of BESCR is set to 0;
- bits 0-61 of the Event-Based Branch Return Register (EBBRR) are set
to the the effective address of the NIA that would have executed if the EBB
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

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                       | 13 ++++++++++
 target/ppc/excp_helper.c               | 31 ++++++++++++++++++++++++
 target/ppc/helper.h                    |  1 +
 target/ppc/insn32.decode               |  5 ++++
 target/ppc/translate.c                 |  2 ++
 target/ppc/translate/branch-impl.c.inc | 33 ++++++++++++++++++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 target/ppc/translate/branch-impl.c.inc

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 993884164f..edb4488176 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -393,6 +393,19 @@ typedef enum {
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
index 17607adbe4..7ead32279c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1250,6 +1250,37 @@ void helper_hrfid(CPUPPCState *env)
 }
 #endif
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void helper_rfebb(CPUPPCState *env, target_ulong s)
+{
+    target_ulong msr = env->msr;
+
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
+    /* Switching to 32-bit ? Crop the nip */
+    if (!msr_is_64bit(env, msr)) {
+        env->nip = (uint32_t)env->spr[SPR_EBBRR];
+    }
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
index d8a23e054a..b0535b389b 100644
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
index e135b8aba4..6cad783dde 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -427,3 +427,8 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
 ## VSX Vector Load Special Value Instruction
 
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
+
+### rfebb
+&XL_s           s:uint8_t
+@XL_s           ......-------------- s:1 .......... -   &XL_s
+RFEBB           010011-------------- .   0010010010 -   @XL_s
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d0e361a9d1..d643a83a51 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7467,6 +7467,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/spe-impl.c.inc"
 
+#include "translate/branch-impl.c.inc"
+
 /* Handles lfdp, lxsd, lxssp */
 static void gen_dform39(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/branch-impl.c.inc b/target/ppc/translate/branch-impl.c.inc
new file mode 100644
index 0000000000..29cfa11854
--- /dev/null
+++ b/target/ppc/translate/branch-impl.c.inc
@@ -0,0 +1,33 @@
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
+static bool trans_RFEBB(DisasContext *ctx, arg_XL_s *arg)
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
+static bool trans_RFEBB(DisasContext *ctx, arg_XL_s *arg)
+{
+    gen_invalid(ctx);
+    return true;
+}
+#endif
-- 
2.31.1


