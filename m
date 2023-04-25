Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC96EDC23
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:06:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prChe-0001Ho-QH; Tue, 25 Apr 2023 03:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prChb-0001Gp-9H
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:03 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prChX-0007zK-MQ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:03 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxW+ohe0dkcl8AAA--.746S3;
 Tue, 25 Apr 2023 15:02:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S9; 
 Tue, 25 Apr 2023 15:02:56 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 07/44] target/loongarch: Implement vsadd/vssub
Date: Tue, 25 Apr 2023 15:02:11 +0800
Message-Id: <20230425070248.2550028-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFy5uF1DWry7ZFy3Kw17KFg_yoWrXrWxpr
 1UKrWUCr4kJr9rJr1S9ws8ur9xGFnrC3ya9wn3twn8WFW5XF1DJr4ktFWq9ayxZwn5uFW0
 gr1xCryjkr95tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VSADD.{B/H/W/D}[U];
- VSSUB.{B/H/W/D}[U].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 17 +++++++++++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 17 +++++++++++++++++
 target/loongarch/insns.decode               | 17 +++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 5eabb8c47a..b7f9320ba0 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -831,3 +831,20 @@ INSN_LSX(vneg_b,           vv)
 INSN_LSX(vneg_h,           vv)
 INSN_LSX(vneg_w,           vv)
 INSN_LSX(vneg_d,           vv)
+
+INSN_LSX(vsadd_b,          vvv)
+INSN_LSX(vsadd_h,          vvv)
+INSN_LSX(vsadd_w,          vvv)
+INSN_LSX(vsadd_d,          vvv)
+INSN_LSX(vsadd_bu,         vvv)
+INSN_LSX(vsadd_hu,         vvv)
+INSN_LSX(vsadd_wu,         vvv)
+INSN_LSX(vsadd_du,         vvv)
+INSN_LSX(vssub_b,          vvv)
+INSN_LSX(vssub_h,          vvv)
+INSN_LSX(vssub_w,          vvv)
+INSN_LSX(vssub_d,          vvv)
+INSN_LSX(vssub_bu,         vvv)
+INSN_LSX(vssub_hu,         vvv)
+INSN_LSX(vssub_wu,         vvv)
+INSN_LSX(vssub_du,         vvv)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index d02db6285f..082bd738ce 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -140,3 +140,20 @@ TRANS(vneg_b, gvec_vv, MO_8, tcg_gen_gvec_neg)
 TRANS(vneg_h, gvec_vv, MO_16, tcg_gen_gvec_neg)
 TRANS(vneg_w, gvec_vv, MO_32, tcg_gen_gvec_neg)
 TRANS(vneg_d, gvec_vv, MO_64, tcg_gen_gvec_neg)
+
+TRANS(vsadd_b, gvec_vvv, MO_8, tcg_gen_gvec_ssadd)
+TRANS(vsadd_h, gvec_vvv, MO_16, tcg_gen_gvec_ssadd)
+TRANS(vsadd_w, gvec_vvv, MO_32, tcg_gen_gvec_ssadd)
+TRANS(vsadd_d, gvec_vvv, MO_64, tcg_gen_gvec_ssadd)
+TRANS(vsadd_bu, gvec_vvv, MO_8, tcg_gen_gvec_usadd)
+TRANS(vsadd_hu, gvec_vvv, MO_16, tcg_gen_gvec_usadd)
+TRANS(vsadd_wu, gvec_vvv, MO_32, tcg_gen_gvec_usadd)
+TRANS(vsadd_du, gvec_vvv, MO_64, tcg_gen_gvec_usadd)
+TRANS(vssub_b, gvec_vvv, MO_8, tcg_gen_gvec_sssub)
+TRANS(vssub_h, gvec_vvv, MO_16, tcg_gen_gvec_sssub)
+TRANS(vssub_w, gvec_vvv, MO_32, tcg_gen_gvec_sssub)
+TRANS(vssub_d, gvec_vvv, MO_64, tcg_gen_gvec_sssub)
+TRANS(vssub_bu, gvec_vvv, MO_8, tcg_gen_gvec_ussub)
+TRANS(vssub_hu, gvec_vvv, MO_16, tcg_gen_gvec_ussub)
+TRANS(vssub_wu, gvec_vvv, MO_32, tcg_gen_gvec_ussub)
+TRANS(vssub_du, gvec_vvv, MO_64, tcg_gen_gvec_ussub)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index d90798be11..3a29f0a9ab 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -525,3 +525,20 @@ vneg_b           0111 00101001 11000 01100 ..... .....    @vv
 vneg_h           0111 00101001 11000 01101 ..... .....    @vv
 vneg_w           0111 00101001 11000 01110 ..... .....    @vv
 vneg_d           0111 00101001 11000 01111 ..... .....    @vv
+
+vsadd_b          0111 00000100 01100 ..... ..... .....    @vvv
+vsadd_h          0111 00000100 01101 ..... ..... .....    @vvv
+vsadd_w          0111 00000100 01110 ..... ..... .....    @vvv
+vsadd_d          0111 00000100 01111 ..... ..... .....    @vvv
+vsadd_bu         0111 00000100 10100 ..... ..... .....    @vvv
+vsadd_hu         0111 00000100 10101 ..... ..... .....    @vvv
+vsadd_wu         0111 00000100 10110 ..... ..... .....    @vvv
+vsadd_du         0111 00000100 10111 ..... ..... .....    @vvv
+vssub_b          0111 00000100 10000 ..... ..... .....    @vvv
+vssub_h          0111 00000100 10001 ..... ..... .....    @vvv
+vssub_w          0111 00000100 10010 ..... ..... .....    @vvv
+vssub_d          0111 00000100 10011 ..... ..... .....    @vvv
+vssub_bu         0111 00000100 11000 ..... ..... .....    @vvv
+vssub_hu         0111 00000100 11001 ..... ..... .....    @vvv
+vssub_wu         0111 00000100 11010 ..... ..... .....    @vvv
+vssub_du         0111 00000100 11011 ..... ..... .....    @vvv
-- 
2.31.1


