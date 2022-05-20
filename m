Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C744852F0D4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 18:39:10 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns5ef-0005uJ-Bu
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 12:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ns5dM-0004pR-SM
 for qemu-devel@nongnu.org; Fri, 20 May 2022 12:37:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ns5dK-00085o-Cq
 for qemu-devel@nongnu.org; Fri, 20 May 2022 12:37:48 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L4XSV5S0zz67x4b;
 Sat, 21 May 2022 00:37:14 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 20 May 2022 18:37:30 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 20 May 2022 17:37:29 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky
 <ben.widawsky@intel.com>, <linux-cxl@vger.kernel.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 <linuxarm@huawei.com>
Subject: [PATCH v11 0/2] hw/arm/virt: CXL 2.0 emulation support
Date: Fri, 20 May 2022 17:37:30 +0100
Message-ID: <20220520163732.27545-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml737-chm.china.huawei.com (10.201.108.187) To
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

The initial CXL support including support on x86/pc has now merged
(thanks Michael!).

This is the first of the two remaining parts of that series, unchanged
since v10.  The second is CXL switch support which can be applied
separately to this series and will be sent shortly.

CXL support requires two types of memory regions and this hooks them
up in arm/virt.

1) CXL host bridge control register regions.  This allows for up to
   16 host bridges which should keep anyone happy. The CEDT ACPI table
   is used by system software to find these regions.
2) CXL Fixed Memory Windows. CFMWs are regions of PA space that are
   configured to perform interleaved accesses over multiple host bridges.
   They are fixed, but the OS may select between multiple CFMWs to find
   one suitable for the interleave it desires.  All interleave in the
   host bridges and switches is programmable and discoverable - only
   these top level regions are static and described to system software
   via another structure in CEDT.

A simple test cases is added to existing cxl-test qtest.

Jonathan Cameron (2):
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  qtest/cxl: Add aarch64 virt test for CXL

 hw/arm/virt-acpi-build.c | 33 +++++++++++++++++++++++++++
 hw/arm/virt.c            | 40 ++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h    |  1 +
 tests/qtest/cxl-test.c   | 48 ++++++++++++++++++++++++++++++++--------
 tests/qtest/meson.build  |  1 +
 5 files changed, 113 insertions(+), 10 deletions(-)

-- 
2.32.0


