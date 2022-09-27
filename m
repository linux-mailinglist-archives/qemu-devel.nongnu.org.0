Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF65EBA75
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:19:23 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od3wA-00064Q-4V
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1od3pn-0001SL-2a
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40728 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1od3pi-0007Hl-6h
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxT+BJlDJj4J4iAA--.64861S5; 
 Tue, 27 Sep 2022 14:12:26 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v2 3/3] hw/intc: Fix LoongArch ipi device emulation
Date: Tue, 27 Sep 2022 14:12:25 +0800
Message-Id: <20220927061225.3566554-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxT+BJlDJj4J4iAA--.64861S5
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1DZFy8Gr4ftF4fKw47XFb_yoW3Jrb_X3
 WIkF97Kw47u3Wjvw1YqrW5Zw1rZw4fuFn3CF97ZFWfJ34UXrZ8Jrs3Xw45Zr9FqrW5ur98
 Ja929r45Aw1YgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

In ipi_send function, it should not to set irq before
writing data to dest cpu iocsr space, as the irq will
trigger after data writing.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_ipi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 4f3c58f872..aa4bf9eb74 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -88,7 +88,6 @@ static void ipi_send(uint64_t val)
     cs = qemu_get_cpu(cpuid);
     cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
     address_space_stl(&env->address_space_iocsr, 0x1008,
                       data, MEMTXATTRS_UNSPECIFIED, NULL);
 
-- 
2.31.1


