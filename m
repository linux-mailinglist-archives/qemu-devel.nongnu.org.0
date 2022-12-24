Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29618655941
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjq-0007De-Hd; Sat, 24 Dec 2022 03:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjO-0006gk-JL
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:11 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Q2-Iw
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:10 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxVPBntaZjHkkIAA--.18722S3;
 Sat, 24 Dec 2022 16:16:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S14; 
 Sat, 24 Dec 2022 16:16:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 12/43] target/loongarch: Implement vabsd
Date: Sat, 24 Dec 2022 16:16:02 +0800
Message-Id: <20221224081633.4185445-13-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S14
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WFW8Jw1xJw4xXw17WFW5Awb_yoW7Cw1xpr
 W3trW7trWUGFZrZ3ZYvw43J3WYqr4qgw4I9an3Jw48uayxJFykZFyrt3yI9FWxGw4DAryI
 g3Wjy34qyFyrJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VABSD.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 +++
 target/loongarch/helper.h                   |  9 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  9 +++
 target/loongarch/insns.decode               |  9 +++
 target/loongarch/lsx_helper.c               | 63 +++++++++++++++++++++
 5 files changed, 99 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index b0a491033e..8ec612446c 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -896,3 +896,12 @@ INSN_LSX(vavgr_bu,         vvv)
 INSN_LSX(vavgr_hu,         vvv)
 INSN_LSX(vavgr_wu,         vvv)
 INSN_LSX(vavgr_du,         vvv)
+
+INSN_LSX(vabsd_b,          vvv)
+INSN_LSX(vabsd_h,          vvv)
+INSN_LSX(vabsd_w,          vvv)
+INSN_LSX(vabsd_d,          vvv)
+INSN_LSX(vabsd_bu,         vvv)
+INSN_LSX(vabsd_hu,         vvv)
+INSN_LSX(vabsd_wu,         vvv)
+INSN_LSX(vabsd_du,         vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index c6a387c54d..8298af2d40 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -250,3 +250,12 @@ DEF_HELPER_4(vavgr_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vavgr_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vavgr_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vavgr_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vabsd_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vabsd_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 2d43a88d74..00a921a935 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -168,3 +168,12 @@ TRANS(vavgr_bu, gen_vvv, gen_helper_vavgr_bu)
 TRANS(vavgr_hu, gen_vvv, gen_helper_vavgr_hu)
 TRANS(vavgr_wu, gen_vvv, gen_helper_vavgr_wu)
 TRANS(vavgr_du, gen_vvv, gen_helper_vavgr_du)
+
+TRANS(vabsd_b, gen_vvv, gen_helper_vabsd_b)
+TRANS(vabsd_h, gen_vvv, gen_helper_vabsd_h)
+TRANS(vabsd_w, gen_vvv, gen_helper_vabsd_w)
+TRANS(vabsd_d, gen_vvv, gen_helper_vabsd_d)
+TRANS(vabsd_bu, gen_vvv, gen_helper_vabsd_bu)
+TRANS(vabsd_hu, gen_vvv, gen_helper_vabsd_hu)
+TRANS(vabsd_wu, gen_vvv, gen_helper_vabsd_wu)
+TRANS(vabsd_du, gen_vvv, gen_helper_vabsd_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index de6e8a72a9..a770f37b99 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -618,3 +618,12 @@ vavgr_bu         0111 00000110 10100 ..... ..... .....    @vvv
 vavgr_hu         0111 00000110 10101 ..... ..... .....    @vvv
 vavgr_wu         0111 00000110 10110 ..... ..... .....    @vvv
 vavgr_du         0111 00000110 10111 ..... ..... .....    @vvv
+
+vabsd_b          0111 00000110 00000 ..... ..... .....    @vvv
+vabsd_h          0111 00000110 00001 ..... ..... .....    @vvv
+vabsd_w          0111 00000110 00010 ..... ..... .....    @vvv
+vabsd_d          0111 00000110 00011 ..... ..... .....    @vvv
+vabsd_bu         0111 00000110 00100 ..... ..... .....    @vvv
+vabsd_hu         0111 00000110 00101 ..... ..... .....    @vvv
+vabsd_wu         0111 00000110 00110 ..... ..... .....    @vvv
+vabsd_du         0111 00000110 00111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 63161ecd1a..61dc92059e 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -841,3 +841,66 @@ DO_HELPER_VVV(vavgr_bu, 8, helper_vvv, do_vavgr_u)
 DO_HELPER_VVV(vavgr_hu, 16, helper_vvv, do_vavgr_u)
 DO_HELPER_VVV(vavgr_wu, 32, helper_vvv, do_vavgr_u)
 DO_HELPER_VVV(vavgr_du, 64, helper_vvv, do_vavgr_u)
+
+static int64_t vabsd_s(int64_t s1, int64_t s2)
+{
+    return s1 < s2 ? s2- s1 : s1 -s2;
+}
+
+static void do_vabsd_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vabsd_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vabsd_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vabsd_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vabsd_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t vabsd_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return u1 < u2 ? u2 - u1 : u1 -u2;
+}
+
+static void do_vabsd_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vabsd_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vabsd_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vabsd_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vabsd_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vabsd_b, 8, helper_vvv, do_vabsd_s)
+DO_HELPER_VVV(vabsd_h, 16, helper_vvv, do_vabsd_s)
+DO_HELPER_VVV(vabsd_w, 32, helper_vvv, do_vabsd_s)
+DO_HELPER_VVV(vabsd_d, 64, helper_vvv, do_vabsd_s)
+DO_HELPER_VVV(vabsd_bu, 8, helper_vvv, do_vabsd_u)
+DO_HELPER_VVV(vabsd_hu, 16, helper_vvv, do_vabsd_u)
+DO_HELPER_VVV(vabsd_wu, 32, helper_vvv, do_vabsd_u)
+DO_HELPER_VVV(vabsd_du, 64, helper_vvv, do_vabsd_u)
-- 
2.31.1


