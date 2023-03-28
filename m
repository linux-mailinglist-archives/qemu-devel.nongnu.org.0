Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B36CC7EE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:30:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCBP-0005fW-KQ; Tue, 28 Mar 2023 12:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phCBH-0005eo-NA
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:28:21 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phCBF-0001Vi-MS
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:28:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so4515436wmq.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680020896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Os31Dt7XJc3UKwruTpOPiFtGsffdvmtxmBfTYfWLU1Q=;
 b=VVvrVAAWNiXcPWgBZORCalYoqfKKAozFeIhUHSvyMPqjwS8qdPnyvZ92CPiV/+MC5b
 iSuCHBh+dQI8VSV4vuSI39Sw3VSYAtneX3Kcv4JZ2BeK0e8OgqRnqd2SRbxsdgny5pW0
 bB7WwoVuRynhZbe7diYaYxr2N3y2vQxzFeXMqQboVkuo91qZKduuQYslJyjDsnOL1GFB
 Ed1o84k0feLMqhOMoOAq8/5lWr70O6N3AR6T/OhSRcBe4//ZMJPz4q1e2zf2SGlwpJwS
 KlObCIpMx9ukdv2GOObKdrBpZY+nfkfsA4GmDPz/GE7mUo7sc/9Boh+SkUUn0q4xj1zx
 iCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680020896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Os31Dt7XJc3UKwruTpOPiFtGsffdvmtxmBfTYfWLU1Q=;
 b=rU+ObBtSpZFu6zAP7zqw2H7iiq7otrMmxLaFbhWLtSkW3+qPRYNlEestCrbcoI5r6S
 KmsH7ct2HaFjES1Xss12fwBUYWVsVT+Y1k0MidH720Qj7hIESs7tX1MisqmXw75XXGY0
 9oXmPGBp7Ux8Uk32r0GDSlxe/t3EEkaA/R8GII/g/Jl790TS4khOv+a7cTMLKaTq1udH
 vj8T+tIp8J8SAT2EC0l1Wr5pzaYgOwgqGFeX2c084OHNBqzAdPAd/x8SCfJkXrVja0zb
 EIUyAQSxpsKY3fblFaqJ7qn/GxHGThTfHpczXdKTgN5nj49HBKiTy1jwJHLVbX1Qscyn
 PS8w==
X-Gm-Message-State: AO0yUKUCcXcw9dhLTfqN9uulu9nmg/pfXFpggapin5WkC6F/SNMply7e
 HhRXpfAUZ+dhpvtEv6GdbrfVKQ==
X-Google-Smtp-Source: AK7set99g9MhXfgnJ4EdjB5g9VF/Y1h3q5RqAMqbm7Cf0h5+w8+9WTxHWv38LiCUudzYy1kNVhc25w==
X-Received: by 2002:a7b:c852:0:b0:3ed:307f:1663 with SMTP id
 c18-20020a7bc852000000b003ed307f1663mr13157023wml.15.1680020895786; 
 Tue, 28 Mar 2023 09:28:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1c4c05000000b003ef5db16176sm13623850wmf.32.2023.03.28.09.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 09:28:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads when
 HSTR is active
Date: Tue, 28 Mar 2023 17:28:14 +0100
Message-Id: <20230328162814.2190220-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In commit 049edada we added some code to handle HSTR_EL2 traps, which
we did as an inline "conditionally branch over a
gen_exception_insn()".  Unfortunately this fails to take account of
the fact that gen_exception_insn() will set s->base.is_jmp to
DISAS_NORETURN.  That means that at the end of the TB we won't
generate the necessary code to handle the "branched over the trap and
continued normal execution" codepath.  The result is that the TCG
main loop thinks that we stopped execution of the TB due to a
situation that only happens when icount is enabled, and hits an
assertion.

Note that this only happens for cpreg reads; writes will call
gen_lookup_tb() which generates a valid end-of-TB.

Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
saving and restoring is_jmp around the call seems super
clunky -- is there a better way ? I think mostly we avoid
this by not doing conditional exception-generation in
inline TCG code...
---
 target/arm/tcg/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 2cb9368b1ba..bb502165c39 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -4617,12 +4617,20 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             /* T4 and T14 are RES0 so never cause traps */
             TCGv_i32 t;
             DisasLabel over = gen_disas_label(s);
+            DisasJumpType old_is_jmp;
 
             t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
             tcg_gen_andi_i32(t, t, 1u << maskbit);
             tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
 
+            /*
+             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
+             * but since we're conditionally branching over it, we want
+             * to retain the existing value.
+             */
+            old_is_jmp = s->base.is_jmp;
             gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
+            s->base.is_jmp = old_is_jmp;
             set_disas_label(s, over);
         }
     }
-- 
2.34.1


