Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C168137C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVHX-0006Sh-G2; Mon, 30 Jan 2023 09:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMVHT-0006Lz-J2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:37:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMVHP-0005Fm-Mu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:37:10 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P59f01JDDz6H6rC;
 Mon, 30 Jan 2023 22:33:28 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 30 Jan 2023 14:37:02 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v3 00/10] hw/cxl: CXL emulation cleanups and minor fixes for
 upstream
Date: Mon, 30 Jan 2023 14:36:55 +0000
Message-ID: <20230130143705.11758-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

V3: Thanks to Michael Tsirkin
 - Update tests/data/acpi/q35/DSDT.cxl to reflect dropping of the duplicate _UID.
   Usual dance with marking table to be ignored by test then making change and finally
   updating the table with the new version and dropping the entry preventing the tests
   from running.
 
V2:
- Various minor issues found by Philippe, see individual patches.
  Note that the const_le64() patch matches changes in a set of Philippe's that was
  never applied. Philippe may send an update of that series before this merges.
  If that occurs, drop "qemu/bswap: Add const_le64()"
- Picked up tags.

V1 Cover letter.

A small collection of misc fixes and tidying up pulled out from various
series. I've pulled this to the top of my queue of CXL related work
as they stand fine on their own and it will reduce the noise in
the larger patch sets if these go upstream first.

Gregory's patches were posted as part of his work on adding volatile support.
https://lore.kernel.org/linux-cxl/20221006233702.18532-1-gregory.price@memverge.com/
https://lore.kernel.org/linux-cxl/20221128150157.97724-2-gregory.price@memverge.com/
I might propose this for upstream inclusion this cycle, but testing is
currently limited by lack of suitable kernel support.

Ira's patches were part of his event injection series.
https://lore.kernel.org/linux-cxl/20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com/
Intent is to propose for upstream the rest of that series shortly after
some minor changes from earlier review.

My three patches have not previously been posted.

For the curious, the current state of QEMU CXL emulation that we are working
through the backlog wrt to final cleanup before proposing for upstreaming can be found at.

https://gitlab.com/jic23/qemu/-/commits/cxl-2023-01-11


Gregory Price (2):
  hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
  hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition

Ira Weiny (3):
  qemu/bswap: Add const_le64()
  qemu/uuid: Add UUID static initializer
  hw/cxl/mailbox: Use new UUID network order define for cel_uuid

Jonathan Cameron (5):
  hw/mem/cxl_type3: Improve error handling in realize()
  hw/pci-bridge/cxl_downstream: Fix type naming mismatch
  tests/acpi: Allow update of q35/DSDT.cxl
  hw/i386/acpi: Drop duplicate _UID entry for CXL root bridge
  tests: acpi: Update q35/DSDT.cxl for removed duplicate UID

 hw/cxl/cxl-device-utils.c      |   2 +-
 hw/cxl/cxl-mailbox-utils.c     |  28 +++++++++++++++-------------
 hw/i386/acpi-build.c           |   1 -
 hw/mem/cxl_type3.c             |  15 +++++++++++----
 hw/pci-bridge/cxl_downstream.c |   2 +-
 include/hw/cxl/cxl_device.h    |   2 +-
 include/qemu/bswap.h           |  12 +++++++++++-
 include/qemu/uuid.h            |  12 ++++++++++++
 tests/data/acpi/q35/DSDT.cxl   | Bin 9636 -> 9622 bytes
 9 files changed, 52 insertions(+), 22 deletions(-)

-- 
2.37.2


