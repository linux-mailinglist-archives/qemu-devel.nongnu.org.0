Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4315B730
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 03:37:09 +0100 (CET)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j24NI-0008TS-Gb
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 21:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j24M3-0007CC-67
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j24M2-0000YD-8u
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2703 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j24Lz-0000Q7-Rp; Wed, 12 Feb 2020 21:35:48 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1529E4D80926B91EB21C;
 Thu, 13 Feb 2020 10:35:44 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 10:35:33 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 0/4] arm64: Add the cpufreq device to show cpufreq info to
 guest
Date: Thu, 13 Feb 2020 10:35:28 +0800
Message-ID: <20200213023532.902-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On ARM64 platform, cpu frequency is retrieved via ACPI CPPC.
A virtual cpufreq device based on ACPI CPPC is created to
present cpu frequency info to the guest.

The default frequency is set to host cpu nominal frequency,
which is obtained from the host CPPC sysfs. Other performance
data are set to the same value, since we don't support guest
performance scaling here.

Performance counters are also not emulated and they simply
return 1 if read, and guest should fallback to use desired
performance value as the current performance.

Guest kernel version above 4.18 is required to make it work.

Ying Fang (4):
  acpi: add aml_generic_register
  acpi/cppc: add ACPI CPPC registers
  arm_virt: add the cpufreq device model
  arm_virt: create the cpufreq device

 default-configs/aarch64-softmmu.mak |   1 +
 hw/acpi/Kconfig                     |   4 +
 hw/acpi/Makefile.objs               |   1 +
 hw/acpi/aml-build.c                 |  22 +++
 hw/acpi/cpufreq.c                   | 247 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c            |  74 ++++++++-
 hw/arm/virt.c                       |  14 ++
 include/hw/acpi/acpi-defs.h         |  32 ++++
 include/hw/acpi/aml-build.h         |   3 +
 include/hw/arm/virt.h               |   1 +
 10 files changed, 397 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/cpufreq.c

--=20
2.19.1



