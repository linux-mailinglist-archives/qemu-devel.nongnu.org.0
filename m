Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D46D065B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:19:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsAp-0006KW-Kc; Thu, 30 Mar 2023 09:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanhongze@loongson.cn>)
 id 1phrfW-0008F7-Bp
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:46:18 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanhongze@loongson.cn>) id 1phrfQ-00043g-Io
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:46:14 -0400
Received: from loongson.cn (unknown [123.125.11.117])
 by gateway (Coremail) with SMTP id _____8BxMMyJhCVkfGgUAA--.31383S3;
 Thu, 30 Mar 2023 20:46:02 +0800 (CST)
Received: from tanhongze-Dell-G15-5511.. (unknown [123.125.11.117])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur2IhCVkfzARAA--.13524S2; 
 Thu, 30 Mar 2023 20:46:01 +0800 (CST)
From: tanhongze <tanhongze@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/loongarch: Enables plugins to get instruction codes
Date: Thu, 30 Mar 2023 20:46:00 +0800
Message-Id: <20230330124600.1523026-1-tanhongze@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur2IhCVkfzARAA--.13524S2
X-CM-SenderInfo: xwdqx0pqj2vqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jw45KryktFy8XFykGr1fXrb_yoW3Zrg_AF
 1fX3Z7Wr4ruFyIyw409r98Xr1UC3W8WFnYv3Z0gay8GFy5Xw43GrWqq3Z5Cr4j9rs8Xrn8
 u3srtry5Ar1rujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 j7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
 xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxV
 CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
 6r1rMI8E67AF67kF1VAFwI0_Jr0_JrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
 WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
 6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
 UvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=tanhongze@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Mar 2023 09:18:34 -0400
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

Signed-off-by: tanhongze <tanhongze@loongson.cn>
---
 target/loongarch/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3bb63bfb3e..50d6b62f39 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -198,7 +198,7 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     CPULoongArchState *env = cs->env_ptr;
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, &ctx->base, ctx->base.pc_next);
 
     if (!decode(ctx, ctx->opcode)) {
         qemu_log_mask(LOG_UNIMP, "Error: unknown opcode. "
-- 
2.34.1


