Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914BE3333DD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 04:36:06 +0100 (CET)
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJpdl-000250-K8
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 22:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lJpca-0000m6-QZ; Tue, 09 Mar 2021 22:34:52 -0500
Received: from exmail.andestech.com ([60.248.187.195]:45045
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lJpcT-0000JV-Tt; Tue, 09 Mar 2021 22:34:52 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12A3Y77s085585;
 Wed, 10 Mar 2021 11:34:07 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 10 Mar 2021 11:34:05 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <Alistair.Francis@wdc.com>, <palmer@dabbelt.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH 0/3] Support Andes AE350 Platform
Date: Wed, 10 Mar 2021 11:33:55 +0800
Message-ID: <20210310033358.30499-1-dylan@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12A3Y77s085585
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ruinland@andestech.com, Dylan Jhong <dylan@andestech.com>,
 alankao@andestech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches support Andes's Linux BSP booting on 
qemu using 'andes_ae350' machine.

This patchset has implemented the basic components of AE350 platform, 
which are 
  1. PLIC(external interrupts),
  2. PLICSW(interprocessor interrupts),
  3. PLMT(timer interrupts),
  4. UART(16550a),
  5. Virtio MMIO,
  6. Device tree

Dylan Jhong (3):
  Andes RISC-V PLIC
  Andes RISC-V PLMT
  Andes AE350 RISC-V Machine

 default-configs/devices/riscv32-softmmu.mak |   1 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/intc/Kconfig                             |   3 +
 hw/intc/andes_plic.c                        | 505 ++++++++++++++++++++
 hw/intc/meson.build                         |   1 +
 hw/riscv/Kconfig                            |   7 +
 hw/riscv/andes_ae350.c                      | 501 +++++++++++++++++++
 hw/riscv/meson.build                        |   1 +
 hw/timer/Kconfig                            |   3 +
 hw/timer/andes_plmt.c                       | 225 +++++++++
 hw/timer/meson.build                        |   1 +
 include/hw/intc/andes_plic.h                | 130 +++++
 include/hw/riscv/andes_ae350.h              |  93 ++++
 include/hw/timer/andes_plmt.h               |  50 ++
 14 files changed, 1522 insertions(+)
 create mode 100644 hw/intc/andes_plic.c
 create mode 100644 hw/riscv/andes_ae350.c
 create mode 100644 hw/timer/andes_plmt.c
 create mode 100644 include/hw/intc/andes_plic.h
 create mode 100644 include/hw/riscv/andes_ae350.h
 create mode 100644 include/hw/timer/andes_plmt.h

-- 
2.17.1


