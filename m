Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258C338033
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:21:11 +0100 (CET)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTg6-0005iV-8U
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTdg-0004IO-B2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:40 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:59441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTdZ-00049f-Jn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:40 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MidPj-1lyjnU1SsR-00fh3e; Thu, 11 Mar 2021 23:18:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] target/m68k: implement rtr instruction
Date: Thu, 11 Mar 2021 23:18:24 +0100
Message-Id: <20210311221827.2595898-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311221827.2595898-1-laurent@vivier.eu>
References: <20210311221827.2595898-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ftA5stcrvlAqhsHWa+A3/poNsjhxo42xmGxWM2QJ+EXFC1V9wO3
 ZJYbGJF86Wek8dPa3l+EJY66ZbXDlmcUKAZ3uDYfpIiIW1OEzKWLL5+I5x4NVxnIgF25srW
 djVPipRAubtxTkHVbo+jCfLoPIjvXrlxkmrlfHqnNMrbMBLOOaS3VwCPi137Ot5n9bUZsb5
 eu8foNfr74DY+rHF17eJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:05nLqMf9n3s=:kPMQ+wTapfgqCmYBh2pSyM
 ctJz48JF/iAQdL8IzDfya6JhRQigO/b1njB5g3Ee9567xG+siOiQCvpi4xyyvdYUyZ05sRNSk
 DxZE8KnPsmV3GpTOgS6viJ7rd6gZyR02E0uB0TJjSb05boapOHeCyfVfcFMUvZ3qiO0szdyMv
 imaH742dAGB9V+QUbANNBLkJF99WLGaJp6aShSOYViI2atzyvV+Ti+8e2zKmxYH0MoaDGArc5
 gY0rTBionHRtazXqkCUEMKg0x+7TOO39yAoiVDtcULncFtzEc8uPIw3w8695MtXXQjWkd5rcc
 oq91SsAdv/VJPtiPrFtZLp8dvpHSJPIHKvukExGqjsh5qCfNlcfMrMXtDPlR8c7U8BLFGMAlg
 PM3AQwzGW526Q55pUuKRIhONYJYMhyFzGe+PSXh/Lp97htiLRM+HUC7YXMqtJH4/px4nRvCfO
 03w7/Ox9zw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210307212552.523552-1-laurent@vivier.eu>
---
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


