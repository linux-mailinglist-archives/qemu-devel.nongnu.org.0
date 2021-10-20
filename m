Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A9434811
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:41:40 +0200 (CEST)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md86L-0008Hb-8S
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1md84T-0006lQ-52
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1md84O-00068U-I4
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634722774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvdmYdXeDAof0WDgyQZJ+FBMFKJX4j9kyW+BYxClKYc=;
 b=EGtVrgDQsynWnaY0+cibR3Wqf7yl+2zNTQ2Ez1NJulZ7FePzr1FFAMDjWyEcCn9ljOfI0A
 Rqxmhdhdmp9nKxtjaAtpSE5QRPYEsa7GCHI/SEbcYAImKXFzhzkJyooakWNK1+poZjOcNI
 289P7Vdi8HKNU89fOW5kmlCCgj23vbA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-aiKbjzscPiWqYAnJ7SIr3Q-1; Wed, 20 Oct 2021 05:39:31 -0400
X-MC-Unique: aiKbjzscPiWqYAnJ7SIr3Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 d7-20020a1c7307000000b0030d6982305bso14143wmb.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WvdmYdXeDAof0WDgyQZJ+FBMFKJX4j9kyW+BYxClKYc=;
 b=d+OTUcSNzyhgmVGTqA7bmU4qbCZTMZXAiVCj2h80ECjbMpD05nswOa1aE5qkUO039d
 Iz4lGbokEc/VRHzshQBf18mE0l9TPND+tPQHGa+t4nH8OFO2jbvHSYJmFgvKWP3u5hFp
 D9IIH3GBsLb2mwFJJDrBjAYHblcsYFaCqrbs/GDJL61dNlJz1YXbhzUSf92Ug7yLml7w
 8odUy9i2KHxkleEnt/xsp3iwjuawxfJClkiGw87tzKX0MJztSyIPKPSwBhiPd+r6hRO+
 FnN2SjMjHv7+Jto58r8Qf96bKQUeoWPSlZ1PaSe0fXSNbLxo+rCTyQn4nQrBZcBfJXUy
 tztA==
X-Gm-Message-State: AOAM531FbSVIK1Hev7nmkk4EPjbR1W18NY6IOwDG/RUjUOCsmBWSJtH6
 sCrVrFSRlfWd3FqfBQFcnYDnEfZik0j3kmu+LbwzTLqevOQn7fjIbM4X69PmyhKZ8KcRmdYy8/i
 zCgLzBs7NwoFU1cA=
X-Received: by 2002:adf:9796:: with SMTP id s22mr48445713wrb.224.1634722769714; 
 Wed, 20 Oct 2021 02:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs0L1Lqqnlmkp/oNHw/8lXBeNX8MX3PnJUzTbd1j/xm6DfcAr1kGQawNCijOi/USCaVjdmWQ==
X-Received: by 2002:adf:9796:: with SMTP id s22mr48445675wrb.224.1634722769362; 
 Wed, 20 Oct 2021 02:39:29 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id t8sm1542233wrx.46.2021.10.20.02.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 02:39:28 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
 <4cc1b92e-a3f0-bab9-6e71-112ef3fb13a1@linaro.org>
 <20211020103929.5cc1fb32@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/29] pc,pci,virtio: features, fixes
Message-ID: <f2a6b49c-f1f7-f50c-0ff6-49e37427007c@redhat.com>
Date: Wed, 20 Oct 2021 11:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020103929.5cc1fb32@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <mapfelba@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 10.39, Igor Mammedov wrote:
> On Tue, 19 Oct 2021 11:38:08 -0700
> Richard Henderson <richard.henderson@linaro.org> wrote:
> 
>> On 10/19/21 4:19 AM, Michael S. Tsirkin wrote:
>>> The following changes since commit 9c050b661d3a43dfe2fd44106e559b39706d1296:
>>>
>>>     Merge remote-tracking branch 'remotes/philmd/tags/mips-20211018' into staging (2021-10-18 09:16:51 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>     git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>>>
>>> for you to fetch changes up to bf2dd99b7d536cdba157fd6687810ce7b8340ccc:
>>>
>>>     failover: fix a regression introduced by JSON'ification of -device (2021-10-19 07:15:34 -0400)
>>>
>>> ----------------------------------------------------------------
>>> pc,pci,virtio: features, fixes
>>>
>>> vhost user rng
>>> Fixes, cleanups all over the place.
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> ----------------------------------------------------------------
>>> Ani Sinha (3):
>>>         tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
>>>         tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
>>>         tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test
>>>
>>> David Hildenbrand (1):
>>>         libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
>>>
>>> Eric Auger (2):
>>>         virtio-iommu: Remove the non transitional name
>>>         virtio-iommu: Drop base_name and change generic_name
>>>
>>> Eugenio Pérez (3):
>>>         vdpa: Skip protected ram IOMMU mappings
>>>         vdpa: Add vhost_vdpa_section_end
>>>         vdpa: Check for iova range at mappings changes
>>>
>>> Igor Mammedov (15):
>>>         tests: acpi: dump table with failed checksum
>>>         tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
>>>         tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
>>>         tests: acpi: q35: test for x2APIC entries in SRAT
>>>         tests: acpi: update expected tables blobs
>>>         tests: acpi: whitelist new expected table tests/data/acpi/q35/DMAR.dmar
>>>         tests: acpi: add testcase for intel_iommu (DMAR table)
>>>         tests: acpi: add expected blob for DMAR table
>>>         tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
>>>         tests: acpi: add testcase for amd-iommu (IVRS table)
>>>         tests: acpi: update expected blobs
>>>         tests: acpi: arm/virt: drop redundant test_acpi_one() in test_acpi_virt_tcg()
>>>         tests: arm-cpu-features: use qtest_has_kvm() API
>>>         tests: migration-test: use qtest_has_accel() API
>>>         tests: bios-tables-test: use qtest_has_accel() API to register TCG only tests
>>>
>>> Laurent Vivier (1):
>>>         failover: fix a regression introduced by JSON'ification of -device
>>>
>>> Mathieu Poirier (3):
>>>         vhost-user-rng: Add vhost-user-rng implementation
>>>         vhost-user-rng-pci: Add vhost-user-rng-pci implementation
>>>         docs: Add documentation for vhost based RNG implementation
>>>
>>> Xueming Li (1):
>>>         vhost-user: fix duplicated notifier MR init
>>>
>>>    include/hw/virtio/vhost-user-rng.h        |  33 ++++
>>>    include/hw/virtio/vhost-vdpa.h            |   2 +
>>>    include/hw/virtio/virtio-iommu.h          |   2 +-
>>>    tests/qtest/libqos/libqtest.h             |   8 +
>>>    hw/net/virtio-net.c                       |  24 ++-
>>>    hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
>>>    hw/virtio/vhost-user-rng.c                | 289 ++++++++++++++++++++++++++++++
>>>    hw/virtio/vhost-user.c                    |   5 +-
>>>    hw/virtio/vhost-vdpa.c                    |  81 ++++++---
>>>    hw/virtio/virtio-iommu-pci.c              |   4 +-
>>>    subprojects/libvhost-user/libvhost-user.c |   1 +
>>>    tests/qtest/acpi-utils.c                  |  14 ++
>>>    tests/qtest/arm-cpu-features.c            |  29 +--
>>>    tests/qtest/bios-tables-test.c            |  90 ++++++++--
>>>    tests/qtest/libqtest.c                    |  27 +++
>>>    tests/qtest/migration-test.c              |  15 +-
>>>    docs/system/device-emulation.rst          |   1 +
>>>    docs/system/devices/vhost-user-rng.rst    |  39 ++++
>>>    hw/virtio/Kconfig                         |   5 +
>>>    hw/virtio/meson.build                     |   2 +
>>>    hw/virtio/trace-events                    |   1 +
>>>    meson.build                               |   6 +
>>>    tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
>>>    tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
>>>    tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
>>>    tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
>>>    tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
>>>    tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
>>>    tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
>>>    tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
>>>    30 files changed, 672 insertions(+), 85 deletions(-)
>>>    create mode 100644 include/hw/virtio/vhost-user-rng.h
>>>    create mode 100644 hw/virtio/vhost-user-rng-pci.c
>>>    create mode 100644 hw/virtio/vhost-user-rng.c
>>>    create mode 100644 docs/system/devices/vhost-user-rng.rst
>>>    create mode 100644 tests/data/acpi/q35/APIC.xapic
>>>    create mode 100644 tests/data/acpi/q35/DMAR.dmar
>>>    create mode 100644 tests/data/acpi/q35/DSDT.ivrs
>>>    create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>>>    create mode 100644 tests/data/acpi/q35/DSDT.xapic
>>>    create mode 100644 tests/data/acpi/q35/FACP.xapic
>>>    create mode 100644 tests/data/acpi/q35/IVRS.ivrs
>>>    create mode 100644 tests/data/acpi/q35/SRAT.xapic
>>
>> 32-bit printf errors:
>>
>> ../hw/virtio/vhost-vdpa.c: In function 'vhost_vdpa_listener_skipped_section':
>> ../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects argument of type 'long
>> unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'}
>> [-Werror=format=]
>>            error_report("RAM section out of device range (min=%lu, addr=%lu)",
>>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>                         iova_min, section->offset_within_address_space);
>>                         ~~~~~~~~
>> ../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects argument of type 'long
>> unsigned int', but argument 3 has type 'hwaddr' {aka 'long long unsigned int'}
>> [-Werror=format=]
>> ../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects argument of type 'long
>> unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'}
>> [-Werror=format=]
>>            error_report("RAM section out of device range (max=%lu, end addr=%lu)",
>>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>                         iova_max, int128_get64(llend));
>>                         ~~~~~~~~
>> ../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects argument of type 'long
>> unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'}
>> [-Werror=format=]
>> cc1: all warnings being treated as errors
>>
>   
>>
>> Also fails s390x host testing:
>>
>>
>> ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion failed (signature ==
>> SIGNATURE): (0x00000000 == 0x0000dead)
>> ERROR qtest-i386/bios-tables-test - Bail out!
>> ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion failed (signature ==
>> SIGNATURE): (0x00000000 == 0x0000dead)
>> Makefile.mtest:368: recipe for target 'run-test-44' failed
> 
> it might happen if VM is too slow
>     /* Wait at most 600 seconds ...
>   
> Let me find s390 host and see if it's reproducable

Micheal already asked Cornelia and me off-list whether it's reproducible, 
and it is. It's the new multif-bridge test that is hanging, but it seems 
like this only uncovered a pre-existing problem: SeaBIOS does bail out as 
soon as QEMU is started with "-device pcie-root-port" on a s390x host. I've 
already enabled the serial debug in SeaBIOS and got this output:

$ build/qemu-system-x86_64 -nographic -machine q35  -vga none  -device 
pcie-root-port -bios ~/bios.bin
Changing serial settings was 0/0 now 3/0
SeaBIOS (version rel-1.14.0-0-g155821a)
BUILD: gcc: (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1) binutils: version 2.30-93.el8
No Xen hypervisor found.
Running on QEMU (q35)
Found QEMU fw_cfg
QEMU fw_cfg DMA interface supported
qemu/e820: addr 0x0000000000000000 len 0x0000000008000000 [RAM]
Relocating init from 0x000d6400 to 0x07faa7a0 (size 88000)
Moving pm_base to 0x600
=== PCI bus & bridge init ===
PCI: pci_bios_init_bus_rec bus = 0x0
PCI: pci_bios_init_bus_rec bdf = 0x10
PCI: primary bus = 0x0
PCI: secondary bus = 0xff -> 0x1
PCI: pci_bios_init_bus_rec bus = 0x1
PCI: subordinate bus = 0x0 -> 0x1
=== PCI device probing ===
Found 6 PCI devices (max PCI bus is 01)
PCIe: using q35 mmconfig at 0xb0000000
=== PCI new allocation pass #1 ===
PCI: check devices
PCI: QEMU resource reserve cap: size 10000000000000 type io
PCI: secondary bus 1 size 10000000000000 type io
PCI: secondary bus 1 size 00200000 type mem
PCI: secondary bus 1 size 00200000 type prefmem
=== PCI new allocation pass #2 ===
PCI: out of I/O address space

I also noticed that the problem did not occur on older versions of QEMU, so 
I just bisected and ended up with this commit here:

e2a6290aab578b2170c1f5909fa556385dc0d820 is the first bad commit
commit e2a6290aab578b2170c1f5909fa556385dc0d820
Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date:   Mon Aug 2 12:00:57 2021 +0300

     hw/pcie-root-port: Fix hotplug for PCI devices requiring IO

Seems like something goes wrong with setting up the IO space on big endian 
hosts?

  Thomas


