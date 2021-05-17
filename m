Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41563822F2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 04:56:01 +0200 (CEST)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liTQH-00059g-3L
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 22:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1liTOG-0003JK-P5
 for qemu-devel@nongnu.org; Sun, 16 May 2021 22:53:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59306 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1liTOE-0002Md-By
 for qemu-devel@nongnu.org; Sun, 16 May 2021 22:53:56 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL++12qFg4v0XAA--.20402S2; 
 Mon, 17 May 2021 10:53:42 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] include/qemu/bswap.h: using atomic memory load/store for word
 access
Date: Mon, 17 May 2021 10:53:41 +0800
Message-Id: <1621220021-17199-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL++12qFg4v0XAA--.20402S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr47trWkKF4DJFW7Wr18AFb_yoW5JFWfpa
 15Cr42qw4UAFyxAr4xJF98A343Zwn7Kry5GayYk3WkXF15ArWvq34YyFW8XryrG3yIkryY
 vaykGFyrWFsxXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio ring buffer has lockless ring buffer scheme. When guest vcpu
reads the memory, qemu io thread may is writing the same address.
It requiires atomic operation in qemu side, __builtin_memcpy may
read byte-by-byte.

This patch uses fix this, however it may bring negative performance
effect on system which does not support hw aligned memory access.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 include/qemu/bswap.h | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 2d3bb8b..b914d33 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -327,56 +327,46 @@ static inline void stb_p(void *ptr, uint8_t v)
 }
 
 /*
- * Any compiler worth its salt will turn these memcpy into native unaligned
- * operations.  Thus we don't need to play games with packed attributes, or
- * inline byte-by-byte stores.
- * Some compilation environments (eg some fortify-source implementations)
- * may intercept memcpy() in a way that defeats the compiler optimization,
- * though, so we use __builtin_memcpy() to give ourselves the best chance
- * of good performance.
+ * Some driver using lockless ring buffer like virtio ring requires that
+ * it should be atomic, since guest vcpu thread is reading the memory.
+ * It may bring out negative performance effect for architectures which
+ * do not support hw memory aligned access like mips, if ptr is not word
+ * alignment.
  */
 
 static inline int lduw_he_p(const void *ptr)
 {
-    uint16_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
+    return *(uint16_t *)ptr;
 }
 
 static inline int ldsw_he_p(const void *ptr)
 {
-    int16_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
+    return *(int16_t *)ptr;
 }
 
 static inline void stw_he_p(void *ptr, uint16_t v)
 {
-    __builtin_memcpy(ptr, &v, sizeof(v));
+    *(uint16_t *)ptr = v;
 }
 
 static inline int ldl_he_p(const void *ptr)
 {
-    int32_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
+    return *(int32_t *)ptr;
 }
 
 static inline void stl_he_p(void *ptr, uint32_t v)
 {
-    __builtin_memcpy(ptr, &v, sizeof(v));
+    *(uint32_t *)ptr = v;
 }
 
 static inline uint64_t ldq_he_p(const void *ptr)
 {
-    uint64_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
+    return *(uint64_t *)ptr;
 }
 
 static inline void stq_he_p(void *ptr, uint64_t v)
 {
-    __builtin_memcpy(ptr, &v, sizeof(v));
+    *(uint64_t *)ptr = v;
 }
 
 static inline int lduw_le_p(const void *ptr)
-- 
1.8.3.1


