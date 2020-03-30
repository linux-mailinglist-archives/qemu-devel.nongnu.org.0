Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCB1981A9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 18:51:34 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIxdN-00026Z-Kw
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 12:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcF-0001A5-0m
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcD-0004ry-V5
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:50:22 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3219 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcB-0004ih-5O; Mon, 30 Mar 2020 12:50:19 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EDE6D49C3F22F7113B3E;
 Tue, 31 Mar 2020 00:50:12 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.27.100) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 00:50:04 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 0/3] acpi: Fixes for inconsistency in ACPI MR size
 during migration 
Date: Mon, 30 Mar 2020 17:49:06 +0100
Message-ID: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.27.100]
X-CFilter-Loop: Reflected
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is to fix few issues discovered while adding NVDIMM hot-add
support to arm/virt. These were previously part of [1] and since
the fixes are generic in nature and might be an issue in x86 as
well, they are being treated separately now.

1. https://patchwork.kernel.org/cover/11432383/

Updates:
 -Added R-by and A-by tags.
 -Edited commit log for patch#2
 -Updated patch#3 as per David's comment

David Hildenbrand (1):
  exec: Fix for qemu_ram_resize() callback

Shameer Kolothum (2):
  acpi: Use macro for table-loader file name
  fw_cfg: Migrate ACPI table mr sizes separately

 exec.c                      | 16 ++++++-
 hw/arm/virt-acpi-build.c    |  2 +-
 hw/core/machine.c           |  1 +
 hw/i386/acpi-build.c        |  2 +-
 hw/nvram/fw_cfg.c           | 86 ++++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h |  1 +
 include/hw/nvram/fw_cfg.h   |  6 +++
 7 files changed, 109 insertions(+), 5 deletions(-)

-- 
2.17.1



