Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27F558EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 05:16:29 +0200 (CEST)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Zo4-0003yl-QY
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 23:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o4Zim-00043H-1W
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 23:11:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44118 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o4Zii-0006fN-4J
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 23:10:59 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0w5K7Vidf5XAA--.33333S9; 
 Fri, 24 Jun 2022 11:10:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v20 07/13] target/loongarch: remove badaddr from CPULoongArch
Date: Fri, 24 Jun 2022 11:10:43 +0800
Message-Id: <20220624031049.1716097-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220624031049.1716097-1-gaosong@loongson.cn>
References: <20220624031049.1716097-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0w5K7Vidf5XAA--.33333S9
X-Coremail-Antispam: 1UD129KBjvJXoWrZry3Cw13tr4DZrWkKryxuFg_yoW8JryUp3
 s3A34UKr40q39rA3s7Xa4rXrn8Wr17Gr4avayIvryvkw45XayDuas5Kwn2kF45Xay5Gryx
 XF1rAw15Za1xX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

We can use CSR_BADV to replace badaddr.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h     | 2 --
 target/loongarch/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 71a5036c3c..4b4fbcdc71 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -246,8 +246,6 @@ typedef struct CPUArchState {
     uint64_t lladdr; /* LL virtual address compared against SC */
     uint64_t llval;
 
-    uint64_t badaddr;
-
     /* LoongArch CSRs */
     uint64_t CSR_CRMD;
     uint64_t CSR_PRMD;
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 0c48834201..24e126fb2d 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -21,7 +21,7 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     } else if (n == 32) {
         return gdb_get_regl(mem_buf, env->pc);
     } else if (n == 33) {
-        return gdb_get_regl(mem_buf, env->badaddr);
+        return gdb_get_regl(mem_buf, env->CSR_BADV);
     }
     return 0;
 }
-- 
2.31.1


