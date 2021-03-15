Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573F33AA9B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:57:39 +0100 (CET)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfIQ-0008Fp-At
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfFl-000665-7E
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:54:53 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:40968)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfFj-0003kf-GK
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615784091; x=1647320091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SIZrl0Bj0PYYrecgcb1RLy/TVXnXFFzOa5Iu8XMcSNc=;
 b=fo49E5UL2XDcM5/Lgpb1yjQRz4bLGs69eGs+EdA8AfJBw6mgVxPPt7AA
 oSW4Kh/mly4hET/AN9HuhVPH/Op9ZVHZA13N5ffjgH4zhzg7QUcjaKo40
 9MzOunM2Ydrp/wBPoAO67wr1RYTbwghtoqKQoxHrjyNexjuNsBm1AAKZ8 E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2021 21:54:50 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 14 Mar 2021 21:54:49 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BEBBDC90; Sun, 14 Mar 2021 23:54:49 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) TCG generation cleanup
Date: Sun, 14 Mar 2021 23:54:48 -0500
Message-Id: <1615784088-26384-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: philmd@redhat.com, tsimpson@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify TCG generation of hex_reg_written

Address feedback from Richard Henderson <<richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/genptr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 7481f4c..0ad63fe 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -43,9 +43,15 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
                            val, hex_new_value[rnum]);
 #if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum], slot_mask, zero,
-                       one, hex_reg_written[rnum]);
+    /*
+     * Do this so HELPER(debug_commit_end) will know
+     *
+     * Note that slot_mask indicates the value is not written
+     * (i.e., slot was cancelled), so we negate the value before
+     * or'ing with hex_reg_written[rnum].
+     */
+    tcg_gen_xori_tl(slot_mask, slot_mask, 1 << slot);
+    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
 #endif
 
     tcg_temp_free(one);
-- 
2.7.4


