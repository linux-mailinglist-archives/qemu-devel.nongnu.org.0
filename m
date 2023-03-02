Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26D6A81E8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhic-00021r-FQ; Thu, 02 Mar 2023 07:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXhiZ-0001x3-QJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:07:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXhiW-0006oa-0k
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677758842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvxcKjWA95EJolHhUtqXWoPRTkvUHlF9dDhQ/r9ocNg=;
 b=UZGlivnTZkWye0cksG1Xd6FUGzWZiphKIK4eRtq3bS53+lO0blZ37Opid0LLSAJgQZk00J
 yxmqvuIs3stwEAhWb5zGbbX+AuR75xd7bAceRgmoy+jmJR4Nyu2oKNpSEwgqAy+4fPax49
 N91NftS48RCE/oCeoj3UohkIk8G18lA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-MVX6RD5GPzuw9Ly6RskJeQ-1; Thu, 02 Mar 2023 07:07:21 -0500
X-MC-Unique: MVX6RD5GPzuw9Ly6RskJeQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 k19-20020ac86053000000b003bd0d4e3a50so8274443qtm.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677758840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvxcKjWA95EJolHhUtqXWoPRTkvUHlF9dDhQ/r9ocNg=;
 b=mTvb/UkNlbzMAlMtUSepS5cDL0x0aJcg/WqW3HMmDVQxNF0MhfyFnw4+IHYCg8nhlX
 Qw5ohRPqjbItPiBEPmxKu8PI2towBcr9x9e9KllJJBUwpHhNSK1nhkNJexBNaPzWJwR/
 hwMmAa5lpKJ7sWOdZdfl6BkI9/Y3+cKp2k0ulNs5o6ifQhXbLOrqavGwVEiV1l3A1VNp
 TEiPLRHSWXXS9H6nCgk7bElv5KaYJ73xDhEcACTnUr9CZnsD7SXt7549YBi1MHOOjBbb
 C7AHyWl6BEIy3TsBfHONFCLYMJKrEwVlFfxCSCfrgxBg6MaVENjy+veRGE2RBfIliZB4
 fV3w==
X-Gm-Message-State: AO0yUKWJNwfN4vSelzAdf4iYSljvJpHxyz1d6fEAFPYqQTHQN4ZODUuP
 vfPPI4K7AdbBlt/Olg+4aMO4CX58z0+e04As+LuW89tEhW2qxKLlr8qomY8r3N6aRRRJKi3hCQn
 1MEmr1d0ktH28HXo=
X-Received: by 2002:ac8:59c8:0:b0:3ba:3ac7:ccf1 with SMTP id
 f8-20020ac859c8000000b003ba3ac7ccf1mr16473427qtf.58.1677758840430; 
 Thu, 02 Mar 2023 04:07:20 -0800 (PST)
X-Google-Smtp-Source: AK7set94j4omZV18JFD/UjXlb6n8j3fa6KCndlwLSKTOx+3zfd67LCke0As3kDfzubtULqvMs/cnmA==
X-Received: by 2002:ac8:59c8:0:b0:3ba:3ac7:ccf1 with SMTP id
 f8-20020ac859c8000000b003ba3ac7ccf1mr16473406qtf.58.1677758840119; 
 Thu, 02 Mar 2023 04:07:20 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05620a09c600b006ee8874f5fasm10710714qky.53.2023.03.02.04.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:07:19 -0800 (PST)
Date: Thu, 2 Mar 2023 13:07:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, berrange@redhat.com
Subject: Re: [PATCH 00/33] pci(pc/q35): acpi-index support on
 non-hotpluggable slots
Message-ID: <20230302130716.5afb85a6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230302055544-mutt-send-email-mst@kernel.org>
References: <20230224153812.4176226-1-imammedo@redhat.com>
 <20230302055544-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

I'll rebase on top of your recent pull req with c471eb4f4044 commit reverted
to get properly updated tables.
Partial table rebuilds are fragile anyways, should we make rebuild ignore
checks the commit introduced?

PS:
Does the rest of the series look fine to you?


> 
> 
> Apropos I still think we should split up DSDT to several
> SSDTs, in a way that multiple tests share some SSDTs.
> This way it will be more common than a change only affects one table
> and it's easier to merge things.
> 
> For example, how about moving CXL things to an SSDT?
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


