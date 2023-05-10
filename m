Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6D6FE155
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:13:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlUF-0000Wr-Hh; Wed, 10 May 2023 11:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lixinyu20s@ict.ac.cn>)
 id 1pwlBK-0001Fx-Ti
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:52:42 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lixinyu20s@ict.ac.cn>) id 1pwlBI-0006Xg-4q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:52:42 -0400
Received: from lxy-MS-7D25.loongson.cn (unknown [132.226.6.133])
 by APP-01 (Coremail) with SMTP id qwCowAAnLp6mr1tkjFIIEw--.15936S2;
 Wed, 10 May 2023 22:52:25 +0800 (CST)
From: lixinyu20s@ict.ac.cn
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Xinyu Li <lixinyu20s@ict.ac.cn>
Subject: [PATCH] target/i386: fix avx2 instructions vzeroall and vpermdq
Date: Wed, 10 May 2023 22:52:22 +0800
Message-Id: <20230510145222.586487-1-lixinyu20s@ict.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnLp6mr1tkjFIIEw--.15936S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxAF15GF13ur15Gw17KFg_yoW8GF13pa
 sxA34xuw4ktrWfJ3WfGFsYgF17G395KFWUKan2yr9YqFsxJFnxZrnxtw4xGFW5XFWxuryq
 yFsIv3y5JFZrX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUka14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwAKzVCY07xG64k0F24l
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU6CJPUUUUU=
X-Originating-IP: [132.226.6.133]
X-CM-SenderInfo: pol0x0t1xsi2g6lf3hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=lixinyu20s@ict.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 May 2023 11:12:00 -0400
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

From: Xinyu Li <lixinyu20s@ict.ac.cn>

vzeroall: xmm_regs should be used instead of xmm_t0
vpermdq: bit 3 and 7 of imm should be considered

Signed-off-by: Xinyu Li <lixinyu20s@ict.ac.cn>
---
 target/i386/ops_sse.h      | 8 ++++++++
 target/i386/tcg/emit.c.inc | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0bd6bfad8a..fb63af7afa 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2497,6 +2497,14 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
     d->Q(1) = r1;
     d->Q(2) = r2;
     d->Q(3) = r3;
+    if (order & 0x8) {
+        d->Q(0) = 0;
+        d->Q(1) = 0;
+    }
+    if (order & 0x80) {
+        d->Q(2) = 0;
+        d->Q(3) = 0;
+    }
 }
 
 void helper_vpermq_ymm(Reg *d, Reg *s, uint32_t order)
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 95fb4f52fa..4fe8dec427 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -2285,7 +2285,7 @@ static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
 {
     TCGv_ptr ptr = tcg_temp_new_ptr();
 
-    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
+    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_regs));
     gen_helper_memset(ptr, ptr, tcg_constant_i32(0),
                       tcg_constant_ptr(CPU_NB_REGS * sizeof(ZMMReg)));
 }
-- 
2.34.1


