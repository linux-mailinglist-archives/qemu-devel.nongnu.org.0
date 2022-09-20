Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05E5BE406
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:59:14 +0200 (CEST)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaay9-0002dI-LJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaZuj-0000P8-3v
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34014 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaZuc-0005Tz-Sl
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmsCjSljVJ8eAA--.35099S9; 
 Tue, 20 Sep 2022 17:51:29 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v2 7/9] hw/loongarch: Fix acpi ged irq number in dsdt table
Date: Tue, 20 Sep 2022 17:50:56 +0800
Message-Id: <20220920095058.4124145-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxnmsCjSljVJ8eAA--.35099S9
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1DJFy8Ar13tr1DKF1kuFg_yoWDJFXEya
 43ArnrG3yDJ3W7Jw18Z3yrJr1UXw1Iy3W3CFsrX34kZ3ZYy3y5JFZxtwnrZF1avrWUuw4f
 G3yFgrsYyw1UAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

In dsdt, acpi ged irq should use gsi number, and the
VIRT_SCI_IRQ means it.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-8-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index d0f01a6485..95e30975a8 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -367,7 +367,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     if (lams->acpi_ged) {
         build_ged_aml(dsdt, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(lams->acpi_ged),
-                      VIRT_SCI_IRQ - PCH_PIC_IRQ_OFFSET, AML_SYSTEM_MEMORY,
+                      VIRT_SCI_IRQ, AML_SYSTEM_MEMORY,
                       VIRT_GED_EVT_ADDR);
     }
 
-- 
2.31.1


