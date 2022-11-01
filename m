Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C191614511
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 08:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opllP-0002NY-7u; Tue, 01 Nov 2022 03:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1opllD-0002Mk-3b
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:32:36 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1opllA-0001oa-8L
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:32:34 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxzNh7y2BjhL0DAA--.13489S3;
 Tue, 01 Nov 2022 15:32:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxHuJ6y2BjP2EJAA--.28642S2; 
 Tue, 01 Nov 2022 15:32:10 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@loongson.cn, xen0n@gentoo.org
Subject: [PATCH 1/2] target/loongarch: Add exception subcode
Date: Tue,  1 Nov 2022 15:32:09 +0800
Message-Id: <20221101073210.3934280-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxHuJ6y2BjP2EJAA--.28642S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFW8Xr1xJr4rJry5ZFWrKrg_yoWrXw4UpF
 s2ka47tryYkFZFy34xJa15Kw13W34xJw4xJw15W3yktFy8t340vr4DWw4rJr9xXrZ5J3yx
 ZF90yryj9wsrCrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

We need subcodes to distinguish the same excode cs->exception_indexs,
such as EXCCODE_ADEF/EXCCODE_ADEM.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c |  7 +++--
 target/loongarch/cpu.h | 58 ++++++++++++++++++++++--------------------
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 49393d95d8..b28aaed5ba 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -220,7 +220,10 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA,
                                       PC, (env->pc >> 2));
     } else {
-        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
+        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE,
+                                    EXCODE_MCODE(cause));
+        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ESUBCODE,
+                                    EXCODE_SUBCODE(cause));
         env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PPLV,
                                    FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV));
         env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PIE,
@@ -257,7 +260,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
             env->pc = env->CSR_TLBRENTRY;
         } else {
             env->pc = env->CSR_EENTRY;
-            env->pc += cause * vec_size;
+            env->pc += EXCODE_MCODE(cause) * vec_size;
         }
         qemu_log_mask(CPU_LOG_INT,
                       "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dce999aaac..dbce176564 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -75,33 +75,37 @@ FIELD(FCSR0, CAUSE, 24, 5)
 #define FP_DIV0           8
 #define FP_INVALID        16
 
-#define  EXCCODE_EXTERNAL_INT   64   /* plus external interrupt number */
-#define  EXCCODE_INT                 0
-#define  EXCCODE_PIL                 1
-#define  EXCCODE_PIS                 2
-#define  EXCCODE_PIF                 3
-#define  EXCCODE_PME                 4
-#define  EXCCODE_PNR                 5
-#define  EXCCODE_PNX                 6
-#define  EXCCODE_PPI                 7
-#define  EXCCODE_ADEF                8 /* Different exception subcode */
-#define  EXCCODE_ADEM                8
-#define  EXCCODE_ALE                 9
-#define  EXCCODE_BCE                 10
-#define  EXCCODE_SYS                 11
-#define  EXCCODE_BRK                 12
-#define  EXCCODE_INE                 13
-#define  EXCCODE_IPE                 14
-#define  EXCCODE_FPD                 15
-#define  EXCCODE_SXD                 16
-#define  EXCCODE_ASXD                17
-#define  EXCCODE_FPE                 18 /* Different exception subcode */
-#define  EXCCODE_VFPE                18
-#define  EXCCODE_WPEF                19 /* Different exception subcode */
-#define  EXCCODE_WPEM                19
-#define  EXCCODE_BTD                 20
-#define  EXCCODE_BTE                 21
-#define  EXCCODE_DBP                 26 /* Reserved subcode used for debug */
+#define EXCODE(code, subcode) ( ((subcode) << 6) | (code) )
+#define EXCODE_MCODE(code)    ( (code) & 0x3f )
+#define EXCODE_SUBCODE(code)  ( (code) >> 6 )
+
+#define  EXCCODE_EXTERNAL_INT        64   /* plus external interrupt number */
+#define  EXCCODE_INT                 EXCODE(0, 0)
+#define  EXCCODE_PIL                 EXCODE(1, 0)
+#define  EXCCODE_PIS                 EXCODE(2, 0)
+#define  EXCCODE_PIF                 EXCODE(3, 0)
+#define  EXCCODE_PME                 EXCODE(4, 0)
+#define  EXCCODE_PNR                 EXCODE(5, 0)
+#define  EXCCODE_PNX                 EXCODE(6, 0)
+#define  EXCCODE_PPI                 EXCODE(7, 0)
+#define  EXCCODE_ADEF                EXCODE(8, 0) /* Different exception subcode */
+#define  EXCCODE_ADEM                EXCODE(8, 1)
+#define  EXCCODE_ALE                 EXCODE(9, 0)
+#define  EXCCODE_BCE                 EXCODE(10, 0)
+#define  EXCCODE_SYS                 EXCODE(11, 0)
+#define  EXCCODE_BRK                 EXCODE(12, 0)
+#define  EXCCODE_INE                 EXCODE(13, 0)
+#define  EXCCODE_IPE                 EXCODE(14, 0)
+#define  EXCCODE_FPD                 EXCODE(15, 0)
+#define  EXCCODE_SXD                 EXCODE(16, 0)
+#define  EXCCODE_ASXD                EXCODE(17, 0)
+#define  EXCCODE_FPE                 EXCODE(18, 0) /* Different exception subcode */
+#define  EXCCODE_VFPE                EXCODE(18, 1)
+#define  EXCCODE_WPEF                EXCODE(19, 0) /* Different exception subcode */
+#define  EXCCODE_WPEM                EXCODE(19, 1)
+#define  EXCCODE_BTD                 EXCODE(20, 0)
+#define  EXCCODE_BTE                 EXCODE(21, 0)
+#define  EXCCODE_DBP                 EXCODE(26, 0) /* Reserved subcode used for debug */
 
 /* cpucfg[0] bits */
 FIELD(CPUCFG0, PRID, 0, 32)
-- 
2.31.1


