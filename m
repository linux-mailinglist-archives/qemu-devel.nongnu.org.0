Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142654E11A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:51:19 +0200 (CEST)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oxy-0003DN-JF
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1oXm-0001cp-HP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:24:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47904 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1oXg-0000FQ-Oi
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:24:13 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD08LH6tiaiNGAA--.9326S11; 
 Thu, 16 Jun 2022 20:16:17 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v17 09/13] target/loongarch: Fix helper_asrtle_d/asrtgt_d
 raise wrong exception
Date: Thu, 16 Jun 2022 20:16:07 +0800
Message-Id: <20220616121611.3316074-10-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616121611.3316074-1-gaosong@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD08LH6tiaiNGAA--.9326S11
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4fuw43Jw43urWxuw45ZFb_yoW8AryrpF
 s7u3srKFW8CrZ8Aw18XayYgwn8W3y7Gr42gan7Za48Kw4Sqr9YvF4kt3909F15Jay5Gryj
 vFZ5Zw1jva1UWFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Raising EXCCODE_BCE instead of EXCCODE_ADEM for helper_asrtle_d/asrtgt_d.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c       | 2 ++
 target/loongarch/op_helper.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e32d4cc269..0013582a3a 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -51,6 +51,7 @@ static const char * const excp_names[] = {
     [EXCCODE_IPE] = "Instruction privilege error",
     [EXCCODE_FPE] = "Floating Point Exception",
     [EXCCODE_DBP] = "Debug breakpoint",
+    [EXCCODE_BCE] = "Bound Check Exception",
 };
 
 const char *loongarch_exception_name(int32_t exception)
@@ -176,6 +177,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_INE:
     case EXCCODE_IPE:
     case EXCCODE_FPE:
+    case EXCCODE_BCE:
         env->CSR_BADV = env->pc;
         QEMU_FALLTHROUGH;
     case EXCCODE_ADEM:
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index d87049851f..df049cec59 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -49,14 +49,14 @@ target_ulong helper_bitswap(target_ulong v)
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj > rk) {
-        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+        do_raise_exception(env, EXCCODE_BCE, 0);
     }
 }
 
 void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj <= rk) {
-        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+        do_raise_exception(env, EXCCODE_BCE, 0);
     }
 }
 
-- 
2.31.1


