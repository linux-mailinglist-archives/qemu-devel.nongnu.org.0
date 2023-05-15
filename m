Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03DA702DEE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:20:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXpE-0002Ee-NA; Mon, 15 May 2023 09:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pyXos-00020l-2I
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:00:54 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pyXop-0000bX-B4
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:00:53 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxNun9LGJkUdEIAA--.15386S3;
 Mon, 15 May 2023 21:00:45 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx87T7LGJkGD9gAA--.35057S2; 
 Mon, 15 May 2023 21:00:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn
Subject: [PATCH] target/loongarch: Fix LD/ST{LE/GT} instructions get wrong
 CSR_ERA and CSR_BADV
Date: Mon, 15 May 2023 21:00:42 +0800
Message-Id: <20230515130042.2719712-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx87T7LGJkGD9gAA--.35057S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFWDWr4xWFyxZr1DuFy5twb_yoW8WryxpF
 Z7CrZrtrW8CrZ8A3yxJayYqr1DW3y7Gr42qan3ta40kw4Sqr1F9r4kt3909F15Jay5GrWj
 vFsxZw1Yvay8Wa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

1.helper_asrtle_d/helper_asrtgt_d need use GETPC() to get PC;
2 LD/ST{LE/GT} need set CSR_BADV = gpr[rj];
3 ASRTLE.D/ASRTGT.D also write CSR_BADV, but this value is random 
  and has no reference value.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c       | 2 +-
 target/loongarch/op_helper.c | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index c0afc21b2f..ad93ecac92 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -187,10 +187,10 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_IPE:
     case EXCCODE_FPD:
     case EXCCODE_FPE:
-    case EXCCODE_BCE:
     case EXCCODE_SXD:
         env->CSR_BADV = env->pc;
         QEMU_FALLTHROUGH;
+    case EXCCODE_BCE:
     case EXCCODE_ADEM:
     case EXCCODE_PIL:
     case EXCCODE_PIS:
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 568c071601..60335a05e2 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -49,14 +49,16 @@ target_ulong helper_bitswap(target_ulong v)
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj > rk) {
-        do_raise_exception(env, EXCCODE_BCE, 0);
+        env->CSR_BADV = rj;
+        do_raise_exception(env, EXCCODE_BCE, GETPC());
     }
 }
 
 void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj <= rk) {
-        do_raise_exception(env, EXCCODE_BCE, 0);
+        env->CSR_BADV = rj;
+        do_raise_exception(env, EXCCODE_BCE, GETPC());
     }
 }
 
-- 
2.39.1


