Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FAD607856
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:25:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ols11-0001Ac-9f
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:24:57 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrut-0000Yd-42
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1olruk-0000F6-V4
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:18:20 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1olruh-0002m9-IX
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:18:18 -0400
Received: from loongson.cn (unknown [10.90.50.23])
 by gateway (Coremail) with SMTP id _____8Bx3NgJnFJjKHIBAA--.6520S3;
 Fri, 21 Oct 2022 21:18:01 +0800 (CST)
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtuMJnFJjo8kCAA--.11466S2; 
 Fri, 21 Oct 2022 21:18:01 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
Subject: [PATCH] target/i386: Fix caculation of LOCK NEG eflags
Date: Fri, 21 Oct 2022 21:17:44 +0800
Message-Id: <20221021131744.337567-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtuMJnFJjo8kCAA--.11466S2
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAGCWNROmIeOgBQsQ
X-Coremail-Antispam: 1Uk129KBjvJXoW7WrW5ZF4kXrWkXFyktw1DJrb_yoW8WFWrpF
 y7C34IgaykJr15A3srWayUJr4UC398CFW0q39Ikws5WwsxX3ykZr10k3yYga1FvayfurWF
 yFyDuF4DuayUX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
 4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In sequence:
---
lock negl -0x14(%rbp)
pushf
pop    %rax
---

%rax will obtain the wrong value becasue "lock neg" caculates the
wrong eflags. The "s->T0" is updated by the wrong value.

You can use this to do some test:
---
#include <assert.h>

int main()
{
  __volatile__ unsigned test = 0x2363a;
  __volatile__ char cond = 0;
  asm(
      "lock negl %0 \n\t"
      "sets %1"
      : "=m"(test), "=r"(cond)
      :
      :);
  assert(cond & 1);
}
---

Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 target/i386/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e19d5c1c64..e72c32827a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3282,24 +3282,25 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 }
                 a0 = tcg_temp_local_new();
                 t0 = tcg_temp_local_new();
+                t1 = tcg_temp_local_new();
                 label1 = gen_new_label();
 
                 tcg_gen_mov_tl(a0, s->A0);
                 tcg_gen_mov_tl(t0, s->T0);
 
                 gen_set_label(label1);
-                t1 = tcg_temp_new();
                 t2 = tcg_temp_new();
                 tcg_gen_mov_tl(t2, t0);
                 tcg_gen_neg_tl(t1, t0);
                 tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
                                           s->mem_index, ot | MO_LE);
-                tcg_temp_free(t1);
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
                 tcg_temp_free(t2);
+
+                tcg_gen_mov_tl(s->T0, t1);
+                tcg_temp_free(t1);
                 tcg_temp_free(a0);
-                tcg_gen_mov_tl(s->T0, t0);
                 tcg_temp_free(t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
-- 
2.38.0


