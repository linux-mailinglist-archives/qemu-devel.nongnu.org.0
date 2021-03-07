Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B28330481
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 21:28:00 +0100 (CET)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ00N-0007Cy-KE
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 15:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIzyy-0005ib-2Q
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:26:32 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44132
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIzyw-0006uK-C8
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:26:31 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIzyo-0005R9-WE; Sun, 07 Mar 2021 20:26:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun,  7 Mar 2021 20:26:07 +0000
Message-Id: <20210307202607.27745-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307202607.27745-1-mark.cave-ayland@ilande.co.uk>
References: <20210307202607.27745-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/2] target/m68k: add M68K_FEATURE_NO_DALIGN feature
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

According to the M68040UM Appendix D the requirement for data accesses to be
word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
68020 onwards will allow unaligned data accesses but at the cost of being less
efficient.

Add a new M68K_FEATURE_NO_DALIGN feature to specify that data accesses are not
required to be word aligned, and don't perform the alignment on the stack
pointer when taking an exception if this feature is not selected.

This is required because the MacOS DAFB driver attempts to call an A-trap
with a byte-aligned stack pointer during initialisation and without this the
stack pointer is off by one when the A-trap returns.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.c       | 1 +
 target/m68k/cpu.h       | 1 +
 target/m68k/op_helper.c | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 37d2ed9dc7..ea51753eb0 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -161,6 +161,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CAS);
     m68k_set_feature(env, M68K_FEATURE_CHK2);
     m68k_set_feature(env, M68K_FEATURE_MSP);
+    m68k_set_feature(env, M68K_FEATURE_NO_DALIGN);
 }
 
 /*
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7c3feeaf8a..1e0876bba8 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -505,6 +505,7 @@ enum m68k_features {
     M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
     M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
     M68K_FEATURE_MOVEC, /* MOVEC insn. (from 68010) */
+    M68K_FEATURE_NO_DALIGN, /* Unaligned data accesses (680[2346]0) */
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 59a6448296..71b3df0910 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -348,7 +348,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     cpu_m68k_set_sr(env, sr);
     sp = env->aregs[7];
 
-    sp &= ~1;
+    if (!m68k_feature(env, M68K_FEATURE_NO_DALIGN)) {
+        sp &= ~1;
+    }
+
     if (cs->exception_index == EXCP_ACCESS) {
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
-- 
2.20.1


