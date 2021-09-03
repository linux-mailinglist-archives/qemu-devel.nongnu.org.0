Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D14006B9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:38:03 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFwo-0004yW-Hd
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqr-0002o5-9g; Fri, 03 Sep 2021 16:31:56 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqo-0001fZ-PF; Fri, 03 Sep 2021 16:31:53 -0400
Received: by mail-qv1-xf29.google.com with SMTP id a5so401325qvq.0;
 Fri, 03 Sep 2021 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+cvvL99f00Qdh0xMkYNslUG7698X+Rt8hPlxanQtzUo=;
 b=a+X6WSBVJW2+dAsyZup/DHbM42A63wfUjpM9kNkFHta8AqjGE9rZUZb1PzdyM/Y8Q1
 moyGzXplPIkN84KPwDIb/HRK2p82GCQTsEQLcSe60sFCKQL4P3TxvauXAbxMMS0BByQT
 kf3iq71+CoWnr6Kvu4exnUlSMQ8rZqXMNmXKShkS/QQ0ROZeX6YoMfTeaFxGgL2bT34f
 kfbdqgq03vYvQ31cxnHm4yrzHcH11zmIzZmbtdRC/AnzzTujW5bDJBGExZ/elJhiNWL+
 gjlYeXROAj4ZzFquMem5VSzfmhuQtDhJJV8uMDtyqPvSJFJYSE5oyDtFciNcWPYvKocR
 H0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+cvvL99f00Qdh0xMkYNslUG7698X+Rt8hPlxanQtzUo=;
 b=ZXmv6vgVdsxCYsNRSEZbojaarwXZs5IPXda2BClLlc2+qR6sybAoXcVjcj2MqHqj8o
 vILAyt2VLGENm/3/s1/XnJZrGsFe0RpQBDGhd5AeLyjOVQQA0uk515uVWpiLsx8KhBWB
 d58Mxqtv+GFSJZv47oOf+0wGC1OjZw2WlVWQa20vtZPv/5V+78cfnZ7tdWcmRclchW4L
 1UYaHk9ObRC5kiWKMti6Bdb8Xmkf7pfEmtae+4tgDajedZm8XUGRU8F/GdZebtQLrMtW
 cdiQUGF/mNlWDNec66g+Eumk08mR/nCgVrgbBY5tOXMABYN2JSBR4buwNz671VWCwyR1
 cpAA==
X-Gm-Message-State: AOAM531uQ3EQL5uFvkuWCC0Q0ORB++pil1b78L55YF4zaVF/evjOe2DP
 187Vd0pKqIlN1z8CLl3xLkFBoL1/z5M=
X-Google-Smtp-Source: ABdhPJwLtFxLKcB7SeI6APyWRpKMSzhOAcsuyILPXTxGnkp3n/xUTEFE9JachQLOi0jERF10qChkYA==
X-Received: by 2002:a05:6214:104e:: with SMTP id
 l14mr927675qvr.45.1630701109072; 
 Fri, 03 Sep 2021 13:31:49 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/15] PPC64/TCG: Implement 'rfebb' instruction
Date: Fri,  3 Sep 2021 17:31:09 -0300
Message-Id: <20210903203116.80628-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf29.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
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
index 93f4a46827..26624508fa 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -368,6 +368,19 @@ typedef struct ppc_v3_pate_t {
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
index 7b6ac16eef..22f9835383 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1281,6 +1281,37 @@ void helper_hrfid(CPUPPCState *env)
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
index 9fd8d6b817..deb7374ea4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -124,3 +124,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
+
+### rfebb
+&XL_s           s:uint8_t
+@XL_s           ......-------------- s:1 .......... -   &XL_s
+RFEBB           010011-------------- .   0010010010 -   @XL_s
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 866b1d2b34..7a3104ecf9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7636,6 +7636,8 @@ static int times_4(DisasContext *ctx, int x)
 
 #include "translate/spe-impl.c.inc"
 
+#include "translate/branch-impl.c.inc"
+
 /* Handles lfdp, lxsd, lxssp */
 static void gen_dform39(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/branch-impl.c.inc b/target/ppc/translate/branch-impl.c.inc
new file mode 100644
index 0000000000..9c991d9abb
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
+    gen_invalid(ctx);
+    return true;
+}
+#endif
-- 
2.31.1


