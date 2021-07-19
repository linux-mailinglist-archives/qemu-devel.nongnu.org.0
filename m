Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB563CCC93
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:22:26 +0200 (CEST)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5JrN-0000Eq-4m
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5Jq2-00067I-Cm
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:02 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5Jpz-0005vf-BN
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:02 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GSn5h2tC9z1CLP0;
 Mon, 19 Jul 2021 11:15:04 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:47 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:46 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v2 00/11] machine: smp parsing fixes and improvement
Date: Mon, 19 Jul 2021 11:20:32 +0800
Message-ID: <20210719032043.25416-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v2 of the series [1] that I have posted to introduce some smp parsing
fixes and improvement, much more work has been processed compared to RFC v1.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html

The purpose of this series is to improve/fix the parsing logic. Explicitly
specifying a CPU topology parameter as zero is not allowed any more, and
maxcpus is now uniformly used to calculate the omitted parameters. It's also
suggested that we should start to prefer cores over sockets over threads on
the newer machine types, which will make the computed virtual topology more
reflective of the real hardware.

In order to reduce code duplication and ease the code maintenance, smp_parse
in now converted into a parser generic enough for all arches, so that the PC
specific one can be removed. It's also convenient to introduce more topology
members (e.g. cluster) to the generic parser in the future.

Finally, a QEMU unit test for the parsing of given SMP configuration is added.
Since all the parsing logic is in generic function smp_parse(), this test
passes diffenent SMP configurations to the function and compare the parsing
result with what is expected. In the test, all possible collections of the
topology parameters and the corressponding expected results are listed,
including the valid and invalid ones. The preference of sockets over cores
and the preference of cores over sockets, and the support of multi-dies are
also taken into consideration.

---

Changelogs:

v1->v2:
- disallow "anything=0" in the smp configuration (Andrew)
- make function smp_parse() a generic helper for all arches
- improve the error reporting in the parser
- start to prefer cores over sockets since 6.2 (Daniel)
- add a unit test for the smp parsing (Daniel)

---

Yanan Wang (11):
  machine: Disallow specifying topology parameters as zero
  machine: Make smp_parse generic enough for all arches
  machine: Uniformly use maxcpus to calculate the omitted parameters
  machine: Use the computed parameters to calculate omitted cpus
  machine: Improve the error reporting of smp parsing
  hw: Add compat machines for 6.2
  machine: Prefer cores over sockets in smp parsing since 6.2
  machine: Use ms instead of global current_machine in sanity-check
  machine: Tweak the order of topology members in struct CpuTopology
  machine: Split out the smp parsing code
  tests/unit: Add a unit test for smp parsing

 MAINTAINERS                 |    2 +
 hw/arm/virt.c               |   10 +-
 hw/core/machine-smp.c       |  124 ++++
 hw/core/machine.c           |   68 +--
 hw/core/meson.build         |    1 +
 hw/i386/pc.c                |   66 +--
 hw/i386/pc_piix.c           |   15 +-
 hw/i386/pc_q35.c            |   14 +-
 hw/ppc/spapr.c              |   16 +-
 hw/s390x/s390-virtio-ccw.c  |   15 +-
 include/hw/boards.h         |   13 +-
 include/hw/i386/pc.h        |    3 +
 qapi/machine.json           |    6 +-
 qemu-options.hx             |    4 +-
 tests/unit/meson.build      |    1 +
 tests/unit/test-smp-parse.c | 1117 +++++++++++++++++++++++++++++++++++
 16 files changed, 1338 insertions(+), 137 deletions(-)
 create mode 100644 hw/core/machine-smp.c
 create mode 100644 tests/unit/test-smp-parse.c

-- 
2.19.1


