Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A154E578
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:56:00 +0200 (CEST)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1que-0005HK-2E
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o1qqA-000097-Mf
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:51:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o1qq8-00064M-Eh
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:51:22 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LP4qc4gn9z67F4F;
 Thu, 16 Jun 2022 22:51:08 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 16 Jun 2022 16:51:17 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 16 Jun 2022 15:51:16 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Ben
 Widawsky" <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v11 0/3] hw/pci-bridge/cxl: Add CXL Switches.
Date: Thu, 16 Jun 2022 15:51:23 +0100
Message-ID: <20220616145126.8002-1-Jonathan.Cameron@huawei.com>
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

Previously sent as patches 43-45 of
[PATCH v10 00/45] CXl 2.0 emulation Support
https://lore.kernel.org/qemu-devel/20220429144110.25167-45-Jonathan.Cameron@huawei.com/#r

Now the initial CXL support is upstream, patch sets applying to different
parts of the CXL infrastructure can be reviewed / applied in any
order.
I have just sent out arm/virt support and aim to send out DOE/CDAT patches
shortly. This series is independent of those others.

Changes since v10:
- Rebase.
- Typo fix in comment about xio3110.

This series adds CXL switch support in the form of upstream and downstream
ports + the additions to the interleave decoder in cxl-host to enable
us to interleave across the downstream switch ports.  The PCI IDs used
have been allocated against Huawei's Vendor ID for use for emulation of
these devices only. Primary use for this support is for testing the Linux
kernel stack.

Note only 1 level of switching / switch based HDM interleave decoding
is supported - consistent with typical CXL 2.0 systems.
Interleaving may occur and any / some / all of:
- Across multiple CXL host bridges (static setup via Fixed Memory Windows).
- Across multiple root ports in a given CXL host bridge (dynamic config
  via CXL host bridge register space.
- Across multiple downstream switch ports (this series).

All comments welcome,

Thanks,

Jonathan


Jonathan Cameron (3):
  pci-bridge/cxl_upstream: Add a CXL switch upstream port
  pci-bridge/cxl_downstream: Add a CXL switch downstream port
  docs/cxl: Add switch documentation

 docs/system/devices/cxl.rst    |  88 +++++++++++-
 hw/cxl/cxl-host.c              |  43 +++++-
 hw/pci-bridge/cxl_downstream.c | 249 +++++++++++++++++++++++++++++++++
 hw/pci-bridge/cxl_upstream.c   | 216 ++++++++++++++++++++++++++++
 hw/pci-bridge/meson.build      |   2 +-
 include/hw/cxl/cxl.h           |   5 +
 6 files changed, 598 insertions(+), 5 deletions(-)
 create mode 100644 hw/pci-bridge/cxl_downstream.c
 create mode 100644 hw/pci-bridge/cxl_upstream.c

-- 
2.32.0


