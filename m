Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E667B8AD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 18:36:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKjfg-00080L-KX; Wed, 25 Jan 2023 12:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pKjff-0007zv-0P
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 12:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pKjfc-0006Ei-Iw
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 12:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674668087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC/8fIu4ghCQxIr5cPjoyY3K+sgUXKJuosj2mEv57GQ=;
 b=G0F6PIWklHY10Ri8ODEjfOonp8/+Qqh0PHqNkb65PBSwzuQIssnq/OGaMG2g+Z2vSHR5ns
 t7LaztgEGOy91brIG3ADDa7r4zh+1urvynWg+B7w0Tb5qEWC3OLaMD9EBCrRRN24s0hP+r
 5aFU5DPA6EIrmC3a4F6TH0Bz4hNOwjU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-bTvk1RBZOSCkq2PJyPetLQ-1; Wed, 25 Jan 2023 12:34:45 -0500
X-MC-Unique: bTvk1RBZOSCkq2PJyPetLQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m12-20020a056402430c00b0049e4ac58509so13426243edc.16
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 09:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gC/8fIu4ghCQxIr5cPjoyY3K+sgUXKJuosj2mEv57GQ=;
 b=UGYSjr88OlNvFUBpjxb2ox1p0NySBjZYmAA1QUbq9/D84VEsoQG4Qmk/GgVbSqHcmL
 QW52hyWjAbXRIdUf4Tc//bPuafzrJa3zgXW3fieimWzyxxqKAymKlEMBB3AmDq1RSKiC
 QLKygc22NOw7V+QClCnt24ynttAqpvw8D7BCiuZcEittYpf4VxqWk9F1/+gT01Z68qXK
 KfU1tLwpIUI+uzlw43UfEAQUY4qPqPctd2uAnF6oCFHtZ4MAFYjcwILXm/4+SMzmvbT0
 w6maqZqjb5hpXUXs98z0406rY3gCAk7MlbRqrVbQzRXhNp+Dh2AmNw6DH/CMoGQoMAn9
 /XxQ==
X-Gm-Message-State: AFqh2krvcdL2Ps9KX1FE8StpYcraQ39+zGG7MXcuyt5CXNs8eGPmD6Mg
 iCBTLYoGZCFp0U/+dPVWjlw5OkgKzCg32rI8AzLL6dQ7iC6m7pe6uImgSvewGHFpOowcmoTF3HW
 SGgfGQCS5UNvsbts=
X-Received: by 2002:a17:906:4f93:b0:877:61e8:915a with SMTP id
 o19-20020a1709064f9300b0087761e8915amr26497826eju.75.1674668084772; 
 Wed, 25 Jan 2023 09:34:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+9mp5rtY1xsRDT8G72pnNhVm3QUWUmmBt9aS28eD6b3QrWyoHmRjxieb8wjSUypSKJ/Es0Q==
X-Received: by 2002:a17:906:4f93:b0:877:61e8:915a with SMTP id
 o19-20020a1709064f9300b0087761e8915amr26497811eju.75.1674668084530; 
 Wed, 25 Jan 2023 09:34:44 -0800 (PST)
Received: from redhat.com ([2.52.134.175]) by smtp.gmail.com with ESMTPSA id
 d12-20020a170906174c00b007a8de84ce36sm2603063eje.206.2023.01.25.09.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 09:34:43 -0800 (PST)
Date: Wed, 25 Jan 2023 12:34:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 00/40] x86: fixing and cleaning up ACPI PCI code part 3
Message-ID: <20230125123423-mutt-send-email-mst@kernel.org>
References: <20230112140312.3096331-1-imammedo@redhat.com>
 <20230125180209.597c0983@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230125180209.597c0983@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Jan 25, 2023 at 06:02:09PM +0100, Igor Mammedov wrote:
> On Thu, 12 Jan 2023 15:02:32 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> ping,
> 
> Michael can you take a look at this series and queue it
> if it looks acceptable to you.

Yes it's tagged already. RSN.

> 
> PS:
> I'm waiting on this being merged, to send acpi-index
> support on non-hotpluggable ports (due to heavy dependency
> on this refactoring). After which I plan to post
> series that allows resources reallocation on bridges.
> (both should be doable in 8.0 timeframe)
> 
> (the rest: acpi-index for pxb and other targets/machines,
> pci-hostbridge cleanups will be after that but probably
> won't make into 8.0)
> 
> > Series continues refactoring on top of [1].
> > 
> > It focuses on isolating creation of non hotplug and
> > hotplug slot descriptions. In state it's posted, it's
> > not complete, but pretty close to it. The series contains
> > stable patches from refactoring and is already too large
> > to keep it to myself, hence I'm publishing it fro review.
> > 
> > It will be followed by separate series on top of this one,
> > that will finish concrete feature[s] in following order:
> >    1 introduce acpi-index support for non-hotpluggable PCI
> >      devices (i.e. NICs directly attached to Q35 host-bridge)
> >      making acpi-index support complete within pc/q35 machines.
> >    2 let guest OS to re-arrange bridge resources when ACPI PCI
> >      hotplug is enabled. (should fix insuficient resources issue
> >      during PCI hotplug)
> >    3 finish isolating hotplug code from non-hotplug one,
> >      which should allow to re-use non-hotplug parts in other
> >      machines (arm/virt and microvm) and bring acpi-index
> >      support there.
> > 
> > PS:
> > Refactoring also adds testing for various corner cases
> > and fixes (present/latent/imagined) bugs where they were
> > spotted.
> > 
> > 1) "[PATCH 00/11] x86: clean up ACPI PCI code part 2"
> >    https://www.mail-archive.com/qemu-devel@nongnu.org/msg915493.html
> > 
> > CC: "Michael S. Tsirkin" <mst@redhat.com>
> > CC: Ani Sinha <ani@anisinha.ca>
> > 
> > Igor Mammedov (40):
> >   tests: qtest: print device_add error before failing test
> >   tests: acpi: cleanup arguments to make them more readable
> >   tests: acpi: whitelist DSDT blobs for tests that use pci-bridges
> >   tests: acpi: extend pcihp with nested bridges
> >   tests: acpi: update expected blobs
> >   tests: acpi: cleanup use_uefi argument usage
> >   pci_bridge: remove whitespace
> >   x86: acpi: pcihp: clean up duplicate bridge_in_acpi assignment
> >   pci: acpi hotplug: rename x-native-hotplug to
> >     x-do-not-expose-native-hotplug-cap
> >   pcihp: piix4: do not call acpi_pcihp_reset() when ACPI PCI hotplug is
> >     disabled
> >   pci: acpihp: assign BSEL only to coldplugged bridges
> >   x86: pcihp: fix invalid AML PCNT calls to hotplugged bridges
> >   tests: boot_sector_test: avoid crashing if status is not available yet
> >   tests: acpi: extend bridge tests with hotplugged bridges
> >   tests: boot_sector_test(): make it multi-shot
> >   tests: acpi: add reboot cycle to bridge test
> >   tests: acpi: whitelist DSDT before refactoring acpi based PCI hotplug
> >     machinery
> >   pcihp: drop pcihp_bridge_en dependency when composing PCNT method
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT before refactoring acpi based PCI hotplug
> >     machinery
> >   pcihp: compose PCNT callchain right before its user _GPE._E01
> >   pcihp: do not put empty PCNT in DSDT
> >   tests: acpi: update expected blobs
> >   whitelist DSDT before adding endpoint devices to bridge testcases
> >   tests: acpi: add endpoint devices to bridges
> >   tests: acpi: update expected blobs
> >   x86: pcihp: acpi: prepare slot ignore rule to work with self
> >     describing bridges
> >   pci: acpi: wire up AcpiDevAmlIf interface to generic bridge
> >   pcihp: make bridge describe itself using
> >     AcpiDevAmlIfClass:build_dev_aml
> >   pci: make sure pci_bus_is_express() won't error out with  "discards
> >     ‘const’ qualifier"
> >   pcihp: isolate rule whether slot should be described in DSDT
> >   tests: acpi: whitelist DSDT before decoupling PCI hotplug code from
> >     basic slots description
> >   pcihp: acpi: decouple hotplug and generic slots description
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT blobs before removing dynamic _DSM on
> >     coldplugged bridges
> >   pcihp: acpi: ignore coldplugged bridges when composing hotpluggable
> >     slots
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist DSDT before moving non-hotpluggble slots
> >     description from hotplug path
> >   pcihp: generate populated non-hotpluggble slot descriptions on
> >     non-hotplug path
> >   tests: acpi: update expected blobs
> > 
> >  include/hw/acpi/pci.h                         |   4 +
> >  include/hw/pci/pci.h                          |   2 +-
> >  include/hw/pci/pcie_port.h                    |   3 +-
> >  hw/acpi/Kconfig                               |   4 +
> >  hw/acpi/meson.build                           |   4 +-
> >  hw/acpi/pci-bridge-stub.c                     |  20 ++
> >  hw/acpi/pci-bridge.c                          |  27 ++
> >  hw/acpi/pcihp.c                               |  35 ++-
> >  hw/acpi/piix4.c                               |   4 +-
> >  hw/i386/Kconfig                               |   1 +
> >  hw/i386/acpi-build.c                          | 279 ++++++++++--------
> >  hw/i386/pc_q35.c                              |   5 +-
> >  hw/pci-bridge/gen_pcie_root_port.c            |   7 +-
> >  hw/pci-bridge/pci_bridge_dev.c                |   1 -
> >  hw/pci/pci.c                                  |   2 +-
> >  hw/pci/pci_bridge.c                           |  14 +
> >  hw/pci/pcie.c                                 |   6 +-
> >  hw/pci/pcie_port.c                            |   3 +-
> >  tests/data/acpi/pc/DSDT                       | Bin 6458 -> 6360 bytes
> >  tests/data/acpi/pc/DSDT.acpierst              | Bin 6418 -> 6283 bytes
> >  tests/data/acpi/pc/DSDT.acpihmat              | Bin 7783 -> 7685 bytes
> >  tests/data/acpi/pc/DSDT.bridge                | Bin 9532 -> 12487 bytes
> >  tests/data/acpi/pc/DSDT.cphp                  | Bin 6922 -> 6824 bytes
> >  tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8112 -> 8014 bytes
> >  tests/data/acpi/pc/DSDT.hpbridge              | Bin 6418 -> 6289 bytes
> >  tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3064 -> 3081 bytes
> >  tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6530 -> 6432 bytes
> >  tests/data/acpi/pc/DSDT.memhp                 | Bin 7817 -> 7719 bytes
> >  tests/data/acpi/pc/DSDT.nohpet                | Bin 6316 -> 6218 bytes
> >  tests/data/acpi/pc/DSDT.numamem               | Bin 6464 -> 6366 bytes
> >  tests/data/acpi/pc/DSDT.roothp                | Bin 6656 -> 9745 bytes
> >  tests/data/acpi/q35/DSDT                      | Bin 8310 -> 8252 bytes
> >  tests/data/acpi/q35/DSDT.acpierst             | Bin 8327 -> 8269 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat             | Bin 9635 -> 9577 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8589 -> 8531 bytes
> >  tests/data/acpi/q35/DSDT.applesmc             | Bin 8356 -> 8298 bytes
> >  tests/data/acpi/q35/DSDT.bridge               | Bin 11439 -> 11481 bytes
> >  tests/data/acpi/q35/DSDT.core-count2          | Bin 32450 -> 32392 bytes
> >  tests/data/acpi/q35/DSDT.cphp                 | Bin 8774 -> 8716 bytes
> >  tests/data/acpi/q35/DSDT.cxl                  | Bin 9636 -> 9578 bytes
> >  tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9964 -> 9906 bytes
> >  tests/data/acpi/q35/DSDT.ipmibt               | Bin 8385 -> 8327 bytes
> >  tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8398 -> 8340 bytes
> >  tests/data/acpi/q35/DSDT.ivrs                 | Bin 8327 -> 8269 bytes
> >  tests/data/acpi/q35/DSDT.memhp                | Bin 9669 -> 9611 bytes
> >  tests/data/acpi/q35/DSDT.mmio64               | Bin 9440 -> 9382 bytes
> >  tests/data/acpi/q35/DSDT.multi-bridge         | Bin 8630 -> 12337 bytes
> >  tests/data/acpi/q35/DSDT.nohpet               | Bin 8168 -> 8110 bytes
> >  tests/data/acpi/q35/DSDT.numamem              | Bin 8316 -> 8258 bytes
> >  tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8411 -> 8353 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8916 -> 8858 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8942 -> 8884 bytes
> >  tests/data/acpi/q35/DSDT.viot                 | Bin 9419 -> 9361 bytes
> >  tests/data/acpi/q35/DSDT.xapic                | Bin 35673 -> 35615 bytes
> >  tests/qtest/bios-tables-test.c                | 144 ++++++---
> >  tests/qtest/boot-sector.c                     |   6 +-
> >  tests/qtest/libqtest.c                        |   4 +
> >  57 files changed, 394 insertions(+), 181 deletions(-)
> >  create mode 100644 hw/acpi/pci-bridge-stub.c
> >  create mode 100644 hw/acpi/pci-bridge.c
> > 


