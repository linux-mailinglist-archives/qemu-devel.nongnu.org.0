Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809741B033
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 08:23:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ4Mv-00058n-Fu
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 02:23:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4Jw-00035H-1O
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4Jv-0004cM-36
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:51103)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hQ4Ju-0004YC-QW
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2019 23:20:16 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga008.fm.intel.com with ESMTP; 12 May 2019 23:20:15 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:19:04 +0800
Message-Id: <20190513061913.9284-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [RFC PATCH 0/9] hw/acpi: make build_madt arch agnostic
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
Cc: yang.zhong@intel.com, ehabkost@redhat.com, mst@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>, pbonzini@redhat.com,
	imammedo@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now MADT is highly depend in architecture and machine type and leaves
duplicated code in different architecture. The series here tries to generalize
it.

MADT contains one main table and several sub tables. These sub tables are
highly related to architecture. Here we introduce one method to make it
architecture agnostic.

  * each architecture define its sub-table implementation function in madt_sub
  * introduces struct madt_input to collect sub table information and pass to
    build_madt

By doing so, each architecture could prepare its own sub-table implementation
and madt_input. And keep build_madt architecture agnostic.

Wei Yang (9):
  hw/acpi: expand pc_madt_cpu_entry in place
  hw/acpi: implement madt_sub[ACPI_APIC_PROCESSOR]
  hw/acpi: implement madt_sub[ACPI_APIC_LOCAL_X2APIC]
  hw/acpi: implement madt_sub[ACPI_APIC_IO]
  hw/acpi: implement madt_sub[ACPI_APIC_XRUPT_OVERRIDE]
  hw/acpi: implement madt_sub[ACPI_APIC_LOCAL_X2APIC_NMI]
  hw/acpi: implement madt_sub[ACPI_APIC_LOCAL_NMI]
  hw/acpi: factor build_madt with madt_input
  hw/acpi: implement madt_main to manipulate main madt table

 hw/acpi/cpu.c                        |  14 +-
 hw/acpi/piix4.c                      |   3 +-
 hw/i386/acpi-build.c                 | 265 +++++++++++++++++----------
 hw/isa/lpc_ich9.c                    |   3 +-
 include/hw/acpi/acpi_dev_interface.h |  12 +-
 include/hw/i386/pc.h                 |   2 +
 6 files changed, 194 insertions(+), 105 deletions(-)

-- 
2.19.1


