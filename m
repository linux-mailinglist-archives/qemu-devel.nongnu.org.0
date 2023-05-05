Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3D6F7AE9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:30:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulC8-0004hL-Ks; Thu, 04 May 2023 22:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulC6-0004gG-Mq
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:14 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulC3-0000Dm-PV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:14 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx+enpaVRk5vcEAA--.8121S3;
 Fri, 05 May 2023 10:28:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S22; 
 Fri, 05 May 2023 10:28:56 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 20/45] target/loongarch: Implement vmskltz/vmskgez/vmsknz
Date: Fri,  5 May 2023 10:27:41 +0800
Message-Id: <20230505022806.6082-21-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S22
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Xw4Utw45Aw18Zr4kAryftFb_yoWxXF47pF
 yayry2yFW8JryxArna934rWa1DXrsxK3W293Z8K348Xa17XFWDXry8t39F9FW8Xa1UXFyI
 qasIyryagFZxXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bo8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0z
 RVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VMSKLTZ.{B/H/W/D};
- VMSKGEZ.B;
- VMSKNZ.B.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-21-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |   7 ++
 target/loongarch/helper.h                   |   7 ++
 target/loongarch/insn_trans/trans_lsx.c.inc |   7 ++
 target/loongarch/insns.decode               |   7 ++
 target/loongarch/lsx_helper.c               | 113 ++++++++++++++++++++
 5 files changed, 141 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 46e808c321..2725b827ee 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1084,3 +1084,10 @@ INSN_LSX(vsigncov_b,       vvv)
 INSN_LSX(vsigncov_h,       vvv)
 INSN_LSX(vsigncov_w,       vvv)
 INSN_LSX(vsigncov_d,       vvv)
+
+INSN_LSX(vmskltz_b,        vv)
+INSN_LSX(vmskltz_h,        vv)
+INSN_LSX(vmskltz_w,        vv)
+INSN_LSX(vmskltz_d,        vv)
+INSN_LSX(vmskgez_b,        vv)
+INSN_LSX(vmsknz_b,         vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e1e5d58697..34b7b2f576 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -343,3 +343,10 @@ DEF_HELPER_FLAGS_4(vsigncov_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vsigncov_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vsigncov_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vsigncov_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_3(vmskltz_b, void, env, i32, i32)
+DEF_HELPER_3(vmskltz_h, void, env, i32, i32)
+DEF_HELPER_3(vmskltz_w, void, env, i32, i32)
+DEF_HELPER_3(vmskltz_d, void, env, i32, i32)
+DEF_HELPER_3(vmskgez_b, void, env, i32, i32)
+DEF_HELPER_3(vmsknz_b, void, env, i32,i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 644917a695..64387f2666 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2867,3 +2867,10 @@ TRANS(vsigncov_b, gvec_vvv, MO_8, do_vsigncov)
 TRANS(vsigncov_h, gvec_vvv, MO_16, do_vsigncov)
 TRANS(vsigncov_w, gvec_vvv, MO_32, do_vsigncov)
 TRANS(vsigncov_d, gvec_vvv, MO_64, do_vsigncov)
+
+TRANS(vmskltz_b, gen_vv, gen_helper_vmskltz_b)
+TRANS(vmskltz_h, gen_vv, gen_helper_vmskltz_h)
+TRANS(vmskltz_w, gen_vv, gen_helper_vmskltz_w)
+TRANS(vmskltz_d, gen_vv, gen_helper_vmskltz_d)
+TRANS(vmskgez_b, gen_vv, gen_helper_vmskgez_b)
+TRANS(vmsknz_b, gen_vv, gen_helper_vmsknz_b)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 4233dd7404..47c1ef78a7 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -783,3 +783,10 @@ vsigncov_b       0111 00010010 11100 ..... ..... .....    @vvv
 vsigncov_h       0111 00010010 11101 ..... ..... .....    @vvv
 vsigncov_w       0111 00010010 11110 ..... ..... .....    @vvv
 vsigncov_d       0111 00010010 11111 ..... ..... .....    @vvv
+
+vmskltz_b        0111 00101001 11000 10000 ..... .....    @vv
+vmskltz_h        0111 00101001 11000 10001 ..... .....    @vv
+vmskltz_w        0111 00101001 11000 10010 ..... .....    @vv
+vmskltz_d        0111 00101001 11000 10011 ..... .....    @vv
+vmskgez_b        0111 00101001 11000 10100 ..... .....    @vv
+vmsknz_b         0111 00101001 11000 11000 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 408815ea45..2359c63fdf 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -669,3 +669,116 @@ DO_3OP(vsigncov_b, 8, B, DO_SIGNCOV)
 DO_3OP(vsigncov_h, 16, H, DO_SIGNCOV)
 DO_3OP(vsigncov_w, 32, W, DO_SIGNCOV)
 DO_3OP(vsigncov_d, 64, D, DO_SIGNCOV)
+
+static uint64_t do_vmskltz_b(int64_t val)
+{
+    uint64_t m = 0x8080808080808080ULL;
+    uint64_t c =  val & m;
+    c |= c << 7;
+    c |= c << 14;
+    c |= c << 28;
+    return c >> 56;
+}
+
+void HELPER(vmskltz_b)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    uint16_t temp = 0;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp = do_vmskltz_b(Vj->D(0));
+    temp |= (do_vmskltz_b(Vj->D(1)) << 8);
+    Vd->D(0) = temp;
+    Vd->D(1) = 0;
+}
+
+static uint64_t do_vmskltz_h(int64_t val)
+{
+    uint64_t m = 0x8000800080008000ULL;
+    uint64_t c =  val & m;
+    c |= c << 15;
+    c |= c << 30;
+    return c >> 60;
+}
+
+void HELPER(vmskltz_h)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    uint16_t temp = 0;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp = do_vmskltz_h(Vj->D(0));
+    temp |= (do_vmskltz_h(Vj->D(1)) << 4);
+    Vd->D(0) = temp;
+    Vd->D(1) = 0;
+}
+
+static uint64_t do_vmskltz_w(int64_t val)
+{
+    uint64_t m = 0x8000000080000000ULL;
+    uint64_t c =  val & m;
+    c |= c << 31;
+    return c >> 62;
+}
+
+void HELPER(vmskltz_w)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    uint16_t temp = 0;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp = do_vmskltz_w(Vj->D(0));
+    temp |= (do_vmskltz_w(Vj->D(1)) << 2);
+    Vd->D(0) = temp;
+    Vd->D(1) = 0;
+}
+
+static uint64_t do_vmskltz_d(int64_t val)
+{
+    return (uint64_t)val >> 63;
+}
+void HELPER(vmskltz_d)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    uint16_t temp = 0;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp = do_vmskltz_d(Vj->D(0));
+    temp |= (do_vmskltz_d(Vj->D(1)) << 1);
+    Vd->D(0) = temp;
+    Vd->D(1) = 0;
+}
+
+void HELPER(vmskgez_b)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    uint16_t temp = 0;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp =  do_vmskltz_b(Vj->D(0));
+    temp |= (do_vmskltz_b(Vj->D(1)) << 8);
+    Vd->D(0) = (uint16_t)(~temp);
+    Vd->D(1) = 0;
+}
+
+static uint64_t do_vmskez_b(uint64_t a)
+{
+    uint64_t m = 0x7f7f7f7f7f7f7f7fULL;
+    uint64_t c = ~(((a & m) + m) | a | m);
+    c |= c << 7;
+    c |= c << 14;
+    c |= c << 28;
+    return c >> 56;
+}
+
+void HELPER(vmsknz_b)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    uint16_t temp = 0;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp = do_vmskez_b(Vj->D(0));
+    temp |= (do_vmskez_b(Vj->D(1)) << 8);
+    Vd->D(0) = (uint16_t)(~temp);
+    Vd->D(1) = 0;
+}
-- 
2.31.1


