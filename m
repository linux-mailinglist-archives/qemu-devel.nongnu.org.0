Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C31402B0B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:49:58 +0200 (CEST)
Received: from localhost ([::1]:49762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcQ9-00085l-6B
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOh-0005b2-FY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOe-00082M-TI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rhSFsRJXnRf5nOa1ATO5iggp2tAujgE4cTF/XL+lIxE=;
 b=PgIBW9DjJN8rlTYayx+TGDIYs5VLlEWZImjIgg8aerZrKaZwaESjHBWwv5ztKtYsXprfv6
 UKkzmmx3qK/kffEheKJeOlwlSgd5sv2qusVIRSft+aDRhjBXuCxBRXm+wtq8Nh/M8NYwRB
 uVDWP34AS2asjHCmPNldImc4fb+W9hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-2Fq2G304Oimd276tYElshg-1; Tue, 07 Sep 2021 10:48:20 -0400
X-MC-Unique: 2Fq2G304Oimd276tYElshg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E22A51940933
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 14:48:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73D125D9DE;
 Tue,  7 Sep 2021 14:48:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/35] acpi: refactor error prone build_header() and packed
 structures usage in ACPI tables
Date: Tue,  7 Sep 2021 10:47:39 -0400
Message-Id: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

v3:
  1. s/acpi_init_table()|acpi_table_composed()/acpi_table_begin()|acpi_table_end()/
  2. arm:madt fix incorrect length
  3. various comment improvments
  4. rewrite IORT conversion patch due to heavy conflicts with bypass iommu code
    merged recently
  5 pick up Eric's Reviewed-By where there wasn't significant change (1)

v2:
  - drop test related patches, they will be sent as a separate series
  - fix bios_loader pointer initialization ordering when using TPM1.2
  - extend commit message of [1/35] and add extra comment about
    table length patching 

Highlights:
  * drop pointer arithmetic in ACPI tables code
  * use endian agnostic API
  * simplifies review of tables. /in most cases just line by line comparision with spec/

Series replaces build_header() with acpi_table_begin()/acpi_table_end()
API that hides pointer/offset arithmetic from user, to prevent
errors caused by it [1].
While doing above, it was necessary to split table header from
packed structure that was describing the table, which is
counter-productive since it still leaves packed structure drawbacks.
So that sort of forced me to rewrite tables that were composed with
help of packed structures to preferred build_append_int_noprefix() API.
In cases where refactoring to build_append_int_noprefix() was small,
it was squashed with acpi_table_begin()/acpi_table_end() patch.
Conversion reduced code size quite a bit despite me adding doc comments
for every table row.

1) commits
   bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
   4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address

Link to repo with this series and tests to validate it:
   https://gitlab.com/imammedo/qemu/-/commits/acpi_build_header_refactoring_v3

Previous v2 revision can be found at:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html


CC: mst@redhat.com

Igor Mammedov (35):
  acpi: add helper routines to initialize ACPI tables
  acpi: build_rsdt: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_xsdt: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_slit: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_tpm2: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: acpi_build_hest: use acpi_table_begin()/acpi_table_end() instead
    of build_header()
  acpi: build_mcfg: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_hmat: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: nvdimm_build_nfit: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: nvdimm_build_ssdt: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: vmgenid_build_acpi: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: x86: build_dsdt: use acpi_table_begin()/acpi_table_end() instead
    of build_header()
  acpi: build_hpet: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_tpm_tcpa: use acpi_table_begin()/acpi_table_end() instead
    of build_header()
  acpi: arm/x86: build_srat: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: use build_append_int_noprefix() API to compose SRAT table
  acpi: build_dmar_q35: use acpi_table_begin()/acpi_table_end() instead
    of build_header()
  acpi: build_waet: use acpi_table_begin()/acpi_table_end() instead of
    build_header()
  acpi: build_amd_iommu: use acpi_table_begin()/acpi_table_end() instead
    of build_header()
  acpi: madt: arm/x86: use acpi_table_begin()/acpi_table_end() instead
    of build_header()
  acpi: x86: remove dead code
  acpi: x86: set enabled when composing _MAT entries
  acpi: x86: madt: use build_append_int_noprefix() API to compose MADT
    table
  acpi: arm/virt: madt: use build_append_int_noprefix() API to compose
    MADT table
  acpi: build_dsdt_microvm: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: arm: virt: build_dsdt: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: arm: virt: build_iort: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: arm/virt: convert build_iort() to endian agnostic
    build_append_FOO() API
  acpi: arm/virt: build_spcr: fix invalid cast
  acpi: arm/virt: build_spcr: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end()
    instead of build_header()
  acpi: build_facs: use build_append_int_noprefix() API to compose table
  acpi: remove no longer used build_header()
  acpi: AcpiGenericAddress no longer used to map/access fields of MMIO,
    drop packed attribute

 include/hw/acpi/acpi-defs.h          | 528 +-----------------------
 include/hw/acpi/acpi_dev_interface.h |   3 +-
 include/hw/acpi/aml-build.h          |  38 +-
 include/hw/i386/pc.h                 |   6 +-
 hw/acpi/acpi-x86-stub.c              |   3 +-
 hw/acpi/aml-build.c                  | 197 +++++----
 hw/acpi/cpu.c                        |  17 +-
 hw/acpi/ghes.c                       |  10 +-
 hw/acpi/hmat.c                       |  14 +-
 hw/acpi/nvdimm.c                     |  64 ++-
 hw/acpi/pci.c                        |  18 +-
 hw/acpi/vmgenid.c                    |  16 +-
 hw/arm/virt-acpi-build.c             | 577 +++++++++++++++------------
 hw/i386/acpi-build.c                 | 304 +++++++-------
 hw/i386/acpi-common.c                | 158 ++++----
 hw/i386/acpi-microvm.c               |  13 +-
 16 files changed, 798 insertions(+), 1168 deletions(-)

-- 
2.27.0


