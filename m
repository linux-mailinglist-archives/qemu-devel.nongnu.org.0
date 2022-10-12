Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA95FC305
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:23:54 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXxx-0003OK-Lu
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oiXo3-0002df-5N
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:13:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44884 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oiXny-0001sN-Tf
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:13:38 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxXWs3hUZj6NIrAA--.30362S3; 
 Wed, 12 Oct 2022 17:13:27 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg/loongarch64: Implement INDEX_op_neg_i{32,64}
Date: Wed, 12 Oct 2022 17:13:26 +0800
Message-Id: <04454bbe9695bd7e5d56f4003ead653fb5719099.1665405913.git.huqi@loongson.cn>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1665405913.git.huqi@loongson.cn>
References: <cover.1665405913.git.huqi@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxXWs3hUZj6NIrAA--.30362S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47uF43Ar4DCryrAFW3Awb_yoW8ZrWDpw
 n7ZrW5Kw48Jay7Gw1ak3WUGr1UAa95u34jvF42gw4jqan8tw1UXFnYgrW7tFWY9FW0vryx
 Zasakr1agF4kA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Kb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
 6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2xwIDUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQARCWNFXOAxfQAJsG
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 tcg/loongarch64/tcg-target.c.inc | 9 +++++++++
 tcg/loongarch64/tcg-target.h     | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a3debf6da7..f5a214a17f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1125,6 +1125,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
         break;
 
+    case INDEX_op_neg_i32:
+        tcg_out_opc_sub_w(s, a0, TCG_REG_ZERO, a1);
+        break;
+    case INDEX_op_neg_i64:
+        tcg_out_opc_sub_d(s, a0, TCG_REG_ZERO, a1);
+        break;
+
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
         if (c2) {
@@ -1503,6 +1510,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ext_i32_i64:
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
+    case INDEX_op_neg_i32:
+    case INDEX_op_neg_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
     case INDEX_op_bswap16_i32:
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index d58a6162f2..67380b2432 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -114,7 +114,7 @@ typedef enum {
 #define TCG_TARGET_HAS_bswap16_i32      1
 #define TCG_TARGET_HAS_bswap32_i32      1
 #define TCG_TARGET_HAS_not_i32          1
-#define TCG_TARGET_HAS_neg_i32          0
+#define TCG_TARGET_HAS_neg_i32          1
 #define TCG_TARGET_HAS_andc_i32         1
 #define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_eqv_i32          0
@@ -150,7 +150,7 @@ typedef enum {
 #define TCG_TARGET_HAS_bswap32_i64      1
 #define TCG_TARGET_HAS_bswap64_i64      1
 #define TCG_TARGET_HAS_not_i64          1
-#define TCG_TARGET_HAS_neg_i64          0
+#define TCG_TARGET_HAS_neg_i64          1
 #define TCG_TARGET_HAS_andc_i64         1
 #define TCG_TARGET_HAS_orc_i64          1
 #define TCG_TARGET_HAS_eqv_i64          0
-- 
2.37.3


