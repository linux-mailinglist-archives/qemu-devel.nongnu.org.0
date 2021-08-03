Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCA3DE7F2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:09:48 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApUh-0000m9-AJ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQp-0000wJ-BH
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQl-00045G-Is
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:46 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gf6lZ2Dhyz82wB;
 Tue,  3 Aug 2021 16:01:46 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:30 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:29 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v4 00/14] machine: smp parsing fixes and improvement
Date: Tue, 3 Aug 2021 16:05:13 +0800
Message-ID: <20210803080527.156556-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is new version (v4) of the series [1] that I have posted to introduce
some fixes and improvement for SMP parsing.

[1] https://lore.kernel.org/qemu-devel/20210728034848.75228-1-wangyanan55@huawei.com/

Most of this series is about the SMP parsers:
maxcpus is now uniformly used to calculate the omitted topology members,
calculation of omitted maxcpus/cpus is improved, the error reporting is
improved. It's also suggested that we should start to prefer cores over
sockets over threads on the newer machine types, which will make the
computed virtual topology more reflective of the real hardware.

In order to reduce code duplication and ease the code maintenance, smp_parse
in now converted into a parser generic enough for all arches, so that the PC
specific one can be removed. It's also convenient to introduce more topology
members to the generic parser in the future.

Finally, a QEMU unit test for the parsing of given SMP configuration is added.
Since all the parsing logic is in generic function smp_parse(), this test
passes different SMP configurations to the function and compare the parsing
result with what is expected. In the test, all possible collections of the
topology parameters and the corresponding expected results are listed,
including the valid and invalid ones. The preference of sockets over cores
and the preference of cores over sockets, and the support of multi-dies are
also taken into consideration.

---

Changelogs:

v3->v4:
- put all the sanity check into the parser
- refine the unit test and add it back to the series
- add the R-b/A-b tags for the reviewed/acked patches
- v3: https://lore.kernel.org/qemu-devel/20210728034848.75228-1-wangyanan55@huawei.com/

v2->v3:
- apply the calculation improvement to smp_parse and pc_smp_parse
  separately and then convert the finally improved parsers into a
  generic one, so that patches can be reviewed separately.
- to ease review, drop the unit test part for a while until we have
  a good enough generic parser.
- send the patch "machine: Disallow specifying topology parameters as zero"
  for 6.1 separately.
- v2: https://lore.kernel.org/qemu-devel/20210719032043.25416-1-wangyanan55@huawei.com/

v1->v2:
- disallow "anything=0" in the smp configuration (Andrew)
- make function smp_parse() a generic helper for all arches
- improve the error reporting in the parser
- start to prefer cores over sockets since 6.2 (Daniel)
- add a unit test for the smp parsing (Daniel)
- v1: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html

---

Yanan Wang (14):
  machine: Minor refactor/cleanup for the smp parsers
  machine: Uniformly use maxcpus to calculate the omitted parameters
  machine: Set the value of cpus to match maxcpus if it's omitted
  machine: Improve the error reporting of smp parsing
  hw: Add compat machines for 6.2
  machine: Prefer cores over sockets in smp parsing since 6.2
  machine: Use ms instead of global current_machine in sanity-check
  machine: Tweak the order of topology members in struct CpuTopology
  machine: Make smp_parse generic enough for all arches
  machine: Remove smp_parse callback from MachineClass
  machine: Move smp_prefer_sockets to struct SMPCompatProps
  machine: Put all sanity-check in the generic SMP parser
  machine: Split out the smp parsing code
  tests/unit: Add a unit test for smp parsing

 MAINTAINERS                 |   2 +
 hw/arm/virt.c               |  10 +-
 hw/core/machine-smp.c       | 199 ++++++++
 hw/core/machine.c           | 106 +----
 hw/core/meson.build         |   1 +
 hw/i386/pc.c                |  66 +--
 hw/i386/pc_piix.c           |  15 +-
 hw/i386/pc_q35.c            |  14 +-
 hw/ppc/spapr.c              |  16 +-
 hw/s390x/s390-virtio-ccw.c  |  15 +-
 include/hw/boards.h         |  27 +-
 include/hw/i386/pc.h        |   3 +
 qemu-options.hx             |  14 +-
 tests/unit/meson.build      |   1 +
 tests/unit/test-smp-parse.c | 892 ++++++++++++++++++++++++++++++++++++
 15 files changed, 1204 insertions(+), 177 deletions(-)
 create mode 100644 hw/core/machine-smp.c
 create mode 100644 tests/unit/test-smp-parse.c

--
2.19.1


