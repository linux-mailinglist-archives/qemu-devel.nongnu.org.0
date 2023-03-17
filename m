Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031196BEEF4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDLv-0002rM-9L; Fri, 17 Mar 2023 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDLr-0002qp-Pu
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:54:47 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDLn-0001Ra-Gv
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:54:47 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdVWz1x3Bz6J9qS;
 Sat, 18 Mar 2023 00:51:27 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:54:35 +0000
To: Michael Tsirkin <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, <ani@anisinha.ca>, <berrange@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [RFC PATCH 0/4] hw/i386: Factor out PXB parts of DSDT into an SSDT
 table
Date: Fri, 17 Mar 2023 16:54:36 +0000
Message-ID: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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

Michael Tsirkin raised that we have recently had churn in the bios-tables-test
and perhaps it was worth factoring some parts of DSDT out as SSDT files.
This is an attempt to do that for the entries from pxb-pcie and pxb-cxl
PCI root bridges.

The main PCI root bridge and related elements are left in DSDT as they
are present in many more tests than PXB.  However things brings some
complexity as some of the DSDT parts are then dependent on building up
information whilst creating the PXB entries.  The ordering constraints
of RSDT entries prevent easily generating the new SSDT table first
(see patch 3)

This series works around that by separating that build up of information from
the build up of the PXB parts of the SSDT.  That allows the tables to be
build in the standard order, based on knowledge that the SSDT parts will
definitely be built later.

Personally, having tried this, I'm not convinced that the advantages of
simplifying updates to the test data justify the complexity increase needed.
However I will add that I have a series adding CXL QTG DSM support form Dave
Jiang in my tree that will only result in updates to SSDT.cxl after this patch
rather than DSDT.cxl reducing chance of a clash with other changes
in flight. Hence this is an RFC to find out if people think this is
a good direction to go in.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
https://lore.kernel.org/qemu-devel/20230302055544-mutt-send-email-mst@kernel.org/	


Jonathan Cameron (4):
  hw/acpi: Make Aml and / or crs_range_set optional in build_crs
  tests/acpi: Allow changes to DSDT.cxl/viot and SSDT.cxl/viot
  hw/i386/acpi: Separate PXB related parts of DSDT into an SSDT table.
  tests/acpi: Updated DSDT and SSDT due to move of PXB info to SSDT

 hw/acpi/aml-build.c           |  75 +++++-----
 hw/i386/acpi-build.c          | 249 ++++++++++++++++++++++------------
 hw/pci-host/gpex-acpi.c       |   5 +-
 include/hw/acpi/aml-build.h   |   4 +-
 tests/data/acpi/q35/DSDT.cxl  | Bin 9673 -> 8474 bytes
 tests/data/acpi/q35/DSDT.viot | Bin 9470 -> 8429 bytes
 tests/data/acpi/q35/SSDT.cxl  | Bin 0 -> 1235 bytes
 tests/data/acpi/q35/SSDT.viot | Bin 0 -> 1077 bytes
 8 files changed, 208 insertions(+), 125 deletions(-)
 create mode 100644 tests/data/acpi/q35/SSDT.cxl
 create mode 100644 tests/data/acpi/q35/SSDT.viot

-- 
2.37.2


