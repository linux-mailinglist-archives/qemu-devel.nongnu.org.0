Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7758A515
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:39:30 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoBN-0000QN-78
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJo7e-0000Ky-5x
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49502 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJo7c-0002AM-63
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:37 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSs37j+xiQD4HAA--.15649S4; 
 Fri, 05 Aug 2022 11:35:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 v2 2/5] target/loongarch: add gdb_arch_name()
Date: Fri,  5 Aug 2022 11:35:20 +0800
Message-Id: <20220805033523.1416837-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220805033523.1416837-1-gaosong@loongson.cn>
References: <20220805033523.1416837-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSs37j+xiQD4HAA--.15649S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4fXryxCr1UCFy7Ary3XFb_yoWDKFg_Xa
 yfAwn7ur48ua4qgw4qvr98J34fGF4fGFn0kF1DJF4xK34fZr15ArsFqwn3Ary0gr48AFsx
 ArW2yr90kF1YyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

Matches bfd/cpu-loongarch.c, bfd_loongarch_arch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d84ec38cf7..941e2772bc 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -661,6 +661,11 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
 };
 #endif
 
+static gchar *loongarch_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup("loongarch64");
+}
+
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
@@ -686,6 +691,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_stop_before_watchpoint = true;
+    cc->gdb_arch_name = loongarch_gdb_arch_name;
 
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
-- 
2.31.1


