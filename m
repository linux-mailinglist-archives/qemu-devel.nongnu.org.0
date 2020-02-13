Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751915BA1F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 08:38:16 +0100 (CET)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j294h-0003VA-Jr
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 02:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j293L-0001nE-H8
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:36:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j293K-00057k-BI
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:36:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2704 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j293F-00054T-AL; Thu, 13 Feb 2020 02:36:46 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 95436FE84DA4358ECCBC;
 Thu, 13 Feb 2020 15:36:39 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 15:36:31 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 0/4] arm64: Add the cpufreq device to show cpufreq info to
 guest
Date: Thu, 13 Feb 2020 15:36:26 +0800
Message-ID: <20200213073630.2125-1-fangying1@huawei.com>
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
  acpi: Add aml_generic_register
  acpi/cppc: Add ACPI CPPC registers
  arm: Add the cpufreq device model
  arm: Create the cpufreq device

 default-configs/aarch64-softmmu.mak |   1 +
 hw/acpi/Kconfig                     |   4 +
 hw/acpi/Makefile.objs               |   1 +
 hw/acpi/aml-build.c                 |  22 +++
 hw/acpi/cpufreq.c                   | 249 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c            |  74 ++++++++-
 hw/arm/virt.c                       |  14 ++
 include/hw/acpi/acpi-defs.h         |  32 ++++
 include/hw/acpi/aml-build.h         |   3 +
 include/hw/arm/virt.h               |   1 +
 10 files changed, 399 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/cpufreq.c

--=20
2.19.1



