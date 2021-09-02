Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416E3FED42
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:55:57 +0200 (CEST)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlJz-0008TZ-Ni
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0j-0008RX-7D
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0f-0004yO-Og
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=52WIoDny5xPC0rlMllgHTG9eFvkW8RFjVKiuvsH/h0g=;
 b=GTnQz+scYudwCj2+n78n5MGH3TD3FEM2WZD/GedsnSJTd+ky0f44CHkfATnXdydcd8gwKq
 nY9Yx8B14D7teUr0QXJExS6HKgTdZUDKQl2OxywYcUZSfcSrbSf/9PjOb62FviZqCXUUK2
 Enjau1FL82BTgV0fju9aHTkatfYIeEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-DdPvD51nNX6Oo0F7eYZ9lg-1; Thu, 02 Sep 2021 07:35:54 -0400
X-MC-Unique: DdPvD51nNX6Oo0F7eYZ9lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63CF81940925
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:35:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BACDB6A8F8;
 Thu,  2 Sep 2021 11:35:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] tests: acpi: add x2apic and various iommu tests
Date: Thu,  2 Sep 2021 07:35:36 -0400
Message-Id: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:
  v2:
     * rebase and update expected blobs on top of 6.1
     * drop ARM/IORT test case, whihc with current master
       requires KVM, but we can't run ACPI tests since
       virt machine on KVM changes irqchip to match host
       and so ACPI tables chage as well. There is a series
       on list that add TCG SMMUv3 support and IORT ACPI
       test along with it, so it will be take care of IORT
       table when merged.

In preparation to ACPI refactoring, the series adds test-cases and
expected ACPI table blobs for:
  * configuration where x2APIC is used (i.e more than 255 cpus)
  * Intel/AMD IOMMUs ACPI tables

Also x2APIC test requires KVM to run, so series adds qtest_has_accel()
API and cleanups tests that used adhoc ways to check for KVM presence.

Series is split from a larger refactoring series:
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg818845.html

gitlab repo for testing:
   https://gitlab.com/imammedo/qemu acpi-tests-v2 

CC: mst@redhat.com

Igor Mammedov (15):
  tests: acpi: dump table with failed checksum
  tests: qtest: add qtest_has_accel() to check if tested binary supports
    accelerator
  tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
  tests: acpi: q35: test for x2APIC entries in SRAT
  tests: acpi: update expected tables blobs
  tests: acpi: whitelist new expected table
    tests/data/acpi/q35/DMAR.dmar
  tests: acpi: add testcase for intel_iommu (DMAR table)
  tests: acpi: add expected blob for DMAR table
  tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
  tests: acpi: add testcase for amd-iommu (IVRS table)
  tests: acpi: update expected blobs
  tests: acpi: arm/virt: drop redundant test_acpi_one() in
    test_acpi_virt_tcg()
  tests: arm-cpu-features: use qtest_has_kvm() API
  tests: migration-test: use qtest_has_accel() API
  tests: bios-tables-test: use qtest_has_accel() API to register TCG
    only tests

 tests/qtest/libqos/libqtest.h  |   8 ++++
 meson.build                    |   6 +++
 tests/data/acpi/q35/APIC.xapic | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DMAR.dmar  | Bin 0 -> 120 bytes
 tests/data/acpi/q35/DSDT.ivrs  | Bin 0 -> 8306 bytes
 tests/data/acpi/q35/DSDT.xapic | Bin 0 -> 35652 bytes
 tests/data/acpi/q35/FACP.xapic | Bin 0 -> 244 bytes
 tests/data/acpi/q35/IVRS.ivrs  | Bin 0 -> 104 bytes
 tests/data/acpi/q35/SRAT.xapic | Bin 0 -> 5080 bytes
 tests/qtest/acpi-utils.c       |  14 +++++++
 tests/qtest/arm-cpu-features.c |  29 +++----------
 tests/qtest/bios-tables-test.c |  72 +++++++++++++++++++++++++--------
 tests/qtest/libqtest.c         |  27 +++++++++++++
 tests/qtest/migration-test.c   |  15 ++-----
 14 files changed, 119 insertions(+), 52 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.xapic
 create mode 100644 tests/data/acpi/q35/DMAR.dmar
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs
 create mode 100644 tests/data/acpi/q35/DSDT.xapic
 create mode 100644 tests/data/acpi/q35/FACP.xapic
 create mode 100644 tests/data/acpi/q35/IVRS.ivrs
 create mode 100644 tests/data/acpi/q35/SRAT.xapic

-- 
2.27.0


