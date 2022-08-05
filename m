Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483F58A514
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:39:27 +0200 (CEST)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoBK-0000Jw-9H
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJo7Z-0000GN-P6
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49396 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJo7W-00027a-QI
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSs37j+xiQD4HAA--.15649S3; 
 Fri, 05 Aug 2022 11:35:24 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 v2 1/5] target/loongarch: Fix GDB get the wrong pc
Date: Fri,  5 Aug 2022 11:35:19 +0800
Message-Id: <20220805033523.1416837-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220805033523.1416837-1-gaosong@loongson.cn>
References: <20220805033523.1416837-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSs37j+xiQD4HAA--.15649S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw17tr48Ww4ktr43GF48JFb_yoW5GF48p3
 s3uw1qkFW0g39Fy3srXa4FqFn8Zr17uF4avF1Iy34xCr48XFy5ZF4Fq39FqF4UG3yFvry2
 qF4rZ3W5ua13XrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

GDB LoongArch add a register orig_a0, see the base64.xml [1].
We should add the orig_a0 to match the upstream GDB.

[1]: https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/base64.xml

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 gdb-xml/loongarch-base64.xml | 1 +
 target/loongarch/cpu.c       | 2 +-
 target/loongarch/gdbstub.c   | 7 +++++--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/gdb-xml/loongarch-base64.xml b/gdb-xml/loongarch-base64.xml
index 4962bdbd28..a1dd4f2208 100644
--- a/gdb-xml/loongarch-base64.xml
+++ b/gdb-xml/loongarch-base64.xml
@@ -39,6 +39,7 @@
   <reg name="r29" bitsize="64" type="uint64" group="general"/>
   <reg name="r30" bitsize="64" type="uint64" group="general"/>
   <reg name="r31" bitsize="64" type="uint64" group="general"/>
+  <reg name="orig_a0" bitsize="64" type="uint64" group="general"/>
   <reg name="pc" bitsize="64" type="code_ptr" group="general"/>
   <reg name="badvaddr" bitsize="64" type="code_ptr" group="general"/>
 </feature>
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 1c69a76f2b..d84ec38cf7 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -683,7 +683,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = loongarch_cpu_gdb_read_register;
     cc->gdb_write_register = loongarch_cpu_gdb_write_register;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
-    cc->gdb_num_core_regs = 34;
+    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_stop_before_watchpoint = true;
 
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 24e126fb2d..5feb43445f 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -19,8 +19,11 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     if (0 <= n && n < 32) {
         return gdb_get_regl(mem_buf, env->gpr[n]);
     } else if (n == 32) {
-        return gdb_get_regl(mem_buf, env->pc);
+        /* orig_a0 */
+        return gdb_get_regl(mem_buf, 0);
     } else if (n == 33) {
+        return gdb_get_regl(mem_buf, env->pc);
+    } else if (n == 34) {
         return gdb_get_regl(mem_buf, env->CSR_BADV);
     }
     return 0;
@@ -36,7 +39,7 @@ int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (0 <= n && n < 32) {
         env->gpr[n] = tmp;
         length = sizeof(target_ulong);
-    } else if (n == 32) {
+    } else if (n == 33) {
         env->pc = tmp;
         length = sizeof(target_ulong);
     }
-- 
2.31.1


