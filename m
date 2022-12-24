Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F809655946
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjk-0006ss-Ai; Sat, 24 Dec 2022 03:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjN-0006g8-A2
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:09 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Pu-Hk
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:09 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx5vBrtaZjPEkIAA--.18216S3;
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S24; 
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 22/43] target/loongarch: Implement LSX logic instructions
Date: Sat, 24 Dec 2022 16:16:12 +0800
Message-Id: <20221224081633.4185445-23-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S24
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3AFy3ArW7Zr4DAw4UuFWfZrb_yoWxWry3pF
 WYqry3trW8JFWDX3Wvvw43Zws0qrs3Kw1xua1rJr18ZFW7JFnrXrykt3yj9FWUWF95ZryI
 ga4UZryUtryrJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- V{AND/OR/XOR/NOR/ANDN/ORN}.V;
- V{AND/OR/XOR/NOR}I.B.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 12 ++++
 target/loongarch/helper.h                   | 12 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 12 ++++
 target/loongarch/insns.decode               | 13 +++++
 target/loongarch/lsx_helper.c               | 62 +++++++++++++++++++++
 5 files changed, 111 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index b674167120..3e8015ac0e 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1062,3 +1062,15 @@ INSN_LSX(vmskltz_w,        vv)
 INSN_LSX(vmskltz_d,        vv)
 INSN_LSX(vmskgez_b,        vv)
 INSN_LSX(vmsknz_b,         vv)
+
+INSN_LSX(vand_v,           vvv)
+INSN_LSX(vor_v,            vvv)
+INSN_LSX(vxor_v,           vvv)
+INSN_LSX(vnor_v,           vvv)
+INSN_LSX(vandn_v,          vvv)
+INSN_LSX(vorn_v,           vvv)
+
+INSN_LSX(vandi_b,          vv_i)
+INSN_LSX(vori_b,           vv_i)
+INSN_LSX(vxori_b,          vv_i)
+INSN_LSX(vnori_b,          vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index ae9351f513..77b576f22f 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -417,3 +417,15 @@ DEF_HELPER_3(vmskltz_w, void, env, i32, i32)
 DEF_HELPER_3(vmskltz_d, void, env, i32, i32)
 DEF_HELPER_3(vmskgez_b, void, env, i32, i32)
 DEF_HELPER_3(vmsknz_b, void, env, i32,i32)
+
+DEF_HELPER_4(vand_v, void, env, i32, i32, i32)
+DEF_HELPER_4(vor_v, void, env, i32, i32, i32)
+DEF_HELPER_4(vxor_v, void, env, i32, i32, i32)
+DEF_HELPER_4(vnor_v, void, env, i32, i32, i32)
+DEF_HELPER_4(vandn_v, void, env, i32, i32, i32)
+DEF_HELPER_4(vorn_v, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vandi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vori_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vxori_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vnori_b, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index c02602c409..c12de1d3d4 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -333,3 +333,15 @@ TRANS(vmskltz_w, gen_vv, gen_helper_vmskltz_w)
 TRANS(vmskltz_d, gen_vv, gen_helper_vmskltz_d)
 TRANS(vmskgez_b, gen_vv, gen_helper_vmskgez_b)
 TRANS(vmsknz_b,  gen_vv, gen_helper_vmsknz_b)
+
+TRANS(vand_v, gen_vvv, gen_helper_vand_v)
+TRANS(vor_v, gen_vvv, gen_helper_vor_v)
+TRANS(vxor_v, gen_vvv, gen_helper_vxor_v)
+TRANS(vnor_v, gen_vvv, gen_helper_vnor_v)
+TRANS(vandn_v, gen_vvv, gen_helper_vandn_v)
+TRANS(vorn_v, gen_vvv, gen_helper_vorn_v)
+
+TRANS(vandi_b, gen_vv_i, gen_helper_vandi_b)
+TRANS(vori_b, gen_vv_i, gen_helper_vori_b)
+TRANS(vxori_b, gen_vv_i, gen_helper_vxori_b)
+TRANS(vnori_b, gen_vv_i, gen_helper_vnori_b)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 864a524fe6..03b7f76712 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -502,6 +502,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 @vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
+@vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
@@ -789,3 +790,15 @@ vmskltz_w        0111 00101001 11000 10010 ..... .....    @vv
 vmskltz_d        0111 00101001 11000 10011 ..... .....    @vv
 vmskgez_b        0111 00101001 11000 10100 ..... .....    @vv
 vmsknz_b         0111 00101001 11000 11000 ..... .....    @vv
+
+vand_v           0111 00010010 01100 ..... ..... .....    @vvv
+vor_v            0111 00010010 01101 ..... ..... .....    @vvv
+vxor_v           0111 00010010 01110 ..... ..... .....    @vvv
+vnor_v           0111 00010010 01111 ..... ..... .....    @vvv
+vandn_v          0111 00010010 10000 ..... ..... .....    @vvv
+vorn_v           0111 00010010 10001 ..... ..... .....    @vvv
+
+vandi_b          0111 00111101 00 ........ ..... .....    @vv_ui8
+vori_b           0111 00111101 01 ........ ..... .....    @vv_ui8
+vxori_b          0111 00111101 10 ........ ..... .....    @vv_ui8
+vnori_b          0111 00111101 11 ........ ..... .....    @vv_ui8
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index cea1d99eb6..c61479bf74 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1912,3 +1912,65 @@ DO_HELPER_VV(vmskltz_w, 32, helper_vv_z, do_vmskltz)
 DO_HELPER_VV(vmskltz_d, 64, helper_vv_z, do_vmskltz)
 DO_HELPER_VV(vmskgez_b, 8, helper_vv_z, do_vmskgez)
 DO_HELPER_VV(vmsknz_b, 8, helper_vv_z, do_vmsknz)
+
+static void do_vand_v(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    Vd->D[n] = Vj->D[n] & Vk->D[n];
+}
+
+static void do_vor_v(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    Vd->D[n] = Vj->D[n] | Vk->D[n];
+}
+
+static void do_vxor_v(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    Vd->D[n] = Vj->D[n] ^ Vk->D[n];
+}
+
+static void do_vnor_v(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    Vd->D[n] = ~(Vj->D[n] | Vk->D[n]);
+}
+
+static void do_vandn_v(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    Vd->D[n] = ~Vj->D[n] & Vk->D[n];
+}
+
+static void do_vorn_v(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    Vd->D[n] = Vj->D[n] | ~Vk->D[n];
+}
+
+DO_HELPER_VVV(vand_v, 64, helper_vvv, do_vand_v)
+DO_HELPER_VVV(vor_v, 64, helper_vvv, do_vor_v)
+DO_HELPER_VVV(vxor_v, 64, helper_vvv, do_vxor_v)
+DO_HELPER_VVV(vnor_v, 64, helper_vvv, do_vnor_v)
+DO_HELPER_VVV(vandn_v, 64, helper_vvv, do_vandn_v)
+DO_HELPER_VVV(vorn_v, 64, helper_vvv, do_vorn_v)
+
+static void do_vandi_b(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    Vd->B[n] = Vj->B[n] & imm;
+}
+
+static void do_vori_b(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    Vd->B[n] = Vj->B[n] | imm;
+}
+
+static void do_vxori_b(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    Vd->B[n] = Vj->B[n] ^ imm;
+}
+
+static void do_vnori_b(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    Vd->B[n] = ~(Vj->B[n] | imm);
+}
+
+DO_HELPER_VV_I(vandi_b, 8, helper_vv_i, do_vandi_b)
+DO_HELPER_VV_I(vori_b, 8, helper_vv_i, do_vori_b)
+DO_HELPER_VV_I(vxori_b, 8, helper_vv_i, do_vxori_b)
+DO_HELPER_VV_I(vnori_b, 8, helper_vv_i, do_vnori_b)
-- 
2.31.1


