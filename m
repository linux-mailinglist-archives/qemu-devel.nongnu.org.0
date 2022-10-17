Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E4600723
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:57:59 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okK4T-0005mD-VY
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1okJn6-0005KU-OW
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:40:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57830 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1okJmz-0002Sj-NN
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:39:57 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id AQAAf8CxhOSw+Exj8gMAAA--.86S4;
 Mon, 17 Oct 2022 14:39:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 2/5] target/loongarch: Fix fnm{sub/add}_{s/d} set wrong flags
Date: Mon, 17 Oct 2022 14:39:41 +0800
Message-Id: <20221017063944.1443723-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221017063944.1443723-1-gaosong@loongson.cn>
References: <20221017063944.1443723-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhOSw+Exj8gMAAA--.86S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWkWr1xKF1DCw4fCr13CFg_yoW8AF48pr
 17CrnrKr4UJa48ZwnFgasFy3s7Xr4qvw10q3Z7tFyYyr4Yqa9F9ayrKayq9FWrZw10gr48
 Aa1qkr12kws8GrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220930024510.800005-3-gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_farith.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
index 65ad2ffab8..7bb3f41aee 100644
--- a/target/loongarch/insn_trans/trans_farith.c.inc
+++ b/target/loongarch/insn_trans/trans_farith.c.inc
@@ -97,9 +97,9 @@ TRANS(fmadd_s, gen_muladd, gen_helper_fmuladd_s, 0)
 TRANS(fmadd_d, gen_muladd, gen_helper_fmuladd_d, 0)
 TRANS(fmsub_s, gen_muladd, gen_helper_fmuladd_s, float_muladd_negate_c)
 TRANS(fmsub_d, gen_muladd, gen_helper_fmuladd_d, float_muladd_negate_c)
-TRANS(fnmadd_s, gen_muladd, gen_helper_fmuladd_s,
-      float_muladd_negate_product | float_muladd_negate_c)
-TRANS(fnmadd_d, gen_muladd, gen_helper_fmuladd_d,
-      float_muladd_negate_product | float_muladd_negate_c)
-TRANS(fnmsub_s, gen_muladd, gen_helper_fmuladd_s, float_muladd_negate_product)
-TRANS(fnmsub_d, gen_muladd, gen_helper_fmuladd_d, float_muladd_negate_product)
+TRANS(fnmadd_s, gen_muladd, gen_helper_fmuladd_s, float_muladd_negate_result)
+TRANS(fnmadd_d, gen_muladd, gen_helper_fmuladd_d, float_muladd_negate_result)
+TRANS(fnmsub_s, gen_muladd, gen_helper_fmuladd_s,
+      float_muladd_negate_c | float_muladd_negate_result)
+TRANS(fnmsub_d, gen_muladd, gen_helper_fmuladd_d,
+      float_muladd_negate_c | float_muladd_negate_result)
-- 
2.31.1


