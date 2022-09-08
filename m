Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DB5B1981
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:00:45 +0200 (CEST)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEKy-0000j1-No
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oWE7I-0005Eg-Ti
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43708 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oWE7D-0004yx-JG
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxYOLwuRljGFYUAA--.17873S3; 
 Thu, 08 Sep 2022 17:46:24 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 1/9] hw/loongarch: Remove vga device when loongarch init
Date: Thu,  8 Sep 2022 17:46:15 +0800
Message-Id: <20220908094623.73051-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
References: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxYOLwuRljGFYUAA--.17873S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWkZFyDJw1fuF1kXw13Arb_yoWDtwb_Wa
 43Aw48Wr45ua45W3ZFqw1rAw1UAa1IqFn3AFZrtws7Z3W3Wry3JrW2qw13Zr12g3yUZFsx
 ZrW0vr1Yyr48ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

Remove the vga device when loongarch machine init and
we will support other display device in the future.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/Kconfig | 1 -
 hw/loongarch/virt.c  | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index a99aa387c3..73c52b093e 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,7 +2,6 @@ config LOONGARCH_VIRT
     bool
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
-    imply VGA_PCI
     imply VIRTIO_VGA
     imply PCI_DEVICES
     select ISA_BUS
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5cc0b05538..b56820ecda 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -378,9 +378,6 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
         pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
     }
 
-    /* VGA setup */
-    pci_vga_init(pci_bus);
-
     /*
      * There are some invalid guest memory access.
      * Create some unimplemented devices to emulate this.
-- 
2.31.1


