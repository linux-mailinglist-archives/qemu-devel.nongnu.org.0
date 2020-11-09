Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52172ABEBD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 15:33:58 +0100 (CET)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc8F3-0003PS-Q3
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 09:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sk-0003R2-C9; Mon, 09 Nov 2020 09:10:54 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60200
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sh-0002rs-2q; Mon, 09 Nov 2020 09:10:54 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 1A22A6064B;
 Mon,  9 Nov 2020 15:10:25 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 17/17] target/arm: refactor vae1_tlbmask()
Date: Mon,  9 Nov 2020 16:10:20 +0200
Message-Id: <20201109141020.27234-17-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f3edbca709..35540d7a2c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4468,26 +4468,23 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 static int vae1_tlbmask(CPUARMState *env)
 {
     uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
 
     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        uint16_t mask = ARMMMUIdxBit_E20_2 |
-                        ARMMMUIdxBit_E20_2_PAN |
-                        ARMMMUIdxBit_E20_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
-        return mask;
-    } else if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
     } else {
-        return ARMMMUIdxBit_E10_1 |
+        mask = ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
                ARMMMUIdxBit_E10_0;
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        mask >>= ARM_MMU_IDX_A_NS;
+    }
+
+    return mask;
 }
 
 /* Return 56 if TBI is enabled, 64 otherwise. */
-- 
2.29.2


