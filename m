Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024915F02F8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 04:51:06 +0200 (CEST)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe67F-0001Q7-4L
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 22:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oe61g-00045g-Ta
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 22:45:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49242 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oe61d-0002jW-F7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 22:45:20 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxFeI2WDZjJAckAA--.4665S4; 
 Fri, 30 Sep 2022 10:45:13 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, yangxiaojuan@loongson.cn, maobibo@Loongson.cn,
 huqi@loongson.cn
Subject: [PATCH v3 2/3] target/loongarch: Fix fnm{sub/add}_{s/d} set wrong
 flags
Date: Fri, 30 Sep 2022 10:45:09 +0800
Message-Id: <20220930024510.800005-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930024510.800005-1-gaosong@loongson.cn>
References: <20220930024510.800005-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeI2WDZjJAckAA--.4665S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWDCr1UXrWkGr1xWF13CFg_yoW8Ww4xpr
 17CrnrKr4UJay8ZwnFgasFyr97Xr4qqw10q3Z7tFyYyr4Yqa9F9ayrKayq9FWruw10gF48
 Aa1jkw12kws8GFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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


