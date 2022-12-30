Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B0659713
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 11:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBCBH-0003kD-Sx; Fri, 30 Dec 2022 05:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pBCBE-0003ij-SA
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 05:00:00 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pBCBC-0005Rt-Sw
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 05:00:00 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxfeuXtq5ja3YJAA--.20899S3;
 Fri, 30 Dec 2022 17:59:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtOWWtq5jCSAQAA--.53838S2; 
 Fri, 30 Dec 2022 17:59:50 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v4 0/3] Add irq number property for loongarch pch interrupt
 controller
Date: Fri, 30 Dec 2022 17:59:47 +0800
Message-Id: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOWWtq5jCSAQAA--.53838S2
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFW7tFyfCFWUXFWrXw1UJrb_yoW8Gr4fpr
 W3Zrn8tr4vyry3XFZ3Jw129Fn3JFn7Ww12v3ZIy347Zr4UAr1UXr1ktrZ8WFyUKw4rJr95
 Wa1rKw4UW3WjyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series add irq number property for loongarch pch_msi
and pch_pic interrupt controller.

Changes for v4:
(1) Change the default irq number of pch pic to 32.
(2) Change the default irq number of pch msi to 224(256 - 32).
(3) Move the 'PCH_PIC_IRQ_NUM' macro to pci-host/ls7a.h
    and add prefix 'VIRT' on it to keep standard format.

Changes for v3:
(1) Fix the valid range of msi_irq_num, it will trigger error_setg() when
irq_num is invalid.
(2) Using g_new() to alloc msi_irqs when pch_msi realize.
(3) Using EXTIOI_IRQS macro to replace the 256 irq number.

Changes for v2:
(1) Free pch_msi_irq array in pch_msi_unrealize().

Changes for v1:
(1) Add irq number property for loongarch_pch_msi.
(2) Add irq number property for loongarch_pch_pic.

Tianrui Zhao (3):
  hw/intc/loongarch_pch_msi: add irq number property
  hw/intc/loongarch_pch_pic: add irq number property
  hw/intc/loongarch_pch: Change default irq number of pch irq controller

 hw/intc/loongarch_pch_msi.c         | 33 +++++++++++++++++++++++++---
 hw/intc/loongarch_pch_pic.c         | 34 +++++++++++++++++++++++++----
 hw/loongarch/virt.c                 | 19 ++++++++++------
 include/hw/intc/loongarch_pch_msi.h |  9 ++++----
 include/hw/intc/loongarch_pch_pic.h |  6 ++---
 include/hw/pci-host/ls7a.h          |  2 +-
 6 files changed, 80 insertions(+), 23 deletions(-)

-- 
2.31.1


