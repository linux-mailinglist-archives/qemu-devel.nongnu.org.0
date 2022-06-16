Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241D54E182
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:10:34 +0200 (CEST)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pGb-0000kD-N4
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o1ohl-0004Nk-QI
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:34:35 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:47002 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o1ohd-0002dg-SQ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:34:29 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-05 (Coremail) with SMTP id zQCowADnlu1EI6tiya3mAw--.16512S2;
 Thu, 16 Jun 2022 20:34:16 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
Date: Thu, 16 Jun 2022 20:34:06 +0800
Message-Id: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADnlu1EI6tiya3mAw--.16512S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4UXFWrAF13ArWkXw1UZFb_yoW8KFWDpa
 yY9FnxJr4ku3W7Gan3Ja17Xr1rXan3XFZ8Ganrtw47JFn8tFy7XFWfKF1UZr90vr4Igr1a
 yFZxKFy7K34UArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-Originating-IP: [159.226.43.7]
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

This patch adds shadow doorbell buffer support in NVMe 1.3 to QEMU
NVMe. The Doorbell Buffer Config admin command is implemented for the
guest to enable shadow doobell buffer. When this feature is enabled, each
SQ/CQ is associated with two buffers, i.e., Shadow Doorbell buffer and
EventIdx buffer. According to the Spec, each queue's doorbell register
is only updated when the Shadow Doorbell buffer value changes from being
less than or equal to the value of the corresponding EventIdx buffer
entry to being greater than that value. Therefore, the number of MMIO's
on the doorbell registers is greatly reduced.

This patch is adapted from Huaicheng Li's patch[1] in 2018.

[1] https://patchwork.kernel.org/project/qemu-devel/patch/20180305194906.GA3630@gmail.com/

IOPS comparison with FIO:

iodepth    1      2      4      8
  QEMU   25.1k  25.9k  24.5k  24.0k
 +dbbuf  29.1k  60.1k  99.8k  82.5k

MMIO's per IO measured by perf-kvm:

iodepth    1      2      4      8
  QEMU   2.01   1.99   1.99   1.99
 +dbbuf  1.00   0.52   0.27   0.46

The tests are done on Ubuntu 22.04 with 5.15.0-33 kernel with Intel(R) 
Xeon(R) Gold 6248R CPU @ 3.00GHz.

QEMU set up:

bin/x86_64-softmmu/qemu-system-x86_64 \
    -name "nvme-test" \
    -machine accel=kvm \
    -cpu host \
    -smp 4 \
    -m 8G \
    -daemonize \
    -device virtio-scsi-pci,id=scsi0 \
    -device scsi-hd,drive=hd0 \
    -drive file=$OSIMGF,if=none,aio=native,cache=none,format=qcow2,id=hd0,snapshot=on \
    -drive "id=nvm,if=none,file=null-co://,file.read-zeroes=on,format=raw" \
    -device nvme,serial=deadbeef,drive=nvm \
    -net user,hostfwd=tcp::8080-:22 \
    -net nic,model=virtio

FIO configuration:

[global]
ioengine=libaio
filename=/dev/nvme0n1
thread=1
group_reporting=1
direct=1
verify=0
time_based=1
ramp_time=0
runtime=30
;size=1G
;iodepth=1
rw=randread
bs=4k

[test]
numjobs=1

Changes since v2:
  - Do not ignore admin queue updates in nvme_process_db and nvme_post_cqes
  - Calculate db_addr and ei_addr in hard-coded way

Changes since v1:
  - Add compatibility with hosts that do not use admin queue shadow doorbell

Jinhao Fan (2):
  hw/nvme: Implement shadow doorbell buffer support
  hw/nvme: Add trace events for shadow doorbell buffer

 hw/nvme/ctrl.c       | 118 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |   8 +++
 hw/nvme/trace-events |   5 ++
 include/block/nvme.h |   2 +
 4 files changed, 132 insertions(+), 1 deletion(-)

-- 
2.25.1


