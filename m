Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D1655942
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:28:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjA-0006U7-DD; Sat, 24 Dec 2022 03:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziM-00068w-Vp
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:08 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziI-0001Nd-DF
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:06 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxl_FytaZjUkkIAA--.17955S3;
 Sat, 24 Dec 2022 16:16:50 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S35; 
 Sat, 24 Dec 2022 16:16:49 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 33/43] target/loongarch: Implement vfrstp
Date: Sat, 24 Dec 2022 16:16:23 +0800
Message-Id: <20221224081633.4185445-34-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S35
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxArW3Zr17Wr1rAr1fGFWDXFb_yoWrtr4xpr
 W2yrWUKrW8JrWUX3ZYqw15tw1DXrs7Kw1jga1fGwnY9w47WF1DZFykt3ykKa17KwsxZFyI
 q3WfA34jyFyfXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VFRSTP[I].{B/H}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 ++
 target/loongarch/helper.h                   |  5 ++
 target/loongarch/insn_trans/trans_lsx.c.inc |  5 ++
 target/loongarch/insns.decode               |  5 ++
 target/loongarch/lsx_helper.c               | 70 +++++++++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 7212f86eb0..ffcaf06136 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1268,3 +1268,8 @@ INSN_LSX(vbitrevi_b,       vv_i)
 INSN_LSX(vbitrevi_h,       vv_i)
 INSN_LSX(vbitrevi_w,       vv_i)
 INSN_LSX(vbitrevi_d,       vv_i)
+
+INSN_LSX(vfrstp_b,         vvv)
+INSN_LSX(vfrstp_h,         vvv)
+INSN_LSX(vfrstpi_b,        vv_i)
+INSN_LSX(vfrstpi_h,        vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index d1983d9404..781a544622 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -623,3 +623,8 @@ DEF_HELPER_4(vbitrevi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vbitrevi_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vbitrevi_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vbitrevi_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vfrstp_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vfrstp_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vfrstpi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vfrstpi_h, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 141d7474dc..ffa281e717 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -539,3 +539,8 @@ TRANS(vbitrevi_b, gen_vv_i, gen_helper_vbitrevi_b)
 TRANS(vbitrevi_h, gen_vv_i, gen_helper_vbitrevi_h)
 TRANS(vbitrevi_w, gen_vv_i, gen_helper_vbitrevi_w)
 TRANS(vbitrevi_d, gen_vv_i, gen_helper_vbitrevi_d)
+
+TRANS(vfrstp_b, gen_vvv, gen_helper_vfrstp_b)
+TRANS(vfrstp_h, gen_vvv, gen_helper_vfrstp_h)
+TRANS(vfrstpi_b, gen_vv_i, gen_helper_vfrstpi_b)
+TRANS(vfrstpi_h, gen_vv_i, gen_helper_vfrstpi_h)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 74667ae6e0..f537f726a2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -997,3 +997,8 @@ vbitrevi_b       0111 00110001 10000 01 ... ..... .....   @vv_ui3
 vbitrevi_h       0111 00110001 10000 1 .... ..... .....   @vv_ui4
 vbitrevi_w       0111 00110001 10001 ..... ..... .....    @vv_ui5
 vbitrevi_d       0111 00110001 1001 ...... ..... .....    @vv_ui6
+
+vfrstp_b         0111 00010010 10110 ..... ..... .....    @vvv
+vfrstp_h         0111 00010010 10111 ..... ..... .....    @vvv
+vfrstpi_b        0111 00101001 10100 ..... ..... .....    @vv_ui5
+vfrstpi_h        0111 00101001 10101 ..... ..... .....    @vv_ui5
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index f88719908a..31e9270826 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -3398,3 +3398,73 @@ DO_HELPER_VV_I(vbitrevi_b, 8, helper_vv_i, do_vbitrev_i)
 DO_HELPER_VV_I(vbitrevi_h, 16, helper_vv_i, do_vbitrev_i)
 DO_HELPER_VV_I(vbitrevi_w, 32, helper_vv_i, do_vbitrev_i)
 DO_HELPER_VV_I(vbitrevi_d, 64, helper_vv_i, do_vbitrev_i)
+
+void helper_vfrstp_b(CPULoongArchState *env,
+                     uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+
+    int i;
+    int m;
+    for (i = 0; i < 128/8; i++) {
+        if (Vj->B[i] < 0) {
+            break;
+        }
+    }
+    m = Vk->B[0] % 16;
+    Vd->B[m] = (int8_t)i;
+}
+
+void helper_vfrstp_h(CPULoongArchState *env,
+                     uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+
+    int i;
+    int m;
+    for (i = 0; i < 128/16; i++) {
+        if (Vj->H[i] < 0) {
+            break;
+        }
+    }
+    m = Vk->H[0] % 8;
+    Vd->H[m] = (int16_t)i;
+}
+
+void helper_vfrstpi_b(CPULoongArchState *env,
+                      uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    int i;
+    int m;
+    for (i = 0; i < 128/8; i++) {
+        if (Vj->B[i] < 0) {
+            break;
+        }
+    }
+    m = imm % 16;
+    Vd->B[m] = (int8_t)i;
+}
+
+void helper_vfrstpi_h(CPULoongArchState *env,
+                      uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    int i;
+    int m;
+    for (i = 0; i < 128/16; i++) {
+        if (Vj->H[i] < 0){
+            break;
+        }
+    }
+    m = imm % 8;
+    Vd->H[m] = (int16_t)i;
+}
-- 
2.31.1


