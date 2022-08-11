Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB9F58F64D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 05:12:46 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLycm-0000Fj-3Z
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 23:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oLyaD-0003B2-Bn
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 23:10:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60650 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oLyaB-0006Bh-Dd
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 23:10:05 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxzyP9cvRi8RcNAA--.8789S2;
 Thu, 11 Aug 2022 11:09:49 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 0/6] Add funtions for LoongArch virt machine
Date: Thu, 11 Aug 2022 11:09:42 +0800
Message-Id: <20220811030948.2994206-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxzyP9cvRi8RcNAA--.8789S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF15Ar47Wry7XFyfCw1kGrg_yoWDCwbEgw
 1fZrW5GFW8XF1qva4jga95JrW7Ca1xtFn8AF9IqF4IgryxXr98XFsFvasFvry0gF4UZwn8
 Jrs7tF1rC343ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

This series add some new functions such as fw_cfg dma, platform bus,
hotplug handler for LoongArch virt machine, And remove the default
vga display device, using ramfb to replace it.

Changes for v1:
1. Remove default vga device.
2. Support fw_cfg dma function.
3. Add interrupt information to FDT table.
4. Add platform bus support.
5. Add hotplug handler for machine.
6. Add RAMFB to dynamic_sysbus_devices list.

Please help review.
Thanks.

Xiaojuan Yang (6):
  hw/loongarch: Remove vga device when loongarch init
  hw/loongarch: Support fw_cfg dma function
  hw/loongarch: Add interrupt information to FDT table
  hw/loongarch: Add platform bus support
  hw/loongarch: Add hotplug handler for machine
  hw/loongarch: Add RAMFB to dynamic_sysbus_devices list

 hw/loongarch/Kconfig        |   3 +-
 hw/loongarch/fw_cfg.c       |   3 +-
 hw/loongarch/virt.c         | 101 ++++++++++++++++++++++++++++++++++--
 include/hw/loongarch/virt.h |   1 +
 include/hw/pci-host/ls7a.h  |   5 ++
 5 files changed, 107 insertions(+), 6 deletions(-)

-- 
2.31.1


