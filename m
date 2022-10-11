Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6167C5FB2E2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:09:14 +0200 (CEST)
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF0T-0004MI-Ey
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIB-0002To-6u
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDI8-0008BU-Eq
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kwbNnedToAYxTRP1wzSbc0OvOdLU40TC0/JSC1Cy9l8=;
 b=gDaycHYzWzr/QXt45cyQusHmrDKx/XdEma/CN7ycLzJL7lcF3p4O4bJdxxVrpWofP6tFAl
 VuUWYbRvIh0uh/11zK198S1uNHt1YJQlR53iweyNsOEQGGxLe03ZareDZ8K+yQs28Yvr4a
 r7rKFaGspI5t7Io+qrT7h3YPwC06dvM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-MD7gHPBoPiSKefL0MTDqjQ-1; Tue, 11 Oct 2022 07:18:14 -0400
X-MC-Unique: MD7gHPBoPiSKefL0MTDqjQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 393BC38041CE;
 Tue, 11 Oct 2022 11:18:14 +0000 (UTC)
Received: from ovpn-194-244.brq.redhat.com (ovpn-194-244.brq.redhat.com
 [10.40.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F24424B400F;
 Tue, 11 Oct 2022 11:18:12 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v3 0/5] hw/smbios: add core_count2 to smbios table type 4
Date: Tue, 11 Oct 2022 13:17:26 +0200
Message-Id: <20221011111731.101412-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SMBIOS 3.0 specification provides the ability to reflect over
255 cores. The 64-bit entry point has been used for a while, but
structure type 4 has not been updated before, so the dmidecode output
looked like this (-smp 280):

    Handle 0x0400, DMI type 4, 42 bytes
    Processor Information
    ...
        Core Count: 24
        Core Enabled: 24
        Thread Count: 1
    ...

Big update in the bios-tables-test as it couldn't work with SMBIOS 3.0.

v3:
    * rebase on fresh master
    * crop lines to 80 characters [Igor]
    * add conditions for cc2 field check in the test [Igor]

v2:
    * generate tables type 4 of different sizes based on the
      selected smbios version
    * use SmbiosEntryPoint* types instead of creating new constants
    * refactor smbios_cpu_test [Igor, Ani]
    * clarify signature check [Igor]
    * add comments with specifications and clarification of the structure loop [Ani]


Julia Suvorova (5):
  hw/smbios: add core_count2 to smbios table type 4
  bios-tables-test: teach test to use smbios 3.0 tables
  tests/acpi: allow changes for core_count2 test
  bios-tables-test: add test for number of cores > 255
  tests/acpi: update tables for new core count test

 hw/smbios/smbios.c                   |  19 +++-
 hw/smbios/smbios_build.h             |   9 +-
 include/hw/firmware/smbios.h         |  12 ++
 tests/data/acpi/q35/APIC.core-count2 | Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT.core-count2 | Bin 0 -> 32414 bytes
 tests/data/acpi/q35/FACP.core-count2 | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test.c       | 158 ++++++++++++++++++++-------
 7 files changed, 156 insertions(+), 42 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2

-- 
2.37.3


