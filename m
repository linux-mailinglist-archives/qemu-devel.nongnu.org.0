Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D544358B5B8
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 15:37:04 +0200 (CEST)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKJzD-0003CF-EO
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 09:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oKJww-00017h-EI
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 09:34:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48790 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oKJws-0001hs-Tt
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 09:34:41 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxXyPlbe5iCbMIAA--.1591S2;
 Sat, 06 Aug 2022 21:34:30 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org,
	Feiyang Chen <chenfeiyang@loongson.cn>
Subject: [PATCH] target/loongarch: Fix "movfcsr2gr" gets wrong value
Date: Sat,  6 Aug 2022 21:34:26 +0800
Message-Id: <20220806133426.542314-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxXyPlbe5iCbMIAA--.1591S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw48Ww4xXF43Ar4kCw17Jrb_yoWrZF13pa
 1fX345J34rWrWSvF1xGw13Cwn8ZrZ5tw18XFW7KFs09Fn7Ja40qFyqkr1I9F4kAF10gFyF
 gwsxKrnxt3y3Ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAKCV3QvP-JawAOsg
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
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

In follow sequence:
  movgr2fcsr $r0,$r0
  movgr2fr.d $f0,$r0
  fdiv.d     $f0,$f0,$f0
  movfcsr2gr $r12,$r0

The value of $r12 is "0x00000000", but it should be "0x10100000"(V flag).

These fp helpers are definded with wrong flag "TCG_CALL_NO_WG" (but the
helpers write the globle "fcsr"). This causes the "fdiv" helper updates
the "fcsr" into mem, but "movfcsr2gr" does not load it from mem.

Reported-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 target/loongarch/helper.h | 64 +++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index cbbe008f32..8bd6b36f53 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -17,38 +17,38 @@ DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_2(cpucfg, TCG_CALL_NO_RWG_SE, tl, env, tl)
 
 /* Floating-point helper */
-DEF_HELPER_FLAGS_3(fadd_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fsub_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fsub_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmul_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmul_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fdiv_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fdiv_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmax_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmax_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmin_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmin_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmaxa_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmaxa_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmina_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fmina_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-
-DEF_HELPER_FLAGS_5(fmuladd_s, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i32)
-DEF_HELPER_FLAGS_5(fmuladd_d, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i32)
-
-DEF_HELPER_FLAGS_3(fscaleb_s, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(fscaleb_d, TCG_CALL_NO_WG, i64, env, i64, i64)
-
-DEF_HELPER_FLAGS_2(flogb_s, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(flogb_d, TCG_CALL_NO_WG, i64, env, i64)
-
-DEF_HELPER_FLAGS_2(fsqrt_s, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(fsqrt_d, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(frsqrt_s, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(frsqrt_d, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(frecip_s, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(frecip_d, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_3(fadd_s, i64, env, i64, i64)
+DEF_HELPER_3(fadd_d, i64, env, i64, i64)
+DEF_HELPER_3(fsub_s, i64, env, i64, i64)
+DEF_HELPER_3(fsub_d, i64, env, i64, i64)
+DEF_HELPER_3(fmul_s, i64, env, i64, i64)
+DEF_HELPER_3(fmul_d, i64, env, i64, i64)
+DEF_HELPER_3(fdiv_s, i64, env, i64, i64)
+DEF_HELPER_3(fdiv_d, i64, env, i64, i64)
+DEF_HELPER_3(fmax_s, i64, env, i64, i64)
+DEF_HELPER_3(fmax_d, i64, env, i64, i64)
+DEF_HELPER_3(fmin_s, i64, env, i64, i64)
+DEF_HELPER_3(fmin_d, i64, env, i64, i64)
+DEF_HELPER_3(fmaxa_s, i64, env, i64, i64)
+DEF_HELPER_3(fmaxa_d, i64, env, i64, i64)
+DEF_HELPER_3(fmina_s, i64, env, i64, i64)
+DEF_HELPER_3(fmina_d, i64, env, i64, i64)
+
+DEF_HELPER_5(fmuladd_s, i64, env, i64, i64, i64, i32)
+DEF_HELPER_5(fmuladd_d, i64, env, i64, i64, i64, i32)
+
+DEF_HELPER_3(fscaleb_s, i64, env, i64, i64)
+DEF_HELPER_3(fscaleb_d, i64, env, i64, i64)
+
+DEF_HELPER_2(flogb_s, i64, env, i64)
+DEF_HELPER_2(flogb_d, i64, env, i64)
+
+DEF_HELPER_2(fsqrt_s, i64, env, i64)
+DEF_HELPER_2(fsqrt_d, i64, env, i64)
+DEF_HELPER_2(frsqrt_s, i64, env, i64)
+DEF_HELPER_2(frsqrt_d, i64, env, i64)
+DEF_HELPER_2(frecip_s, i64, env, i64)
+DEF_HELPER_2(frecip_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(fclass_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
-- 
2.37.1


