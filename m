Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E172E5B1982
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:00:45 +0200 (CEST)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEKz-0000je-1b
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oWE7H-0005EK-Po
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43714 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oWE7B-0004z2-Lq
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxYOLwuRljGFYUAA--.17873S9; 
 Thu, 08 Sep 2022 17:46:25 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 7/9] hw/loongarch: Fix acpi ged irq number in dsdt table
Date: Thu,  8 Sep 2022 17:46:21 +0800
Message-Id: <20220908094623.73051-8-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
References: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxYOLwuRljGFYUAA--.17873S9
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1fuw4UCry5uF13AF15XFb_yoW3XFcEka
 s3GFnrG3y8Ja4jvw1Iv34fAr1UX3WIkF1SkF1DX3yDZa1ktw45GFs7twnxZr1aqr4Uu3yf
 J34Yqrs5Ar1UAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

In dsdt, acpi ged irq should use gsi number, and the
VIRT_SCI_IRQ means it.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
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


