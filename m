Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A272957338F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 11:54:52 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZ51-0000ET-BI
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 05:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBZ1W-0003Iu-OG
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:14 -0400
Received: from [114.242.206.163] (port=38480 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBZ1U-0005JC-JZ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:14 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39Bslc5iXkcbAA--.18694S6; 
 Wed, 13 Jul 2022 17:50:38 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 4/5] target/loongarch/tlb_helper: Fix coverity integer
 overflow error
Date: Wed, 13 Jul 2022 17:50:35 +0800
Message-Id: <20220713095036.705102-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39Bslc5iXkcbAA--.18694S6
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4rurWxtrWfKrykCw45Wrg_yoWkGFg_CF
 1fJw1v9ryUWw12ywsYv3s8t3W7Kw1IgF45Cay8WrW7K345XF43Ga1qq3Z3Ar4YkrWrCrnI
 kwnFvry3CF4YyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.242.206.163 (deferred)
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


