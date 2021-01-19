Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5352FAE13
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 01:36:19 +0100 (CET)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1f0M-0006PB-P0
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 19:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1l1ewe-0002yP-H3; Mon, 18 Jan 2021 19:32:28 -0500
Received: from mail.mutex.one ([62.77.152.124]:49442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1l1ewc-0004A4-4N; Mon, 18 Jan 2021 19:32:28 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 07241BF4250E;
 Tue, 19 Jan 2021 02:32:21 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRlDmgeo-Wb7; Tue, 19 Jan 2021 02:32:19 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id B7438BF4227A;
 Tue, 19 Jan 2021 02:32:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1611016339; bh=WsbrKiWSijFZOi0txX9TwEsaVHqaQQOrmRtQjMMAhhE=;
 h=From:To:Cc:Subject:Date:From;
 b=DU2o1pnrvX1qL0jL9Z8KFZPESPLQUvn2RioiZuVVxd/q16gQNemnJWpEOzxv6c/Lh
 mAoPmetc8YSyWGkLOAy46I3TJBHFiTZc7BiR3Pa1NbUMp/C/YSCtxiyoFfbI9NxP82
 1hBAQESbdz/h2227C23d0slXdaxs7ewugCo21RiQ=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Date: Tue, 19 Jan 2021 02:32:11 +0200
Message-Id: <20210119003216.17637-1-posteuca@mutex.one>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=62.77.152.124; envelope-from=marian@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu's ACPI table generation sets the fields OEM ID and OEM table ID=0D
to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI=0D
table name.=0D
=0D
Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID=0D
and OEM table ID for the strings "BOCHS" and "BXPC" and if they are=0D
found, the game crashes(this may be an intentional detection=0D
mechanism to prevent playing the game in a virtualized environment).=0D
=0D
This patch allows you to override these default values.=0D
=0D
The feature can be used in this manner:=0D
qemu -machine oem-id=3DABCDEF,oem-table-id=3DGHIJKLMN=0D
=0D
The oem-id string can be up to 6 bytes in size, and the=0D
oem-table-id string can be up to 8 bytes in size. If the string are=0D
smaller than their respective sizes they will be padded with space.=0D
If either of these parameters is not set, the current default values=0D
will be used for the one missing.=0D
=0D
Note that the the OEM Table ID field will not be extended with the=0D
name of the table, but will use either the default name or the user=0D
provided one.=0D
=0D
This does not affect the -acpitable option (for user-defined ACPI=0D
tables), which has precedence over -machine option.=0D
=0D
v4:=0D
- Added testcases for pc,q35,microvm,aarch64=0D
- Switched to strpadcpy() instead of own function=0D
- Don't touch unrelated fields in tables=0D
- Instead of VIRT_MACHINE(obj)->bar use Foo *vm =3D VIRT_MACHINE(obj);=0D
  vm->bar=0D
=0D
v3:=0D
- Do not append the sig part to OEM table id=0D
- build_header() always sets the passed in values for oem_id=0D
  and oem_table_id=0D
- Fixed a call to g_strdup() with a non-terminated string=0D
- Use MachineState structures to hold the OEM fields=0D
- Proper error handling in object setters=0D
- Added description for object setters/getters=0D
- Added support for pc,q35,microvm,aarch64=0D
=0D
v2:=0D
- Use machine properties to set the OEM fields values=0D
- Pass the desired values from acpi_build()=0D
=0D
Marian Postevca (5):=0D
  tests/acpi: allow updates for expected data files=0D
  acpi: Permit OEM ID and OEM table ID fields to be changed=0D
  tests/acpi: add OEM ID and OEM TABLE ID test=0D
  tests/acpi: update expected data files=0D
  tests/acpi: disallow updates for expected data files=0D
=0D
 hw/acpi/hmat.h                       |   3 +-=0D
 hw/i386/acpi-common.h                |   3 +-=0D
 include/hw/acpi/acpi-defs.h          |   2 +-=0D
 include/hw/acpi/aml-build.h          |   8 +-=0D
 include/hw/acpi/ghes.h               |   3 +-=0D
 include/hw/acpi/pci.h                |   3 +-=0D
 include/hw/acpi/vmgenid.h            |   2 +-=0D
 include/hw/arm/virt.h                |   2 +=0D
 include/hw/i386/microvm.h            |   4 +=0D
 include/hw/i386/pc.h                 |   5 +-=0D
 include/hw/mem/nvdimm.h              |   3 +-=0D
 hw/acpi/aml-build.c                  |  29 ++---=0D
 hw/acpi/ghes.c                       |   5 +-=0D
 hw/acpi/hmat.c                       |   5 +-=0D
 hw/acpi/nvdimm.c                     |  18 +--=0D
 hw/acpi/pci.c                        |   5 +-=0D
 hw/acpi/vmgenid.c                    |   4 +-=0D
 hw/arm/virt-acpi-build.c             |  40 ++++---=0D
 hw/arm/virt.c                        |  63 ++++++++++=0D
 hw/i386/acpi-build.c                 |  86 +++++++++-----=0D
 hw/i386/acpi-common.c                |   5 +-=0D
 hw/i386/acpi-microvm.c               |  13 +-=0D
 hw/i386/microvm.c                    |  66 +++++++++++=0D
 hw/i386/pc.c                         |  64 ++++++++++=0D
 tests/qtest/bios-tables-test.c       | 170 +++++++++++++++++++++++----=0D
 tests/data/acpi/microvm/APIC         | Bin 70 -> 70 bytes=0D
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 82 -> 82 bytes=0D
 tests/data/acpi/microvm/APIC.pcie    | Bin 110 -> 110 bytes=0D
 tests/data/acpi/microvm/DSDT         | Bin 365 -> 365 bytes=0D
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 365 -> 365 bytes=0D
 tests/data/acpi/microvm/DSDT.pcie    | Bin 3031 -> 3031 bytes=0D
 tests/data/acpi/microvm/DSDT.rtc     | Bin 404 -> 404 bytes=0D
 tests/data/acpi/microvm/DSDT.usb     | Bin 414 -> 414 bytes=0D
 tests/data/acpi/microvm/FACP         | Bin 268 -> 268 bytes=0D
 tests/data/acpi/pc/APIC              | Bin 120 -> 120 bytes=0D
 tests/data/acpi/pc/APIC.acpihmat     | Bin 128 -> 128 bytes=0D
 tests/data/acpi/pc/APIC.cphp         | Bin 160 -> 160 bytes=0D
 tests/data/acpi/pc/APIC.dimmpxm      | Bin 144 -> 144 bytes=0D
 tests/data/acpi/pc/DSDT              | Bin 5065 -> 5065 bytes=0D
 tests/data/acpi/pc/DSDT.acpihmat     | Bin 6390 -> 6390 bytes=0D
 tests/data/acpi/pc/DSDT.bridge       | Bin 6924 -> 6924 bytes=0D
 tests/data/acpi/pc/DSDT.cphp         | Bin 5529 -> 5529 bytes=0D
 tests/data/acpi/pc/DSDT.dimmpxm      | Bin 6719 -> 6719 bytes=0D
 tests/data/acpi/pc/DSDT.hpbridge     | Bin 5026 -> 5026 bytes=0D
 tests/data/acpi/pc/DSDT.hpbrroot     | Bin 3084 -> 3084 bytes=0D
 tests/data/acpi/pc/DSDT.ipmikcs      | Bin 5137 -> 5137 bytes=0D
 tests/data/acpi/pc/DSDT.memhp        | Bin 6424 -> 6424 bytes=0D
 tests/data/acpi/pc/DSDT.numamem      | Bin 5071 -> 5071 bytes=0D
 tests/data/acpi/pc/DSDT.roothp       | Bin 5261 -> 5261 bytes=0D
 tests/data/acpi/pc/FACP              | Bin 116 -> 116 bytes=0D
 tests/data/acpi/pc/HMAT.acpihmat     | Bin 280 -> 280 bytes=0D
 tests/data/acpi/pc/HPET              | Bin 56 -> 56 bytes=0D
 tests/data/acpi/pc/NFIT.dimmpxm      | Bin 240 -> 240 bytes=0D
 tests/data/acpi/pc/SLIT.cphp         | Bin 48 -> 48 bytes=0D
 tests/data/acpi/pc/SLIT.memhp        | Bin 48 -> 48 bytes=0D
 tests/data/acpi/pc/SRAT.acpihmat     | Bin 280 -> 280 bytes=0D
 tests/data/acpi/pc/SRAT.cphp         | Bin 304 -> 304 bytes=0D
 tests/data/acpi/pc/SRAT.dimmpxm      | Bin 392 -> 392 bytes=0D
 tests/data/acpi/pc/SRAT.memhp        | Bin 264 -> 264 bytes=0D
 tests/data/acpi/pc/SRAT.numamem      | Bin 224 -> 224 bytes=0D
 tests/data/acpi/pc/SSDT.dimmpxm      | Bin 734 -> 734 bytes=0D
 tests/data/acpi/pc/WAET              | Bin 40 -> 40 bytes=0D
 tests/data/acpi/q35/APIC             | Bin 120 -> 120 bytes=0D
 tests/data/acpi/q35/APIC.acpihmat    | Bin 128 -> 128 bytes=0D
 tests/data/acpi/q35/APIC.cphp        | Bin 160 -> 160 bytes=0D
 tests/data/acpi/q35/APIC.dimmpxm     | Bin 144 -> 144 bytes=0D
 tests/data/acpi/q35/DSDT             | Bin 7801 -> 7801 bytes=0D
 tests/data/acpi/q35/DSDT.acpihmat    | Bin 9126 -> 9126 bytes=0D
 tests/data/acpi/q35/DSDT.bridge      | Bin 7819 -> 7819 bytes=0D
 tests/data/acpi/q35/DSDT.cphp        | Bin 8265 -> 8265 bytes=0D
 tests/data/acpi/q35/DSDT.dimmpxm     | Bin 9455 -> 9455 bytes=0D
 tests/data/acpi/q35/DSDT.ipmibt      | Bin 7876 -> 7876 bytes=0D
 tests/data/acpi/q35/DSDT.memhp       | Bin 9160 -> 9160 bytes=0D
 tests/data/acpi/q35/DSDT.mmio64      | Bin 8932 -> 8932 bytes=0D
 tests/data/acpi/q35/DSDT.numamem     | Bin 7807 -> 7807 bytes=0D
 tests/data/acpi/q35/DSDT.tis         | Bin 8407 -> 8407 bytes=0D
 tests/data/acpi/q35/FACP             | Bin 244 -> 244 bytes=0D
 tests/data/acpi/q35/HMAT.acpihmat    | Bin 280 -> 280 bytes=0D
 tests/data/acpi/q35/HPET             | Bin 56 -> 56 bytes=0D
 tests/data/acpi/q35/MCFG             | Bin 60 -> 60 bytes=0D
 tests/data/acpi/q35/NFIT.dimmpxm     | Bin 240 -> 240 bytes=0D
 tests/data/acpi/q35/SLIT.cphp        | Bin 48 -> 48 bytes=0D
 tests/data/acpi/q35/SLIT.memhp       | Bin 48 -> 48 bytes=0D
 tests/data/acpi/q35/SRAT.acpihmat    | Bin 280 -> 280 bytes=0D
 tests/data/acpi/q35/SRAT.cphp        | Bin 304 -> 304 bytes=0D
 tests/data/acpi/q35/SRAT.dimmpxm     | Bin 392 -> 392 bytes=0D
 tests/data/acpi/q35/SRAT.memhp       | Bin 264 -> 264 bytes=0D
 tests/data/acpi/q35/SRAT.mmio64      | Bin 224 -> 224 bytes=0D
 tests/data/acpi/q35/SRAT.numamem     | Bin 224 -> 224 bytes=0D
 tests/data/acpi/q35/SSDT.dimmpxm     | Bin 734 -> 734 bytes=0D
 tests/data/acpi/q35/TPM2.tis         | Bin 76 -> 76 bytes=0D
 tests/data/acpi/q35/WAET             | Bin 40 -> 40 bytes=0D
 tests/data/acpi/virt/APIC            | Bin 168 -> 168 bytes=0D
 tests/data/acpi/virt/APIC.memhp      | Bin 168 -> 168 bytes=0D
 tests/data/acpi/virt/APIC.numamem    | Bin 168 -> 168 bytes=0D
 tests/data/acpi/virt/DSDT            | Bin 5204 -> 5204 bytes=0D
 tests/data/acpi/virt/DSDT.memhp      | Bin 6565 -> 6565 bytes=0D
 tests/data/acpi/virt/DSDT.numamem    | Bin 5204 -> 5204 bytes=0D
 tests/data/acpi/virt/DSDT.pxb        | Bin 7689 -> 7689 bytes=0D
 tests/data/acpi/virt/FACP            | Bin 268 -> 268 bytes=0D
 tests/data/acpi/virt/FACP.memhp      | Bin 268 -> 268 bytes=0D
 tests/data/acpi/virt/FACP.numamem    | Bin 268 -> 268 bytes=0D
 tests/data/acpi/virt/GTDT            | Bin 96 -> 96 bytes=0D
 tests/data/acpi/virt/GTDT.memhp      | Bin 96 -> 96 bytes=0D
 tests/data/acpi/virt/GTDT.numamem    | Bin 96 -> 96 bytes=0D
 tests/data/acpi/virt/MCFG            | Bin 60 -> 60 bytes=0D
 tests/data/acpi/virt/MCFG.memhp      | Bin 60 -> 60 bytes=0D
 tests/data/acpi/virt/MCFG.numamem    | Bin 60 -> 60 bytes=0D
 tests/data/acpi/virt/NFIT.memhp      | Bin 224 -> 224 bytes=0D
 tests/data/acpi/virt/SLIT.memhp      | Bin 48 -> 48 bytes=0D
 tests/data/acpi/virt/SPCR            | Bin 80 -> 80 bytes=0D
 tests/data/acpi/virt/SPCR.memhp      | Bin 80 -> 80 bytes=0D
 tests/data/acpi/virt/SPCR.numamem    | Bin 80 -> 80 bytes=0D
 tests/data/acpi/virt/SRAT.memhp      | Bin 226 -> 226 bytes=0D
 tests/data/acpi/virt/SRAT.numamem    | Bin 106 -> 106 bytes=0D
 tests/data/acpi/virt/SSDT.memhp      | Bin 736 -> 736 bytes=0D
 116 files changed, 495 insertions(+), 116 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

