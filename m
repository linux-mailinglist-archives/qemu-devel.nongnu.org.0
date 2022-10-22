Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BA608521
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:32:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om7kd-0007JE-SC; Sat, 22 Oct 2022 02:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1om7kT-0007J3-HE
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 02:12:45 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1om7kQ-00047q-SM
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 02:12:45 -0400
Received: from loongson.cn (unknown [10.90.50.23])
 by gateway (Coremail) with SMTP id _____8Axz7fUiVNjLZkBAA--.2054S3;
 Sat, 22 Oct 2022 14:12:37 +0800 (CST)
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPuLUiVNjeEYDAA--.13144S2; 
 Sat, 22 Oct 2022 14:12:36 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
Subject: [PATCH v2] target/i386: Fix caculation of LOCK NEG eflags
Date: Sat, 22 Oct 2022 14:12:16 +0800
Message-Id: <20221022061216.423098-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPuLUiVNjeEYDAA--.13144S2
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAHCWNSi+IJ-gAKsq
X-Coremail-Antispam: 1Uk129KBjvJXoW7WFyDWry3GF4fCw1rtFy8uFg_yoW8JFy5pF
 W7Cry8K3y8Jr1UCwnrWayUJr1UCws8CFy8Xa9Fyrs5WwnxXw1kZry8K3y5GayF9ayFgF15
 ZryqyFWDCFWjqa7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
 xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
 126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
 6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
 AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
 07jeQ6JUUUUU=
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In sequence:
---
lock negl -0x14(%rbp)
pushf
pop    %rax
---

%rax will obtain the wrong value becasue the "lock neg" caculates the
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
  return 0;
}
---

Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
Signed-off-by: Qi Hu <huqi@loongson.cn>
---
V1 -> V2:
Following Richard's suggestion, just change mov to neg instead of using
local_tmp.
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e19d5c1c64..cec2182080 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3299,7 +3299,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
                 tcg_temp_free(t2);
                 tcg_temp_free(a0);
-                tcg_gen_mov_tl(s->T0, t0);
+                tcg_gen_neg_tl(s->T0, t0);
                 tcg_temp_free(t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
-- 
2.38.0


