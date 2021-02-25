Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F19324C50
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:59:23 +0100 (CET)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCUU-0000oj-RY
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSF-0007Xd-0M; Thu, 25 Feb 2021 03:57:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSA-0003sF-Fl; Thu, 25 Feb 2021 03:57:02 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmRS1224zzMdfg;
 Thu, 25 Feb 2021 16:54:41 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:36 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/5] hw/arm/virt: Introduce cpu topology support
Date: Thu, 25 Feb 2021 16:56:22 +0800
Message-ID: <20210225085627.2263-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An accurate cpu topology may help improve the cpu scheduler's decision
making when dealing with multi-core system. So cpu topology description
is helpful to provide guest with the right view. Dario Faggioli's talk
in [0] also shows the virtual topology may has impact on sched performace.
Thus this patch series is posted to introduce cpu topology support for
arm platform.

Both fdt and ACPI are introduced to present the cpu topology. To describe
the cpu topology via ACPI, a PPTT table is introduced according to the
processor hierarchy node structure. This series is derived from [1], in
[1] we are trying to bring both cpu and cache topology support for arm
platform, but there is still some issues to solve to support the cache
hierarchy. So we split the cpu topology part out and send it seperately.
The patch series to support cache hierarchy will be send later since
Salil Mehta's cpu hotplug feature need the cpu topology enabled first and
he is waiting for it to be upstreamed.

This patch series was initially based on the patches posted by Andrew Jones [2].
I jumped in on it since some OS vendor cooperative partner are eager for it.
Thanks for Andrew's contribution.

After applying this patch series, launch a guest with virt-6.0 and cpu
topology configured with sockets:cores:threads = 2:4:2, you will get the
bellow messages with the lscpu command.

-----------------------------------------
Architecture:                    aarch64
CPU op-mode(s):                  64-bit
Byte Order:                      Little Endian
CPU(s):                          16
On-line CPU(s) list:             0-15
Thread(s) per core:              2
Core(s) per socket:              4
Socket(s):                       2
NUMA node(s):                    2
Vendor ID:                       HiSilicon
Model:                           0
Model name:                      Kunpeng-920
Stepping:                        0x1
BogoMIPS:                        200.00
NUMA node0 CPU(s):               0-7
NUMA node1 CPU(s):               8-15

[0] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
[1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02166.html
[2] https://patchwork.ozlabs.org/project/qemu-devel/cover/20180704124923.32483-1-drjones@redhat.com

Ying Fang (5):
  device_tree: Add qemu_fdt_add_path
  hw/arm/virt: Add cpu-map to device tree
  hw/arm/virt-acpi-build: distinguish possible and present cpus
  hw/acpi/aml-build: add processor hierarchy node structure
  hw/arm/virt-acpi-build: add PPTT table

 hw/acpi/aml-build.c          | 40 ++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     | 64 +++++++++++++++++++++++++++++++++---
 hw/arm/virt.c                | 40 +++++++++++++++++++++-
 include/hw/acpi/acpi-defs.h  | 13 ++++++++
 include/hw/acpi/aml-build.h  |  7 ++++
 include/hw/arm/virt.h        |  1 +
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 45 +++++++++++++++++++++++--
 8 files changed, 204 insertions(+), 7 deletions(-)

-- 
2.23.0


