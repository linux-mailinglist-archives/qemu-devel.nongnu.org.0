Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1D8677A9F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:18:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvlR-0007JD-Ia; Mon, 23 Jan 2023 07:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pJvlM-0007Iz-RA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:17:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pJvlH-0004Ww-C8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:17:24 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P0pxG4ZF7z67tG2;
 Mon, 23 Jan 2023 20:16:34 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 23 Jan 2023 12:17:12 +0000
To: <qemu-devel@nongnu.org>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, <alison.schofield@intel.com>, Fan Ni
 <fan.ni@samsung.com>
Subject: [RFC PATCH 0/2] hw/cxl: Passthrough HDM decoder emulation
Date: Mon, 23 Jan 2023 12:17:10 +0000
Message-ID: <20230123121712.29892-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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

Until now, testing using CXL has relied up always using two root ports
below a host bridge, to work around a current assumption in the Linux
kernel support that, in the single root port case, the implementation will
use the allowed passthrough decoder implementation choice. If that choice
is made all accesses are routed from the host bridge to the single
root port that is present. Effectively we have a pass through decoder
(it is called that in the kernel driver).

This patch series implements that functionality and makes it the default
See patch 2 for a discussion of why I think we can make this change
without backwards compatibility issues (basically if it didn't work before
who are we breaking by making it work?)

Whilst this limitation has been known since the initial QEMU patch
postings / kernel CXL region support, Fan Ni Ran into it recently reminding
me that we should solve it.

https://lore.kernel.org/linux-cxl/20230113171044.GA24788@bgt-140510-bm03/

Tree with a large set of patches before this at:
https://gitlab.com/jic23/qemu/-/tree/cxl-2023-01-20

I've done some basic testing, though I did hit what appears to be
a kernel race on region bring up of existing region / namespace in a
1HB 2RP 2EP test case. That is proving hard to replicate consistently
but doesn't seem to have anything to do with the emulation other than
perhaps we are opening up a race by responding slowly to something.

Jonathan Cameron (2):
  hw/pci: Add pcie_count_ds_port() and pcie_find_port_first() helpers
  hw/pxb-cxl: Support passthrough HDM Decoders unless overridden

 hw/cxl/cxl-host.c                   | 31 +++++++++++++--------
 hw/pci-bridge/pci_expander_bridge.c | 43 +++++++++++++++++++++++++----
 hw/pci/pcie_port.c                  | 38 +++++++++++++++++++++++++
 include/hw/cxl/cxl.h                |  1 +
 include/hw/cxl/cxl_component.h      |  1 +
 include/hw/pci/pci_bridge.h         |  1 +
 include/hw/pci/pcie_port.h          |  2 ++
 7 files changed, 100 insertions(+), 17 deletions(-)

-- 
2.37.2


