Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DBE58448A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 18:59:20 +0200 (CEST)
Received: from localhost ([::1]:55308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH6r1-0006GM-Fd
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 12:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nR-0001OS-MN; Thu, 28 Jul 2022 12:55:37 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nP-0006gW-KW; Thu, 28 Jul 2022 12:55:37 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10e45b51f77so3012839fac.7; 
 Thu, 28 Jul 2022 09:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6JpKN6VGIawog0Lbow57TwD2L6j5sb5+ZAYB2OsJi+o=;
 b=LD82aIze5F+NUWC0MGbQ9YdqlOvDVWaYDSwuIqhZrpAYZRCnhBBu9kSNUQawG88oxt
 xT9pejRM4UrkbxAjSavSndEnnKsA5QS7Pjv8Ne35s1Qw84Kw0GFuMwxZTJbQbV8ZcWnE
 70hUTi0dK2IoQWt10kh9NRqSCsKVOlJ7uroe1nuVYYhwcbZEhFnx8y0f9DyTO98dcM7H
 b3tVSMF6qhEQHf7sKfCh8GASxRRz2gEId+WXUxDmeMYSPNtlLtOuveeMZRkyNt6khp55
 I4d/N+sHuhz9UW9FcWE3RcnEhzXYtmADXiZ+E1fGfPRJPSEZ1JtgTjGp/SqzkAbaxyua
 Yz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6JpKN6VGIawog0Lbow57TwD2L6j5sb5+ZAYB2OsJi+o=;
 b=yEazKQR4jMQ7C5Mw5b3RyNwNDWnV5Q0LlcorOEaRefErJny2Ctg58aK7+TXFKEojYY
 2gi+sM+i+pNtC/oZ28dmFheXyBSWXG7ZeiPU+aN+5iHGH+8gylGvcrnS5dR8Mu38Pmge
 /kaYsezARrerNDjJDYDDPUYOYQeUW6FoxktpH6f4SCxFfs78b69b+PNK0YZoC07dIwFH
 i4zM6J2d9zh1rjiidvi603fjjZesdWAAcG7uNYOxjVFVVJ2M9qPskCyGkEbNQ3v6L7Qm
 sxBRvuTbBrC2komJAcZgBlkHjYfpyD+9yOHKWEbx5/O6ghks36zvBz3fAOhMVsiZ+CM1
 mt2Q==
X-Gm-Message-State: AJIora8zhVWMhxx9JxpUTkkybXwUDOfriN5xHD2QJfmvkn2Zb793QBlI
 p8ISzanA57ywJNt7lcCSHrTpgcz3Srg=
X-Google-Smtp-Source: AGRyM1sucxnalaCTjqFcGQXSpYbuWLiAFFTeWxaiN0Yu2cfOfY/KSXthCGoffoKsyL9/pVZRWPfnsQ==
X-Received: by 2002:a05:6870:f593:b0:10d:887e:70fa with SMTP id
 eh19-20020a056870f59300b0010d887e70famr159081oab.241.1659027332980; 
 Thu, 28 Jul 2022 09:55:32 -0700 (PDT)
Received: from balboa.COMFAST ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a056870170f00b0010e5a5dfcb4sm616290oae.0.2022.07.28.09.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 09:55:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 3/3] target/ppc: Implement new wait variants
Date: Thu, 28 Jul 2022 13:55:19 -0300
Message-Id: <20220728165519.2101401-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728165519.2101401-1-danielhb413@gmail.com>
References: <20220728165519.2101401-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

ISA v2.06 adds new variations of wait, specified by the WC field. These
are not all compatible with the prior wait implementation, because they
add additional conditions that cause the processor to resume, which can
cause software to hang or run very slowly.

At this moment, with the current wait implementation and a pseries guest
using mainline kernel with new wait upcodes [1], QEMU hangs during boot if
more than one CPU is present:

 qemu-system-ppc64 -M pseries,x-vof=on -cpu POWER10 -smp 2 -nographic
-kernel zImage.pseries -no-reboot

QEMU will exit (as there's no filesystem) if the test "passes", or hang
during boot if it hits the bug.

ISA v3.0 changed the wait opcode and removed the new variants (retaining
the WC field but making non-zero values reserved).

ISA v3.1 added new WC values to the new wait opcode, and added a PL
field.

This patch implements the new wait encoding and supports WC variants
with no-op implementations, which provides basic correctness as
explained in comments.

[1] https://lore.kernel.org/all/20220720132132.903462-1-npiggin@gmail.com/

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Tested-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220720133352.904263-1-npiggin@gmail.com>
[danielhb: added information about the bug being fixed]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/internal.h  |  3 ++
 target/ppc/translate.c | 96 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 467f3046c8..337a362205 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -165,6 +165,9 @@ EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
 /* darn */
 EXTRACT_HELPER(L, 16, 2);
 #endif
+/* wait */
+EXTRACT_HELPER(WC, 21, 2);
+EXTRACT_HELPER(PL, 16, 2);
 
 /***                            Jump target decoding                       ***/
 /* Immediate address */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5a18ee577f..388337f81b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4071,12 +4071,91 @@ static void gen_sync(DisasContext *ctx)
 /* wait */
 static void gen_wait(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(1);
-    tcg_gen_st_i32(t0, cpu_env,
-                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
-    tcg_temp_free_i32(t0);
-    /* Stop translation, as the CPU is supposed to sleep from now */
-    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    uint32_t wc;
+
+    if (ctx->insns_flags & PPC_WAIT) {
+        /* v2.03-v2.07 define an older incompatible 'wait' encoding. */
+
+        if (ctx->insns_flags2 & PPC2_PM_ISA206) {
+            /* v2.06 introduced the WC field. WC > 0 may be treated as no-op. */
+            wc = WC(ctx->opcode);
+        } else {
+            wc = 0;
+        }
+
+    } else if (ctx->insns_flags2 & PPC2_ISA300) {
+        /* v3.0 defines a new 'wait' encoding. */
+        wc = WC(ctx->opcode);
+        if (ctx->insns_flags2 & PPC2_ISA310) {
+            uint32_t pl = PL(ctx->opcode);
+
+            /* WC 1,2 may be treated as no-op. WC 3 is reserved. */
+            if (wc == 3) {
+                gen_invalid(ctx);
+                return;
+            }
+
+            /* PL 1-3 are reserved. If WC=2 then the insn is treated as noop. */
+            if (pl > 0 && wc != 2) {
+                gen_invalid(ctx);
+                return;
+            }
+
+        } else { /* ISA300 */
+            /* WC 1-3 are reserved */
+            if (wc > 0) {
+                gen_invalid(ctx);
+                return;
+            }
+        }
+
+    } else {
+        warn_report("wait instruction decoded with wrong ISA flags.");
+        gen_invalid(ctx);
+        return;
+    }
+
+    /*
+     * wait without WC field or with WC=0 waits for an exception / interrupt
+     * to occur.
+     */
+    if (wc == 0) {
+        TCGv_i32 t0 = tcg_const_i32(1);
+        tcg_gen_st_i32(t0, cpu_env,
+                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
+        tcg_temp_free_i32(t0);
+        /* Stop translation, as the CPU is supposed to sleep from now */
+        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    }
+
+    /*
+     * Other wait types must not just wait until an exception occurs because
+     * ignoring their other wake-up conditions could cause a hang.
+     *
+     * For v2.06 and 2.07, wc=1,2,3 are architected but may be implemented as
+     * no-ops.
+     *
+     * wc=1 and wc=3 explicitly allow the instruction to be treated as a no-op.
+     *
+     * wc=2 waits for an implementation-specific condition, such could be
+     * always true, so it can be implemented as a no-op.
+     *
+     * For v3.1, wc=1,2 are architected but may be implemented as no-ops.
+     *
+     * wc=1 (waitrsv) waits for an exception or a reservation to be lost.
+     * Reservation-loss may have implementation-specific conditions, so it
+     * can be implemented as a no-op.
+     *
+     * wc=2 waits for an exception or an amount of time to pass. This
+     * amount is implementation-specific so it can be implemented as a
+     * no-op.
+     *
+     * ISA v3.1 allows for execution to resume "in the rare case of
+     * an implementation-dependent event", so in any case software must
+     * not depend on the architected resumption condition to become
+     * true, so no-op implementations should be architecturally correct
+     * (if suboptimal).
+     */
 }
 
 #if defined(TARGET_PPC64)
@@ -6691,8 +6770,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0x00000000, PPC_64B),
 GEN_HANDLER_E(stqcx_, 0x1F, 0x16, 0x05, 0, PPC_NONE, PPC2_LSQ_ISA207),
 #endif
 GEN_HANDLER(sync, 0x1F, 0x16, 0x12, 0x039FF801, PPC_MEM_SYNC),
-GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x03FFF801, PPC_WAIT),
-GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
+/* ISA v3.0 changed the extended opcode from 62 to 30 */
+GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x039FF801, PPC_WAIT),
+GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039CF801, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(b, 0x12, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
 GEN_HANDLER(bc, 0x10, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
 GEN_HANDLER(bcctr, 0x13, 0x10, 0x10, 0x00000000, PPC_FLOW),
-- 
2.36.1


