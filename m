Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576AE1FAA41
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:44:49 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl6H2-0008U8-76
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl6G8-0007RR-HJ
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 03:43:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35802
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl6G5-0006Jh-Vg
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 03:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592293428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wD0xe39zJBIkg8X+3SRoC70TAmoc/QlOTu3igiwyP8=;
 b=a08uxfKyIArx343pkXC+iD5Qwa4p/o5a4b1ReuRkMPRWSsXSqj7OGl/NUaSUXhi0W6DADN
 xhZKwMxPx3mMkjqr768ygeFUaaQOJUxETGenm2/EGnog5rLsMTdyg8Gj9AbfPms34/m/kE
 YHL7p//K+uo5RaDd3gsb99wgHRZQweo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-jFI3afyeMBa7pGvh1NVE-w-1; Tue, 16 Jun 2020 03:43:47 -0400
X-MC-Unique: jFI3afyeMBa7pGvh1NVE-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0EF68730E8;
 Tue, 16 Jun 2020 07:43:45 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACF785D9CD;
 Tue, 16 Jun 2020 07:43:41 +0000 (UTC)
Subject: Re: [PULL v2 00/58] virtio, acpi, pci: features, fixes, cleanups,
 tests
From: Auger Eric <eric.auger@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200612141917.9446-1-mst@redhat.com>
 <21bdbe01-aefd-3d7b-965e-c34f54c5c0de@redhat.com>
Message-ID: <00af175b-ac54-b6df-1d48-da1dd02b9452@redhat.com>
Date: Tue, 16 Jun 2020 09:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <21bdbe01-aefd-3d7b-965e-c34f54c5c0de@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/16/20 9:26 AM, Auger Eric wrote:
> Hi Michael,
> 
> + Stefan
> 
> On 6/12/20 4:51 PM, Michael S. Tsirkin wrote:
>> changes from v1:
>> - printf format fixed for 32 bit hosts
>> - a couple of bugfixes added
>>
>> The following changes since commit 49ee11555262a256afec592dfed7c5902d5eefd2:
>>
>>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.1-pull-request' into staging (2020-06-08 11:04:57 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>>
>> for you to fetch changes up to 10d35e581901c09ee3817ac7cddd296d05291a9d:
>>
>>   virtio-pci: fix queue_enable write (2020-06-12 10:17:06 -0400)
>>
>> ----------------------------------------------------------------
>> virtio,acpi,pci: features, fixes, cleanups, tests
>>
>> Max slots negotiation for vhost-user.
>> Free page reporting for balloon.
>> Partial TPM2 ACPI support for ARM.
>> Support for NVDIMMs having their own proximity domains.
>> New vhost-user-vsock device.
>>
>> Fixes, cleanups in ACPI, PCI, virtio.
>> New tests for TPM ACPI.
>>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> ----------------------------------------------------------------
>> Alexander Duyck (2):
>>       virtio-balloon: Implement support for page poison reporting feature
>>       virtio-balloon: Provide an interface for free page reporting
>>
>> David Hildenbrand (3):
>>       virtio-balloon: fix free page hinting without an iothread
>>       virtio-balloon: fix free page hinting check on unrealize
>>       virtio-balloon: unref the iothread when unrealizing
>>
>> Dima Stepanov (2):
>>       char-socket: return -1 in case of disconnect during tcp_chr_write
>>       vhost-user-blk: delay vhost_user_blk_disconnect
>>
>> Eric Auger (8):
>>       acpi: Convert build_tpm2() to build_append* API
>>       acpi: Move build_tpm2() in the generic part
>>       arm/acpi: TPM2 ACPI table support
> I just noticed you did not take
> 
> [PATCH v4 4/5] arm/acpi: Add the TPM2.0 device under the DSDT
> [PATCH v4 5/5] docs/specs/tpm: ACPI boot now supported for TPM/ARM
> 
> from [PATCH v4 0/5] vTPM/aarch64 ACPI support.
> 
> Without 4/5 the TPM does not work with ACPI. With LUKS auto decryption
> you get:
> 
> [   34.098051] dracut-initqueue[1084]: A TPM2 device with the in-kernel
> resource manager is needed
> 
> Do you wait for other reviews? Shall I resend those 2 patches?

Actually the patches pulled does not correspond to v4. I will submit a
series with latest modifications in build_tpm2() + missing patches.

Thanks

Eric
> 
> Thanks
> 
> Eric
> 
> 
>>       test/tpm-emu: include sockets and channel headers in tpm-emu header
>>       tests/acpi: Add void tables for Q35/TPM-TIS bios-tables-test
>>       tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
>>       bios-tables-test: Add Q35/TPM-TIS test
>>       bios-tables-test: Generate reference tables for Q35/TPM-TIS
>>
>> Gerd Hoffmann (12):
>>       qtest: allow DSDT acpi table changes
>>       acpi: move aml builder code for rtc device
>>       acpi: rtc: use a single crs range
>>       acpi: serial: don't use _STA method
>>       acpi: move aml builder code for serial device
>>       acpi: parallel: don't use _STA method
>>       acpi: move aml builder code for parallel device
>>       acpi: make build_madt() more generic.
>>       acpi: create acpi-common.c and move madt code
>>       acpi: madt: skip pci override on pci-less systems.
>>       acpi: fadt: add hw-reduced sleep register support
>>       acpi: ged: rename event memory region
>>
>> Jason Wang (1):
>>       virtio-pci: fix queue_enable write
>>
>> Julia Suvorova (1):
>>       hw/pci/pcie: Move hot plug capability check to pre_plug callback
>>
>> Michael S. Tsirkin (2):
>>       msix: allow qword MSI-X table accesses
>>       tests/acpi: update DSDT expected files
>>
>> Peter Xu (1):
>>       pci: Display PCI IRQ pin in "info pci"
>>
>> Philippe Mathieu-Daudé (4):
>>       hw/pci-host/prep: Correct RAVEN bus bridge memory region size
>>       hw/pci/pci_bridge: Correct pci_bridge_io memory region size
>>       hw/pci/pci_bridge: Use the IEC binary prefix definitions
>>       hw/pci-host: Use the IEC binary prefix definitions
>>
>> Prasad J Pandit (1):
>>       pci: assert configuration access is within bounds
>>
>> Raphael Norwitz (11):
>>       Add helper to populate vhost-user message regions
>>       Add vhost-user helper to get MemoryRegion data
>>       Add VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS
>>       Transmit vhost-user memory regions individually
>>       Lift max memory slots limit imposed by vhost-user
>>       Refactor out libvhost-user fault generation logic
>>       Support ram slot configuration in libvhost-user
>>       Support adding individual regions in libvhost-user
>>       Support individual region unmap in libvhost-user
>>       Lift max ram slots limit in libvhost-user
>>       Fix parameter type in vhost migration log path
>>
>> Stefan Berger (1):
>>       acpi: tpm: Do not build TCPA table for TPM 2
>>
>> Stefan Hajnoczi (1):
>>       libvhost-user: advertise vring features
>>
>> Stefano Garzarella (3):
>>       vhost-vsock: add vhost-vsock-common abstraction
>>       virtio: add vhost-user-vsock base device
>>       virtio: add vhost-user-vsock-pci device
>>
>> Thomas Huth (2):
>>       MAINTAINERS: Fix the classification of bios-tables-test-allowed-diff.h
>>       hw/pci: Fix crash when running QEMU with "-nic model=rocker"
>>
>> Vishal Verma (3):
>>       diffs-allowed: add the SRAT AML to diffs-allowed
>>       hw/acpi/nvdimm: add a helper to augment SRAT generation
>>       tests/acpi: update expected SRAT files
>>
>>  configure                               |   3 +
>>  qapi/misc.json                          |   6 +-
>>  contrib/libvhost-user/libvhost-user.h   |  24 +-
>>  hw/i386/acpi-common.h                   |  15 +
>>  include/hw/acpi/acpi-defs.h             |   2 +
>>  include/hw/acpi/aml-build.h             |   2 +
>>  include/hw/acpi/generic_event_device.h  |   2 +-
>>  include/hw/mem/nvdimm.h                 |   1 +
>>  include/hw/virtio/vhost-user-vsock.h    |  36 ++
>>  include/hw/virtio/vhost-user.h          |   1 +
>>  include/hw/virtio/vhost-vsock-common.h  |  47 +++
>>  include/hw/virtio/vhost-vsock.h         |  11 +-
>>  include/hw/virtio/virtio-balloon.h      |   3 +-
>>  include/sysemu/tpm.h                    |   2 +
>>  tests/qtest/tpm-emu.h                   |   3 +
>>  chardev/char-socket.c                   |   7 +-
>>  contrib/libvhost-user/libvhost-user.c   | 351 +++++++++++++----
>>  contrib/vhost-user-blk/vhost-user-blk.c |   4 +-
>>  hw/acpi/aml-build.c                     |  49 ++-
>>  hw/acpi/generic_event_device.c          |  16 +-
>>  hw/acpi/nvdimm.c                        |  23 ++
>>  hw/arm/virt-acpi-build.c                |  11 +
>>  hw/block/vhost-user-blk.c               |  38 +-
>>  hw/char/parallel.c                      |  22 ++
>>  hw/char/serial-isa.c                    |  22 ++
>>  hw/core/machine.c                       |   4 +-
>>  hw/i386/acpi-build.c                    | 270 +------------
>>  hw/i386/acpi-common.c                   | 156 ++++++++
>>  hw/pci-host/i440fx.c                    |   3 +-
>>  hw/pci-host/prep.c                      |   2 +-
>>  hw/pci-host/q35.c                       |   2 +-
>>  hw/pci-host/versatile.c                 |   5 +-
>>  hw/pci/msix.c                           |   6 +
>>  hw/pci/pci.c                            |  18 +-
>>  hw/pci/pci_bridge.c                     |   7 +-
>>  hw/pci/pcie.c                           |  19 +-
>>  hw/rtc/mc146818rtc.c                    |  24 ++
>>  hw/virtio/vhost-user-vsock-pci.c        |  84 +++++
>>  hw/virtio/vhost-user-vsock.c            | 181 +++++++++
>>  hw/virtio/vhost-user.c                  | 646 +++++++++++++++++++++++++++-----
>>  hw/virtio/vhost-vsock-common.c          | 258 +++++++++++++
>>  hw/virtio/vhost-vsock.c                 | 283 +++-----------
>>  hw/virtio/vhost.c                       |   4 +-
>>  hw/virtio/virtio-balloon.c              | 137 ++++++-
>>  hw/virtio/virtio-pci.c                  |  12 +-
>>  monitor/hmp-cmds.c                      |   3 +-
>>  tests/qtest/bios-tables-test.c          |  58 +++
>>  tests/qtest/tpm-emu.c                   |   1 -
>>  MAINTAINERS                             |   3 +-
>>  docs/interop/vhost-user.rst             |  44 +++
>>  hw/i386/Makefile.objs                   |   1 +
>>  hw/virtio/Makefile.objs                 |   4 +-
>>  tests/data/acpi/pc/DSDT                 | Bin 5125 -> 5014 bytes
>>  tests/data/acpi/pc/DSDT.acpihmat        | Bin 6449 -> 6338 bytes
>>  tests/data/acpi/pc/DSDT.bridge          | Bin 6984 -> 6873 bytes
>>  tests/data/acpi/pc/DSDT.cphp            | Bin 5588 -> 5477 bytes
>>  tests/data/acpi/pc/DSDT.dimmpxm         | Bin 6778 -> 6667 bytes
>>  tests/data/acpi/pc/DSDT.ipmikcs         | Bin 5197 -> 5086 bytes
>>  tests/data/acpi/pc/DSDT.memhp           | Bin 6484 -> 6373 bytes
>>  tests/data/acpi/pc/DSDT.numamem         | Bin 5131 -> 5020 bytes
>>  tests/data/acpi/pc/SRAT.dimmpxm         | Bin 392 -> 392 bytes
>>  tests/data/acpi/q35/DSDT                | Bin 7863 -> 7752 bytes
>>  tests/data/acpi/q35/DSDT.acpihmat       | Bin 9187 -> 9076 bytes
>>  tests/data/acpi/q35/DSDT.bridge         | Bin 7880 -> 7769 bytes
>>  tests/data/acpi/q35/DSDT.cphp           | Bin 8326 -> 8215 bytes
>>  tests/data/acpi/q35/DSDT.dimmpxm        | Bin 9516 -> 9405 bytes
>>  tests/data/acpi/q35/DSDT.ipmibt         | Bin 7938 -> 7827 bytes
>>  tests/data/acpi/q35/DSDT.memhp          | Bin 9222 -> 9111 bytes
>>  tests/data/acpi/q35/DSDT.mmio64         | Bin 8993 -> 8882 bytes
>>  tests/data/acpi/q35/DSDT.numamem        | Bin 7869 -> 7758 bytes
>>  tests/data/acpi/q35/DSDT.tis            | Bin 0 -> 8357 bytes
>>  tests/data/acpi/q35/SRAT.dimmpxm        | Bin 392 -> 392 bytes
>>  tests/data/acpi/q35/TPM2.tis            | Bin 0 -> 76 bytes
>>  tests/data/acpi/virt/SRAT.memhp         | Bin 186 -> 226 bytes
>>  tests/qtest/Makefile.include            |   1 +
>>  75 files changed, 2183 insertions(+), 754 deletions(-)
>>  create mode 100644 hw/i386/acpi-common.h
>>  create mode 100644 include/hw/virtio/vhost-user-vsock.h
>>  create mode 100644 include/hw/virtio/vhost-vsock-common.h
>>  create mode 100644 hw/i386/acpi-common.c
>>  create mode 100644 hw/virtio/vhost-user-vsock-pci.c
>>  create mode 100644 hw/virtio/vhost-user-vsock.c
>>  create mode 100644 hw/virtio/vhost-vsock-common.c
>>  create mode 100644 tests/data/acpi/q35/DSDT.tis
>>  create mode 100644 tests/data/acpi/q35/TPM2.tis
>>
>>


