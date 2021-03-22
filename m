Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F1D345225
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:58:08 +0100 (CET)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOSYp-0004P9-SO
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lOSWr-0003IM-Cy; Mon, 22 Mar 2021 17:56:05 -0400
Received: from mail.mutex.one ([62.77.152.124]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lOSWo-0005xk-KQ; Mon, 22 Mar 2021 17:56:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 74FB4BF426A2;
 Mon, 22 Mar 2021 23:55:58 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CvHQ_3wAryT; Mon, 22 Mar 2021 23:55:57 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.115.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id BA2AEBF42692;
 Mon, 22 Mar 2021 23:55:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1616450156; bh=56gKa/9K+bohAh0JX6G0ndA+B07XW+dnsNawaoFpzO4=;
 h=From:To:Cc:Subject:Date:From;
 b=Fo7Wp4F2jxxjm4ZN1nAV0uPVEXTEjU1IzSivIX68sWVIJPh11Z6CSx4jE2RoMZj8D
 fLMOdmJamH7mk76AVqyyCtI8wTJ7heua+mIATBDyAxhvkkobln1N2wRRgn73gsqawp
 pZRehoQkhaSIylJd53gXa1g2xzXyitY0kGkNimyc=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] Rework ACPI OEM fields handling to simplify code (was:
 acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Date: Mon, 22 Mar 2021 23:55:53 +0200
Message-Id: <20210322215554.24875-1-posteuca@mutex.one>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch consolidates ACPI OEM fields handling=0D
by:=0D
- Moving common code in PC and MICROVM to X86.=0D
- Changes unnecessary dynamic memory allocation to static allocation=0D
- Uses dedicated structure to keep values of fields instead of two=0D
  separate strings=0D
- Adds helper macros to initialize the structure=0D
=0D
v2:=0D
- Move the setters/getters of OEM fields to X86MachineState to=0D
  remove duplication=0D
- Change commit message to make it clear the second commit is=0D
  a re-factor=0D
=0D
v3:=0D
- Rebase "acpi: Consolidate the handling of OEM ID and OEM=0D
          Table ID fields to latest" to latest HEAD=0D
- Dropped "acpi: Move setters/getters of oem fields to=0D
           X86MachineState" since it was accepted already=0D
=0D
Marian Postevca (1):=0D
  acpi: Consolidate the handling of OEM ID and OEM Table ID fields=0D
=0D
 hw/acpi/hmat.h                   |  2 +-=0D
 hw/i386/acpi-common.h            |  2 +-=0D
 include/hw/acpi/acpi-build-oem.h | 55 ++++++++++++++++++++++=0D
 include/hw/acpi/aml-build.h      | 15 +++---=0D
 include/hw/acpi/ghes.h           |  2 +-=0D
 include/hw/acpi/pci.h            |  2 +-=0D
 include/hw/acpi/vmgenid.h        |  2 +-=0D
 include/hw/arm/virt.h            |  4 +-=0D
 include/hw/i386/x86.h            |  4 +-=0D
 include/hw/mem/nvdimm.h          |  4 +-=0D
 hw/acpi/aml-build.c              | 27 ++++++-----=0D
 hw/acpi/ghes.c                   |  5 +-=0D
 hw/acpi/hmat.c                   |  4 +-=0D
 hw/acpi/nvdimm.c                 | 22 +++++----=0D
 hw/acpi/pci.c                    |  4 +-=0D
 hw/acpi/vmgenid.c                |  6 ++-=0D
 hw/arm/virt-acpi-build.c         | 40 ++++++----------=0D
 hw/arm/virt.c                    | 16 +++----=0D
 hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------=0D
 hw/i386/acpi-common.c            |  4 +-=0D
 hw/i386/acpi-microvm.c           | 13 ++----=0D
 hw/i386/x86.c                    | 19 ++++----=0D
 22 files changed, 182 insertions(+), 148 deletions(-)=0D
 create mode 100644 include/hw/acpi/acpi-build-oem.h=0D
=0D
-- =0D
2.26.2=0D
=0D

