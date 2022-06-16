Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4568654E344
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:22:00 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qNj-0000rf-3Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o1qLk-0007nz-4X; Thu, 16 Jun 2022 10:19:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o1qLh-0006Sw-3K; Thu, 16 Jun 2022 10:19:55 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LP45Q10fbz67JpL;
 Thu, 16 Jun 2022 22:18:02 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 16 Jun 2022 16:19:41 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 16 Jun 2022 15:19:41 +0100
To: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v11 0/2] arm/virt: CXL support via pxb_cxl
Date: Thu, 16 Jun 2022 15:19:48 +0100
Message-ID: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Previously patches 40 and 41 of
[PATCH v10 00/45] CXl 2.0 emulation Support
https://lore.kernel.org/qemu-devel/20220429144110.25167-45-Jonathan.Cameron@huawei.com/#r

Now the base CXL support including for x86/pc is upstream (patches 1-39)
there are no dependencies between the next few CXL elements in my queue
so they can be reviewed / merged in parallel.  Hence I'll be sending switch
support (43-45) separately and hopefully DOE / CDAT support in a few days.
I'm assuming this particular series should go through the arm tree if
the maintainers are happy?

Changes since v10:
 - CXL machine setup is now entirely from the supporting machines rather
   than via code in machine.c and vl.c.  Change made for x86 in:
   https://lore.kernel.org/qemu-devel/20220608145440.26106-1-Jonathan.Cameron@huawei.com/
 - Dropped Ben's sign off from patch 1 which resulted from him carrying
   these patches of mine for a while. It isn't a useful bit of history
   to carry now they are back to me.

This short series adds support for CXL host bridges and CXL fixed memory
windows on arm/virt.  Two types of memory region are needed:
1. Register space for CXL host bridges (static allowance for 16)
2. CXL fixed memory windows: Ranges of host PA space which
   are statically mapped to an interleave across 1 or more CXL host
   bridges.

Both of these types of region are described via appropriate ACPI tables.
As the CEDT table is created with the same code as for x86 I don't think
there is much value in duplicating the existing CXL bios-tables test.

The second patch adds a single complex test. We test a lot more configurations
on x86 but it does not seem useful to duplicate them all on ARM and this single
test should act as a smoke test for any problems that occur.

Run through CI at:
https://gitlab.com/jic23/qemu/-/pipelines/564934276
Intermittent (unrelated I assume) failure in msys64 aio-test resolved
with a retry.

Thanks,

Jonathan

Jonathan Cameron (2):
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  qtest/cxl: Add aarch64 virt test for CXL

 hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++
 hw/arm/virt.c            | 44 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  3 +++
 tests/qtest/cxl-test.c   | 48 ++++++++++++++++++++++++++++++++--------
 tests/qtest/meson.build  |  1 +
 5 files changed, 121 insertions(+), 9 deletions(-)

-- 
2.32.0


