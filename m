Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C13BA25B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:48:46 +0200 (CEST)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKTF-0005xv-MX
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKS4-0004ei-4U
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKS1-0003z6-3F
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625237248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pX9nDspZfpsLNcKVW/ABMDE6g3Ep0AtMtQeJqigJ6h8=;
 b=Z8QlJ+sjfb5RRKms5eMdLdcb1+sPhWY1U+qKCZmItR1LIannQQojrXvV+Q78r0e3zD2sWl
 V5S3F1PRslMYRJfBLF1aMkBzyjlvIqG9xOPOK2ZR8zYxG1MUk+CJUwU2PymMFo8rLLmYsA
 tMtlJzotsHXg6VeoMJK/tsxQT+lbpl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-H3XckFB2Mq2tjkJvgmnhJg-1; Fri, 02 Jul 2021 10:47:25 -0400
X-MC-Unique: H3XckFB2Mq2tjkJvgmnhJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c12b02901dce930b374so3594808wms.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pX9nDspZfpsLNcKVW/ABMDE6g3Ep0AtMtQeJqigJ6h8=;
 b=m1AGOzSC5ngVZav9f1fOiWtCBQwWrxkqiLrbE/BTvNS3RJYQnRCPbpKRKBh1z01LEZ
 bzfhQZ1ksVjPxKiqr4cG6dAvGAe2un6/INzGHeUyFfMV9iQb4gqxBaW1qJZyw4qMmjMY
 rJ8M9O2P3ruyI6djzKzsrPSIwh11BuJpg5wxUAJg/DYKrKhMzelggIDUBwR339AS8/Ix
 kp0R0/Dxx746EUP2vP6W5++zDPdMhHddqXk+dr2nFoUunvV4GUza1CUZ/FT1XTiA4O4R
 UIyTZxb3FFSm8Cmja05hRuAWzkkMUV7hP5/EQgl3BnGwyHGiKMO56ri5utqfkrQo1bS4
 ZuUg==
X-Gm-Message-State: AOAM533F6/FYHdwHn8xN0L08NojkWjX9aiIx2cqy16Y4BdH2d+bZqfU/
 LcjJ739lx6lLhyv8r2rnbPzTbZn4EBXyOuZhdMv9S56LYrz0e+x3bUTTlX9Eb+zHZd3xntvZk4Z
 u4Ss6/dqNZGwXbsg=
X-Received: by 2002:adf:edc4:: with SMTP id v4mr23410wro.54.1625237244548;
 Fri, 02 Jul 2021 07:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAq2xEdb2kSmuLKf6+yI05V1NWC5KTOIKEazo/qw3JbtdwJ2Hv3xSM3EEmpR0eIhZ1vL+s0w==
X-Received: by 2002:adf:edc4:: with SMTP id v4mr23393wro.54.1625237244265;
 Fri, 02 Jul 2021 07:47:24 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id p187sm3442881wmp.28.2021.07.02.07.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 07:47:23 -0700 (PDT)
Date: Fri, 2 Jul 2021 10:47:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 00/53] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210702104548-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 05:17:24AM -0400, Igor Mammedov wrote:
> Highlights:
>   * drop pointer arithmetic in ACPI tables code
>   * use endian agnostic API
>   * simplifies review of tables. /in most cases just line by line comparision with spec/


A hue amount of work, thank you!
To make it easier to merge, how about splitting it up a bit?
E.g. I think first 10-11 patches make sense on their own, right?

> Series replaces build_header() with acpi_init_table()/acpi_table_composed()
> API that hides pointer/offset arithmetic from user, to prevent
> errors caused by it [1].
> While doing above, it was necessary to split table header from
> packed structure that was describing the table, which is
> counter-productive since it still leaves packed structure drawbacks.
> So that sort of forced me to rewrite tables that were composed with
> help of packed structures to preferred build_append_int_noprefix() API.
> In cases where switch to build_append_int_noprefix() was small, it was
> combined with acpi_init_table()/acpi_table_composed() patch.
> Conversion reduced code size quite a bit despite me adding doc comments
> for every table row.
> 
> Series also includes optional qtest patches that add missing acpi
> tests for tables that I'm touching to verify conversion changes.
> That includes an alternative build time based impl. of
> qtest_has_accel() API. So if we start bike-shedding this qtest_has_accel()
> we can safely drop all tests included, till the time discussion settles
> and some form of a qtest_has_accel() is merged, at which point I'd respin
> depended tests.
> 
> 1) commits
>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> 
> Link to repo:
>    https://gitlab.com/imammedo/qemu/-/commits/acpi_build_header_refactoring
> 
> CC: mst@redhat.com
> 
> Igor Mammedov (53):
>   tests: acpi: dump table with failed checksum
>   tests: qtest: add qtest_has_accel() to check if tested binary supports
>     accelerator
>   tests: acpi: whitelist expected tables for acpi/q35/numamem testcase
>   tests: acpi: q35: test for x2APIC entries in SRAT
>   tests: acpi: update expected tables blobs
>   tests: acpi: whitelist new expected table
>     tests/data/acpi/q35/DMAR.dmar
>   tests: acpi: add testcase for intel_iommu (DMAR table)
>   tests: acpi: add expected blob for DMAR table
>   tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
>   tests: acpi: add testcase for amd-iommu (IVRS table)
>   tests: acpi: update expected blobs
>   tests: acpi: arm/virt: drop redundant test_acpi_one() in
>     test_acpi_virt_tcg()
>   tests: acpi: whitelist expected tables for acpi/virt/iort testcase
>   tests: acpi: arm/virt: use kvm to test IORT table
>   tests: acpi: add expected IORT table blob
>   tests: arm-cpu-features: use qtest_has_kvm() API
>   tests: migration-test: use qtest_has_accel() API
>   tests: bios-tables-test: use qtest_has_accel() API to register TCG
>     only tests
>   acpi: add helper routines to initialize ACPI tables
>   acpi: build_rsdt: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_xsdt: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_slit: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_fadt: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_tpm2: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: acpi_build_hest: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: build_mcfg: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_hmat: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: nvdimm_build_nfit: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: nvdimm_build_ssdt: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: vmgenid_build_acpi: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: x86: build_dsdt: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: build_hpet: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_tpm_tcpa: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: arm/x86: build_srat: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: use build_append_int_noprefix() API to compose SRAT table
>   acpi: build_dmar_q35: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: build_waet: use acpi_init_table()/acpi_table_composed() instead
>     of build_header()
>   acpi: build_amd_iommu: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: madt: arm/x86: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: x86: remove dead code
>   acpi: x86: set enabled when composing _MAT entries
>   acpi: x86: madt: use build_append_int_noprefix() API to compose MADT
>     table
>   acpi: arm/virt: madt: use build_append_int_noprefix() API to compose
>     MADT table
>   acpi: build_dsdt_microvm: use acpi_init_table()/acpi_table_composed()
>     instead of build_header()
>   acpi: arm: virt: build_dsdt: use
>     acpi_init_table()/acpi_table_composed() instead of build_header()
>   acpi: arm: virt: build_iort: use
>     acpi_init_table()/acpi_table_composed() instead of build_header()
>   acpi: arm/virt: convert build_iort() to endian agnostic
>     build_append_FOO() API
>   acpi: arm/virt: build_spcr: fix invalid cast
>   acpi: arm/virt: build_spcr: use
>     acpi_init_table()/acpi_table_composed() instead of build_header()
>   acpi: arm/virt: build_gtdt: use
>     acpi_init_table()/acpi_table_composed() instead of build_header()
>   acpi: build_facs: use build_append_int_noprefix() API to compose table
>   acpi: remove no longer used build_header()
>   acpi: AcpiGenericAddress no longer used to map/access fields of MMIO,
>     drop packed attribute
> 
>  include/hw/acpi/acpi-defs.h          | 528 +------------------------
>  include/hw/acpi/acpi_dev_interface.h |   3 +-
>  include/hw/acpi/aml-build.h          |  21 +-
>  include/hw/i386/pc.h                 |   7 +-
>  tests/qtest/libqos/libqtest.h        |   8 +
>  hw/acpi/acpi-x86-stub.c              |   3 +-
>  hw/acpi/aml-build.c                  | 188 +++++----
>  hw/acpi/cpu.c                        |  17 +-
>  hw/acpi/ghes.c                       |  10 +-
>  hw/acpi/hmat.c                       |  14 +-
>  hw/acpi/nvdimm.c                     |  64 ++--
>  hw/acpi/pci.c                        |  18 +-
>  hw/acpi/vmgenid.c                    |  16 +-
>  hw/arm/virt-acpi-build.c             | 550 +++++++++++++++------------
>  hw/i386/acpi-build.c                 | 285 +++++++-------
>  hw/i386/acpi-common.c                | 158 ++++----
>  hw/i386/acpi-microvm.c               |  13 +-
>  meson.build                          |   6 +
>  tests/data/acpi/q35/APIC.numamem     | Bin 0 -> 2686 bytes
>  tests/data/acpi/q35/DMAR.dmar        | Bin 0 -> 80 bytes
>  tests/data/acpi/q35/DSDT.ivrs        | Bin 0 -> 7877 bytes
>  tests/data/acpi/q35/DSDT.numamem     | Bin 7865 -> 35222 bytes
>  tests/data/acpi/q35/FACP.numamem     | Bin 0 -> 244 bytes
>  tests/data/acpi/q35/IVRS.ivrs        | Bin 0 -> 104 bytes
>  tests/data/acpi/q35/SRAT.numamem     | Bin 224 -> 5080 bytes
>  tests/data/acpi/virt/IORT.iort       | Bin 0 -> 124 bytes
>  tests/qtest/acpi-utils.c             |  14 +
>  tests/qtest/arm-cpu-features.c       |  29 +-
>  tests/qtest/bios-tables-test.c       |  85 ++++-
>  tests/qtest/libqtest.c               |  27 ++
>  tests/qtest/migration-test.c         |  15 +-
>  31 files changed, 873 insertions(+), 1206 deletions(-)
>  create mode 100644 tests/data/acpi/q35/APIC.numamem
>  create mode 100644 tests/data/acpi/q35/DMAR.dmar
>  create mode 100644 tests/data/acpi/q35/DSDT.ivrs
>  create mode 100644 tests/data/acpi/q35/FACP.numamem
>  create mode 100644 tests/data/acpi/q35/IVRS.ivrs
>  create mode 100644 tests/data/acpi/virt/IORT.iort
> 
> --
> 2.27.0


