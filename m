Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBB449EE0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:58:22 +0100 (CET)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDan-00064O-WA
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDUH-0001c0-MM; Mon, 08 Nov 2021 17:51:37 -0500
Received: from [2607:f8b0:4864:20::32e] (port=43906
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDUF-0000RV-PE; Mon, 08 Nov 2021 17:51:37 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so11965962otm.10; 
 Mon, 08 Nov 2021 14:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQWucBdUnIwcDto3kL5CaPivJvG9I2UvY5V50LYFHLk=;
 b=WFQTu+fL+qHoe+yBy9USAr1jeyFi10WiPS0T0XFrwVo30mp+dG87xjnMReqplp8ltp
 e20TtMpJGL0QFTFDQlXkhb4A0dlynwFJQMSzN2MSCiFaK7WuqIoZ55C9XNVivsVwDz+4
 Iodu35c56JB7CwZTE9qpS/d3CRVMOhhPIbsd4Ziov6qcu+yLGjPsQ9yP931QIL09ljuW
 DvXHixQvrNDAzH0wT5pz5fx6WG95nqLvOpzFl0qWQn9n65zcDKNd+4HzvSlIXZtlSYgy
 2J3r61RwKT6HCDFOYPSttghrxUPuwiIEykAkXzF4s32OlTWMrlZmq7oECdmU1HqsrOGa
 Xpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQWucBdUnIwcDto3kL5CaPivJvG9I2UvY5V50LYFHLk=;
 b=Ibr2N0Bx4QbXZWOMKESWylADoINS7TFtmefKRVw/2MIWZsMjdjP/zY7QaZxeAs5QWv
 fvOmhEHHqLUArkSQvBlspuxP7L8rHxTJFkjJoJvRsFEI/pZTau2J/3s8yhBzCveyJjTh
 w/y2DXWSrtVCuePZdnkjidZN1qFu64lBpAs2UiSnKnZvQqDeq+gQzivH2QgvIbAhFSw0
 vTSK5W1zRp0FepytCz1ClyD/+gax1o7KADtc6OCqsXZX8DeOK6cfuY3lM3AucuB6AvaC
 6+xnEkOT9N05kLB/I6hy7yoZxl8K9fUoMvcCr5kfWsUrgd2eWw/Rp6FbzYtxgJ8vt2XR
 SEHQ==
X-Gm-Message-State: AOAM533uLujyT7gOUmjaxeoR4nVMFnnzuY/cwdU94qLNeqf2j6KPjP3n
 LSOAGrPOakp/Fes+R74zIk4dtSB6Koc=
X-Google-Smtp-Source: ABdhPJxe5oDyJ6AKQQ7b8TkH/RgmxSKgYBYsx1UsgHAi5Sv9ehHaUSWwX27ag45aqWoWSxRk3EB7cw==
X-Received: by 2002:a05:6830:348c:: with SMTP id
 c12mr2048928otu.261.1636411893208; 
 Mon, 08 Nov 2021 14:51:33 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id h3sm6487249oih.23.2021.11.08.14.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 14:51:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/10] PPC64/TCG: Implement 'rfebb' instruction
Date: Mon,  8 Nov 2021 19:50:45 -0300
Message-Id: <20211108225047.1733607-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108225047.1733607-1-danielhb413@gmail.com>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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
index a1957c5e7a..bd807aa7ea 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -392,6 +392,19 @@ typedef enum {
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
index ce05470fd4..ba69b57163 100644
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


