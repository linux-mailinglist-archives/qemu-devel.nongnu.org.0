Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D2308E20
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:14:13 +0100 (CET)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5a9k-0000pR-Ot
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6O-000610-2v
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:44 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6J-00080S-SS
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:43 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q2so5896071plk.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HBBO7QZPtUwrm35LTuZ36OrNAjYmk4o8xxojo1oe3Y4=;
 b=piCzEltPqcsnGfT1rPl6QIF98ecXYtaSnEbFEpRsPdiwGMh47BYyf95/2aTGOOpjc7
 S4ujmVdKpiBPl/CV4ocuNgF3dxqCNCrkhwT0VfQdwrGwQRk4yRSlPuQlSvWCIMW42glR
 WVWqYYok/eqMs1aLKuCfVPVYjVbGL5dUMc6/aHcUIKIEynDi6zvHNnHVxf2ITHdKE7NB
 EJQ78391VAnpYUYyLlW2xQCMva/h2r4xx2b4INNjOhgRPe5iS8cvR0vDkVeE2KmWUbnG
 GCZSE/f+/rUqtjuR54i0fAvbX9eASZ2nUE9EhfIN8QVi/iIXLvmSzi10CUwEE+jXgFsc
 2+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HBBO7QZPtUwrm35LTuZ36OrNAjYmk4o8xxojo1oe3Y4=;
 b=JuowPQ67QsygNGH+YmlEn3Jg/7jGLaWTdgMWrjngl1F7ppmqwckYM3qqdojRjAQt0L
 /aHEO2GBb9Fh0Um84qRxT2O4+zyafIezBzpgLQMk7IRo0P1rJE6P2aeDGezNogyy/dVS
 fAgYPY2kUI5bBpEAybxIssINt0EN9VECiAxuXb/rebrPvEuv8MRC5bRXzV3fFGFxd+WR
 WjwJXq3ICuq2VGMoOi9n/tS6FhlBJdG5ngpwNdrAkxdiJXfl85cYq+mQQwe/zmPkmR1I
 SernQJR/wV2ssz/3q6yAf5unEcMWRTTuzQRQVzeMa3IawGlk5vyJZFj7gwAKRfaGsYoO
 gFfA==
X-Gm-Message-State: AOAM532xhX3Z83dIyZJ6GjemEYcXOlXbOmzp70rDtQXh9CF2i3eexPaC
 fHGeshsqeqPgajvxmTvtJFQy0glD2kJCK+r3
X-Google-Smtp-Source: ABdhPJy8kjrpub+iqbXIYBS9O3Opk7gFWxoHZdFLbHguI1KHcNnXVvZcZXpwWp+hmYybL9/pgmPFhA==
X-Received: by 2002:a17:90a:4504:: with SMTP id
 u4mr6141101pjg.218.1611951038551; 
 Fri, 29 Jan 2021 12:10:38 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/24] tcg/i386: Tidy register constraint definitions
Date: Fri, 29 Jan 2021 10:10:08 -1000
Message-Id: <20210129201028.787853-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create symbolic constants for all low-byte-addressable
and second-byte-addressable registers.  Create a symbol
for the registers that need reserving for softmmu.

There is no functional change for 's', as this letter is
only used for i386.  The BYTEL name is correct for the
action we wish from the constraint.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 540debdf34..4feb7e2aa1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -132,6 +132,22 @@ static const int tcg_target_call_oarg_regs[] = {
 # define TCG_REG_L1 TCG_REG_EDX
 #endif
 
+#define ALL_BYTEH_REGS         0x0000000fu
+#if TCG_TARGET_REG_BITS == 64
+# define ALL_GENERAL_REGS      0x0000ffffu
+# define ALL_VECTOR_REGS       0xffff0000u
+# define ALL_BYTEL_REGS        ALL_GENERAL_REGS
+#else
+# define ALL_GENERAL_REGS      0x000000ffu
+# define ALL_VECTOR_REGS       0x00ff0000u
+# define ALL_BYTEL_REGS        ALL_BYTEH_REGS
+#endif
+#ifdef CONFIG_SOFTMMU
+# define SOFTMMU_RESERVE_REGS  ((1 << TCG_REG_L0) | (1 << TCG_REG_L1))
+#else
+# define SOFTMMU_RESERVE_REGS  0
+#endif
+
 /* The host compiler should supply <cpuid.h> to enable runtime features
    detection, as we're not going to go so far as our own inline assembly.
    If not available, default values will be assumed.  */
@@ -193,14 +209,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-#define ALL_GENERAL_REGS   0x0000ffffu
-#define ALL_VECTOR_REGS    0xffff0000u
-#else
-#define ALL_GENERAL_REGS   0x000000ffu
-#define ALL_VECTOR_REGS    0x00ff0000u
-#endif
-
 /* parse target specific constraints */
 static const char *target_parse_constraint(TCGArgConstraint *ct,
                                            const char *ct_str, TCGType type)
@@ -226,11 +234,11 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
         break;
     case 'q':
         /* A register that can be used as a byte operand.  */
-        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xf;
+        ct->regs |= ALL_BYTEL_REGS;
         break;
     case 'Q':
         /* A register with an addressable second byte (e.g. %ah).  */
-        ct->regs = 0xf;
+        ct->regs |= ALL_BYTEH_REGS;
         break;
     case 'r':
         /* A general register.  */
@@ -247,19 +255,11 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 
     case 'L':
         /* qemu_ld/st data+address constraint */
-        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
-#ifdef CONFIG_SOFTMMU
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
-#endif
+        ct->regs |= ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS;
         break;
     case 's':
         /* qemu_st8_i32 data constraint */
-        ct->regs = 0xf;
-#ifdef CONFIG_SOFTMMU
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
-#endif
+        ct->regs |= ALL_BYTEL_REGS & ~SOFTMMU_RESERVE_REGS;
         break;
 
     case 'e':
-- 
2.25.1


