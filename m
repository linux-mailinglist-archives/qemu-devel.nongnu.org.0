Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387A5EBAD0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:38:46 +0200 (CEST)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4Eu-0001jx-RU
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43D-0001uK-Ow
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:55355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43C-0000ZP-1u
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXH7g-1okInl1wRK-00YlRz; Tue, 27
 Sep 2022 08:26:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/3] target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature for
 move_from_sr privilege check
Date: Tue, 27 Sep 2022 08:26:32 +0200
Message-Id: <20220927062633.618677-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927062633.618677-1-laurent@vivier.eu>
References: <20220927062633.618677-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QjL1m1fsxNqQUN6vmn7GKig/flH15DYtQMz7TRZP/pJOhrX+ef0
 d/2gCw3PTnzEnJqaKRKHcz+xQxa0VQrMzG2mUSSx9m9y2HFxWhronH2EB1+krzb1jqWPRQb
 SJu9mX0OIqnf/rvuPvrCMqiTksIR2kQ1P5MdXMfOOosrEdKd83o4fEj8ED+Qjp7m3cK15Go
 pdMHoyEcVh0DsELo0Tdsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h+3HM1+H3do=:iGQnpFcB5lEB9I6FLirnrz
 rp8mSNtgWQ8hB3kR9xQYViUoPTAF5skdna9RX9CDx2zsAhym3L5o/xWBF6FpHCXW5iAYWValk
 /1gyFqSPH6+ZAQFivBFn010RNo7YdCcUl3cgfF9LLwbS5nfIl9UtyxKV23cca2AKNajjJjQ7Y
 zrXyv9kEaO+sW/wNHs9mHIe5KPkEJ/rjoVVmCON9ti72nzWGiOrEijIbVxNI0v2mvV/fXr232
 rG0oqERkzxgotMD0mfwIAmvmkDfr2SuTtVl78c9XEqSD0mihatWBwvZ1FPjVmgN6RbbtlNQjf
 oZO3kVjo4mRiDr8QCODHixKgGhlOkJ1ZiF/lI2HUT0q3BbT/+28mix67p4uPWDdxnOCLPc26U
 ASOWwK/d6LitydwvoZEZ9moW6cwBUsYa5aCpaa2yDcAzhaNPbPtpNfDzJgT5wVxi4LlHB8Cmj
 Vujtl9lgAKTvTLi0PZf3+TbpjZq7bXSjIs9fBaQWN7AUpzbxi6dt+6zNzjMxrgZ3mpUKiAlJQ
 UTGpKpUmo3hBqCyMXC4ZAoT6xOUl9qDnp+EuGA4ZYIIoIrqCEvg1oJVWWVNhnzR5XXRB4OOMs
 E7Kin97vmrbAGGhpKoSJdoaa9mVpzDfb5+gnxaQAwpHVK5/5XKyTkFoRXYfFv84pdkDfxEWe0
 z3LGOwcjVRCopFqRHR57+XCGF/LemY0ffhprY7IXyttOCn5MnTK6TJ3fMD3nOf6kPVw8Wc1nc
 LGhFWei7fRTqXibZUhMSdoqTsVn5qOiIuX69bE9EG7VxehFMXx0USNv//y3Ghqx/FQUb0A8FZ
 35vTRLx
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Now that M68K_FEATURE_M68000 has been renamed to M68K_FEATURE_M68K it is easier
to see that the privilege exception check is wrong: it is currently only generated
for ColdFire CPUs when in fact it should also be generated for Motorola CPUs from
the 68010 onwards.

Introduce a new M68K_FEATURE_MOVEFROMSR_PRIV feature which is set for all non-
Motorola CPUs, and for all Motorola CPUs from the 68010 onwards and use it to
determine whether a privilege exception should be generated for the MOVE-from-SR
instruction.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220925134804.139706-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h       | 2 ++
 target/m68k/cpu.c       | 5 +++++
 target/m68k/translate.c | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index f5c6e95cb44a..3a9cfe2f33a7 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -537,6 +537,8 @@ enum m68k_features {
     M68K_FEATURE_UNALIGNED_DATA,
     /* TRAPcc insn. (680[2346]0, and CPU32) */
     M68K_FEATURE_TRAPCC,
+    /* MOVE from SR privileged (from 68010) */
+    M68K_FEATURE_MOVEFROMSR_PRIV,
 };
 
 static inline bool m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 8d23c72056fd..25d610db21f7 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -102,6 +102,7 @@ static void m5206_cpu_initfn(Object *obj)
     CPUM68KState *env = &cpu->env;
 
     m68k_set_feature(env, M68K_FEATURE_CF_ISA_A);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 /* Base feature set, including isns. for m68k family */
@@ -129,6 +130,7 @@ static void m68010_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_RTD);
     m68k_set_feature(env, M68K_FEATURE_BKPT);
     m68k_set_feature(env, M68K_FEATURE_MOVEC);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 /*
@@ -241,6 +243,7 @@ static void m5208_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_BRAL);
     m68k_set_feature(env, M68K_FEATURE_CF_EMAC);
     m68k_set_feature(env, M68K_FEATURE_USP);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 static void cfv4e_cpu_initfn(Object *obj)
@@ -254,6 +257,7 @@ static void cfv4e_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CF_FPU);
     m68k_set_feature(env, M68K_FEATURE_CF_EMAC);
     m68k_set_feature(env, M68K_FEATURE_USP);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 static void any_cpu_initfn(Object *obj)
@@ -275,6 +279,7 @@ static void any_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_USP);
     m68k_set_feature(env, M68K_FEATURE_EXT_FULL);
     m68k_set_feature(env, M68K_FEATURE_WORD_INDEX);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 233b9d8e5783..9df17aa4b2d8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4624,7 +4624,7 @@ DISAS_INSN(move_from_sr)
 {
     TCGv sr;
 
-    if (IS_USER(s) && !m68k_feature(env, M68K_FEATURE_M68K)) {
+    if (IS_USER(s) && m68k_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV)) {
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
-- 
2.37.3


