Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71725E7276
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 05:33:53 +0200 (CEST)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obZRo-0000ni-JY
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 23:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1obZNN-0004g1-UR
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:29:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43462 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1obZNL-0000s7-EX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:29:17 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxFeIDKC1jj3UgAA--.57803S5; 
 Fri, 23 Sep 2022 11:29:08 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn,
	maobibo@loongson.cn
Subject: [PATCH v1 3/3] hw/intc: Fix LoongArch ipi device emulation
Date: Fri, 23 Sep 2022 11:29:07 +0800
Message-Id: <20220923032907.1728700-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220923032907.1728700-1-yangxiaojuan@loongson.cn>
References: <20220923032907.1728700-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeIDKC1jj3UgAA--.57803S5
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


