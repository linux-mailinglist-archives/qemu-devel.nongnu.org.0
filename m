Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510323B4B6E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 02:03:44 +0200 (CEST)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwvnT-0007SE-Dm
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 20:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lwvlw-0005LR-2d
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:02:08 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37440 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lwvlt-00064g-W6
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:02:07 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 695436031112D; Fri, 25 Jun 2021 20:02:04 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v1 QEMU CXL modifications for openspdm 0/1] Testing PCIe DOE
 in QEMU CXL/PCIe Device using openspdm
Date: Fri, 25 Jun 2021 20:02:03 -0400
Message-Id: <1624665723-5169-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
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

This patch series provides an implementation of the the Data Object Exchange
(DOE) for Component Measurement and Authentication (CMA) of the Security
Protocol and Data Model (SPDM). 

This patch is based on 
[1] [PATCH v1 openspdm on QEMU CXL/PCIe Device 0/2] Testing PCIe DOE in QEMU CXL/PCIe Device using openspdm
https://lore.kernel.org/qemu-devel/1624665280-3595-1-git-send-email-cbrowy@avery-design.com/T/#u
[2] QEMU DOE: [PATCH v6 cxl2.0-v6-doe 0/6] QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.0
https://lore.kernel.org/qemu-devel/1623329999-15662-1-git-send-email-cbrowy@avery-design.com/

Openspdm is an emulator composed of an SPDM requester and an SPDM responder.
The default SpdmEmu usage have the requester and responder communicate with
each other via a TCP socket. 

However to test PCIe DOE support in QEMU PCIe/CXL device directly, the openspdm
requester is modified to use pwrite/pread for MMIO access to the
QEMU CXL Device DOE capability (hw/mem/cxl_type3.c).  The openspdm
requester is run as user application targeting the CXL Device.

Follow the readme.md under [1] to build this enhanced version of openspdm.

The QEMU CXL device is extended usig the "-spdm=<bool>" option to turn on/off
the DOE/CMA capability. Once the option is turned on (-spdm=true) the CXL
device can communicate with Openspdm's responder to get the data object of
SPDM/secured SPDM.  QEMU and SPDM responder communicate over client-server
method.

Build the QEMU with patch series applied to [2].

Now run the system as follows:

1. Start Responder process:
    ./openspdm/Build/RELEASE_GCC/X64/SpdmResponderEmu --trans PCI_DOE

2. Start QEMU process:
    qemu-system-x86_64 \
    -nic user,hostfwd=tcp::2222-:22 \
	-machine type=pc-q35-4.0 \
	-smp 8,sockets=2,cores=2,threads=2 \
	-m 4G \
	-boot order=d \
	-k 'en-us' \
	-vga virtio \
	-drive file=<path to qcow>,format=qcow2 \
	-drive if=pflash,format=raw,readonly=on,file=<path to OVMF_CODE.fd> \
	-drive if=pflash,format=raw,file=<path to OVMF_VARS.fd> \
	-object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxl-mem2,size=1K \
	-object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxl-mem,size=512M \
	-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-window-base=1,window-base[0]=0x4c0000000,memdev[0]=cxl-mem1 \
	-device cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0 \
	-device cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M,lsa=cxl-mem2,spdm=true

3. Next copy the openspdm build into QEMU qcow

    scp -rP2222 openspdm qemu@localhost:.

4. Next ssh to QEMU emulator and execute the requester user application

    sudo ./openspdm/Build/RELEASE_GCC/X64/SpdmRequesterEmu --trans PCI_DOE -s 35:00.0

hchkuo (1):
  pcie/spdm: PCIe CMA implementation

 hw/mem/cxl_type3.c              |  31 +++-
 hw/pci/Kconfig                  |   4 +
 hw/pci/SpdmEmuCommand.c         | 319 ++++++++++++++++++++++++++++++++++++++++
 hw/pci/meson.build              |   1 +
 include/hw/cxl/cxl_device.h     |   2 +
 include/hw/pci/SpdmEmuCommand.h |  21 +++
 include/hw/pci/pcie_doe.h       |   2 +
 7 files changed, 377 insertions(+), 3 deletions(-)
 create mode 100644 hw/pci/SpdmEmuCommand.c
 create mode 100644 include/hw/pci/SpdmEmuCommand.h

-- 
1.8.3.1


