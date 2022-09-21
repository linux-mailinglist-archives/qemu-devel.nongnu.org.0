Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69065C03AF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:08:57 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2HP-0004gc-K0
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21N-0006Z5-K9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:21 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21M-0006CY-0b
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:21 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M277h-1oYZ2k0iM5-002bT4; Wed, 21
 Sep 2022 17:52:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 5/5] target/m68k: always call gen_exit_tb() after writes to SR
Date: Wed, 21 Sep 2022 17:52:11 +0200
Message-Id: <20220921155211.402559-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921155211.402559-1-laurent@vivier.eu>
References: <20220921155211.402559-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FueM/w/6c16kYeru3Iw4QGIRBFCBHA/jzRAwA3vmzNyVUy1yer9
 K7wiY5/+q6jMWtPlLPC/6RGcopBQq6FnewB9wZFrDuWfBqIGWEaCVuZgUBfugIDvZ+1HSVG
 OZgvjg+EjOelvNAnM5A2OR1AB/5LU0pB6dJeXhS6vFjVKW61crvvSeIBwA5Tpasz0TKrO6c
 IrXCiA0piA7lUsx4Thd6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Nx5aEQE4+E=:lAIC612DNVwaPnDVLADoOP
 y52qK7lpdYoqeJCz2R85wU+ip1oERrxGMDZP4GK12sGVclh6XeS/kMa3Mx0km4vndsjEZtDt7
 uG5Nbm9dM1qhfbfznTwP2q63cQydjAUq/B2NglAo/ZwLARwrfGKGCbaG7aCuf79RsbmfsCEEI
 xfbNPDZfkUV220XIcthKfLhek0hEAdiRHwUvGVlOt5/i2j7JOCbPw9RDYW1oWFpj19954jGLB
 JbUyCAbTtycKQ6EqwXo3XtT1rHUAvaYQn4/NA8uMFO46M53sGy0iLJBrSx68VsdIpzzwt6FC1
 9CxQtiFNg33BMTHQlJBOB790MFpYM/nRCtWQMlcvTCsPiNyoo8RzpjWDn02Vsmxk0RsjVPkMP
 WtFsbpNPG8pfAbMoE4Ik9R9VMY5CTcI7xV4M7soN8fWp9uAEv7z2PrQbGynX2FGrCu3A51xgi
 lI4kfBlbJMNu0Qw2hpx4b5HTJ1ApHR4hdRXzJMf4aw2nEuSJY/CAu/yxE2+urScIGQGWv1IwL
 QgBkd1C5K2FpvNuVHPwh096OHkmHXSJlyYL29oHLYB0fPKCrAj8XblLdPrpWY8lTGLpaHd3dN
 IfVBChgBylWW79aHLUQ2EzC9WDqdHN8BMv1eD8ygJo+xSCNfln/redgdInhXSFcfqiTQ53O+4
 3poZsZasP/6vWVFYahRcB/v+Gg0GKbz0b+zv5N2Dn48edJKr21V4K7bqN3rmwYSSizaKl9hi6
 ICaAE8kYGCBBFc48X1Pb/EmaR2QfjuUqYskzMDqpZorG47YeNJW4GS/m0Vkk/R3oBeQPjlsuR
 YMaT1GE
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Any write to SR can change the security state so always call gen_exit_tb() when
this occurs. In particular MacOS makes use of andiw/oriw in a few places to
handle the switch between user and supervisor mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0b618e8eb2bd..233b9d8e5783 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2375,6 +2375,7 @@ DISAS_INSN(arith_im)
         tcg_gen_or_i32(dest, src1, im);
         if (with_SR) {
             gen_set_sr(s, dest, opsize == OS_BYTE);
+            gen_exit_tb(s);
         } else {
             DEST_EA(env, insn, opsize, dest, &addr);
             gen_logic_cc(s, dest, opsize);
@@ -2384,6 +2385,7 @@ DISAS_INSN(arith_im)
         tcg_gen_and_i32(dest, src1, im);
         if (with_SR) {
             gen_set_sr(s, dest, opsize == OS_BYTE);
+            gen_exit_tb(s);
         } else {
             DEST_EA(env, insn, opsize, dest, &addr);
             gen_logic_cc(s, dest, opsize);
@@ -2407,6 +2409,7 @@ DISAS_INSN(arith_im)
         tcg_gen_xor_i32(dest, src1, im);
         if (with_SR) {
             gen_set_sr(s, dest, opsize == OS_BYTE);
+            gen_exit_tb(s);
         } else {
             DEST_EA(env, insn, opsize, dest, &addr);
             gen_logic_cc(s, dest, opsize);
@@ -4614,6 +4617,7 @@ DISAS_INSN(strldsr)
     }
     gen_push(s, gen_get_sr(s));
     gen_set_sr_im(s, ext, 0);
+    gen_exit_tb(s);
 }
 
 DISAS_INSN(move_from_sr)
-- 
2.37.3


