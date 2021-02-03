Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E9430D167
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:23:48 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77pb-0007uO-GZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i6-0007bl-V4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:02 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i5-0000yb-8H
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id lw17so2638010pjb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVGyR+0FxLnTgjrZTyBr7a+qg0xbyTqyjngL3BTi7tU=;
 b=fj2+7Rc6rM/ejU7lVHTETs0FcxgLTShNOD75nnh8tIfeX9aQHjYLXn8WVWcyML1Grz
 joNfPrqBj55xoPxyMQoLEBF//02rtA+fPzgB73MR2vEgDTGdNYSTUIhgqgASyX63UMDa
 6lQnG2ld5pNs/LEjeSlp+WtPzz0s4iVdPFihaQV+4BBrQcJ4JRAif58OvNj63NZ/qBpB
 +qmvvF3uPsRjv3t6qM3hVROm1tLJYqVCGf6m9gXnwKvM7Ni3x0K2NsXa5kwvrqM8QZZ1
 8U+4MUSk0KCVTtTLaCedUierTgnnNqircc9pzmH44Hy/ylhg43AUdwwnpNjE7RWjhLnr
 m4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVGyR+0FxLnTgjrZTyBr7a+qg0xbyTqyjngL3BTi7tU=;
 b=rV63tWlq/BG8qWKeaTZRDRaNsGdtQeuUWZ1lAE4+L3J2uCf0bB+jvZnkCdD1zUnfQD
 n1ZKusp4wAbOaHg+iXxIRNPlHQaaXA1gVUYuAndqGD0BKc72urwXQlwmitlwZ0cOAMy7
 1VgEqVyOpv2PaUJsBDGeIg5Nd0FLIZvQh3yRBkD7n8UQad7XjbW50FCQEsF6Aggtyr2a
 ThWA5yHaNHb1oPHrT6sRUq8r2H9WdyhWjpRZio73yGZeY0nkp7IGGucZsV1wvQdxXgyh
 xFBle9t/sEHEit9GHkunjLkLOKNpDgAVjqh9F97QMbM0jaGW3FqAxFOwEXXDtZVzMYtf
 c59g==
X-Gm-Message-State: AOAM532C84cId/w3rniBAy/cMLBIUWebmO9i3BuETlMT8XAPoOs0Iosm
 qX0S2tryW5BxMHVFzRBT3yjtP+ErkGGoC2ky
X-Google-Smtp-Source: ABdhPJzlXAev4JSnBOe3NbySPbaMEGf0LXkQMylsfP2S5fU6Mc9fdRQS5TsjlIFN9OIvVo0lLeb2JA==
X-Received: by 2002:a17:90a:fb83:: with SMTP id
 cp3mr809691pjb.168.1612318560054; 
 Tue, 02 Feb 2021 18:16:00 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:15:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] tcg/i386: Tidy register constraint definitions
Date: Tue,  2 Feb 2021 16:15:30 -1000
Message-Id: <20210203021550.375058-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create symbolic constants for all low-byte-addressable
and second-byte-addressable registers.  Create a symbol
for the registers that need reserving for softmmu.

There is no functional change for 's', as this letter is
only used for i386.  The BYTEL name is correct for the
action we wish from the constraint.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


