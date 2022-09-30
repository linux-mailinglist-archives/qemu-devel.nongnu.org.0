Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF0A5F0808
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:53:36 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCi5-0005bl-PO
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oeCgU-0004Ap-W7
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:51:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34714 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oeCgS-0001U5-1U
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:51:54 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx32srvDZjkCYkAA--.63057S2; 
 Fri, 30 Sep 2022 17:51:39 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v4 0/2] Add memmap and fix bugs for LoongArch
Date: Fri, 30 Sep 2022 17:51:37 +0800
Message-Id: <20220930095139.867115-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32srvDZjkCYkAA--.63057S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1xGw48Jry8XFyxtFyrZwb_yoW8Xw15pr
 WS9FWfKr4UJ393tF9xCa45JF98Xrs7JayxZa43t3sY9F4DuryjqFy0gryrZa47Gas3Ja42
 qw1vy34DG3W5Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Xiaojuan Yang (2):
  hw/intc: Fix LoongArch extioi function
  hw/intc: Fix LoongArch ipi device emulation

 hw/intc/loongarch_extioi.c      | 51 +++++++++++++++++++--------------
 hw/intc/loongarch_ipi.c         |  1 -
 hw/intc/trace-events            |  2 +-
 target/loongarch/iocsr_helper.c | 16 +++++------
 4 files changed, 38 insertions(+), 32 deletions(-)

-- 
2.31.1


