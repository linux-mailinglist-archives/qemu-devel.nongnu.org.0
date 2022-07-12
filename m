Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4BE5714C0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:37:46 +0200 (CEST)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBOr-0000CC-Lg
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBBJf-0002rQ-Lx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:32:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40892 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBBJa-0006Qz-Mp
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:32:23 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9CGMc1iyeQYAA--.15566S2; 
 Tue, 12 Jul 2022 16:32:06 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 0/6] Support booting bios and kernel for LoongArch
Date: Tue, 12 Jul 2022 16:32:00 +0800
Message-Id: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9CGMc1iyeQYAA--.15566S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1fuw1xuF48ZrWkuw1fCrg_yoW8Gr1Dpa
 y7uF15Cr48Gr9xJr9xtayDWr15Arn7Gr1aq3W3try8CrW7Jr1UZr10kasIvFy7Xa48G34v
 vr1rKw1UWa1DJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

This series add some new funcitons for LoongArch virt machine.
Support loading uefi bios and linux kernel to boot system, and 
add fw_cfg table, smbios table, acpi table, fdt table to transmit
information for the system.

We could get the uefi bios and linux kernel file by this address:
The kernel file:
   * https://github.com/loongson/linux/tree/loongarch-next
The bios file:
   * https://github.com/loongson/edk2
   * https://github.com/loongson/edk2-platforms

Xiaojuan Yang (6):
  hw/loongarch: Add fw_cfg table support
  hw/loongarch: Add uefi bios loading support
  hw/loongarch: Add linux kernel booting support
  hw/loongarch: Add smbios support
  hw/loongarch: Add acpi ged support
  hw/loongarch: Add fdt support

 hw/loongarch/Kconfig        |   3 +
 hw/loongarch/acpi-build.c   | 609 ++++++++++++++++++++++++++++++++++++
 hw/loongarch/fw_cfg.c       |  33 ++
 hw/loongarch/fw_cfg.h       |  15 +
 hw/loongarch/loongson3.c    | 439 ++++++++++++++++++++++++--
 hw/loongarch/meson.build    |   4 +
 include/hw/loongarch/virt.h |  25 ++
 include/hw/pci-host/ls7a.h  |   4 +
 target/loongarch/cpu.c      |   1 +
 target/loongarch/cpu.h      |   3 +
 10 files changed, 1117 insertions(+), 19 deletions(-)
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

-- 
2.31.1


