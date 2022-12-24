Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5722B655930
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:22:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjk-0006jg-2Y; Sat, 24 Dec 2022 03:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjN-0006fz-4F
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:09 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Pw-H8
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:08 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxvutxtaZjTkkIAA--.18825S3;
 Sat, 24 Dec 2022 16:16:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S33; 
 Sat, 24 Dec 2022 16:16:48 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 31/43] target/loongarch: Implement vpcnt
Date: Sat, 24 Dec 2022 16:16:21 +0800
Message-Id: <20221224081633.4185445-32-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S33
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuF1UWFWDuw1UKr1fZFWDurg_yoWrAFyDpr
 47KrWxKr4kWFZ7Aan2vw45X347Xrs29w4I9a1ft34rurW7Xr1DZr10qrZFgFWUXw4DZFyI
 g3W2kryjyF95Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VPCNT.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 +++
 target/loongarch/helper.h                   |  5 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  5 +++
 target/loongarch/insns.decode               |  5 +++
 target/loongarch/lsx_helper.c               | 39 +++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 865c293f43..e3d4d105fe 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1238,3 +1238,8 @@ INSN_LSX(vclz_b,           vv)
 INSN_LSX(vclz_h,           vv)
 INSN_LSX(vclz_w,           vv)
 INSN_LSX(vclz_d,           vv)
+
+INSN_LSX(vpcnt_b,          vv)
+INSN_LSX(vpcnt_h,          vv)
+INSN_LSX(vpcnt_w,          vv)
+INSN_LSX(vpcnt_d,          vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 0080890bf6..6869b05105 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -593,3 +593,8 @@ DEF_HELPER_3(vclz_b, void, env, i32, i32)
 DEF_HELPER_3(vclz_h, void, env, i32, i32)
 DEF_HELPER_3(vclz_w, void, env, i32, i32)
 DEF_HELPER_3(vclz_d, void, env, i32, i32)
+
+DEF_HELPER_3(vpcnt_b, void, env, i32, i32)
+DEF_HELPER_3(vpcnt_h, void, env, i32, i32)
+DEF_HELPER_3(vpcnt_w, void, env, i32, i32)
+DEF_HELPER_3(vpcnt_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 105b6fac6e..38493c98b0 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -509,3 +509,8 @@ TRANS(vclz_b, gen_vv, gen_helper_vclz_b)
 TRANS(vclz_h, gen_vv, gen_helper_vclz_h)
 TRANS(vclz_w, gen_vv, gen_helper_vclz_w)
 TRANS(vclz_d, gen_vv, gen_helper_vclz_d)
+
+TRANS(vpcnt_b, gen_vv, gen_helper_vpcnt_b)
+TRANS(vpcnt_h, gen_vv, gen_helper_vpcnt_h)
+TRANS(vpcnt_w, gen_vv, gen_helper_vpcnt_w)
+TRANS(vpcnt_d, gen_vv, gen_helper_vpcnt_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 27cfa306c9..812262ff78 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -967,3 +967,8 @@ vclz_b           0111 00101001 11000 00100 ..... .....    @vv
 vclz_h           0111 00101001 11000 00101 ..... .....    @vv
 vclz_w           0111 00101001 11000 00110 ..... .....    @vv
 vclz_d           0111 00101001 11000 00111 ..... .....    @vv
+
+vpcnt_b          0111 00101001 11000 01000 ..... .....    @vv
+vpcnt_h          0111 00101001 11000 01001 ..... .....    @vv
+vpcnt_w          0111 00101001 11000 01010 ..... .....    @vv
+vpcnt_d          0111 00101001 11000 01011 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 0abb06781f..c9913dec54 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -3197,3 +3197,42 @@ DO_HELPER_VV(vclz_b, 8, helper_vv, do_vclz)
 DO_HELPER_VV(vclz_h, 16, helper_vv, do_vclz)
 DO_HELPER_VV(vclz_w, 32, helper_vv, do_vclz)
 DO_HELPER_VV(vclz_d, 64, helper_vv, do_vclz)
+
+static uint64_t vpcnt(int64_t s1, int bit)
+{
+    uint64_t u1 = s1 & MAKE_64BIT_MASK(0, bit);
+
+    u1 = (u1 & 0x5555555555555555ULL) + ((u1 >>  1) & 0x5555555555555555ULL);
+    u1 = (u1 & 0x3333333333333333ULL) + ((u1 >>  2) & 0x3333333333333333ULL);
+    u1 = (u1 & 0x0F0F0F0F0F0F0F0FULL) + ((u1 >>  4) & 0x0F0F0F0F0F0F0F0FULL);
+    u1 = (u1 & 0x00FF00FF00FF00FFULL) + ((u1 >>  8) & 0x00FF00FF00FF00FFULL);
+    u1 = (u1 & 0x0000FFFF0000FFFFULL) + ((u1 >> 16) & 0x0000FFFF0000FFFFULL);
+    u1 = (u1 & 0x00000000FFFFFFFFULL) + ((u1 >> 32));
+
+    return u1;
+}
+
+static void do_vpcnt(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vpcnt(Vj->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vpcnt(Vj->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vpcnt(Vj->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vpcnt(Vj->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV(vpcnt_b, 8, helper_vv, do_vpcnt)
+DO_HELPER_VV(vpcnt_h, 16, helper_vv, do_vpcnt)
+DO_HELPER_VV(vpcnt_w, 32, helper_vv, do_vpcnt)
+DO_HELPER_VV(vpcnt_d, 64, helper_vv, do_vpcnt)
-- 
2.31.1


