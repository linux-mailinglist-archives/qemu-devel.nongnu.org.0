Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A16211F3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:05:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOFZ-0001lm-36; Tue, 08 Nov 2022 08:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1osOFE-0001ap-Ey
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:02:31 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1osOF9-0002to-QD
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:02:23 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxbbZRU2pjXFEFAA--.5557S3;
 Tue, 08 Nov 2022 21:02:09 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axf+BQU2pjmvkOAA--.41900S2; 
 Tue, 08 Nov 2022 21:02:09 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org,
	richard.henderson@linaro.org
Cc: stefanha@gmaiDDDl.com,
	yangxiaojuan@loongson.cn,
	maobibo@loongson.cn
Subject: [PATCH 1/1] target/loongarch: Fix loongarch fdt addr confict
Date: Tue,  8 Nov 2022 21:02:04 +0800
Message-Id: <20221108130204.926434-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axf+BQU2pjmvkOAA--.41900S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AFW3Ar13tFWftw4rXr47urg_yoW8Xr17pr
 W3Cr45KF48JF1rAr4kWa4qgFn8trZ7A3Wagay7Ar1rur1DXr1jvr1Ygrn2qFyjk3y0ga1F
 vFnYyr1a9Fyktw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix LoongArch check-tcg error:
  TEST    hello on loongarch64
qemu-system-loongarch64: Some ROM regions are overlapping
These ROM regions might have been loaded by direct user request or by default.
They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.

The following two regions overlap (in the memory address space):
  hello ELF program header segment 0 (addresses 0x0000000000200000 - 0x0000000000242000)
  fdt (addresses 0x0000000000200000 - 0x0000000000300000)
make[1]: *** [Makefile:177: run-hello] Error 1

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/system/kernel.ld |  7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/loongarch64/system/kernel.ld b/tests/tcg/loongarch64/system/kernel.ld
index f1a7c0168c..2110cfe8be 100644
--- a/tests/tcg/loongarch64/system/kernel.ld
+++ b/tests/tcg/loongarch64/system/kernel.ld
@@ -2,8 +2,11 @@ ENTRY(_start)
 
 SECTIONS
 {
-    /* Linux kernel legacy start address.  */
-    . = 0x9000000000200000;
+    /*
+     * Linux kernel legacy start address.
+     * FDT is load at 0x200000, kernel image size must be smaller than 1M
+     */
+    . = 0x100000;
     _text = .;
     .text : {
         *(.text)
-- 
2.31.1


