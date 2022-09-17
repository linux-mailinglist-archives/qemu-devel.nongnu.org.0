Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC795BB727
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 10:15:58 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSzV-0002RP-NF
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 04:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZSkF-0006iN-3f
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:00:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57656 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZSk0-0008Si-CA
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:00:10 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxBOJ2fiVjHQccAA--.40868S7; 
 Sat, 17 Sep 2022 15:59:52 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH 5/5] target/loongarch: div if x/0 set dividend to 0
Date: Sat, 17 Sep 2022 15:59:50 +0800
Message-Id: <20220917075950.1412309-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220917075950.1412309-1-gaosong@loongson.cn>
References: <20220917075950.1412309-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOJ2fiVjHQccAA--.40868S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1Utr4fuFWrWryDWw47XFb_yoW8Kw4rpr
 1kur4aqaykJFZ3Jr42v3WUZr17tF9Ykw4jq3srtr45Grs8Zr1DArs7K3sIgFy8GayrZrWF
 vF95u3WjgF45J3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 KHOP_HELO_FCRDNS=0.399, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

div.d, div.du, div,w, div.wu, the LoongArch host if x/0  the result is 0.
So we set the divisor to 1 and the dividend to 0.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_arith.c.inc | 34 +++++++++++++++----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
index 8e45eadbc8..c97afb16f9 100644
--- a/target/loongarch/insn_trans/trans_arith.c.inc
+++ b/target/loongarch/insn_trans/trans_arith.c.inc
@@ -147,12 +147,28 @@ static void prep_divisor_du(TCGv ret, TCGv src2)
     tcg_gen_movcond_tl(TCG_COND_EQ, ret, src2, zero, one, src2);
 }
 
+static void prep_div(TCGv divisor, TCGv dividend, TCGv src1, TCGv src2)
+{
+    TCGv zero = tcg_constant_tl(0);
+    TCGv one = tcg_constant_tl(1);
+
+    /*
+     * If x / 0, set the diviend to 0 set the divisor to 1
+     * this is the same with LoongArch host.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, dividend, src2, zero, zero, src1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, divisor, src2, zero, one, src2);
+}
+
 static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv t0 = tcg_temp_new();
-    prep_divisor_d(t0, src1, src2);
-    tcg_gen_div_tl(dest, src1, t0);
+    TCGv t1 = tcg_temp_new();
+
+    prep_div(t0, t1, src1, src2);
+    tcg_gen_div_tl(dest, t1, t0);
     tcg_temp_free(t0);
+    tcg_temp_free(t1);
 }
 
 static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
@@ -166,9 +182,11 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
 static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv t0 = tcg_temp_new();
-    prep_divisor_du(t0, src2);
-    tcg_gen_divu_tl(dest, src1, t0);
+    TCGv t1 = tcg_temp_new();
+    prep_div(t0, t1, src1, src2);
+    tcg_gen_divu_tl(dest, t1, t0);
     tcg_temp_free(t0);
+    tcg_temp_free(t1);
 }
 
 static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
@@ -182,10 +200,12 @@ static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
 static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv t0 = tcg_temp_new();
-    /* We need not check for integer overflow for div_w. */
-    prep_divisor_du(t0, src2);
-    tcg_gen_div_tl(dest, src1, t0);
+    TCGv t1 = tcg_temp_new();
+
+    prep_div(t0, t1, src1, src2);
+    tcg_gen_div_tl(dest, t1, t0);
     tcg_temp_free(t0);
+    tcg_temp_free(t1);
 }
 
 static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
-- 
2.31.1


