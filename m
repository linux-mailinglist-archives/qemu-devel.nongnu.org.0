Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FD6A83A0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXj7Z-00020A-RS; Thu, 02 Mar 2023 08:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXj7T-0001yV-NC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:37:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXj7R-0001vv-6E
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:37:15 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PSBwR6KCFz6J7hv;
 Thu,  2 Mar 2023 21:36:55 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 13:37:08 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Alison Schofield <alison.schofield@intel.com>, Michael
 Roth <michael.roth@amd.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [RESEND PATCH v6 0/8] hw/cxl: RAS error emulation and injection
Date: Thu, 2 Mar 2023 13:37:01 +0000
Message-ID: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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

Resending to expand CC list. Looking in particular for review of the QAPI
part of patch 8.

v6:  Thanks to Philippe Mathieu-Daudé
- Added 'Since' entries to qapi docs.
- Added error prints to stubs rather than doing nothing at all.
(these two comments will be applied to the Poison injeciton series as well)
- Picked up tags

Long discussion on whether there was a good way to make the qapi only
exist when CONFIG_CXL* was set.  Conclusion (I think) was that
unfortunately there isn't a good way to do this so stubs are currently
the best option.  Thanks to Marcus for some great background info on this.

Based on series "[PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream"

Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com

v3 cover letter.

CXL error reporting is complex. This series only covers the protocol
related errors reported via PCIe AER - Ira Weiny has posted support for
Event log based injection and I will post an update of Poison list injection
shortly. My proposal is to upstream this one first, followed by Ira's Event
Log series, then finally the Poison List handling. That is based on likely
order of Linux kernel support (the support for this type of error reporting
went in during the recent merge window, the others are still under review).
Note we may propose other non error related features in between!

In order to test the kernel support for RAS error handling, I previously
provided this series via gitlab, enabling David Jiang's kernel patches
to be tested.

Now that Linux kernel support is upstream, this series is proposing the
support for upstream inclusion in QEMU. Note that support for Multiple
Header Recording has been added to QEMU the meantime and a kernel
patch to use that feature sent out.

https://lore.kernel.org/linux-cxl/20230113154058.16227-1-Jonathan.Cameron@huawei.com/T/#t

There are two generic PCI AER precursor feature additions.
1) The PCI_ERR_UCOR_MASK register has not been implemented until now
   and is necessary for correct emulation.
2) The routing for AER errors, via existing AER error injection, only
   covered one of two paths given in the PCIe base specification,
   unfortunately not the one used by the Linux kernel CXL support.

The use of MSI for the CXL root ports, both makes sense from the point
of view of how it may well be implemented, and works around the documented
lack of PCI interrupt routing in i386/q35. I have a hack that lets
us correctly route those interrupts but don't currently plan to post it.

The actual CXL error injection uses a new QMP interface as documented
in the final patch description. The existing AER error injection
internals are reused though it's HMP interface is not.

Injection via QMP:
{ "execute": "qmp_capabilities" }
...
{ "execute": "cxl-inject-uncorrectable-errors",
  "arguments": {
    "path": "/machine/peripheral/cxl-pmem0",
    "errors": [
        {
            "type": "cache-address-parity",
            "header": [ 3, 4]
        },
        {
            "type": "cache-data-parity",
            "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
        },
        {
            "type": "internal",
            "header": [ 1, 2, 4]
        }
        ]
  }}
...
{ "execute": "cxl-inject-correctable-error",
    "arguments": {
        "path": "/machine/peripheral/cxl-pmem0",
        "type": "physical"
    } }


Jonathan Cameron (8):
  hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
  hw/pci/aer: Add missing routing for AER errors
  hw/pci-bridge/cxl_root_port: Wire up AER
  hw/pci-bridge/cxl_root_port: Wire up MSI
  hw/mem/cxl-type3: Add AER extended capability
  hw/cxl: Fix endian issues in CXL RAS capability defaults / masks
  hw/pci/aer: Make PCIE AER error injection facility available for other
    emulation to use.
  hw/mem/cxl_type3: Add CXL RAS Error Injection Support.

 hw/cxl/cxl-component-utils.c   |  20 ++-
 hw/mem/cxl_type3.c             | 294 +++++++++++++++++++++++++++++++++
 hw/mem/cxl_type3_stubs.c       |  17 ++
 hw/mem/meson.build             |   2 +
 hw/pci-bridge/cxl_root_port.c  |  64 +++++++
 hw/pci/pci-internal.h          |   1 -
 hw/pci/pcie_aer.c              |  14 +-
 include/hw/cxl/cxl_component.h |  26 +++
 include/hw/cxl/cxl_device.h    |  11 ++
 include/hw/pci/pcie_aer.h      |   1 +
 include/hw/pci/pcie_regs.h     |   3 +
 qapi/cxl.json                  | 128 ++++++++++++++
 qapi/meson.build               |   1 +
 qapi/qapi-schema.json          |   1 +
 14 files changed, 572 insertions(+), 11 deletions(-)
 create mode 100644 hw/mem/cxl_type3_stubs.c
 create mode 100644 qapi/cxl.json

-- 
2.37.2


