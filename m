Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6A3304D8
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 22:26:45 +0100 (CET)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ0vE-0003jj-62
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 16:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJ0uW-0003IO-Ot
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 16:26:00 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJ0uU-0006hE-SI
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 16:26:00 -0500
Received: from localhost.localdomain ([82.252.159.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7Jj2-1lOXE71ZZU-007kAs; Sun, 07 Mar 2021 22:25:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/m68k: implement rtr instruction
Date: Sun,  7 Mar 2021 22:25:52 +0100
Message-Id: <20210307212552.523552-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p65TfEdGnZJoEzJ7/a1bmxE8SQrcnZ1HGs3whoZbKTweGi3hlOJ
 y+U9HEycAiwCkHC7XVrZFT8h1K5UhSSsDvYxvd6RpLythZmeQ0MZcj42lza1xexMXR2m1qE
 UdvKPJkWnQ/qqw+CvMFKSKbE+LbMpL9yCzur/aeT6mzzrDs5CNJDb0JK8/FGTAd7B47Qira
 6he1DFwJkgb559S5ngpgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:boB958wzwX8=:lFA+KCp1oNrqlmzatvX2UV
 /h/LdZYUlorpfdR4I8CJYi6U+WIB+v2j1qBXF59wGWjZxlpb7r8Qa9RK6iGoBKFNZ/buWr3UU
 4ymbd52gZEzNygULbINsEP6hRtdxl9YfkQUosekTX10CF6BcZDaRKkgyMG9Zwu4de639uUPBK
 7sLZpSESDmoFB1qXt3W8D9N7w+RWjX6i0tjZi8CmQ/eZs3e6wDfh4tH+Q3mSoHrhWy17hJ3uF
 0aBNd+JTqLJXAvSkWKmPeAwjtlYHbW9jVEcF+VjFc87jDvU7FIaYtyxt0famCOsheyxdpjH7Y
 0tlogeiEhpETtel9ijly5+5JuiAbQ7aO8hHDM70NtioGOdKADkfkp/hHfBHyosyayRtpcdWEE
 vx3Rs9mnawHXXt5wpEnPl0T6Ef2dvant1G/Ys6Pd5Rf8gCevq2YMa9qsTgfYOCRK0xz6v7Um4
 niqCdbqtUg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to boot MacOS ROM.

Pull the condition code and the program counter from the stack.

Operation:

    (SP) -> CCR
    SP + 2 -> SP
    (SP) -> PC
    SP + 4 -> SP

This operation is not privileged.

Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---

Notes:
    v3: put loads before state writeback
    
    v2: update comment
        SP + 4 -> SP

 target/m68k/translate.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ac936ebe8f14..200018ae6a63 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2969,6 +2969,25 @@ DISAS_INSN(rtd)
     gen_jmp(s, tmp);
 }
 
+DISAS_INSN(rtr)
+{
+    TCGv tmp;
+    TCGv ccr;
+    TCGv sp;
+
+    sp = tcg_temp_new();
+    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
+    tcg_gen_addi_i32(sp, QREG_SP, 2);
+    tmp = gen_load(s, OS_LONG, sp, 0, IS_USER(s));
+    tcg_gen_addi_i32(QREG_SP, sp, 4);
+    tcg_temp_free(sp);
+
+    gen_set_sr(s, ccr, true);
+    tcg_temp_free(ccr);
+
+    gen_jmp(s, tmp);
+}
+
 DISAS_INSN(rts)
 {
     TCGv tmp;
@@ -6015,6 +6034,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
     INSN(addsubq,   5000, f080, M68000);
-- 
2.29.2


