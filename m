Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC8D5C02E8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:56:49 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob25g-00036K-Lb
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21J-0006UB-Pm
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:17 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21I-0006Bw-0F
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:17 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mdva2-1pAv4F3UTW-00b70D; Wed, 21
 Sep 2022 17:52:14 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 3/5] target/m68k: Perform writback before modifying SR
Date: Wed, 21 Sep 2022 17:52:09 +0200
Message-Id: <20220921155211.402559-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921155211.402559-1-laurent@vivier.eu>
References: <20220921155211.402559-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pzxou0mKXGsU7dP4/b0wxckJpZ5QMQKU1mHG1wVpJuHBOi3SOCL
 kHqxoxYvxwTFQ0G7zuKkPq5pEJiYjKFRd5qxsE6CSa2ha10PqJBNc7a2jOzLuViZS2aPrme
 fjHYrsKAlqYqH8oM43Ez3A+e7avbmg3MvcHCQhiH2jwQIE5lP0BmAlzQ4vizOWeOTWfr54x
 j41eo/vDqbbwOL7ZT4Sow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jxz/plHLh+M=:xsXndB3r1UogomeNHTeF7+
 7W7OV8yC58bcwYFvCH3f0MqAw+21A0qhi9M+YOg6Geyy+hs2+UPRoyfpDFVKbfadYzySwdnxA
 Wqd7CiglZ5fOcIHxzPAqTaSrmHWqzwysksK3lLWV2Lj5D5qIUFqcOoVtGotpQBSI5JlYkyxXm
 wNStFxHAJJNWonxjPPEbFnHYiddyxn8/h85dLLSN35T9xJOzO8ULGUaqdFlyyIH9liOlLqSpe
 g+QUk1FFwK67ZVUsCtwntxOgn2RaxBdIfhaMdBvAIwA1QV+fYA6HCps6znF/pKSuK52D8EfLL
 BnbA9RW+BCJlC+eyBBgknTVpI9aAnOv5HoMEHXB3lZoE/Q4j64Vg0niXksamR0s+73w6c3MRI
 4NwuktSfggm6Mc27mB3ueUEICjzOorz0VNoZSI2np58gvJsnQdCBhPxrAvZ25pNHka2GGZv37
 MeOg+56JSYA/jaOuer5OsHaI5VkKh/GJmoYlxYaUP74klMTx4pFY1tpJrztwIfJI7eKN/wvr/
 Wf5YxMywW2a2jNtg5iGhQVNKkhlBMjruXl506ECQqA/ohaD01sknE/oTq7DjWmGAhdtwJ3tgG
 LzKUY4ZcpKj0ljw26tevRrN0zZwEmzUx9fKRs9W54crzrXYPod47XlAbOnuQzZWRuSZ8M8ZZo
 IM4nGFQALnzYC2JCKyUE+/NYMjpHwBDgD8eeeM1AOD1yny+bbxmYNboASop6g+tF2wbHC9zAP
 1XjInxOEbByRuZy1npDgtoUV48crYxG8bOVNFhZo+w7ok70eFsbl9CQIPzezAXj/fF8dpeR88
 xA7L46B
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Writes to SR may change security state, which may involve
a swap of %ssp with %usp as reflected in %a7.  Finish the
writeback of %sp@+ before swapping stack pointers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1206
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220913142818.7802-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c9bb05380323..4640eadf78e1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2285,9 +2285,9 @@ static void gen_set_sr_im(DisasContext *s, uint16_t val, int ccr_only)
         tcg_gen_movi_i32(QREG_CC_N, val & CCF_N ? -1 : 0);
         tcg_gen_movi_i32(QREG_CC_X, val & CCF_X ? 1 : 0);
     } else {
-        TCGv sr = tcg_const_i32(val);
-        gen_helper_set_sr(cpu_env, sr);
-        tcg_temp_free(sr);
+        /* Must writeback before changing security state. */
+        do_writebacks(s);
+        gen_helper_set_sr(cpu_env, tcg_constant_i32(val));
     }
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -2297,6 +2297,8 @@ static void gen_set_sr(DisasContext *s, TCGv val, int ccr_only)
     if (ccr_only) {
         gen_helper_set_ccr(cpu_env, val);
     } else {
+        /* Must writeback before changing security state. */
+        do_writebacks(s);
         gen_helper_set_sr(cpu_env, val);
     }
     set_cc_op(s, CC_OP_FLAGS);
-- 
2.37.3


