Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1DA41BD12
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 05:05:09 +0200 (CEST)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVPu6-0005Zo-Vm
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 23:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPnv-0004yX-6n; Tue, 28 Sep 2021 22:58:43 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPns-0005lu-JY; Tue, 28 Sep 2021 22:58:42 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HK1Cy1LsWz8yv8;
 Wed, 29 Sep 2021 10:53:50 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:28 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:27 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 00/16] machine: smp parsing fixes and improvement
Date: Wed, 29 Sep 2021 10:58:00 +0800
Message-ID: <20210929025816.21076-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a new version (v12) with minor update suggested by Daniel
and Philippe. Two new commits (#1 and #16) are added. Thanks!

Summary of v12:
1) Specifying a CPU topology parameter as zero was implicitly allowed
but undocumented before, while now it's explicitly deprecated.

2) Refactor/fixes of the smp parsers.

3) For consistency, maxcpus is now uniformly used to calculate the
omitted topology members.

4) Improve the error reporting of the parsers.

5) It's also suggested that we should start to prefer cores over sockets
over threads on the newer machine types, which will make the computed
virtual topology more reflective of the real hardware. Related discussion
can be found in [1].
[1] https://lore.kernel.org/qemu-devel/YNIgInK00yNNI4Dy@redhat.com/

6) In order to reduce code duplication and ease the code maintenance,
smp_parse() is converted into a generic enough parser for all arches,
so that the arch-specific ones (e.g. pc_smp_parse) can be removed.
It's also convenient to introduce more topology members to the generic
parser in the future. Related discussions can be found in [2] and [3].
[2] https://lore.kernel.org/qemu-devel/20210630115602.txmvmfe2jrzu7o67@gator.home/
[3] https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/

Changelogs:

v11->v12:
- add an extra commit 16/16 to make smp_parse() return a boolean (Philippe)
- split the machine.json Doc fix out into a separate patch 01/16 (Daniel)
- add R-bs for the series from Daniel and Philippe, thanks!
- v11: https://lore.kernel.org/qemu-devel/20210928035755.11684-1-wangyanan55@huawei.com/

v10->v11:
- only update patch 11/14
  use GString APIs to build the cpu topology hierarchy string (Daniel)
  refine the comments of smp_parse()
- v10: https://lore.kernel.org/qemu-devel/20210926084541.17352-1-wangyanan55@huawei.com/

v9->v10:
- rebased on latest upstream commit 11a1199846.
  there is no change of the patches in v10, except minor update
  in 08/14 to resolve merge conflict with master.
- To make this series more acceptable, drop the last two patches
  about SMP unit test, since the scalability of the test is not
  optimally designed after rethinking of it. So I will resend the
  test related patches separately after refining them.
- v9: https://lore.kernel.org/qemu-devel/20210910073025.16480-1-wangyanan55@huawei.com/

Yanan Wang (16):
  qapi/machine: Fix an incorrect comment of SMPConfiguration
  machine: Deprecate "parameter=0" SMP configurations
  machine: Minor refactor/fix for the smp parsers
  machine: Uniformly use maxcpus to calculate the omitted parameters
  machine: Set the value of cpus to match maxcpus if it's omitted
  machine: Improve the error reporting of smp parsing
  qtest/numa-test: Use detailed -smp CLIs in pc_dynamic_cpu_cfg
  qtest/numa-test: Use detailed -smp CLIs in test_def_cpu_split
  machine: Prefer cores over sockets in smp parsing since 6.2
  machine: Use ms instead of global current_machine in sanity-check
  machine: Tweak the order of topology members in struct CpuTopology
  machine: Make smp_parse generic enough for all arches
  machine: Remove smp_parse callback from MachineClass
  machine: Move smp_prefer_sockets to struct SMPCompatProps
  machine: Put all sanity-check in the generic SMP parser
  machine: Make smp_parse return a boolean

 docs/about/deprecated.rst  |  15 +++
 hw/arm/virt.c              |   1 +
 hw/core/machine.c          | 206 ++++++++++++++++++++++++++-----------
 hw/i386/pc.c               |  63 +-----------
 hw/i386/pc_piix.c          |   1 +
 hw/i386/pc_q35.c           |   1 +
 hw/ppc/spapr.c             |   1 +
 hw/s390x/s390-virtio-ccw.c |   1 +
 include/hw/boards.h        |  23 +++--
 qapi/machine.json          |   2 +-
 qemu-options.hx            |  24 +++--
 tests/qtest/numa-test.c    |   6 +-
 12 files changed, 201 insertions(+), 143 deletions(-)

--
2.19.1


