Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AC6F6C06
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:35:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4W-0001Tn-Cd; Thu, 04 May 2023 08:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4P-0001SH-T0
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:27 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4M-0002yv-3x
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:25 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxzOrfpFNkiqAEAA--.7478S3;
 Thu, 04 May 2023 20:28:15 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S9; 
 Thu, 04 May 2023 20:28:15 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 07/44] target/loongarch: Implement vsadd/vssub
Date: Thu,  4 May 2023 20:27:33 +0800
Message-Id: <20230504122810.4094787-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFy5uF1DWry7ZFy3Kw17KFg_yoWrXrWxpr
 1UKrWUCr4kJr9rJr1S9ws8ur9xGFnrC3ya9wn3twn8WFW5XF1DJr4ktFWq9ayxZwn5uFW0
 gr1xCryjkr95tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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


