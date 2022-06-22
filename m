Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD78554567
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:53:29 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xzE-00027J-Ls
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xvt-00080b-Jm
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:50:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55336 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xvr-0004kr-Ah
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:50:01 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S2; 
 Wed, 22 Jun 2022 18:43:03 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn, zhaotianrui <zhaotianrui@loongson.cn>
Subject: [PATCH 00/10] Add functions for LoongArch virt machine
Date: Wed, 22 Jun 2022 18:42:51 +0800
Message-Id: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1UuFyDZry3Jr4DuF4fGrg_yoW8GFWDpa
 y7uF15Jr4kCrZrJr9xX3sxWr98AFn7Gr42v3W3try8CrW3tryUZr1Iyas0vFyUJa48Jryv
 vr1rCw1UWF4DJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

From: zhaotianrui <zhaotianrui@loongson.cn>

This series add some functions for LoongArch virt machine,
such as support fw_cfg table, loading uefi bios and linux kernel, etc.
Also fix some bugs of ipi device, ECFG reg, etc.

Xiaojuan Yang (10):
  hw/loongarch: rename macro prefix LS_PCI to LS7A_PCI
  hw/loongarch: Add fw_cfg table support
  hw/loongarch: Add uefi bios loading support
  hw/loongarch: Add linux kernel booting support
  hw/loongarch: Add smbios support
  hw/loongarch: Add acpi ged support
  hw/loongarch: Add fdt support
  hw/loongarch: Fix ipi device access of 64bits
  target/loongarch: Fix the meaning of ECFG reg's VS field
  target/loongarch: Add lock when writing timer clear reg

 hw/intc/loongarch_ipi.c         |  85 +++--
 hw/loongarch/Kconfig            |   3 +
 hw/loongarch/acpi-build.c       | 609 ++++++++++++++++++++++++++++++++
 hw/loongarch/fw_cfg.c           |  33 ++
 hw/loongarch/fw_cfg.h           |  15 +
 hw/loongarch/loongson3.c        | 443 +++++++++++++++++++++--
 hw/loongarch/meson.build        |   4 +
 include/hw/intc/loongarch_ipi.h |   8 +-
 include/hw/loongarch/virt.h     |  25 ++
 include/hw/pci-host/ls7a.h      |   8 +-
 target/loongarch/cpu.c          |   5 +
 target/loongarch/cpu.h          |   3 +
 target/loongarch/csr_helper.c   |   2 +
 13 files changed, 1187 insertions(+), 56 deletions(-)
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

-- 
2.31.1


