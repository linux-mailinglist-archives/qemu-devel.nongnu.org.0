Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A151D24859
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyY5-0003FW-N4
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:46:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSyHi-00068N-9k
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSyHg-0008BW-Fb
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:33253)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSyHc-00083f-Cq; Tue, 21 May 2019 02:29:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 23:29:54 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga004.jf.intel.com with ESMTP; 20 May 2019 23:29:50 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 21 May 2019 14:28:34 +0800
Message-Id: <20190521062836.6541-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v6 0/2] Extract build_mcfg Part 2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set tries to generalize MCFG table build process. Several patches
are already merged and these two are left for the following reasons:

  * conflict with latest upstream
  * ACPI_PCI dependency fix
  * missed reserved[8] in MCFG

v4->v5:
    * ACPI_PCI depends on both ACPI and PCI
    * rebase on latest master, adjust arm Kconfig
    * miss the reserved[8] of MCFG, add it back
    * make sure bios-tables-test all OK

Wei Yang (2):
  hw/acpi: Consolidate build_mcfg to pci.c
  acpi: pci: use build_append_foo() API to construct MCFG

 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 61 ++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                   |  1 +
 hw/arm/virt-acpi-build.c         | 17 ---------
 hw/i386/acpi-build.c             | 18 +---------
 include/hw/acpi/acpi-defs.h      | 18 ----------
 include/hw/acpi/pci.h            |  1 +
 9 files changed, 70 insertions(+), 52 deletions(-)
 create mode 100644 hw/acpi/pci.c

-- 
2.19.1


