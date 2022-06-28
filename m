Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FA55BDC0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 05:05:45 +0200 (CEST)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o61Xr-0002bb-KG
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 23:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1o61WM-0001vp-JX
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 23:04:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40676 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1o61WJ-0000vG-WE
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 23:04:10 -0400
Received: from localhost.localdomain (unknown [10.2.9.158])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9ugb7piTrBgAA--.7212S2;
 Tue, 28 Jun 2022 11:04:00 +0800 (CST)
From: Mao Bibo <maobibo@loongson.cn>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] include: set vm hva aligned with huge pagesize on loongarch
Date: Tue, 28 Jun 2022 11:04:00 +0800
Message-Id: <20220628030400.1291793-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9ugb7piTrBgAA--.7212S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyDJr4ktr15Aw17WFykKrg_yoWfKrb_Z3
 W7ur4kGr1rW34kKFW29Fn3Jay5G348GF4kuryFyFW7Cr1jkws8Gwn5ur47ur4vkrs0k34r
 uayvyr98ArW7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7kYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUq_b1DUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
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

On loongarch system, page size is 16K rather than 4K like general platforms,
and huge pagesize is 32M. This patch sets hva for vm aligned with huge pagesize
on loongarch host system.

Signed-off-by: Mao Bibo <maobibo@loongson.cn>
---
 include/qemu/osdep.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..4f9aa53e35 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -451,6 +451,9 @@ extern int madvise(char *, size_t, int);
 #  define QEMU_VMALLOC_ALIGN (256 * 4096)
 #elif defined(__linux__) && defined(__sparc__)
 #  define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size(), SHMLBA)
+#elif defined(__linux__) && defined(__loongarch__)
+#  define QEMU_VMALLOC_ALIGN (qemu_real_host_page_size() * \
+                              qemu_real_host_page_size() / sizeof(long))
 #else
 #  define QEMU_VMALLOC_ALIGN qemu_real_host_page_size()
 #endif
-- 
2.27.0


