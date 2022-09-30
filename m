Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050775F0592
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 09:17:01 +0200 (CEST)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAGZ-0003Ri-HA
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 03:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oeAAw-0005XS-Ae
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:11:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60410 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oeAAt-0002rF-Ql
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:11:10 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxrmt1ljZjthYkAA--.54493S4; 
 Fri, 30 Sep 2022 15:10:46 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 2/2] hw/intc: Fix LoongArch ipi device emulation
Date: Fri, 30 Sep 2022 15:10:45 +0800
Message-Id: <20220930071045.848674-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930071045.848674-1-yangxiaojuan@loongson.cn>
References: <20220930071045.848674-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxrmt1ljZjthYkAA--.54493S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1DZFy8Gr4ftF4fKw47XFb_yoWfCrX_XF
 nrKF97Gw47u3Wj9w1YqrW5uF18uw4ruF1fCF97ZFWSk345X398Xr4xX3yYvwnrtrW5Wr98
 Jw429r45Ar1j9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
When call this function 'address_space_stl()', it will
trigger loongarch_ipi_writel(), the addr arg is 0x1008
('CORE_SET_OFF'), and qemu_irq_raise will be called in
this case.

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


