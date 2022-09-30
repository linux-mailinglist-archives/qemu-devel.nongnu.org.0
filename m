Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA755F0814
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:58:40 +0200 (CEST)
Received: from localhost ([::1]:48720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCn1-0002hp-Om
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oeCgW-0004BG-0D
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:51:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34718 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oeCgS-0001U6-0B
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:51:55 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx32srvDZjkCYkAA--.63057S4; 
 Fri, 30 Sep 2022 17:51:44 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v4 2/2] hw/intc: Fix LoongArch ipi device emulation
Date: Fri, 30 Sep 2022 17:51:39 +0800
Message-Id: <20220930095139.867115-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930095139.867115-1-yangxiaojuan@loongson.cn>
References: <20220930095139.867115-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32srvDZjkCYkAA--.63057S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1DZFy8Gr4ftF4fKw47XFb_yoWDGrc_XF
 1xKF97Gw42k3Wj9w1Fqr45Z3W8uw4ruF1fCF97ZFWfK345XrZ8Xrs7X3yYvwnrtrW5Zr98
 J3y2kr45Ar1q9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


