Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EFF600731
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:01:38 +0200 (CEST)
Received: from localhost ([::1]:40860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okK7z-0002g2-Pk
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1okJn6-0005KT-OH
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:40:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57836 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1okJmz-0002Sl-Dv
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:39:58 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id AQAAf8CxhOSw+Exj8gMAAA--.86S5;
 Mon, 17 Oct 2022 14:39:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 3/5] softfloat: logB(0) should raise divideByZero exception
Date: Mon, 17 Oct 2022 14:39:42 +0800
Message-Id: <20221017063944.1443723-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221017063944.1443723-1-gaosong@loongson.cn>
References: <20221017063944.1443723-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhOSw+Exj8gMAAA--.86S5
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4rtFyUXry3urWkKr4kWFg_yoWfXrg_ZF
 yUKrn7uw1q9rW7Ganayw4DJayDJa1fZFs8Xw1qqw1xXan0kr1fG3yvqa1UXrWrur4UW3sr
 Was3XF4Skws7JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
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

logB(0) should raise divideByZero exception from IEEE 754-2008 spec 7.3

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220930024510.800005-4-gaosong@loongson.cn>
---
 fpu/softfloat-parts.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a9f268fcab..247400031c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1436,6 +1436,7 @@ static void partsN(log2)(FloatPartsN *a, float_status *s, const FloatFmt *fmt)
             parts_return_nan(a, s);
             return;
         case float_class_zero:
+            float_raise(float_flag_divbyzero, s);
             /* log2(0) = -inf */
             a->cls = float_class_inf;
             a->sign = 1;
-- 
2.31.1


