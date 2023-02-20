Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265369CF17
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6sV-0002rv-8C; Mon, 20 Feb 2023 09:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <songshaobo@eswincomputing.com>)
 id 1pU0bo-0001Hh-1d
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:29:12 -0500
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net ([46.101.248.176])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <songshaobo@eswincomputing.com>) id 1pU0bk-0001bZ-WF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:29:11 -0500
Received: from E0004756DT.eswin.cn (unknown [10.12.97.136])
 by app2 (Coremail) with SMTP id EggMCgC3JJc+IfNjuqETAA--.51710S4;
 Mon, 20 Feb 2023 15:29:05 +0800 (CST)
From: Shaobo Song <songshaobo@eswincomputing.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alistair.francis@wdc.com,
 Shaobo Song <songshaobo@eswincomputing.com>
Subject: [PATCH] target/riscv: Fix checking of whether instruciton at
 'pc_next' spans pages
Date: Mon, 20 Feb 2023 07:29:00 +0000
Message-Id: <20230220072900.673-1-songshaobo@eswincomputing.com>
X-Mailer: git-send-email 2.33.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EggMCgC3JJc+IfNjuqETAA--.51710S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1rCry8Xw1DAFyfWrWxZwb_yoWDXwc_C3
 yxG3WIg345uF1jyayUCr1kJryUKr1rGr18XFs3GayUKa4YgFy7W3WkXwn7uw1ruF4fXr1x
 C3sFgFy3CF4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
 AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
 uYvjfUYNVyDUUUU
X-CM-SenderInfo: 5vrqw2xkdru046hv4xpqfrz1xxwl0woofrz/
Received-SPF: pass client-ip=46.101.248.176;
 envelope-from=songshaobo@eswincomputing.com;
 helo=zg8tndyumtaxlji0oc4xnzya.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 09:10:28 -0500
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

This bug has a noticeable behavior of falling back to the main loop and
respawning a redundant translation block including a single instruction
when the end address of the compressive instruction is exactly on a page
boundary, and slows down running system performance.

Signed-off-by: Shaobo Song <songshaobo@eswincomputing.com>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 772f9d7..8ffa211 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1261,7 +1261,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
                 uint16_t next_insn = cpu_lduw_code(env, ctx->base.pc_next);
                 int len = insn_len(next_insn);
 
-                if (!is_same_page(&ctx->base, ctx->base.pc_next + len)) {
+                if (!is_same_page(&ctx->base, ctx->base.pc_next + len - 1)) {
                     ctx->base.is_jmp = DISAS_TOO_MANY;
                 }
             }
-- 
2.33.1.windows.1


