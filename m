Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F85589C6B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:17:07 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJain-0001T2-Ih
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJaUm-0000Ax-Lb
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52796 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJaUg-0008AY-42
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:36 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axis1Vw+tiTugFAA--.19495S7; 
 Thu, 04 Aug 2022 21:02:15 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 5/5] target/loongarch: Update gdb_set_fpu() and
 gdb_get_fpu()
Date: Thu,  4 Aug 2022 21:02:13 +0800
Message-Id: <20220804130213.1364164-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220804130213.1364164-1-gaosong@loongson.cn>
References: <20220804130213.1364164-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axis1Vw+tiTugFAA--.19495S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy7tFWUurWrCF1DAF1kXwb_yoW8GF13p3
 s3CanI9F4jgF9Fy3Zaqwn8X3Z8Cr1xCrsIq3WSk348Cr4UJ3Wruay8Wr92gF48Aa4vqF45
 WF1rZ3W3uFyrArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

GDB LoongArch fpu use fcc register,  update gdb_set_fpu() and gdb_get_fpu() to match it.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/gdbstub.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 7d95b4b11c..265f0f43b6 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -51,9 +51,14 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
 {
     if (0 <= n && n < 32) {
         return gdb_get_reg64(mem_buf, env->fpr[n]);
-    } else if (32 <= n && n < 40) {
-        return gdb_get_reg8(mem_buf, env->cf[n - 32]);
-    } else if (n == 40) {
+    } else if (n == 32) {
+        /* fcc */
+        uint64_t val = 0;
+        for (int i = 0; i < 8; ++i) {
+            val |= (uint64_t)env->cf[i] << (i * 8);
+        }
+        return gdb_get_reg64(mem_buf, val);
+    } else if (n == 33) {
         return gdb_get_reg32(mem_buf, env->fcsr0);
     }
     return 0;
@@ -67,10 +72,14 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
     if (0 <= n && n < 32) {
         env->fpr[n] = ldq_p(mem_buf);
         length = 8;
-    } else if (32 <= n && n < 40) {
-        env->cf[n - 32] = ldub_p(mem_buf);
-        length = 1;
-    } else if (n == 40) {
+    } else if (n == 32) {
+        /* fcc */
+        uint64_t val = ldq_p(mem_buf);
+        for (int i = 0; i < 8; ++i) {
+            env->cf[i] = (val >> (i * 8)) & 1;
+        }
+        length = 8;
+    } else if (n == 33) {
         env->fcsr0 = ldl_p(mem_buf);
         length = 4;
     }
-- 
2.31.1


