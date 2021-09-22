Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D67414B5A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:06:10 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2sz-000285-I8
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT2qY-0001KL-Tc
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT2qW-0006Sq-Ge
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632319414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IhYglY8c4M73JVYB+jFQ5WOZi0E9PDFDq6AyrIHPTsg=;
 b=AosIpxsMDp48sQjgswlkCiMyI0AIPFaRa0DNa08qd1ln4aDe0rVaRr2kTBrS3tkXGcH8Q6
 Y5P7VYmUKzWEIBoN2vkxcm347VhAaxmaZGBDN1wpX8E64aHAAkrKVFxRpeQYB2P3+UmJSV
 iWELvuQQJaud6XRX+G6DJZ8mV72hhy0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-uT4gbkt7N8mTcNAyLVu2qQ-1; Wed, 22 Sep 2021 10:03:31 -0400
X-MC-Unique: uT4gbkt7N8mTcNAyLVu2qQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 e7-20020a50d4c7000000b003d871ecccd8so3155129edj.18
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhYglY8c4M73JVYB+jFQ5WOZi0E9PDFDq6AyrIHPTsg=;
 b=de2qZrotM5bmSJWAXJ9booRWq/sofuuNaRNV3WL7KdXCXjAmwbr9I2dJ009RS5ZRWc
 Ntvml2/RsYnOSK+JpLQj2Qk++87K8GgdAnPtrTTGQJrbEo6SlHRh+NOx9I5wPkv7AsIK
 fCWbB3uXmN6L7A2lYxaj0BGCCy+yX+8nzwXtl16rKTfLaNRt9cF4WShEnmg/pK2f8qQ1
 TkMS6n94PkT3QcfLOc1HKbT/oK99drjFtqZlorIsZsmg+Ra4Ecd+vvctksp6BVWW7apI
 BU1JiImzwiCoaOJaayYA4xdyCgsoz3yevVPodw8bxS5Vf/Ljd0/lw6OmxWBQcfK9UV1h
 lCRA==
X-Gm-Message-State: AOAM532Zcxe1Q1d6alg8xfNQ2kkaGzDVZL6fgzMIZkHeTbE6OWh2CLvM
 zRePdIdy9S1tq+I4XRMwiePQysFpXBR3B4yB1o5yaZ/V5tJ/FF+HGGkdiSiQrdcidLlMfhCeFeP
 5uYp8yUjpMXblAbvvOKqNRCaiffDHf2cfMcQ45+yO9Sb172Hp3NbthPA9Vz0AkdMuL6E=
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr42433021edt.237.1632319410057; 
 Wed, 22 Sep 2021 07:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGEPd3a2/vZl2B8mYtmVWaw1z9P1zoFzaTQAHOHaNNnSIRtPvM+w97wEApTOrzxr+BoxgLVA==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr42432995edt.237.1632319409781; 
 Wed, 22 Sep 2021 07:03:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bw12sm1071477ejb.9.2021.09.22.07.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:03:29 -0700 (PDT)
Date: Wed, 22 Sep 2021 16:03:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/35] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210922160328.194af27f@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue,  7 Sep 2021 10:47:39 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

Michael,

there are some fixups accumulated (mostly doc/comment related or
dropping some not related code movements),
I can respin series quickly with them incorporated or do fixups on top.
Which one would you prefer?

> v3:
>   1. s/acpi_init_table()|acpi_table_composed()/acpi_table_begin()|acpi_table_end()/
>   2. arm:madt fix incorrect length
>   3. various comment improvments
>   4. rewrite IORT conversion patch due to heavy conflicts with bypass iommu code
>     merged recently
>   5 pick up Eric's Reviewed-By where there wasn't significant change (1)
> 
> v2:
>   - drop test related patches, they will be sent as a separate series
>   - fix bios_loader pointer initialization ordering when using TPM1.2
>   - extend commit message of [1/35] and add extra comment about
>     table length patching 
> 
> Highlights:
>   * drop pointer arithmetic in ACPI tables code
>   * use endian agnostic API
>   * simplifies review of tables. /in most cases just line by line comparision with spec/
> 
> Series replaces build_header() with acpi_table_begin()/acpi_table_end()
> API that hides pointer/offset arithmetic from user, to prevent
> errors caused by it [1].
> While doing above, it was necessary to split table header from
> packed structure that was describing the table, which is
> counter-productive since it still leaves packed structure drawbacks.
> So that sort of forced me to rewrite tables that were composed with
> help of packed structures to preferred build_append_int_noprefix() API.
> In cases where refactoring to build_append_int_noprefix() was small,
> it was squashed with acpi_table_begin()/acpi_table_end() patch.
> Conversion reduced code size quite a bit despite me adding doc comments
> for every table row.
> 
> 1) commits
>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> 
> Link to repo with this series and tests to validate it:
>    https://gitlab.com/imammedo/qemu/-/commits/acpi_build_header_refactoring_v3
> 
> Previous v2 revision can be found at:
>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html
> 
> 
> CC: mst@redhat.com
> 
> Igor Mammedov (35):
>   acpi: add helper routines to initialize ACPI tables
>   acpi: build_rsdt: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_xsdt: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_slit: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_tpm2: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: acpi_build_hest: use acpi_table_begin()/acpi_table_end() instead
>     of build_header()
>   acpi: build_mcfg: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_hmat: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: nvdimm_build_nfit: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: nvdimm_build_ssdt: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: vmgenid_build_acpi: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: x86: build_dsdt: use acpi_table_begin()/acpi_table_end() instead
>     of build_header()
>   acpi: build_hpet: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_tpm_tcpa: use acpi_table_begin()/acpi_table_end() instead
>     of build_header()
>   acpi: arm/x86: build_srat: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: use build_append_int_noprefix() API to compose SRAT table
>   acpi: build_dmar_q35: use acpi_table_begin()/acpi_table_end() instead
>     of build_header()
>   acpi: build_waet: use acpi_table_begin()/acpi_table_end() instead of
>     build_header()
>   acpi: build_amd_iommu: use acpi_table_begin()/acpi_table_end() instead
>     of build_header()
>   acpi: madt: arm/x86: use acpi_table_begin()/acpi_table_end() instead
>     of build_header()
>   acpi: x86: remove dead code
>   acpi: x86: set enabled when composing _MAT entries
>   acpi: x86: madt: use build_append_int_noprefix() API to compose MADT
>     table
>   acpi: arm/virt: madt: use build_append_int_noprefix() API to compose
>     MADT table
>   acpi: build_dsdt_microvm: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: arm: virt: build_dsdt: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: arm: virt: build_iort: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: arm/virt: convert build_iort() to endian agnostic
>     build_append_FOO() API
>   acpi: arm/virt: build_spcr: fix invalid cast
>   acpi: arm/virt: build_spcr: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end()
>     instead of build_header()
>   acpi: build_facs: use build_append_int_noprefix() API to compose table
>   acpi: remove no longer used build_header()
>   acpi: AcpiGenericAddress no longer used to map/access fields of MMIO,
>     drop packed attribute
> 
>  include/hw/acpi/acpi-defs.h          | 528 +-----------------------
>  include/hw/acpi/acpi_dev_interface.h |   3 +-
>  include/hw/acpi/aml-build.h          |  38 +-
>  include/hw/i386/pc.h                 |   6 +-
>  hw/acpi/acpi-x86-stub.c              |   3 +-
>  hw/acpi/aml-build.c                  | 197 +++++----
>  hw/acpi/cpu.c                        |  17 +-
>  hw/acpi/ghes.c                       |  10 +-
>  hw/acpi/hmat.c                       |  14 +-
>  hw/acpi/nvdimm.c                     |  64 ++-
>  hw/acpi/pci.c                        |  18 +-
>  hw/acpi/vmgenid.c                    |  16 +-
>  hw/arm/virt-acpi-build.c             | 577 +++++++++++++++------------
>  hw/i386/acpi-build.c                 | 304 +++++++-------
>  hw/i386/acpi-common.c                | 158 ++++----
>  hw/i386/acpi-microvm.c               |  13 +-
>  16 files changed, 798 insertions(+), 1168 deletions(-)
> 


