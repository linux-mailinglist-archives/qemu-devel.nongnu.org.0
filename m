Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315630AB88
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:35:40 +0100 (CET)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bEo-00048V-Vn
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6bAA-00081a-DI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:30:50 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6bA4-0007uf-VY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:30:49 -0500
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTsDx4w6Bz67jpB;
 Mon,  1 Feb 2021 23:24:33 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:30:41 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:30:40 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/3] hw/arm/virt: CXL enablement including gpex-acpi
Date: Mon, 1 Feb 2021 23:26:52 +0800
Message-ID: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Very basic initial enablement of CXL on arm virt with relevant ACPI table
construction. Includes changes in gpex-acpi to ensure correct DSDT for
any pci_expand_bridge/pxb-cxl bridges.  Note not looking to do the
primary root bridge yet.

Based on Ben's tree cxl-2.0v3 at https://gitlab.com/bwidawsk/qemu

To actually get the memory appropriately exposed to the OS a few additional
changes are needed as discussed in thread
https://lore.kernel.org/qemu-devel/20210128174009.00007536@Huawei.com/

I will rebase this on future versions of Ben's series as needed.

Jonathan Cameron (3):
  hw/pci-host/gpex-acpi: Add support for dsdt construction for pxb-cxl
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  hw/cxl/cxl-device-utils: Allow incorrect read lengths

 hw/arm/Kconfig            |  1 +
 hw/arm/virt-acpi-build.c  | 27 +++++++++++++++++++++++++++
 hw/arm/virt.c             |  3 ++-
 hw/cxl/cxl-device-utils.c |  4 ++--
 hw/pci-host/gpex-acpi.c   | 22 +++++++++++++++++++---
 5 files changed, 51 insertions(+), 6 deletions(-)

-- 
2.19.1


