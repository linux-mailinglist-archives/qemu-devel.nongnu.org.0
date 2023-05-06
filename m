Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B696F8F4E
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:40:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWZ-0005hZ-Kd; Sat, 06 May 2023 02:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWR-0005gF-8j
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:01 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWO-0004Bt-PP
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:58 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx+elE9VVkxqQFAA--.9288S3;
 Sat, 06 May 2023 14:35:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S9; 
 Sat, 06 May 2023 14:35:48 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 07/45] target/loongarch: Implement vsadd/vssub
Date: Sat,  6 May 2023 14:35:02 +0800
Message-Id: <20230506063540.178794-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFy5uF1DWry7ZFy3Kw17KFg_yoWrXw45pr
 1UKrWUCr4kJr9rJr1S9ws8ur9xGFnrC3ya9wn3twn8WFW5XF1DJr4ktFWq9ayxZwn5uFW0
 gr1xCryjkr95tw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
Message-Id: <20230504122810.4094787-8-gaosong@loongson.cn>
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


