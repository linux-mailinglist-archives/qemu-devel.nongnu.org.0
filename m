Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236995798AC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:42:38 +0200 (CEST)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlcb-0002AN-8Q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oDlZ7-00007z-3j; Tue, 19 Jul 2022 07:39:02 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oDlZ5-0004wT-Cx; Tue, 19 Jul 2022 07:39:00 -0400
Received: by mail-pf1-x436.google.com with SMTP id b9so13265004pfp.10;
 Tue, 19 Jul 2022 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1iO1A/wv48NkHgUMKx30Fbte06nrUW/o1EiSkaqBNw=;
 b=KXQ3vvE9l5j+Bsx/n2iuL2WsfvqysUSFdjIIJLljHJKgtP/cYFfpupWNDVVqkojZJt
 ImWbBkTiqt2LFmYRd6BsvJBQQwpO+HgYsenafEB5a0X5WOkF731uYKkydpcjO9ricQ27
 tFX5zeR3/IGR+rwlDSEiT/qwMdt5OFVt1IOHhFFF8ku0vHljeB4762vNQVZcaxXx9O6g
 Uh/NDDx3Z4vNokX7lisWwnAThZlmXkIc/fPfrAWpGtDUxpq7kqwaazvZ2nwV8v9ZyWKk
 TMZRJY616PUUYvxGBAEcG9tlAKjLvarKIOTmASTPynd4M2zMgpc3zUqLRh005y0qGazx
 2xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1iO1A/wv48NkHgUMKx30Fbte06nrUW/o1EiSkaqBNw=;
 b=xe8D6HmS3D9jTuXjD2doBhXBrTA/3w8zl9N3pQqenNICJ03rzYsFf18v3pQ4yvg5Gv
 8JXFE4dolIcD4Ls/Fdf3u/RT0Xc9qYvD+dUMqmT/DOILwFrhp3k9UH0MKi+qAjKECAee
 o43kdxurvpg/F2sQaCYP7cX2VSmKM2xDxMeHspkfxIItN4YxVoVQrjlZxhWvAv3os2b/
 TGkt344UI1JEyPgopNBJR5E14N05VUjUsXUKNJD+IQqxvo/8Qas3KvflfNubY0JY8wyo
 09wQNS/X+F1qimowcV5L8wWJpikdZpX7lxPJsOipAOJC4h4b1LKbOVzSOXcyAf3hn8sH
 HzrA==
X-Gm-Message-State: AJIora8cPWN6n/1yo/ExFSlwYEtNCvCYes2ykbZ1FRofZ4+7iP237AZv
 wbFuOikS3IkgbbYK4apS9aB/CU2C450=
X-Google-Smtp-Source: AGRyM1siDTYWCDcW/R8rlx7uVtYL5VX9utoI4us3YspVLDJTGt6S2FwJl1UDUbDxK95ZJxdZ3p3B9w==
X-Received: by 2002:a05:6a00:1d26:b0:528:31c2:5243 with SMTP id
 a38-20020a056a001d2600b0052831c25243mr32733688pfx.28.1658230736789; 
 Tue, 19 Jul 2022 04:38:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-251-27.static.tpgi.com.au.
 [27.33.251.27]) by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a514d00b001ef9659d711sm11189525pjm.48.2022.07.19.04.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 04:38:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Implement new wait variants
Date: Tue, 19 Jul 2022 21:38:43 +1000
Message-Id: <20220719113843.429600-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

ISA v2.06 adds new variations of wait, specified by the WC field. These
are not compatible with the wait 0 implementation, because they add
additional conditions that cause the processor to resume, which can
cause software to hang or run very slowly.

ISA v3.0 changed the wait opcode.

ISA v3.1 added new WC values to the new wait opcode, and added a PL
field.

This implements the new wait encoding and supports WC variants with
no-op implementations, which is provides basic correctness as explained.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate.c | 84 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1d6daa4608..ce4aa84f1d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4066,12 +4066,79 @@ static void gen_sync(DisasContext *ctx)
 /* wait */
 static void gen_wait(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(1);
-    tcg_gen_st_i32(t0, cpu_env,
-                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
-    tcg_temp_free_i32(t0);
-    /* Stop translation, as the CPU is supposed to sleep from now */
-    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    uint32_t wc = (ctx->opcode >> 21) & 3;
+    uint32_t pl = (ctx->opcode >> 16) & 3;
+
+    /* v3.0 and later use the ISA flag for wait rather than a PM flag */
+    if (!(ctx->insns_flags2 & PPC2_PM_ISA206) &&
+        !(ctx->insns_flags2 & PPC2_ISA300)) {
+        /* wc field was introduced in ISA v2.06 */
+        if (wc) {
+            gen_invalid(ctx);
+            return;
+        }
+    }
+
+    if (!(ctx->insns_flags2 & PPC2_ISA310)) {
+        /* pl field was introduced in ISA v3.1 */
+        if (pl) {
+            gen_invalid(ctx);
+            return;
+        }
+
+        if (ctx->insns_flags2 & PPC2_ISA300) {
+            /* wc > 0 is reserved in v3.0 */
+            if (wc > 0) {
+                gen_invalid(ctx);
+                return;
+            }
+        }
+    }
+
+    /* wc=3 is reserved and pl=1-3 are reserved in v3.1. */
+    if (wc == 3 || pl > 0) {
+        gen_invalid(ctx);
+        return;
+    }
+
+    /* wait 0 waits for an exception to occur. */
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
+     * For v2.06 and 2.07, wc=1,2 are architected but may be implemented as
+     * no-ops.
+     *
+     * wc=1 (waitrsv) waits for an exception or a reservation to be lost.
+     * Reservation-loss may have implementation-specific conditions, so it
+     * can be implemented as a no-op.
+     *
+     * wc=2 waits for an implementation-specific condition which could be
+     * always true, so it can be implemented as a no-op.
+     *
+     * For v3.1, wc=1,2 are architected but may be implemented as no-ops.
+     *
+     * wc=1 similarly to v2.06 and v2.07.
+     *
+     * wc=2 waits for an exception or an amount of time to pass. This
+     * amount is implementation-specific so it can be implemented as a
+     * no-op.
+     *
+     * ISA v3.1 does allow for execution to resume "in the rare case of
+     * an implementation-dependent event", so in any case software must
+     * not depend on the architected resumption condition to become
+     * true, so no-op implementations should be architecturally correct
+     * (if suboptimal).
+     */
 }
 
 #if defined(TARGET_PPC64)
@@ -6852,8 +6919,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0x00000000, PPC_64B),
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
2.35.1


