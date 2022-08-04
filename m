Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104A589FE4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:32:23 +0200 (CEST)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJehq-0004Wo-5M
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oJefN-0002PN-TJ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:29:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47118 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oJefL-0002Ap-FH
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:29:49 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxsM4DAuxirU0GAA--.23226S2; 
 Fri, 05 Aug 2022 01:29:39 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org
Subject: [PATCH] disas: Add LoongArch support
Date: Fri,  5 Aug 2022 01:29:39 +0800
Message-Id: <20220804172939.325306-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxsM4DAuxirU0GAA--.23226S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYb7k0a2IF6w1UM7kC6x804xWl14x267AK
 xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
 6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
 4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvE
 ncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I
 8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xS
 Y4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8GY
 LUUUUU=
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAICV3QvP+lDgA0sR
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
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

Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 disas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/disas.c b/disas.c
index e31438f349..d44feeee46 100644
--- a/disas.c
+++ b/disas.c
@@ -176,6 +176,8 @@ static void initialize_debug_host(CPUDebug *s)
 #else
 #error unsupported RISC-V ABI
 #endif
+#elif defined(__loongarch__)
+    s->info.print_insn = print_insn_loongarch;
 #elif defined(__aarch64__)
     s->info.cap_arch = CS_ARCH_ARM64;
 #elif defined(__alpha__)
-- 
2.37.1


