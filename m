Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7235914A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 03:19:42 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUfoD-00036M-84
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 21:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfd3-0005t2-Cy
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:11 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6254)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfd0-0001Cp-Ok
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617930486; x=1649466486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V+piZ0Ov1cF46o0YuKWLxA2t56DT2YMzF2dkqmiYdjM=;
 b=LppQeV8yrpra+WdIGhfHhQ43lGj+jTXj0qsjDcV71HevJpRgXMyI/X2A
 BJSFkffRByQce2WOFm07bDfDxSMcg2mucR66wF159xmzs0iuOu2biPp+Y
 MtHi3RS1D9Fce+8BqJs2SEA46Mhjwlge+sVU1l5r0M5fzNdppEGmoGGBX k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 08 Apr 2021 18:07:57 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6B5FC11C0; Thu,  8 Apr 2021 20:07:56 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/26] Hexagon (target/hexagon) cleanup
 gen_log_predicated_reg_write_pair
Date: Thu,  8 Apr 2021 20:07:30 -0500
Message-Id: <1617930474-31979-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to previous cleanup of gen_log_predicated_reg_write

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/genptr.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 87f5d92..07d970f 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -69,36 +69,35 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
 static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
 {
     TCGv val32 = tcg_temp_new();
-    TCGv one = tcg_const_tl(1);
     TCGv zero = tcg_const_tl(0);
     TCGv slot_mask = tcg_temp_new();
 
     tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
     /* Low word */
     tcg_gen_extrl_i64_i32(val32, val);
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
-                       val32, hex_new_value[rnum]);
-#if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum],
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum],
                        slot_mask, zero,
-                       one, hex_reg_written[rnum]);
-#endif
-
+                       val32, hex_new_value[rnum]);
     /* High word */
     tcg_gen_extrh_i64_i32(val32, val);
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum + 1],
                        slot_mask, zero,
                        val32, hex_new_value[rnum + 1]);
 #if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum + 1],
-                       slot_mask, zero,
-                       one, hex_reg_written[rnum + 1]);
+    /*
+     * Do this so HELPER(debug_commit_end) will know
+     *
+     * Note that slot_mask indicates the value is not written
+     * (i.e., slot was cancelled), so we create a true/false value before
+     * or'ing with hex_reg_written[rnum].
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
+    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
+    tcg_gen_or_tl(hex_reg_written[rnum + 1], hex_reg_written[rnum + 1],
+                  slot_mask);
 #endif
 
     tcg_temp_free(val32);
-    tcg_temp_free(one);
     tcg_temp_free(zero);
     tcg_temp_free(slot_mask);
 }
-- 
2.7.4


