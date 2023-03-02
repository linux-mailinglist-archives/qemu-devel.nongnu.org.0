Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694456A81E6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:06:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhhM-0000G8-5r; Thu, 02 Mar 2023 07:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXhhG-0000FP-Nu
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:06:07 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXhhD-0006Ni-5K
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:06:06 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PS8vD6vRdz6J7jf;
 Thu,  2 Mar 2023 20:05:44 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 12:05:57 +0000
Date: Thu, 2 Mar 2023 12:05:56 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>, <qemu-devel@nongnu.org>,
 <ani@anisinha.ca>, <berrange@redhat.com>
Subject: Re: [PATCH 00/33] pci(pc/q35): acpi-index support on
 non-hotpluggable slots
Message-ID: <20230302120556.00003ac7@Huawei.com>
In-Reply-To: <20230302055544-mutt-send-email-mst@kernel.org>
References: <20230224153812.4176226-1-imammedo@redhat.com>
 <20230302055544-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 05:59:16 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Feb 24, 2023 at 04:37:39PM +0100, Igor Mammedov wrote:
> > Series extends acpi-index support to host-bridge(s) and bridges
> > with disabled hotplug (either explicitly or implicitly).
> > Whats new (it is still limited to 'pc' and 'q35' machines),
> > acpi-index now works for non-hotpluggable slots/nics:
> >  * q35: host-bridge
> >  * pc: host-bridge with disabled hotplug
> >        'PIIX4_PM.acpi-root-pci-hotplug=off'
> >  * non-hotpluggable multifunction nics
> >  * on non-hotpluggable slots with native hotplug (i.e. without ACPI PCI hotplug)
> >        PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off
> >        ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> >      + pcie-root-port,hotplug=off | pci-bridge,shpc=off
> > 
> > where it doesn't work (and never will):
> >  * on hotplugged ports/bridges
> >  * on hotpluggable ports/bridges with native hotplug
> > 
> > 1-11/33:  fixes for bugs or odd behavior
> > 13-23/33: non-hotplug/multifunction acpi-index enabling
> > 28-33/33: cleanups 
> > all of that is peppered by extra acpi tests or extensions to existing ones  
> 
> dropped because viot was wrong.
> Pls rebase fix up and repost.
> 
> 
> Apropos I still think we should split up DSDT to several
> SSDTs, in a way that multiple tests share some SSDTs.
> This way it will be more common than a change only affects one table
> and it's easier to merge things.
> 
> For example, how about moving CXL things to an SSDT?

I'll take a look at that, though given CXL doesn't have that much in DSDT that
is different from pxb-pcie (it is set to grow a bit, but just by one _DSM)
and the code is currently mixed up, it may make more sense to pull out both CXL
and PXB into a single SSDT.

I'm definitely keen on less churn in these files given it's not the
easiest thing to sort out if you care carrying a lot of patches out of
tree as we currently are for CXL.

Jonathan 

> 
> 
> > Somewhat tested with RHEL9.0 and WS2022.
> > 
> > What's in queue:
> >  * PXB support 
> >  * microvm and arm/virt support
> > all of above only for non-hotpluggable slots as I don't really want to
> > pull there complicated APCI PCI hotplug.
> > 
> > gitlab tree: https://gitlab.com/imammedo/qemu/-/tree/acpi_index_non_hotplug
> > CI: https://gitlab.com/imammedo/qemu/-/pipelines/787263630
> >  it's red but only due to unrelated curl breakage in msys* targets,
> >  the rest is green
> > 
> > Igor Mammedov (33):
> >   tests: acpi: whitelist new q35.noacpihp test and pc.hpbrroot
> >   tests: acpi: add test_acpi_q35_tcg_no_acpi_hotplug test and extend
> >     test_acpi_piix4_no_acpi_pci_hotplug
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist q35/DSDT.multi-bridge before extending testcase
> >   tests: acpi: extend multi-bridge case with case
> >     'root-port,id=HOHP,hotplug=off root-port,bus=NOHP'
> >   x86: pcihp: fix missing PCNT callchain when intermediate root-port has
> >     'hotplug=off' set
> >   tests: acpi: whitelist pc/DSDT.hpbrroot and pc/DSDT.hpbridge tests
> >   x86: pcihp: fix missing bridge AML when intermediate root-port has
> >     'hotplug=off' set
> >   tests: acpi: update expected blobs
> >   pcihp: piix4: do not redirect hotplug controller to piix4 when ACPI
> >     hotplug is disabled
> >   pci: fix 'hotplugglable' property behavior
> >   tests: acpi: whitelist DSDT blobs before isolating PCI _DSM func 0
> >     prolog
> >   pcihp: move PCI _DSM function 0 prolog into separate function
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT before adding EDSM method
> >   acpi: pci: add EDSM method to DSDT
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT before adding device with acpi-index to
> >     testcases
> >   tests: acpi: add device with acpi-index on non-hotpluggble bus
> >   acpi: pci: support acpi-index for non-hotpluggable devices
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT before exposing non zero functions
> >   acpi: pci: describe all functions on populated slots
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT before adding non-0 function device with
> >     acpi-index to testcases
> >   tests: acpi: add non zero function device with acpi-index on
> >     non-hotpluggble bus
> >   tests: acpi: update expected blobs
> >   pci: move acpi-index uniqueness check to generic PCI device code
> >   acpi: pci: drop BSEL usage when deciding that device isn't
> >     hotpluggable
> >   acpi: pci: move BSEL into build_append_pcihp_slots()
> >   acpi: pci: move out ACPI PCI hotplug generator from generic slot
> >     generator build_append_pci_bus_devices()
> >   pcihp: move fields enabling hotplug into AcpiPciHpState
> >   pcihp: add ACPI PCI hotplug specific is_hotpluggable_bus() callback
> > 
> >  include/hw/acpi/ich9.h                        |   1 +
> >  include/hw/acpi/pcihp.h                       |  11 +-
> >  include/hw/acpi/piix4.h                       |   2 -
> >  include/hw/hotplug.h                          |   2 +
> >  include/hw/qdev-core.h                        |  13 +-
> >  hw/acpi/acpi-pci-hotplug-stub.c               |   9 +-
> >  hw/acpi/ich9.c                                |  21 +-
> >  hw/acpi/pci-bridge.c                          |  14 +-
> >  hw/acpi/pcihp.c                               | 112 +++--------
> >  hw/acpi/piix4.c                               |  33 ++--
> >  hw/i386/acpi-build.c                          | 179 +++++++++++++-----
> >  hw/isa/lpc_ich9.c                             |   1 +
> >  hw/pci/pci.c                                  |  57 ++++++
> >  hw/pci/pcie_port.c                            |   8 +
> >  tests/data/acpi/pc/DSDT                       | Bin 6360 -> 6488 bytes
> >  tests/data/acpi/pc/DSDT.acpierst              | Bin 6283 -> 6411 bytes
> >  tests/data/acpi/pc/DSDT.acpihmat              | Bin 7685 -> 7813 bytes
> >  tests/data/acpi/pc/DSDT.bridge                | Bin 12487 -> 12615 bytes
> >  tests/data/acpi/pc/DSDT.cphp                  | Bin 6824 -> 6952 bytes
> >  tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8014 -> 8142 bytes
> >  tests/data/acpi/pc/DSDT.hpbridge              | Bin 6289 -> 6451 bytes
> >  tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3081 -> 3343 bytes
> >  tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6432 -> 6560 bytes
> >  tests/data/acpi/pc/DSDT.memhp                 | Bin 7719 -> 7847 bytes
> >  tests/data/acpi/pc/DSDT.nohpet                | Bin 6218 -> 6346 bytes
> >  tests/data/acpi/pc/DSDT.numamem               | Bin 6366 -> 6494 bytes
> >  tests/data/acpi/pc/DSDT.roothp                | Bin 9745 -> 9873 bytes
> >  tests/data/acpi/q35/DSDT                      | Bin 8252 -> 8361 bytes
> >  tests/data/acpi/q35/DSDT.acpierst             | Bin 8269 -> 8378 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat             | Bin 9577 -> 9686 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8531 -> 8640 bytes
> >  tests/data/acpi/q35/DSDT.applesmc             | Bin 8298 -> 8407 bytes
> >  tests/data/acpi/q35/DSDT.bridge               | Bin 11481 -> 11590 bytes
> >  tests/data/acpi/q35/DSDT.core-count2          | Bin 32392 -> 32501 bytes
> >  tests/data/acpi/q35/DSDT.cphp                 | Bin 8716 -> 8825 bytes
> >  tests/data/acpi/q35/DSDT.cxl                  | Bin 9578 -> 9687 bytes
> >  tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9906 -> 10015 bytes
> >  tests/data/acpi/q35/DSDT.ipmibt               | Bin 8327 -> 8436 bytes
> >  tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8340 -> 8449 bytes
> >  tests/data/acpi/q35/DSDT.ivrs                 | Bin 8269 -> 8378 bytes
> >  tests/data/acpi/q35/DSDT.memhp                | Bin 9611 -> 9720 bytes
> >  tests/data/acpi/q35/DSDT.mmio64               | Bin 9382 -> 9491 bytes
> >  tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12337 -> 12770 bytes
> >  tests/data/acpi/q35/DSDT.noacpihp             | Bin 0 -> 8248 bytes
> >  tests/data/acpi/q35/DSDT.nohpet               | Bin 8110 -> 8219 bytes
> >  tests/data/acpi/q35/DSDT.numamem              | Bin 8258 -> 8367 bytes
> >  tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8353 -> 8462 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8858 -> 8967 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8884 -> 8993 bytes
> >  tests/data/acpi/q35/DSDT.viot                 | Bin 9361 -> 9486 bytes
> >  tests/data/acpi/q35/DSDT.xapic                | Bin 35615 -> 35724 bytes
> >  tests/qtest/bios-tables-test.c                |  50 ++++-
> >  52 files changed, 341 insertions(+), 172 deletions(-)
> >  create mode 100644 tests/data/acpi/q35/DSDT.noacpihp
> > 
> > -- 
> > 2.39.1  
> 
> 


