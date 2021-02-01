Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09930AB22
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:25:10 +0100 (CET)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6b4Z-0000Yu-U1
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6azw-0003Ho-ER
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:20:21 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6azl-0002sh-2y
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:20:16 -0500
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTs214B40z67g2G;
 Mon,  1 Feb 2021 23:15:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:19:40 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:19:40 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/4] hw/cxl/ + /hw/pci/: PCI DOE + CXL CDAT emulation
Date: Mon, 1 Feb 2021 23:16:25 +0800
Message-ID: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whilst I know others are working on an implementation of at least some of
this, a desire to work on the kernel user of this required an
implementation so I threw this together in the meantime and am sending
it out on the basis that it may be of use to others.

As it is an RFC I have been lazy on some cleanup and error handling.
Will fix that in a future version if we decide to take this forwards.

Based on Ben's cxl-2.0v3 branch from https://gitlab.com/bwidawsk/qemu
Possible I've picked an unstable branch so this may or may not currently
apply :)  I'll rebase on Ben's next version when avaialble.

Jonathan Cameron (4):
  include/standard-headers/linux/pci_regs: temp hack to add necessary
    DOE definitions.
  hw/pci/pcie_doe: Introduce utility functions for PCIe DOE
  hw/cxl/cxl-cdat: Initial CDAT implementation for use by CXL devices
  hw/mem/cxl_type3: Enabled DOE mailbox for access to CDAT

 hw/cxl/cxl-cdat.c                         | 252 +++++++++++++++++++++
 hw/cxl/meson.build                        |   1 +
 hw/mem/cxl_type3.c                        |  49 ++++-
 hw/pci/meson.build                        |   2 +-
 hw/pci/pcie_doe.c                         | 257 ++++++++++++++++++++++
 include/hw/cxl/cxl.h                      |   1 +
 include/hw/cxl/cxl_cdat.h                 | 101 +++++++++
 include/hw/pci/doe.h                      |  40 ++++
 include/hw/pci/pci_ids.h                  |   2 +
 include/standard-headers/linux/pci_regs.h |  33 ++-
 10 files changed, 734 insertions(+), 4 deletions(-)
 create mode 100644 hw/cxl/cxl-cdat.c
 create mode 100644 hw/pci/pcie_doe.c
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/pci/doe.h

-- 
2.19.1


