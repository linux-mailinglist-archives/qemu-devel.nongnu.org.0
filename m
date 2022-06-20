Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7669551238
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:10:58 +0200 (CEST)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CUr-00016b-7R
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3CPT-0006f0-Ui
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47776 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3CPJ-0007Jr-Gp
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:18 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+YjKrBilqVOAA--.20331S10; 
 Mon, 20 Jun 2022 16:04:55 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 8/8] target/loongarch: Fix csrwr timer clear
Date: Mon, 20 Jun 2022 16:04:51 +0800
Message-Id: <20220620080451.3711049-9-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+YjKrBilqVOAA--.20331S10
X-Coremail-Antispam: 1UD129KBjvdXoW5Kw1rXr1xAFW3ZF1ruryfWFg_yoWxGFg_XF
 1xGa1kurW8W3ZIkw1Yvr98tw15Jw18KF1akFsrXF4xKFyUG3ZxXr4qqan3Cw1j9r15Xrn8
 ZrsavrWa9F1YkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/csr_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 24a9389364..7e02787895 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -81,7 +81,9 @@ target_ulong helper_csrwr_ticlr(CPULoongArchState *env, target_ulong val)
     int64_t old_v = 0;
 
     if (val & 0x1) {
+        qemu_mutex_lock_iothread();
         loongarch_cpu_set_irq(cpu, IRQ_TIMER, 0);
+        qemu_mutex_unlock_iothread();
     }
     return old_v;
 }
-- 
2.31.1


