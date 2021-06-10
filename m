Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930633A2C57
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:02:46 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKKb-0006rh-Mh
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lrKI4-0005HG-NM
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:00:09 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:57740 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lrKI2-0007De-P7
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:00:08 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 7427560310050; Thu, 10 Jun 2021 09:00:01 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v6 cxl2.0-v6-doe 0/6] QEMU PCIe DOE for PCIe 4.0/5.0 and CXL
 2.0
Date: Thu, 10 Jun 2021 08:59:59 -0400
Message-Id: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.398,
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
Cc: Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the PCIe Data Object Exchange (DOE) for PCIe 4.0/5.0
and later and CXL 2.0 "type-3" memory devices supporting the following protocols:
 1: PCIe DOE Discovery protocol
 2: CXL DOE Compliance Mode protocol
 3: CXL DOE CDAT protocol

Implementation is based on QEMU version which added CXL 2.0 "type-3" support
https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4
6882c0453eea74d639ac75ec0f362d0cf9f1c744

PCIe Data Object Exchange (DOE) implementation for QEMU refers to
"Data Object Exchange ECN, March 12, 2020" [1]

The Data Object Exchange implementation of CXL Compliance Mode is
refers to "Compute Express Link (CXL) Specification, Rev. 2.0, Oct.
2020" [2]

The Data Object Exchange implementation of CXL Coherent Device Attribute
Table (CDAT). This implementation is referring to "Coherent Device
Attribute Table Specification, Rev. 1.02, Oct. 2020" [3] and "Compute
Express Link Specification, Rev. 2.0, Oct. 2020" [2]

The CDAT can be specified in two ways. One is to add ",cdat=<filename>"
in "-device cxl-type3"'s command option. The file is required to provide
the whole CDAT table in binary mode. The other is to use the default
CDAT value created by build_cdat_table in hw/cxl/cxl-cdat.c.

Pre-built CDAT table for testing, contains one CDAT header and six
CDAT entries: DSMAS, DSLBIS, DSMSCIS, DSIS, DSEMTS, and SSLBIS
respectively.

Changes since PATCH v5:
1-3: PCIe DOE linux header and macros and PCIe Discovery protocol
4:   Clean up CXL compliance mode DOE protocol including default responses
5-6: Clean up CXL CDAT DOE protocol including tesing built-in and external CDAT tables

[1]: https://members.pcisig.com/wg/PCI-SIG/document/14143
[2]: https://www.computeexpresslink.org/
[3]: https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.02.pdf

hchkuo (6):
  standard-headers/linux/pci_regs: PCI header from Linux kernel
  include/hw/pci: headers for PCIe DOE
  hw/pci: PCIe Data Object Exchange implementation
  cxl/compliance: CXL Compliance Data Object Exchange implementation
  cxl/cdat: CXL CDAT Data Object Exchange implementation
  test/cdat: CXL CDAT test data

 MAINTAINERS                               |   7 +
 hw/cxl/cxl-cdat.c                         | 139 ++++++++
 hw/cxl/meson.build                        |   1 +
 hw/mem/cxl_type3.c                        | 298 +++++++++++++++++
 hw/pci/meson.build                        |   1 +
 hw/pci/pcie_doe.c                         | 374 ++++++++++++++++++++++
 include/hw/cxl/cxl_cdat.h                 | 150 +++++++++
 include/hw/cxl/cxl_compliance.h           | 293 +++++++++++++++++
 include/hw/cxl/cxl_component.h            |   7 +
 include/hw/cxl/cxl_device.h               |   4 +
 include/hw/cxl/cxl_pci.h                  |   2 +
 include/hw/pci/pci_ids.h                  |   3 +
 include/hw/pci/pcie.h                     |   1 +
 include/hw/pci/pcie_doe.h                 | 123 +++++++
 include/hw/pci/pcie_regs.h                |   4 +
 include/standard-headers/linux/pci_regs.h |   3 +-
 tests/data/cdat/cdat.dat                  | Bin 0 -> 148 bytes
 17 files changed, 1409 insertions(+), 1 deletion(-)
 create mode 100644 hw/cxl/cxl-cdat.c
 create mode 100644 hw/pci/pcie_doe.c
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/cxl/cxl_compliance.h
 create mode 100644 include/hw/pci/pcie_doe.h
 create mode 100644 tests/data/cdat/cdat.dat

-- 
2.17.1


