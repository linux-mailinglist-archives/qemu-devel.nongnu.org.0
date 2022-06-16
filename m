Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9B54E107
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:47:02 +0200 (CEST)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1otp-0006O9-EF
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1oXm-0001cq-HG
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:24:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47902 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1oXg-0000FS-TE
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:24:13 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD08LH6tiaiNGAA--.9326S10; 
 Thu, 16 Jun 2022 20:16:17 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v17 08/13] target/loongarch: Fix missing update CSR_BADV
Date: Thu, 16 Jun 2022 20:16:06 +0800
Message-Id: <20220616121611.3316074-9-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616121611.3316074-1-gaosong@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD08LH6tiaiNGAA--.9326S10
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw18AFWkuw4fuFyUCw43Awb_yoWDCrg_Aa
 na93WDXryIgw12qr4j9r95Xw4Fq3WxKF1YkF90vr4UJF4DXrs3Gw4DK34kAFyUurWvqF1f
 uFy2qryakw109jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
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

loongarch_cpu_do_interrupt() should update CSR_BADV for some EXCCODE.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 4c8f96bc3a..e32d4cc269 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -171,18 +171,20 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         cause = cs->exception_index;
         update_badinstr = 0;
         break;
-    case EXCCODE_ADEM:
     case EXCCODE_SYS:
     case EXCCODE_BRK:
+    case EXCCODE_INE:
+    case EXCCODE_IPE:
+    case EXCCODE_FPE:
+        env->CSR_BADV = env->pc;
+        QEMU_FALLTHROUGH;
+    case EXCCODE_ADEM:
     case EXCCODE_PIL:
     case EXCCODE_PIS:
     case EXCCODE_PME:
     case EXCCODE_PNR:
     case EXCCODE_PNX:
     case EXCCODE_PPI:
-    case EXCCODE_INE:
-    case EXCCODE_IPE:
-    case EXCCODE_FPE:
         cause = cs->exception_index;
         break;
     default:
-- 
2.31.1


