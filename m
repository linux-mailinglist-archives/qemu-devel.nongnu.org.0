Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4F576CAD
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 11:01:44 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdgE-00087q-TH
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 05:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZN-0005cn-DR
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50094 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZL-0006eW-F4
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:37 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S4; 
 Sat, 16 Jul 2022 16:54:30 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 2/8] fpu/softfloat: Add LoongArch specialization for
 pickNaNMulAdd
Date: Sat, 16 Jul 2022 16:54:20 +0800
Message-Id: <20220716085426.3098060-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uw18Cr15CrWfJFWrKw47XFb_yoW8GF45pr
 y7trWrKa47Gr17CF4SywnYvw15uwn3WF97Ka4ay34kArs8JFWrWF1rKr17tryrXFW8KrWa
 yw42vFW3uF1DArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LoongArch system follows IEEE754-2008 specificationa. The (inf,zero,nan)
case sets InvalidOp and returns the input value 'c', and Prefer sNaN
over qNaN, in the c, a, b order.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 fpu/softfloat-specialize.c.inc | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 943e3301d2..948e1c1b24 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -574,6 +574,29 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
             return 1;
         }
     }
+#elif defined(TARGET_LOONGARCH64)
+    /*
+     * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
+     * case sets InvalidOp and returns the input value 'c'
+     */
+    if (infzero) {
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
+        return 2;
+    }
+    /* Prefer sNaN over qNaN, in the c, a, b order. */
+    if (is_snan(c_cls)) {
+        return 2;
+    } else if (is_snan(a_cls)) {
+        return 0;
+    } else if (is_snan(b_cls)) {
+        return 1;
+    } else if (is_qnan(c_cls)) {
+        return 2;
+    } else if (is_qnan(a_cls)) {
+        return 0;
+    } else {
+        return 1;
+    }
 #elif defined(TARGET_PPC)
     /* For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
      * to return an input NaN if we have one (ie c) rather than generating
-- 
2.31.1


