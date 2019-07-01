Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8555BE41
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 16:28:11 +0200 (CEST)
Received: from localhost ([::1]:59304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhxHv-0004vS-3l
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 10:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hhwVP-0004yz-KO
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hhwVN-0001Fp-Mb
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:38:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hhwVM-0001F5-4i
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:38:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C4887821D8;
 Mon,  1 Jul 2019 13:37:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EBF017CC0;
 Mon,  1 Jul 2019 13:37:49 +0000 (UTC)
Date: Mon, 1 Jul 2019 15:37:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190701153745.2149d011@redhat.com>
In-Reply-To: <20190614155626.27932-1-tao3.xu@intel.com>
References: <20190614155626.27932-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 01 Jul 2019 13:37:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 0/8] Build ACPI Heterogeneous Memory
 Attribute Table (HMAT)
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
Cc: jingqi.liu@intel.com, fan.du@intel.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jun 2019 23:56:18 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> This series of patches will build Heterogeneous Memory Attribute Table (HMAT)
> according to the command line. The ACPI HMAT describes the memory attributes,
> such as memory side cache attributes and bandwidth and latency details,
> related to the System Physical Address (SPA) Memory Ranges.
> The software is expected to use this information as hint for optimization.

in addition to patches in this series. pls consider adding testcase for ACPI table
as the last patch. Look at tests/bios-tables-test.c for examples.


> The V4 patches link:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01644.html
> 
> Changelog:
> v5:
>     - spilt the 1-6/11 and 8/11 from patch v4 to build Memory Subsystem
>     Address Range Structure(s) and System Locality Latency and Bandwidth
>     Information Structure(s) firstly.
>     - add 1/8 of patch v5 to simplify arm_load_dtb() (Igor)
>     - drop the helper machine_num_numa_nodes() and use
>     machine->numa_state->num_nodes (and numa_state->nodes) directly (Igor)
>     - Add more descriptions from ACPI spec (Igor)
>     - Add the reason of using stub (Igor)
>     - Use GArray for NUMA memory ranges data (Igor)
>     - Separate hmat_build_lb() (Igor)
>     - Drop all global variables and use local variables instead (Igor)
>     - Add error message when base unit < 10
>     - Update the hmat-lb option example by using '-numa cpu'
>     and '-numa memdev' (Igor)
> 
> v4:
>     - send the patch of "move numa global variables into MachineState"
>     together with HMAT patches.
>     https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg03662.html
>     - spilt the 1/8 of v3 patch into two patches, 4/11 introduces
>     build_mem_ranges() and 5/11 builds HMAT (Igor)
>     - use build_append_int_noprefix() to build parts of ACPI table in
>     all patches (Igor)
>     - Split 8/8 of patch v3 into two parts, 10/11 introduces NFIT
>     generalizations (build_acpi_aml_common), and use it in 11/11 to
>     simplify hmat_build_aml (Igor)
>     - use MachineState instead of PCMachineState to build HMAT more
>     generalic (Igor)
>     - move the 7/8 v3 patch into the former patches
>     - update the version tag from 4.0 to 4.1
> v3:
>     - rebase the fixing patch into the jingqi's patches (Eric)
>     - update the version tag from 3.10 to 4.0 (Eric)
> v2:
>   Per Igor and Eric's comments, fix some coding style and small issues:
>     - update the version number in qapi/misc.json
>     - including the expansion of the acronym HMAT in qapi/misc.json
>     - correct spell mistakes in qapi/misc.json and qemu-options.hx
>     - fix the comment syle in hw/i386/acpi-build.c
>     and hw/acpi/hmat.h
>    - remove some unnecessary head files in hw/acpi/hmat.c 
>    - use hardcoded numbers from spec to generate
>    Memory Subsystem Address Range Structure in hw/acpi/hmat.c
>    - drop the struct AcpiHmat and AcpiHmatSpaRange
>     in hw/acpi/hmat.h
>    - rewrite NFIT code to build _HMA method
> 
> Liu Jingqi (3):
>   hmat acpi: Build Memory Subsystem Address Range Structure(s) in ACPI
>     HMAT
>   hmat acpi: Build System Locality Latency and Bandwidth Information
>     Structure(s) in ACPI HMAT
>   numa: Extend the command-line to provide memory latency and bandwidth
>     information
> 
> Tao Xu (5):
>   hw/arm: simplify arm_load_dtb
>   numa: move numa global variable nb_numa_nodes into MachineState
>   numa: move numa global variable have_numa_distance into MachineState
>   numa: move numa global variable numa_info into MachineState
>   acpi: introduce AcpiDeviceIfClass.build_mem_ranges hook
> 
>  exec.c                               |   5 +-
>  hw/acpi/Kconfig                      |   5 +
>  hw/acpi/Makefile.objs                |   1 +
>  hw/acpi/aml-build.c                  |   9 +-
>  hw/acpi/hmat.c                       | 252 +++++++++++++++++++++++++++
>  hw/acpi/hmat.h                       |  82 +++++++++
>  hw/acpi/piix4.c                      |   1 +
>  hw/arm/aspeed.c                      |   5 +-
>  hw/arm/boot.c                        |  20 ++-
>  hw/arm/collie.c                      |   8 +-
>  hw/arm/cubieboard.c                  |   5 +-
>  hw/arm/exynos4_boards.c              |   7 +-
>  hw/arm/highbank.c                    |   8 +-
>  hw/arm/imx25_pdk.c                   |   5 +-
>  hw/arm/integratorcp.c                |   8 +-
>  hw/arm/kzm.c                         |   5 +-
>  hw/arm/mainstone.c                   |   5 +-
>  hw/arm/mcimx6ul-evk.c                |   5 +-
>  hw/arm/mcimx7d-sabre.c               |   5 +-
>  hw/arm/musicpal.c                    |   8 +-
>  hw/arm/nseries.c                     |   5 +-
>  hw/arm/omap_sx1.c                    |   5 +-
>  hw/arm/palm.c                        |  10 +-
>  hw/arm/raspi.c                       |   6 +-
>  hw/arm/realview.c                    |   5 +-
>  hw/arm/sabrelite.c                   |   5 +-
>  hw/arm/spitz.c                       |   5 +-
>  hw/arm/tosa.c                        |   8 +-
>  hw/arm/versatilepb.c                 |   5 +-
>  hw/arm/vexpress.c                    |   5 +-
>  hw/arm/virt-acpi-build.c             |  17 +-
>  hw/arm/virt.c                        |  16 +-
>  hw/arm/xilinx_zynq.c                 |   8 +-
>  hw/arm/xlnx-versal-virt.c            |   7 +-
>  hw/arm/xlnx-zcu102.c                 |   5 +-
>  hw/arm/z2.c                          |   8 +-
>  hw/core/machine.c                    |  16 +-
>  hw/i386/acpi-build.c                 | 140 +++++++++------
>  hw/i386/pc.c                         |  11 +-
>  hw/isa/lpc_ich9.c                    |   1 +
>  hw/mem/pc-dimm.c                     |   2 +
>  hw/pci-bridge/pci_expander_bridge.c  |   2 +
>  hw/ppc/spapr.c                       |  23 ++-
>  hw/ppc/spapr_pci.c                   |   2 +
>  include/hw/acpi/acpi_dev_interface.h |   4 +
>  include/hw/acpi/aml-build.h          |   2 +-
>  include/hw/arm/boot.h                |   4 +-
>  include/hw/boards.h                  |   2 +
>  include/hw/i386/pc.h                 |   1 +
>  include/qemu/typedefs.h              |   1 +
>  include/sysemu/numa.h                |  37 +++-
>  include/sysemu/sysemu.h              |  24 +++
>  monitor.c                            |  11 +-
>  numa.c                               | 219 +++++++++++++++++++----
>  qapi/misc.json                       |  94 +++++++++-
>  qemu-options.hx                      |  45 ++++-
>  stubs/Makefile.objs                  |   1 +
>  stubs/pc_build_mem_ranges.c          |  14 ++
>  58 files changed, 961 insertions(+), 264 deletions(-)
>  create mode 100644 hw/acpi/hmat.c
>  create mode 100644 hw/acpi/hmat.h
>  create mode 100644 stubs/pc_build_mem_ranges.c
> 


