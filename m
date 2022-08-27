Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72E5A364A
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 11:23:50 +0200 (CEST)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRs2f-0007rF-9m
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 05:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRrsP-0006Z4-UI
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 05:13:13 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52552 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oRrsM-0007sv-5P
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 05:13:12 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAAHR2Eb4AljuYWkAA--.20130S2;
 Sat, 27 Aug 2022 17:13:00 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH v3 0/4] irqfd, iothread and polling support
Date: Sat, 27 Aug 2022 17:12:54 +0800
Message-Id: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHR2Eb4AljuYWkAA--.20130S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtr1xWrWUuw1DArWfAw4Dtwb_yoW8JrWfpF
 W5Wwn8XrWxCry7WrnIq39rKr15Xan3Ww1DAF17t3y3Jw1Fka45Xr4Iy3W5AF17GF93G3y7
 Zw1UXF13WFZ8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
 GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0VyxDU
 UUU
X-Originating-IP: [159.226.43.62]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series of performance enhancements brings iothread and polling
capabilities to qemu-nvme. The first two patches implements support
for irqfd, which solves thread safety problems for interrupt emulation
outside the main loop thread. The third patch adds support for
emulating NVMe IO queues in a dedicated iothread, which avoid
interference from other devices running on the main loop thread.
The fourth patch implements SQ and CQ pollers, thus enabling polling
on SQ and CQ.

After all these optimizations, our performance becomes similar to
virtio-blk.

Comparison (KIOPS):

QD                    1   4  16  64
virtio-blk           59 185 260 256
nvme                 53 155 245 309
virtio-blk-polling   88 212 210 213
nvme-polling        123 165 189 191

Changes since v2:
 - Add polling support
 - Do not set up MSI-X masking handlers when irq-eventfd is off

Changes since v1:
 - Avoid duplicate initilization of cq timer

Jinhao Fan (4):
  hw/nvme: support irq(de)assertion with eventfd
  hw/nvme: use KVM irqfd when available
  hw/nvme: add iothread support
  hw/nvme: add polling support

 hw/nvme/ctrl.c       | 394 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c         |  21 ++-
 hw/nvme/nvme.h       |  13 +-
 hw/nvme/trace-events |   3 +
 4 files changed, 401 insertions(+), 30 deletions(-)

-- 
2.25.1


