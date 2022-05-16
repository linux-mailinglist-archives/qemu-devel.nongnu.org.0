Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE752919E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:48:44 +0200 (CEST)
Received: from localhost ([::1]:55436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhdz-0003HO-Ld
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhcp-0002BV-MO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhcm-0005kA-L4
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ArC6+nigI8MDakXdJuYpsKR8fjGmHWY7lTNbO/XCjNY=;
 b=WT028/u8nsquDDuALjTg+wH6MTEWt3aZtKKqCrSPzwsbM86FES68vDQwIxMCWY3x9VwUoI
 Hcdokz5M2IAbR5bOf3TnL5shMxzcntD03Mj/sa+z2iAcjf9N4XZCAMrLfAfCuuhfl9jiBP
 ohiz7n1BNxPkf+v134klZF6MRcznIfU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-7p1uVWK7OAiYl-qXTIO40w-1; Mon, 16 May 2022 16:47:26 -0400
X-MC-Unique: 7p1uVWK7OAiYl-qXTIO40w-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb36-20020a1709077ea400b006f45e182187so6324320ejc.14
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ArC6+nigI8MDakXdJuYpsKR8fjGmHWY7lTNbO/XCjNY=;
 b=y6AtuvTWcW2YVEYW50OTBkZQA5csBiJ6giA437VWljOVDYIc1wBRkemwD1E5tXaXkT
 +RPosflJsjaao23phl4t3lBsdOJyfv//rgDPUMqFwwhmLpxaWEV/hjnmAcZoGxxT7G+u
 p8zL6N1T+mCM8RBOmOUcsolWGilh3kHGNJ2avWEmOSZr7owqWLJZHLHtKNgprjIfopfN
 FzLFFRCuIU9vQBc4LeWRO0Oy+3a0rUyRrw+p5TY1hvbbjF2OYlPCIC8oIAgPB1TXoOLP
 azFTfXiuRp4BJGWrgAy6waybyBRJzcbOxrxHgeXy/GokyM6qGlQ/CpVzlkAolbIHv/jV
 txjw==
X-Gm-Message-State: AOAM533lailHRluzDLI1jkUp8cEegVzRJ7v5FliYO9G3FqyBdbuxkKYJ
 yQd66x1WNzyNMitirGINPSQhB7H0iDyTCGjfZeA3zuFiUI+VQAB6eLxk0kT7zauX0yEQDlLs8Uu
 tkmK1F6EjLDxYJ9Q=
X-Received: by 2002:aa7:c314:0:b0:42a:bb52:59d2 with SMTP id
 l20-20020aa7c314000000b0042abb5259d2mr3963929edq.167.1652734045215; 
 Mon, 16 May 2022 13:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXkdt3q8g9nLOJlhnr70OrtkjoVrgBC2Lr8c9Tfe2xC3GzH8RFb+x/DXv3ro5nL3WdDa/rQQ==
X-Received: by 2002:aa7:c314:0:b0:42a:bb52:59d2 with SMTP id
 l20-20020aa7c314000000b0042abb5259d2mr3963901edq.167.1652734044980; 
 Mon, 16 May 2022 13:47:24 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 h8-20020a170906530800b006f3ef214e43sm155803ejo.169.2022.05.16.13.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:47:24 -0700 (PDT)
Date: Mon, 16 May 2022 16:47:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 00/35] pc/q35: refactor ISA and SMBUS AML generation
Message-ID: <20220516164638-mutt-send-email-mst@kernel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 16, 2022 at 11:25:35AM -0400, Igor Mammedov wrote:
> 
> Series is excerpt form larger refactoring that does
> the same for PCI devices, but it's too large at this
> point, so I've split off a relatively self-contained
> ISA/SMBUS patches into a smaller separate series, and
> PCI refactoring will follow up on top of this series
> using the same AcpiDevAmlIf interface.
> 
> Series consolidates and unifies how pc/q35 machine
> generates AML for ISA and SMBUS devices. It adds
> a new more generic interface 'AcpiDevAmlIf' that
> replaces ISA specific ISADeviceClass::build_aml
> hook and should allow to use the same approach
> (i.e. ask a device to provide its own AML) but
> not limited to ISA bus.
> Series applies AcpiDevAmlIf interface to a few
> ISA devices that were already using
> ISADeviceClass::build_aml and to devices /tpm,
> applesmc,pvpanic,ipmi/ that were generated in
> custom way. The AML generation for the later
> class is normalized to behave like any other
> ISA device that were using ISADeviceClass::build_aml
> and converted to interface 'AcpiDevAmlIf'.
> It simplifies process of building DSDT and
> eliminates custom probing/wiring for those devices
> as AML for them is generated at the time ISA/SMBUS
> is enumerated.
> 
> Changes to DSDT tables QEMU generates are mostly
> contextual where devices scattered across DSDT
> are consolidated under respective device that
> hosts bus they are attached to.

I like this. Have one further enhancement idea before
applying this, sent on list.

> PS:
>  + series adds several ACPI tests for devices
>    that were missing them.
> 
> Igor Mammedov (35):
>   acpi: add interface to build device specific AML
>   acpi: make isa_build_aml() support AcpiDevAmlIf interface
>   acpi: fdc-isa: replace ISADeviceClass::build_aml with
>     AcpiDevAmlIfClass:build_dev_aml
>   acpi: parallel port: replace ISADeviceClass::build_aml with
>     AcpiDevAmlIfClass:build_dev_aml
>   acpi: serial-is: replace ISADeviceClass::build_aml with
>     AcpiDevAmlIfClass:build_dev_aml
>   acpi: mc146818rtc: replace ISADeviceClass::build_aml with
>     AcpiDevAmlIfClass:build_dev_aml
>   acpi: pckbd: replace ISADeviceClass::build_aml with
>     AcpiDevAmlIfClass:build_dev_aml
>   isa-bus: drop no longer used ISADeviceClass::build_aml
>   tests: acpi: add and whitelist DSDT.ipmismbus expected blob
>   tests: acpi: q35: add test for smbus-ipmi device
>   tests: acpi: update expected blob DSDT.ipmismbus
>   tests: acpi: whitelist DSDT.ipmismbus expected blob
>   ipmi: acpi: use relative path to resource source
>   tests: acpi: update expected DSDT.ipmismbus blob
>   acpi: ich9-smb: add support for AcpiDevAmlIf interface
>   acpi: ipmi: use AcpiDevAmlIf interface to build IPMI device
>     descriptors
>   q35: acpi: drop not needed PCMachineClass::do_not_add_smb_acpi
>   tests: acpi: white-list to be re-factored pc/q35 DSDT
>   acpi: pc: isa bridge: use AcpiDevAmlIf interface to build ISA device
>     descriptors
>   acpi: q35: isa bridge: use AcpiDevAmlIf interface to build ISA device
>     descriptors
>   tests: acpi: update expected blobs
>   tests: acpi: add and white-list DSDT.applesmc expected blob
>   tests: acpi: add applesmc testcase
>   acpi: applesmc: use AcpiDevAmlIfClass:build_dev_aml to provide
>     device's AML
>   tests: acpi: update expected blobs
>   tests: acpi: white-lists expected DSDT.pvpanic-isa blob
>   tests: acpi: add pvpanic-isa: testcase
>   acpi: pvpanic-isa: use AcpiDevAmlIfClass:build_dev_aml to provide
>     device's AML
>   tests: acpi: update expected DSDT.pvpanic-isa blob
>   tests: acpi: white-list DSDT.tis.tpm2/DSDT.tis.tpm12 expected blobs
>   acpi: pc/q35: tpm-tis: fix TPM device scope
>   acpi: pc/q35: remove not needed 'if' condition on pci bus
>   acpi: tpm-tis: use AcpiDevAmlIfClass:build_dev_aml to provide device's
>     AML
>   tests: acpi: update expected DSDT.tis.tpm2/DSDT.tis.tpm12 blobs
>   x86: acpi-build: do not include hw/isa/isa.h directly
> 
>  include/hw/acpi/acpi_aml_interface.h  |  40 ++++++
>  include/hw/acpi/ipmi.h                |   9 +-
>  include/hw/i386/pc.h                  |   1 -
>  include/hw/isa/isa.h                  |  15 ---
>  include/hw/misc/pvpanic.h             |   9 --
>  hw/acpi/acpi_interface.c              |   8 ++
>  hw/acpi/ipmi-stub.c                   |   2 +-
>  hw/acpi/ipmi.c                        |  53 +++-----
>  hw/acpi/meson.build                   |   2 +-
>  hw/block/fdc-isa.c                    |  16 ++-
>  hw/char/parallel.c                    |  14 ++-
>  hw/char/serial-isa.c                  |  14 ++-
>  hw/i2c/smbus_ich9.c                   |  15 +++
>  hw/i386/acpi-build.c                  | 171 ++++++--------------------
>  hw/i386/pc_piix.c                     |   1 -
>  hw/i386/pc_q35.c                      |   1 -
>  hw/input/pckbd.c                      |  14 ++-
>  hw/ipmi/isa_ipmi_bt.c                 |   4 +
>  hw/ipmi/isa_ipmi_kcs.c                |   4 +
>  hw/ipmi/smbus_ipmi.c                  |   4 +
>  hw/isa/isa-bus.c                      |   9 +-
>  hw/isa/lpc_ich9.c                     |  19 +++
>  hw/isa/piix3.c                        |  17 +++
>  hw/misc/applesmc.c                    |  29 +++++
>  hw/misc/pvpanic-isa.c                 |  42 +++++++
>  hw/rtc/mc146818rtc.c                  |  14 ++-
>  hw/tpm/tpm_tis_isa.c                  |  32 +++++
>  tests/data/acpi/pc/DSDT               | Bin 6002 -> 5987 bytes
>  tests/data/acpi/pc/DSDT.acpierst      | Bin 5969 -> 5954 bytes
>  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7327 -> 7312 bytes
>  tests/data/acpi/pc/DSDT.bridge        | Bin 8668 -> 8653 bytes
>  tests/data/acpi/pc/DSDT.cphp          | Bin 6466 -> 6451 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7656 -> 7641 bytes
>  tests/data/acpi/pc/DSDT.hpbridge      | Bin 5969 -> 5954 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3084 -> 3069 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6074 -> 6059 bytes
>  tests/data/acpi/pc/DSDT.memhp         | Bin 7361 -> 7346 bytes
>  tests/data/acpi/pc/DSDT.nohpet        | Bin 5860 -> 5845 bytes
>  tests/data/acpi/pc/DSDT.numamem       | Bin 6008 -> 5993 bytes
>  tests/data/acpi/pc/DSDT.roothp        | Bin 6210 -> 6195 bytes
>  tests/data/acpi/q35/DSDT              | Bin 8289 -> 8274 bytes
>  tests/data/acpi/q35/DSDT.acpierst     | Bin 8306 -> 8291 bytes
>  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9614 -> 9599 bytes
>  tests/data/acpi/q35/DSDT.applesmc     | Bin 0 -> 8320 bytes
>  tests/data/acpi/q35/DSDT.bridge       | Bin 11003 -> 10988 bytes
>  tests/data/acpi/q35/DSDT.cphp         | Bin 8753 -> 8738 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9943 -> 9928 bytes
>  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8364 -> 8349 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 0 -> 8363 bytes
>  tests/data/acpi/q35/DSDT.ivrs         | Bin 8306 -> 8291 bytes
>  tests/data/acpi/q35/DSDT.memhp        | Bin 9648 -> 9633 bytes
>  tests/data/acpi/q35/DSDT.mmio64       | Bin 9419 -> 9404 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8583 -> 8568 bytes
>  tests/data/acpi/q35/DSDT.nohpet       | Bin 8147 -> 8132 bytes
>  tests/data/acpi/q35/DSDT.numamem      | Bin 8295 -> 8280 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 0 -> 8375 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8900 -> 8880 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8921 -> 8906 bytes
>  tests/data/acpi/q35/DSDT.viot         | Bin 9398 -> 9383 bytes
>  tests/data/acpi/q35/DSDT.xapic        | Bin 35652 -> 35637 bytes
>  tests/qtest/bios-tables-test.c        |  40 ++++++
>  61 files changed, 360 insertions(+), 239 deletions(-)
>  create mode 100644 include/hw/acpi/acpi_aml_interface.h
>  create mode 100644 tests/data/acpi/q35/DSDT.applesmc
>  create mode 100644 tests/data/acpi/q35/DSDT.ipmismbus
>  create mode 100644 tests/data/acpi/q35/DSDT.pvpanic-isa
> 
> -- 
> 2.31.1


