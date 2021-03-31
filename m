Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C9350455
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:18:37 +0200 (CEST)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdYC-0006QY-V6
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lRdSH-0000gd-Tm
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:12:29 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37694 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lRdSG-00089U-0n
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:12:29 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 0B2E560310050; Wed, 31 Mar 2021 12:12:27 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v4 cxl-2.0-doe 0/3] QEMU PCIe DOE for PCIe and CXL2.0
Date: Wed, 31 Mar 2021 12:12:05 -0400
Message-Id: <1617207125-1138-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Version 4 patch series for PCIe DOE for PCIe and CXL 2.0 completes
 all planned functionality.
 
 Based on QEMU version:
 https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4

Summary of changes:
 1: PCIe DOE support for Discovery
    - Fix the alignment error in DOE config write
    - Fix the interrupt disabling issue in DOE config write
    - Naming and comments clean up
	- Removed CMA support 
 2: CXL DOE for CDAT and Compliance Mode.
    - Add default values for the absence of CDAT file
    - Add cdatCDAT file example for use with cdat=<filename>
    - Refactor DOE CXL compliance mode
    - Naming and comments clean up

hchkuo (3):
  PCIe Data Object Exchange implementation
  CXL Data Object Exchange implementation
  PCIe standard header for DOE

 MAINTAINERS                               |   7 +
 hw/cxl/cxl-cdat.c                         | 220 ++++++++++++++++++
 hw/cxl/meson.build                        |   1 +
 hw/mem/cxl_type3.c                        | 200 +++++++++++++++++
 hw/pci/meson.build                        |   1 +
 hw/pci/pcie_doe.c                         | 356 ++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_cdat.h                 | 149 +++++++++++++
 include/hw/cxl/cxl_compliance.h           | 297 +++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h            |   7 +
 include/hw/cxl/cxl_device.h               |   4 +
 include/hw/cxl/cxl_pci.h                  |   2 +
 include/hw/pci/pci_ids.h                  |   2 +
 include/hw/pci/pcie.h                     |   1 +
 include/hw/pci/pcie_doe.h                 | 123 +++++++++++
 include/hw/pci/pcie_regs.h                |   3 +
 include/standard-headers/linux/pci_regs.h |   3 +-
 tests/data/cdat/cdat.dat                  | Bin 0 -> 148 bytes
 17 files changed, 1375 insertions(+), 1 deletion(-)
 create mode 100644 hw/cxl/cxl-cdat.c
 create mode 100644 hw/pci/pcie_doe.c
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/cxl/cxl_compliance.h
 create mode 100644 include/hw/pci/pcie_doe.h
 create mode 100644 tests/data/cdat/cdat.dat

-- 
1.8.3.1


