Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D483157B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:32:20 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZgI-00047r-PO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1l9ZKe-00059k-QW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:09:56 -0500
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:55746 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1l9ZKc-00010I-Ss
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:09:56 -0500
Received: by server4.localdomain (Postfix, from userid 503)
 id 7D1E960310050; Tue,  9 Feb 2021 14:59:37 -0500 (EST)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com,
	ben.widawsky@intel.com
Subject: [RFC PATCH v2 0/2] PCIe DOE for PCIe and CXL 2.0 v2 release
Date: Tue,  9 Feb 2021 14:59:20 -0500
Message-Id: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
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
Cc: david@redhat.com, qemu-devel@nongnu.org, vishal.l.verma@intel.com,
 jgroves@micron.com, Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, Jonathan.Cameron@huawei.com,
 imammedo@redhat.com, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2 patch series for PCIe DOE for PCIe and CXL 2.0

Summary is 

1: PCIe DOE support for Discovery and CMA.
   - MSI-X and polling supported
2: CXL DOE for CDAT and Compliance Mode.
   - DOE CDAT response returns one CDAT Structure instance based on
     request EntryHandle value.
   - One of each CDAT Structure types supported

Based on QEMU version:
https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v3

References:
1. CXL 2.0 specification
https://www.computeexpresslink.org/download-the-specification
2. PCI-SIG ECN: Data Object Exchange (DOE)
http://www.pcisig.com
3. Coherent Device Attribute Table	CDAT 1.02
https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.02.pdf

---

Chris Browy (2):
  Basic PCIe DOE support
  Basic CXL DOE for CDAT and Compliance Mode

 MAINTAINERS                               |   7 +
 hw/cxl/cxl-component-utils.c              | 132 ++++++++++
 hw/mem/cxl_type3.c                        | 172 +++++++++++++
 hw/pci/meson.build                        |   1 +
 hw/pci/pcie.c                             |   2 +-
 hw/pci/pcie_doe.c                         | 414 ++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_cdat.h                 | 120 +++++++++
 include/hw/cxl/cxl_compl.h                | 289 +++++++++++++++++++++
 include/hw/cxl/cxl_component.h            | 126 +++++++++
 include/hw/cxl/cxl_device.h               |   3 +
 include/hw/cxl/cxl_pci.h                  |   4 +
 include/hw/pci/pci_ids.h                  |   2 +
 include/hw/pci/pcie.h                     |   1 +
 include/hw/pci/pcie_doe.h                 | 166 ++++++++++++
 include/hw/pci/pcie_regs.h                |   4 +
 include/standard-headers/linux/pci_regs.h |   3 +-
 16 files changed, 1444 insertions(+), 2 deletions(-)
 create mode 100644 hw/pci/pcie_doe.c
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/cxl/cxl_compl.h
 create mode 100644 include/hw/pci/pcie_doe.h

-- 
1.8.3.1


