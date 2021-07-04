Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3A3BAD6F
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:34:05 +0200 (CEST)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m03C8-0008Gm-9P
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m03Ao-0006Bk-VT
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:32:43 -0400
Received: from smtpbgjp3.qq.com ([54.92.39.34]:59027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m03Al-0008UR-CG
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:32:42 -0400
X-QQ-mid: bizesmtp54t1625409091tknzzoxm
Received: from Wei.localdomain (unknown [223.72.88.167])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 04 Jul 2021 22:31:30 +0800 (CST)
X-QQ-SSF: 0140000000200080X000000B0000000
X-QQ-FEAT: g9nl15ZGxljvewZdWj6FQFzWCm4Pl6WDlpwqL4gpWE2YfJor5fUESGng+FQ97
 wU0hxUsDCYD2xTdap4PZpBivqkC97+uwf8Dc/n/hOe/FIo2qx9d5W8E3vyhquQKbWRPGs3z
 GGryo6qJbaGwC9RKEMxvZpAYe7JPKCQI9v2SJ+jREZwyL2Q0nly5v3BLG9BH/oUfTNgxrQU
 d/suYdsb8scd6IMhaGCKITuLRsGCa+tVuip+qw3oIDI4w3ieNXgHxI4K39CVOTkaC2TEyjk
 LyvivdH7qAjaaMbS8Oablu4aItFlpmCgAfvHG20aZSFze9yNFabYI9fEE/FCRONWdcEMwKZ
 u+5BLEKe9uhv4QX4r1iT3RI7Vk7t78OAG1YqdtKUWCYrAzN5Iw=
X-QQ-GoodBg: 2
From: Liren Wei <lrwei@bupt.edu.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] accel/tcg: Hoist tcg_tb_insert() up above tb_link_page()
Date: Sun,  4 Jul 2021 22:31:26 +0800
Message-Id: <f9fc263f71e11b6308d8c1fbc0dd366bf4aeb532.1625404483.git.lrwei@bupt.edu.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1625404483.git.lrwei@bupt.edu.cn>
References: <cover.1625404483.git.lrwei@bupt.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=54.92.39.34; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpbgjp3.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TranslationBlocks not inserted into the corresponding region
tree shall be regarded as partially initialized objects, and
needs to be finalized first before inserting into QHT.

Signed-off-by: Liren Wei <lrwei@bupt.edu.cn>
---
 accel/tcg/translate-all.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7929a7e320..75e4d06557 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1657,6 +1657,13 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         return tb;
     }
 
+    /*
+     * Insert TB into the corresponding region tree before publishing it
+     * through QHT. Otherwise rewinding happened in the TB might fail to
+     * lookup itself using host PC.
+     */
+    tcg_tb_insert(tb);
+
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
@@ -1675,9 +1682,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         orig_aligned -= ROUND_UP(sizeof(*tb), qemu_icache_linesize);
         qatomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
         tb_destroy(tb);
+        tcg_tb_remove(tb);
         return existing_tb;
     }
-    tcg_tb_insert(tb);
     return tb;
 }
 
-- 
2.32.0




