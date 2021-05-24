Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767138F496
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 22:52:46 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHZ1-0008CP-WC
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 16:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1llHXO-000713-Gx; Mon, 24 May 2021 16:50:58 -0400
Received: from mail.mutex.one ([62.77.152.124]:59820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1llHXM-00025e-NI; Mon, 24 May 2021 16:50:58 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 9CC4BBF4022C;
 Mon, 24 May 2021 23:50:52 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3C6wQQsqX2PM; Mon, 24 May 2021 23:50:51 +0300 (EEST)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.92.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 0FA48BF400A9;
 Mon, 24 May 2021 23:50:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1621889451; bh=kFr+64OLqfHe4NUhLsDBszjOdYFHs0ztMgBTSg+k6aw=;
 h=From:To:Cc:Subject:Date:From;
 b=Pl4pZeLTL1Nf/7CLzjmK8rziAuMHaZfGiv4l2Mncn5m64mwwDwyMkBekc0u9WGTAW
 PR0b0H1k0ls7exl9dtxBdjubY0wWZvEzX6Lr8gwoKATeiZoxUoPyKYFCS6SX6xEjCF
 3aOn66zkBycwvjbNmExs/Q+bTN8VtPwgXRTP1id8=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/1] Rework ACPI OEM fields handling to simplify code (was:
 acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Date: Mon, 24 May 2021 23:50:28 +0300
Message-Id: <20210524205029.16195-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch consolidates ACPI OEM fields handling
by:
- Moving common code in PC and MICROVM to X86.
- Changes unnecessary dynamic memory allocation to static allocation
- Uses dedicated structure to keep values of fields instead of two
  separate strings
- Adds helper functions to initialize the structure

v2:
- Move the setters/getters of OEM fields to X86MachineState to
  remove duplication
- Change commit message to make it clear the second commit is
  a re-factor

v3:
- Rebase "acpi: Consolidate the handling of OEM ID and OEM
	  Table ID fields to latest" to latest HEAD
- Dropped "acpi: Move setters/getters of oem fields to
	   X86MachineState" since it was accepted already

v4:
- Drop helper macros and use static inline functions instead
- Removed variables starting with __
- Used consistent naming for helper functions that start with ACPI_BUILD_OEM_*
- Didn't drop the defines ACPI_BUILD_APPNAME6 and ACPI_BUILD_APPNAME8 since
  ACPI_BUILD_APPNAME8 is still used in build_header() in aml-build.c and it
  feels better to keep them defined together. But if others prefer to drop the
  ACPI_BUILD_APPNAME6 define, will resend the patch.

v5:
- Rebase on mst tree latest HEAD

Marian Postevca (1):
  acpi: Consolidate the handling of OEM ID and OEM Table ID fields

 hw/acpi/hmat.h                   |  2 +-
 hw/i386/acpi-common.h            |  2 +-
 include/hw/acpi/acpi-build-oem.h | 61 +++++++++++++++++++++++++
 include/hw/acpi/aml-build.h      | 15 +++---
 include/hw/acpi/ghes.h           |  2 +-
 include/hw/acpi/pci.h            |  2 +-
 include/hw/acpi/vmgenid.h        |  2 +-
 include/hw/arm/virt.h            |  4 +-
 include/hw/i386/x86.h            |  4 +-
 include/hw/mem/nvdimm.h          |  4 +-
 hw/acpi/aml-build.c              | 26 +++++------
 hw/acpi/ghes.c                   |  5 +-
 hw/acpi/hmat.c                   |  4 +-
 hw/acpi/nvdimm.c                 | 22 +++++----
 hw/acpi/pci.c                    |  4 +-
 hw/acpi/vmgenid.c                |  6 ++-
 hw/arm/virt-acpi-build.c         | 40 ++++++----------
 hw/arm/virt.c                    | 16 +++----
 hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------
 hw/i386/acpi-common.c            |  4 +-
 hw/i386/acpi-microvm.c           | 13 ++----
 hw/i386/x86.c                    | 19 ++++----
 22 files changed, 188 insertions(+), 147 deletions(-)
 create mode 100644 include/hw/acpi/acpi-build-oem.h

-- 
2.26.3


