Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4315A0AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:53:42 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7gL-0003fZ-IR
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oR7b5-0006zZ-FJ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:48:16 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:57404 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oR7b2-0001Bb-TI
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:48:15 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-05 (Coremail) with SMTP id zQCowAAX+ookKQdjLzYIAA--.1273S2;
 Thu, 25 Aug 2022 15:47:53 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH v2 0/3] hw/nvme: add irqfd support
Date: Thu, 25 Aug 2022 15:47:43 +0800
Message-Id: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAX+ookKQdjLzYIAA--.1273S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF4xJFyxZw45GF4DZFyrZwb_yoWkArgE9F
 40y3s5ua18Xanaya4qvF1jyryUKayrGr1jy3WqvFy2qr40vFZ8Wr4ktr1UZ3W8XFW5Xrn8
 XF4DJFyfury2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0SoGDUUUU
X-Originating-IP: [159.226.43.62]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
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

This patch series changes qemu-nvme's interrupt emulation to use event
notifiers, which can ensure thread-safe interrupt delivery when iothread
is used. In the first patche, I convert qemu-nvme's IO emulation
logic to send irq via eventfd, so that the actual assertion and
deassertion is always done in the main loop thread with BQL held. In the
second patch, support is added to send irq via KVM irqfd, bypassing
qemu's MSI-x emulation. In the last patch, I add MSI-x mask handlers
when irqfd is enabled so that qemu-nvme knows which vector is masked
even when qemu's MSI-x emulation is bypassed.

Changes since v1:
 - Made nvme_irq_(de)assert wrappers around eventfd call and actual irq
   assertion
 - Dropped the previous first patch to avoid duplicate checks for 
   irq_enabled and msix_enabled

Jinhao Fan (3):
  hw/nvme: support irq(de)assertion with eventfd
  hw/nvme: use KVM irqfd when available
  hw/nvme: add MSI-x mask handlers for irqfd

 hw/nvme/ctrl.c       | 264 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/nvme.h       |   7 ++
 hw/nvme/trace-events |   3 +
 3 files changed, 257 insertions(+), 17 deletions(-)

-- 
2.25.1


