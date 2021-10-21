Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B849D43588D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 04:17:07 +0200 (CEST)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNdi-00025g-HY
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 22:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1mdNan-0008T6-6q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:14:05 -0400
Received: from smtpbg702.qq.com ([203.205.195.102]:57527
 helo=smtpproxy21.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1mdNaj-0005Mg-BT
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:14:03 -0400
X-QQ-mid: bizesmtp48t1634782421tk6gv5jz
Received: from Wei.localdomain (unknown [223.72.75.51])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 21 Oct 2021 10:13:18 +0800 (CST)
X-QQ-SSF: 01400000002000B0Z000B00Z0000000
X-QQ-FEAT: F3yR32iATbgOjg0qmhZ3EjUZlBeMgf9FcXzIEYQhx7Yi7fKwApBIJ/hw+luNq
 V/bz5A7N0GQ/LpKxkMuI02F4dpSdhOpUUOSi/66wgrleREgIVjB5P3tZ65zpDp/7OdbNuDQ
 taporZr9UAUxA9lhbra2LYUDsGgwiDZFwYPIfzPwqYQ/hxeINuFYOGUbcT5JTSjmnY9SLXB
 Ty8Ca/sSEYZP/0+cZk64h/f524t4AxcfWRoE9ecp+ibBPdnoYZLGC2xQYmpItOyV0OkcQZ+
 2/TPVx8KnK9i4HsbPQ9/B8Lr0kZw22b0oSheFHbBjTBiM5GQqRUwVAzZSaxedhpw1NoWxVt
 rWPWMXRfPRxMecxQ1WdL61dRBo1VSU2g0kl/+IJ
X-QQ-GoodBg: 2
From: Liren Wei <lrwei@bupt.edu.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix constant folding logic of setcond2_i32
Date: Thu, 21 Oct 2021 10:13:14 +0800
Message-Id: <20211021021314.16746-1-lrwei@bupt.edu.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=203.205.195.102; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpproxy21.qq.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_XBL=0.375, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For setcond2_i32 DST, A_low, A_high, B_low, B_high, TCG_COND_EQ,
DST should be 0 as long as either half of A and B are not equal.

Signed-off-by: Liren Wei <lrwei@bupt.edu.cn>
---
 tcg/optimize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c239c3bd07..45a10e5e72 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1492,7 +1492,7 @@ void tcg_optimize(TCGContext *s)
                                                op->args[2], op->args[4],
                                                TCG_COND_EQ);
                 if (tmp == 0) {
-                    goto do_setcond_high;
+                    goto do_setcond_const;
                 } else if (tmp != 1) {
                     goto do_default;
                 }
-- 
2.33.0




