Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398C5C0281
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:53:57 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob22u-0000kD-3V
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21J-0006U9-In
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:17 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21H-0006Bq-N5
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:17 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MkpKR-1ozcO33t3n-00mMLw; Wed, 21
 Sep 2022 17:52:13 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/5] target/m68k: Implement atomic test-and-set
Date: Wed, 21 Sep 2022 17:52:07 +0200
Message-Id: <20220921155211.402559-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921155211.402559-1-laurent@vivier.eu>
References: <20220921155211.402559-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6g1DQtSzF3ueHZP2WMd66+ue6bRt88KX6gJwkXxaIktn3qtXkZT
 CWXA0VkHvn8DRymwjjstskEtRVeRPYfDrJUx0NjUQG3iEZt3VqSvZvrWjQWSHIgVWxcPup3
 Ow7JDr4KRCW+iLxCS84VrHTUCUf+5Q+QpiVKTd/LuJiFuBfXsGoo615peRn1M//G6P4RLlF
 QcUAiA4jAHxIVCqbQ4xOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R5YDnkGOocw=:bFaqdpWZxeeWuO9IapIbk4
 IB92YUYuI+/l0vp3Kj+KS0rB49U6KwxbBRX7SZntXeOONi4Gobli/P7WNsJb34x5y3uGmPoJ6
 /D+niHZEfxF4yA3ZETpiCIxtEZSXtoxiUo5x7bKHQBWPrZFen2dHGU/qlW+SyFZIyF2jwC//H
 lSNfpC0n3F9HAbcevoyUN+/Q2k69Zrz1DuWgoB9p8AJfMxISWonQxhSdCfZMUcIwJATDXTlBh
 pCCKfGICqnxC/dLuciV07DNFfIc/hHSGQU0MueoeXYvVRPUVPL5HO6K5s27twx5Z5JEYRY3GU
 8NkXS4TweQz2vAKMmKGmZ3kqtUAjL8DLa+W/+j3t2WzYfys7RG3j8fEK/Yv+M6jD2178I27vW
 QJsUPHulBTWYJ3EaBkArqVYLOa3Ni6eVVUt37cIvfVI18RU8U2NLXZowyGaKYOgXTf8smi+mX
 8s/BQcGrsvwXuF6O6lgYTBZz8yKzVZuEZB9+pJzI6KUXZJepwdn5cZIEMvqNSvccS/ZUBJ86H
 +z16fMKzjboPWa24ri7rbtrsEWGfbprKQLhxmPXE2sGWOCb/76hBM6GDCfnDtwPxJflYhHtVI
 TA6S0kJ2YFLUjaXqVBo4bI8l4KMcgj2xijn9Fr+ZIdy8/QJSF5QDQGdQ+kjA689dI3whyWy3u
 ZucGSOTfCzii9g6K9+ipGOQIoDk8soowz4TMdmuJy2jndhHdhiSLaIp+c4XSUuJ0j+NN0lDLV
 WewUZcwBJphPF6Gd81FFhSXEcR+sclOa3qDLh3x0ksewcEg3XDXbVP+3R18Qo8MwHfaCcViCL
 g0ljapu
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

From: Richard Henderson <richard.henderson@linaro.org>

This is slightly more complicated than cas,
because tas is allowed on data registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829051746.227094-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 5098f7e570e0..ffcc761d6011 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2825,19 +2825,39 @@ DISAS_INSN(illegal)
     gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
 }
 
-/* ??? This should be atomic.  */
 DISAS_INSN(tas)
 {
-    TCGv dest;
-    TCGv src1;
-    TCGv addr;
+    int mode = extract32(insn, 3, 3);
+    int reg0 = REG(insn, 0);
 
-    dest = tcg_temp_new();
-    SRC_EA(env, src1, OS_BYTE, 1, &addr);
-    gen_logic_cc(s, src1, OS_BYTE);
-    tcg_gen_ori_i32(dest, src1, 0x80);
-    DEST_EA(env, insn, OS_BYTE, dest, &addr);
-    tcg_temp_free(dest);
+    if (mode == 0) {
+        /* data register direct */
+        TCGv dest = cpu_dregs[reg0];
+        gen_logic_cc(s, dest, OS_BYTE);
+        tcg_gen_ori_tl(dest, dest, 0x80);
+    } else {
+        TCGv src1, addr;
+
+        addr = gen_lea_mode(env, s, mode, reg0, OS_BYTE);
+        if (IS_NULL_QREG(addr)) {
+            gen_addr_fault(s);
+            return;
+        }
+        src1 = tcg_temp_new();
+        tcg_gen_atomic_fetch_or_tl(src1, addr, tcg_constant_tl(0x80),
+                                   IS_USER(s), MO_SB);
+        gen_logic_cc(s, src1, OS_BYTE);
+        tcg_temp_free(src1);
+
+        switch (mode) {
+        case 3: /* Indirect postincrement.  */
+            tcg_gen_addi_i32(AREG(insn, 0), addr, 1);
+            break;
+        case 4: /* Indirect predecrememnt.  */
+            tcg_gen_mov_i32(AREG(insn, 0), addr);
+            break;
+        }
+    }
 }
 
 DISAS_INSN(mull)
-- 
2.37.3


