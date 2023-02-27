Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA36A6A3C3A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:19:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXsq-0005S3-Op; Mon, 27 Feb 2023 02:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWXsn-0005Rr-Vx
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:25:14 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pWXsa-0006Vp-J9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:25:13 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bxtth6V_xjEwEGAA--.10708S3;
 Mon, 27 Feb 2023 15:10:50 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx2r12V_xj6o8+AA--.46768S2; 
 Mon, 27 Feb 2023 15:10:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn
Subject: [PATCH v1] target/loongarch: Implement Chip Configuraiton Version
 Register(0x0000)
Date: Mon, 27 Feb 2023 15:10:46 +0800
Message-Id: <20230227071046.1445572-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx2r12V_xj6o8+AA--.46768S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr4DWryDJF4DJr1Uuw43GFg_yoW8Gr1Dpr
 9xZFyDKa1UJa9Iya4kCay5Xrn8WFsrGr42vF4xC3y0kr45Xrn7ZF1kt39I9Fy5Ja4rGrWI
 grn5C34UZFWDX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

According to the 3A5000 manual 4.1 implement Chip Configuration
Version Register(0x0000). The manual does not state that 0x0018 is
reserved for the vendor name and 0x0028 is reserved for the chip name.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 2 ++
 target/loongarch/cpu.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 290ab4d526..d1c803c9d6 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -545,6 +545,8 @@ static void loongarch_qemu_write(void *opaque, hwaddr addr,
 static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
 {
     switch (addr) {
+    case VERSION_REG:
+        return 0x11ULL;
     case FEATURE_REG:
         return 1ULL << IOCSRF_MSI | 1ULL << IOCSRF_EXTIOI |
                1ULL << IOCSRF_CSRIPI;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e35cf65597..eabb66fe2f 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -27,9 +27,12 @@
 #define IOCSRF_GMOD             9
 #define IOCSRF_VM               11
 
+#define VERSION_REG             0x0
 #define FEATURE_REG             0x8
 #define VENDOR_REG              0x10
+#define VENDOR_RESERVED_REG     0x18
 #define CPUNAME_REG             0x20
+#define CPUNAME_RESERVED_REG    0x28
 #define MISC_FUNC_REG           0x420
 #define IOCSRM_EXTIOI_EN        48
 
-- 
2.31.1


