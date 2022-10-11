Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517195FAB91
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 06:07:47 +0200 (CEST)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi6YT-0006QT-TJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 00:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oi6SS-0002j2-GD
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 00:01:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42378 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oi6SP-00020c-A0
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 00:01:32 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPGuO6kRj06YqAA--.27267S2; 
 Tue, 11 Oct 2022 12:01:19 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org
Subject: [PATCH v5 0/3] Add memmap and fix bugs for LoongArch
Date: Tue, 11 Oct 2022 12:01:15 +0800
Message-Id: <20221011040118.2635467-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGuO6kRj06YqAA--.27267S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF17WFW8uw1xJF1kArW3GFg_yoW8ZF1xpr
 Wa9FZ3Kr4UJrZIqF93C345XFy5Xrs7Jay8Xa43t3409F4Dur1jgFyIqFy5A34UGa4fJ34I
 q3W0ya4UW3W5Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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

This series add memmap table and fix extioi, ipi device
emulation for LoongArch virt machine.

The 'Fix LoongArch extioi function' patch based on:
20220927141504.3886314-1-alex.bennee@linaro.org

Changes for v5:
These changes are following Philippe Mathieu-Daude's advice.
1. Add trace_bad_read/write function when MemTxAttrs type is
   not MTRT_CPU in extioi_read/write().
2. Separate 'remove unused extioi system memory region' to a
   single patch.

Changes for v4: 
Add 'reviewed-by' tag in fixing ipi patch, and other changes
are the same as v3. 
1. Remove the memmap table patch in this series, it
   will apply until we have more than one machinestate.
2. Using MemTxAttrs' requester_type and requester_id
   to get current cpu index in loongarch extioi regs
   emulation.
   This patch based on: 
   20220927141504.3886314-1-alex.bennee@linaro.org
3. Rewrite the commit message of fixing ipi patch, and 
   add reviewed by tag in the patch.

Changes for v3: 
1. Remove the memmap table patch in this series, it
   will apply until we have more than one machinestate.
2. Using MemTxAttrs' requester_type and requester_id
   to get current cpu index in loongarch extioi regs
   emulation.
   This patch based on: 
   20220927141504.3886314-1-alex.bennee@linaro.org
3. Rewrite the commit message of fixing ipi patch, and 
   this patch has been reviewed.

Changes for v2: 
1. Adjust the position of 'PLATFORM' element in memmap table

Changes for v1: 
1. Add memmap table for LoongArch virt machine
2. Fix LoongArch extioi function
3. Fix LoongArch ipi device emulation

Xiaojuan Yang (3):
  hw/intc: Fix LoongArch extioi function
  hw/intc: Remove unused extioi system memory region of LoongArch
  hw/intc: Fix LoongArch ipi device emulation

 hw/intc/loongarch_extioi.c      | 53 +++++++++++++++++++--------------
 hw/intc/loongarch_ipi.c         |  1 -
 hw/intc/trace-events            |  5 ++--
 target/loongarch/iocsr_helper.c | 16 +++++-----
 4 files changed, 42 insertions(+), 33 deletions(-)

-- 
2.31.1


