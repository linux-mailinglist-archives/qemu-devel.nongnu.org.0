Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0846551255
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:16:08 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CZo-0007kl-Bo
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3CPT-0006f1-VN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47764 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3CPJ-0007Jm-0V
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:16 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+YjKrBilqVOAA--.20331S2; 
 Mon, 20 Jun 2022 16:04:51 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 0/8] Add some functions for LoongArch
Date: Mon, 20 Jun 2022 16:04:43 +0800
Message-Id: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+YjKrBilqVOAA--.20331S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWrAw18tw18Ww4kCF17Wrg_yoW8XFyxpF
 W7uF15Gr48Cr9rJr9xWas8Wrn8Arn7Gr42q3W3trW8CrW7Xr1UZr10yas8ZFy7Xa48Gr92
 vr1rCw1UWF4UJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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

In order to start the latest community BIOS and kernel of LoongArch,
we have added the following patches.

This series add some functions for LoongArch, and fix some errors.
Add bios, kernel, fdt, smbios and acpi options support.

The kernel file:
   * https://github.com/loongson/linux/tree/loongarch-next
The bios file:
   * https://github.com/loongson/edk2
   * https://github.com/loongson/edk2-platforms


Xiaojuan Yang (8):
  hw/loongarch: Add default bios startup support
  hw/loongarch: Add -kernel and -initrd options support
  hw/loongarch: Add LoongArch smbios support
  hw/loongarch: Add LoongArch acpi support
  hw/loongarch: Add fdt support
  hw/loongarch: Fix loongarch ipi device
  target/loongarch: Fix vector size of exception entry address
  target/loongarch: Fix csrwr timer clear

 hw/intc/loongarch_ipi.c         |  85 +++--
 hw/loongarch/Kconfig            |   3 +
 hw/loongarch/acpi-build.c       | 620 ++++++++++++++++++++++++++++++++
 hw/loongarch/fw_cfg.c           |  33 ++
 hw/loongarch/fw_cfg.h           |  15 +
 hw/loongarch/loongson3.c        | 457 +++++++++++++++++++++--
 hw/loongarch/meson.build        |   4 +
 include/hw/intc/loongarch_ipi.h |   8 +-
 include/hw/loongarch/virt.h     |  25 ++
 include/hw/pci-host/ls7a.h      |   5 +
 target/loongarch/cpu.c          |   5 +
 target/loongarch/cpu.h          |   3 +
 target/loongarch/csr_helper.c   |   2 +
 13 files changed, 1213 insertions(+), 52 deletions(-)
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

-- 
2.31.1


