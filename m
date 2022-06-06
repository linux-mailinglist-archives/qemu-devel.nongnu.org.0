Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25FE53ED09
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:35:43 +0200 (CEST)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGdi-0003rm-FJ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nyGbo-0003DG-Oe
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:33:44 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:44042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nyGbm-0004oK-IQ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:33:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4A6B611F6;
 Mon,  6 Jun 2022 17:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A23C385A9;
 Mon,  6 Jun 2022 17:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654536820;
 bh=c7sTXPMA2eAWH6wjM1wkQAqaH6pZtjiRkXPAQ5EavlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfLL9+WVyWAx8yJgG15jxIZwEa/xMZ0ehpeKJEnLVTszFc+mwQYx/P7j8O1JU6nLI
 oLvYdhRATC2ADMcp0tHucVms/Bw6TswAQcXFiNGj26fG36FrRG5T1Vv0X5rN6/k+Be
 NmnKC6Jw9ojamzxV8/l2ks0V894CtybweLh4y/0wvqk5g7jlMfJiEj09xwXccUw2dd
 OOdi74YKcQ7hG/leNb2BGwzy2wBSOMeTSHm4Q7P/j/SXlPpOgl6urn8LzlpvTgVcHa
 P9JKduVDxhtC/PK4L/qbqjbNoSfCF8HFUH4jSuT+wcgnhI+TUdej1Iz3HvEOve/doP
 sK0CUvmNS3F9g==
Date: Mon, 6 Jun 2022 10:33:38 -0700
From: Ben Widawsky <bwidawsk@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 0/8] hw/cxl: Move CXL emulation options and state to
 machines.
Message-ID: <20220606173338.g2cligo2t5pugh7l@bwidawsk-mobl5>
References: <20220601164235.2117-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601164235.2117-1-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=bwidawsk@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22-06-01 17:42:27, Jonathan Cameron wrote:
> Changes since v1 (thanks to Paolo Bonzini)
> * Update 'description' of cxl-fmw as suggested to mention it's an array.
> * Add a wrapper cxl_hook_up_pxb_registers() to cxl-host.c as it'll be common
>   for all machines using CXL with PXB.
> 
> Run through the CI at:
> https://gitlab.com/jic23/qemu/-/pipelines/553257456
>  
> V1 Cover letter:
> 
> Currently only machine with CXL support upstream is i386/pc but arm/virt
> patches have been posted and once this is merged an updated series will
> follow. Switch support is queued behind this as well because they both
> include documentation updates.
> 
> Paolo Bonzini highlighted a couple of issues with the current CXL
> emulation code.
> 
> * Top level parameter rather than machine for fixed memory windows
> 
>   The --cxl-fixed-memory-window top level command line parameters won't play
>   well with efforts to make it possible to instantiate entire machines via
>   RPC. Better to move these to be machine configuration.  This change is
>   relatively straight forward, but does result in very long command lines
>   (cannot break fixed window setup into multiple -M entries).
> 
> * Move all CXL stuff to machine specific code and helpers
> 
>   To simplify the various interactions between machine setup and host
>   bridges etc, currently various CXL steps are called from the generic
>   core/machine.c and softmmu/vl.c + there are CXL elements in MachineState.
> 
>   Much of this is straight forward to do with one exception:
>   The CXL pci_expander_bridge host bridges require MMIO register space.
>   This series does this by walking the bus and filling the register space
>   in via the machine_done callback. This is similar to the walk done for
>   identifying host bridges in the ACPI building code but it is rather ugly
>   and postpones rejection of PXB_CXL instances where cxl=off (default).
> 
> All comments welcome, but the first patch at least changes the command-line
> so to avoid have to add backwards compatibility code, it would be great
> to merge that before 7.1 is released.
> 

LGTM overall. I'm not thrilled with introducing another [sub]scronym "fmw", but
otherwise, no complaints.
Series is:
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>

> Thanks,
> 
> Jonathan
> 
> Jonathan Cameron (8):
>   hw/cxl: Make the CXL fixed memory window setup a machine parameter.
>   hw/acpi/cxl: Pass in the CXLState directly rather than MachineState
>   hw/cxl: Push linking of CXL targets into i386/pc rather than in
>     machine.c
>   tests/acpi: Allow modification of q35 CXL CEDT table.
>   pci/pci_expander_bridge: For CXL HB delay the HB register memory
>     region setup.
>   tests/acpi: Update q35/CEDT.cxl for new memory addresses.
>   hw/cxl: Move the CXLState from MachineState to machine type specific
>     state.
>   hw/machine: Drop cxl_supported flag as no longer useful
> 
>  docs/system/devices/cxl.rst                 |   4 +-
>  hw/acpi/cxl.c                               |   9 +-
>  hw/core/machine.c                           |  28 ------
>  hw/cxl/cxl-host-stubs.c                     |   9 +-
>  hw/cxl/cxl-host.c                           | 100 ++++++++++++++++++--
>  hw/i386/acpi-build.c                        |   8 +-
>  hw/i386/pc.c                                |  31 +++---
>  hw/pci-bridge/meson.build                   |   5 +-
>  hw/pci-bridge/pci_expander_bridge.c         |  32 ++++---
>  hw/pci-bridge/pci_expander_bridge_stubs.c   |  14 +++
>  include/hw/acpi/cxl.h                       |   5 +-
>  include/hw/boards.h                         |   3 +-
>  include/hw/cxl/cxl.h                        |   9 +-
>  include/hw/cxl/cxl_host.h                   |  23 +++++
>  include/hw/i386/pc.h                        |   2 +
>  include/hw/pci-bridge/pci_expander_bridge.h |  12 +++
>  qapi/machine.json                           |  13 +++
>  softmmu/vl.c                                |  46 ---------
>  tests/data/acpi/q35/CEDT.cxl                | Bin 184 -> 184 bytes
>  tests/qtest/bios-tables-test.c              |   4 +-
>  tests/qtest/cxl-test.c                      |   4 +-
>  21 files changed, 222 insertions(+), 139 deletions(-)
>  create mode 100644 hw/pci-bridge/pci_expander_bridge_stubs.c
>  create mode 100644 include/hw/cxl/cxl_host.h
>  create mode 100644 include/hw/pci-bridge/pci_expander_bridge.h
> 
> -- 
> 2.32.0
> 

