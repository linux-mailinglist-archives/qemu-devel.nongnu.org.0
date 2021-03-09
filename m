Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252DB33305F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:57:46 +0100 (CET)
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjQH-0004aL-5e
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lJj3q-0001RD-24
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:34:34 -0500
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:42730 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lJj3o-0003VM-7A
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:34:33 -0500
Received: by server4.localdomain (Postfix, from userid 503)
 id 999AB60310050; Tue,  9 Mar 2021 15:34:29 -0500 (EST)
From: Chris Browy <cbrowy@avery-design.com>
To: qemu-devel@nongnu.org,
	linux-cxl@vger.kernel.org
Subject: [RFC PATCH v3 cxl-2.0-doe 0/2] Version 3 patch series for PCIe DOE
 for PCIe and CXL 2.0
Date: Tue,  9 Mar 2021 15:33:49 -0500
Message-Id: <1615322029-13038-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.116,
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
Cc: ben.widawsky@intel.com, david@redhat.com, vishal.l.verma@intel.com,
 jgroves@micron.com, cbrowy@avery-design.com, armbru@redhat.com,
 f4bug@amsat.org, mst@redhat.com, tyshao@avery-design.com.tw,
 hchkuo@avery-design.com.tw, Jonathan.Cameron@Huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 3 patch series for PCIe DOE for PCIe and CXL 2.0 implements
all planned functionality.

Based on QEMU version:
https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4

Summary:
1: PCIe DOE support for Discovery
   - Support multiple DOE instances for each own protocol set 
   - MSI-X and polling supported
   - Update error and interrupt status in DOE Status register
   - Use static array to register callback function for DOE protocols 
   - Deprecate DOE_SUCCESS and DOE_DISCARD
   - Add license headers
2: CXL DOE for CDAT and Compliance Mode.
   - Device supports pre-defined CDAT or user-provided CDAT.
   - Support on reading the iASL aml file via specifying
     "cdat=<filename.aml>" property to -device cxl-type3
	 skips over the ACPI header and writes only CDAT table entries
   - Clean up CXL compliance structures
   - DOE CDAT response returns one CDAT Structure instance based on
     request EntryHandle value.

Example cdat.dat file: (compile with iasl -G cdat.dat)
CDAT file may contain any mix and number of supported CDAT Structure types
----------------------
/* Header */ 
Signature : "CDAT"
Table Length : 00000000
Revision : 01
Checksum : 00
Oem ID : AVERY 
Oem Table ID : 0 
Oem Revision : 1 
Asl Compiler ID : "INTL"
Asl Compiler Revision : 20160527

/* CDAT structures */
Label : DSMAS               // Field        Byte Length
UINT8  : 0                  // Type             1
UINT8  : 00                 // Reserved         1
UINT16 : 0018               // Length           2
UINT8  : 00                 // DSMADHandle      1
UINT8  : 00                 // Flags            1
UINT16 : 0000               // Reserved         2
UINT64 : 0000000000000000   // DPA Base         8
UINT64 : ffffffffffffffff   // DPA Length       8

Label : DSLBIS              // Field          Byte Length
UINT8  : 01                 // Type             1
UINT8  : 00                 // Reserved         1
UINT16 : 0018               // Length           2
UINT8  : 00                 // Handle           1
UINT8  : 00                 // Flags            1
UINT8  : 00                 // Data Type        1
UINT8  : 00                 // Reserved         1
UINT64 : 0000000000000000   // Entry Base Unit  8
UINT16 : 0000               // Entry[0]         2
UINT16 : 0000               // Entry[1]         2
UINT16 : 0000               // Entry[2]         2
UINT16 : 0000               // Reserved         2

Label: DSMSCIS              // Field        Byte Length
UINT8  : 02                 // Type             1
UINT8  : 00                 // Reserved         1
UINT16 : 0014               // Length           2
UINT8  : 00                 // DSMASHandle      1
UINT24 : 000000             // Reserved         3
UINT64 : 0000000000000000   // Memory Side Cache Size    8
UINT32 : 00000000           // Cache Attributes 4 

Label : DSIS                // Field        Byte Length
UINT8  : 03                 // Type             1
UINT8  : 00                 // Reserved         1
UINT16 : 0008               // Length           2
UINT8  : 00                 // Flags            1
UINT8  : 00                 // Handle           1
UINT16 : 0000               // Reserved         2

Label : DSEMTS              // Field        Byte Length
UINT8  : 04                 // Type             1
UINT8  : 00                 // Reserved         1
UINT16 : 0018               // Length           2
UINT8  : 00                 // DSMAS Handle     1
UINT8  : 00                 // EFI Memory Type and Attribute    1
UINT16 : 0000               // Reserved         2
UINT64 : 0000000000000000   // DPA Offset       8
UINT64 : 0000000000000000   // DPA Length       8

Label : SSLBIS              // Field        Byte Length
UINT8  : 05                 // Type             1
UINT8  : 00                 // Reserved         1
UINT16 : 0020               // Length           2
UINT8  : 00                 // Data Type        1
UINT24 : 000000             // Reserved         3
UINT64 : 0000000000000000   // Entry Base Unit  8
Label : SSLBE               // SSLBE[0]
UINT16 : 0000               // Port X ID        2
UINT16 : 0000               // Port Y ID        2
UINT16 : 0000               // Latency or Bandwidth    2
UINT16 : BBBB               // Reserved         2
Label : SSLBE               // SSLBE[1]
UINT16 : 0000               // Port X ID        2
UINT16 : 0000               // Port Y ID        2
UINT16 : 0000               // Latency or Bandwidth    2
UINT16 : BBBC               // Reserved         2
----

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
  CXL DOE support for CDAT and Compliance Mode

 MAINTAINERS                               |  49 +--
 hw/cxl/cxl-component-utils.c              |  93 +++++
 hw/mem/cxl_type3.c                        | 184 ++++++++++
 hw/pci/meson.build                        |   1 +
 hw/pci/pci.c                              |  13 +-
 hw/pci/pcie_doe.c                         | 416 ++++++++++++++++++++++
 include/hw/cxl/cxl_cdat.h                 | 127 +++++++
 include/hw/cxl/cxl_compl.h                | 252 +++++++++++++
 include/hw/cxl/cxl_component.h            |  74 ++++
 include/hw/cxl/cxl_device.h               |   4 +
 include/hw/cxl/cxl_pci.h                  |   2 +
 include/hw/pci/pci_ids.h                  |   5 +-
 include/hw/pci/pcie.h                     |   1 +
 include/hw/pci/pcie_doe.h                 | 142 ++++++++
 include/hw/pci/pcie_regs.h                |   4 +
 include/standard-headers/linux/pci_regs.h |   3 +-
 16 files changed, 1327 insertions(+), 43 deletions(-)
 create mode 100644 hw/pci/pcie_doe.c
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/cxl/cxl_compl.h
 create mode 100644 include/hw/pci/pcie_doe.h

-- 
2.17.1


