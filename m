Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D5575B4D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:11:58 +0200 (CEST)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCEYQ-0006xU-1V
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oCEUb-0001Z2-6W
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:08:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49870 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oCEUY-0000gN-0G
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:08:00 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9AtBNFicw8gAA--.25026S6; 
 Fri, 15 Jul 2022 14:07:49 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 4/5] target/loongarch/tlb_helper: Fix coverity integer
 overflow error
Date: Fri, 15 Jul 2022 14:07:39 +0800
Message-Id: <20220715060740.1500628-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9AtBNFicw8gAA--.25026S6
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4rurWxtrWftFWkJF4fKrg_yoWkuFb_CF
 1xtw1kuryjgw12ywsYv3s8ta43Kw1IgF45CayUW3y7K34UXF43Ga1qq3Z3Ar4Ykr4rCrnx
 CwnFvr13Cr45tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace '1 << shift' with 'MAKE_64BIT_MASK(shift, 1)' to fix
unintentional integer overflow errors in tlb_helper file.

Fix coverity CID: 1489759 1489762

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/tlb_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index bab19c7e05..610b6d123c 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -298,7 +298,7 @@ static void invalidate_tlb_entry(CPULoongArchState *env, int index)
     } else {
         tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
     }
-    pagesize = 1 << tlb_ps;
+    pagesize = MAKE_64BIT_MASK(tlb_ps, 1);
     mask = MAKE_64BIT_MASK(0, tlb_ps + 1);
 
     if (tlb_v0) {
@@ -736,7 +736,7 @@ void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
                 (tmp0 & (~(1 << R_TLBENTRY_G_SHIFT)));
         ps = ptbase + ptwidth - 1;
         if (odd) {
-            tmp0 += (1 << ps);
+            tmp0 += MAKE_64BIT_MASK(ps, 1);
         }
     } else {
         /* 0:64bit, 1:128bit, 2:192bit, 3:256bit */
-- 
2.31.1


