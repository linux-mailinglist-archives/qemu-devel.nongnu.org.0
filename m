Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B53303E7
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 19:23:32 +0100 (CET)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIy3v-0005Tc-3d
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 13:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIy2j-00052q-Pt
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:22:17 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:49391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIy2i-0005yi-7H
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:22:17 -0500
Received: from localhost.localdomain ([82.252.159.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1fzM-1llnTR3Bea-0121sx; Sun, 07 Mar 2021 19:22:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/m68k: implement rtr instruction
Date: Sun,  7 Mar 2021 19:22:10 +0100
Message-Id: <20210307182210.473111-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z5A8P3OcpaNhgCe1/N9yPJHFwCBRRBpD0L1ZkBVN53Lu1GVZ27G
 SWSgTM37TkPtV+02Ic/6aPLKXiY9736m2Za1og/gXe8BHqkM0YN+B5aAFNlQINewePoGihc
 g2DYBd6MDjGoUfMRigD71hwbpwL/u/nXgenSUnOEyYFQWHcricL0SqSVOPnc7CBwGobM/R4
 qpDJ2QrpGRfgopfsbKTLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aEhwg5mxusg=:3sGYiMGJT0YfvAniZ8B3y3
 3xigpwjTAtTY/SyxgKM0emVN0eMj9xBgTxDOdJR/JWRe+M6DNSeOSP3ngfichUnB/Wof7esqw
 091PAL4FRt3gS/YW2nHpoueHVtXB3LP0e0bx/AfNsknCZYb+O5kuqVEuIFrh/fJhTMUB8RncY
 VHZ1NTY92E6HgpPNw7VsYemDsdIIYhnvpj+fmTDeEbzImwaUw6Ag50CaMEUO+iy3l8Sk5GRty
 TgMpUpkGYTmJKu8skURRfASilz+tUUiy9NF7ESA5FS9TxH1yEPmPrGY1MAQIo+7BJo6w26Ykd
 1iF5pKExyPE/Obsd5g12hiPrB8ttUmCInwln5pEUYNW3WEe0aJxFUMtDHTVPm5MbspODuckvS
 eAxOHLZpHcFSzewmAPV31I68Uxs1gg+3zIJdxBCLg5uyp6mtwRc62qvwUcVhZ
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to boot MacOS ROM.

Pull the condition code and the program counter from the stack.

Operation:

    (SP) -> CCR
    SP + 2 -> SP
    (SP) -> PC
    SP + 4 - > SP

This operation is not privileged.

Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---

Notes:
    v2: update comment
        SP + 4 -> SP

 target/m68k/translate.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ac936ebe8f14..e6942955713c 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2969,6 +2969,20 @@ DISAS_INSN(rtd)
     gen_jmp(s, tmp);
 }
 
+DISAS_INSN(rtr)
+{
+    TCGv tmp;
+    TCGv ccr;
+
+    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
+    gen_set_sr(s, ccr, true);
+    tcg_temp_free(ccr);
+    tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
+    tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
+    tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);
+    gen_jmp(s, tmp);
+}
+
 DISAS_INSN(rts)
 {
     TCGv tmp;
@@ -6015,6 +6029,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
     INSN(addsubq,   5000, f080, M68000);
-- 
2.29.2


