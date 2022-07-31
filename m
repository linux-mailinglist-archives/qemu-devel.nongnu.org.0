Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE18585FCF
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 18:24:53 +0200 (CEST)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIBkK-0005SR-ED
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oIBid-0002Oe-0S
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 12:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oIBiZ-0007T5-MZ
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 12:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659284580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d82wi4XTmN84SZEhizJIYdG2JWQIE63kEOZqqj1sOuw=;
 b=Nb/g6SeZDVOnTHZuV29pzV6h8YBMn1QuVZgwoCUv4gkeiuu6EGQfLnEzVMWkFnPtCjDFnQ
 dQiwF6yXZLJAhSQXp0bGgoY6V9McyBWwOXnWhCBIyMLTc3D27WAEMszQWeuHqr56j7atAM
 eLtHd6cajO9BwcCw9UPeaxTr3yRiuS0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-Pu8kU-PYNuG4IQCCToMLTA-1; Sun, 31 Jul 2022 12:21:49 -0400
X-MC-Unique: Pu8kU-PYNuG4IQCCToMLTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4484101A54E;
 Sun, 31 Jul 2022 16:21:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DAF52026D64;
 Sun, 31 Jul 2022 16:21:47 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v2 0/5] hw/smbios: add core_count2 to smbios table type 4
Date: Sun, 31 Jul 2022 18:21:36 +0200
Message-Id: <20220731162141.178443-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

 hw/smbios/smbios_build.h             |   9 +-
 include/hw/firmware/smbios.h         |  11 ++
 hw/smbios/smbios.c                   |  18 +++-
 tests/qtest/bios-tables-test.c       | 148 ++++++++++++++++++++-------
 tests/data/acpi/q35/APIC.core-count2 | Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT.core-count2 | Bin 0 -> 32414 bytes
 tests/data/acpi/q35/FACP.core-count2 | Bin 0 -> 244 bytes
 7 files changed, 144 insertions(+), 42 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2

-- 
2.35.3


