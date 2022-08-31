Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC95A8159
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:37:20 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTPmI-0004vK-O2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oTPj4-0001wu-Ag
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 11:33:58 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oTPj1-0000f1-FY
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 11:33:58 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MHp591g8xz6813w;
 Wed, 31 Aug 2022 23:29:49 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Wed, 31 Aug 2022 17:33:33 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 16:33:33 +0100
To: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
CC: Ben Widawsky <bwidawsk@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 0/3] CXL Performance Monitoring Unit QEMU emulation.
Date: Wed, 31 Aug 2022 16:33:33 +0100
Message-ID: <20220831153336.16165-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

CXL 3.0 introduces a CXL Performance Monitoring Unit.
(13.2 Performance Monitoring)
These unit may be present in any CXL component but for now the kernel
code only supports them in Type 3 Memory devices.

Add basic emulation of such units and instantiate 2 in each CXL Type 3 device.

Kernel driver was developed against this fairly minimal emulation.
https://lore.kernel.org/linux-cxl/20220824103617.21781-1-Jonathan.Cameron@huawei.com/T/#t

For now, this RFC is both to seek general feedback on the approach used and to
provide a platform for testing the kernel driver against.

Note that the CPMU definition is extremely flexible and configuring the
available options via the QEMU command line may be impractical.
To avoid that complexity, this configuration is currently fixed.
This code provides a pair of identical CPMU instances on each CXL type 3
device which were constructed to hit some of the corner cases in the
enumeration code.

The counters themselves just get bigger in a fashion designed to overflow
fairly quickly. Actual values are meaningless.  For now there is no
control over the existence of CPMU instances.  Likely we will add at least
an option to enable them or not.

Precursor patch to add MSI/MSIX support may well merge as part of a
different series, but is needed to apply this to 7.1.

Jonathan Cameron (3):
  hw/mem/cxl-type3: Add MSI/MSIX support
  hw/cxl: Switch to using an array for CXLRegisterLocator base
    addresses.
  hw/cxl: CXL Performance Monitoring Unit (CPMU) Emulation

 hw/cxl/cxl-cpmu.c              | 295 +++++++++++++++++++++++++++++++++
 hw/cxl/meson.build             |   1 +
 hw/mem/cxl_type3.c             |  31 +++-
 hw/pci-bridge/cxl_downstream.c |   4 +-
 hw/pci-bridge/cxl_root_port.c  |   4 +-
 hw/pci-bridge/cxl_upstream.c   |   4 +-
 include/hw/cxl/cxl.h           |   1 +
 include/hw/cxl/cxl_cpmu.h      |  99 +++++++++++
 include/hw/cxl/cxl_device.h    |  31 +++-
 include/hw/cxl/cxl_pci.h       |  15 +-
 10 files changed, 463 insertions(+), 22 deletions(-)
 create mode 100644 hw/cxl/cxl-cpmu.c
 create mode 100644 include/hw/cxl/cxl_cpmu.h

-- 
2.32.0


