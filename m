Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C318C3C7384
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:48:22 +0200 (CEST)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Kdx-0006El-Rg
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Kbd-0004NT-TI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Kba-0000db-Ao
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626191152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BzBMOHYkm73QcgYRBrUbDxPAZ5V4YMTZWsOanFNkh8I=;
 b=CGSh9htEam8Ntpxjo7dQEVdI3/v2kokzfpquDLx+Kwzmmi5xk3dWlWGtIZCEOb0gdfO8vX
 yGI2N2opcA37KlyBcUsrlGJCt299DhH48RXEGziNvwQqQqf3rvafHvzhW9RxynrA0YI4kM
 wjyf/43Fwqw8k4q5sY63nsB5x3hlxR8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-meRwk2k5NkazWU5WSxNZWQ-1; Tue, 13 Jul 2021 11:45:51 -0400
X-MC-Unique: meRwk2k5NkazWU5WSxNZWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso1649498wmj.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BzBMOHYkm73QcgYRBrUbDxPAZ5V4YMTZWsOanFNkh8I=;
 b=Exz36ZHEFK6Djc5lJ9gEVjDf4htmLoYujIW3k6aKvxWx2+lASSYI7ma13z5cRxhyIM
 jgZspB2hPFVjFWhu6ufMQkS7Y2FP5bYL3F2kfgK5vRy8zCeYJo4aZKoyW8vBK11ndKXa
 sqbu9rRG+ihpcXl6vSgSrq+DYT+3XXNSkRHAUUIBvl6eWfg1bWRuPUZyCj7ZCGtiOved
 trKB+5lS4wHJ6iDxqW3QZAmbG0oRdJRcgKwYTuTWktWC3kr5OGFoOPqBxk2fj9FA0zcB
 vGYAIn/aZJCeYFNHmh4q+dxn2o/XLTwysn0ktlAGrziDlYsVrUeJl/5MobeCT5pE2MQH
 aX2w==
X-Gm-Message-State: AOAM533xGISy7REbFFDc/CwxeC+vzV9xuEzcDpyWbYNbLB+YX1/IyMOg
 mHD1SEDZXkSv6Ws96Xd5X93jELBojSt/dTWwE4WXf3kGU+MKw0MryaQ2V3qsLyd3tho7YYpQTo0
 vuWLQEuUqyCLJMI0=
X-Received: by 2002:a5d:457b:: with SMTP id a27mr6463453wrc.280.1626191150476; 
 Tue, 13 Jul 2021 08:45:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAltvON959dQNLJFs3qbW6TC75bLd2DsDo85JF2Uww6LOtMRA7pw57BTgC/nsgLCfePGe3ow==
X-Received: by 2002:a5d:457b:: with SMTP id a27mr6463422wrc.280.1626191150245; 
 Tue, 13 Jul 2021 08:45:50 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id c15sm2049718wmr.28.2021.07.13.08.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:45:49 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:45:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 00/35] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210713114350-mutt-send-email-mst@kernel.org>
References: <20210708154617.1538485-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Thu, Jul 08, 2021 at 11:45:42AM -0400, Igor Mammedov wrote:
> v2:
>   - drop test related patches, they will be sent as a separate series
>   - fix bios_loader pointer initialization ordering when using TPM1.2
>   - extend commit message of [1/35] and add extra comment about
>     table length patching 


So I think this is in good shape, and I really like the code size
reduction. Given a rush to push things before the freeze, I'm inclined
to just defer API rework to the next release. This kind of thing is
better at the beginning of the cycle so we can iron out API kinks if any
surface.

> Highlights:
>   * drop pointer arithmetic in ACPI tables code
>   * use endian agnostic API
>   * simplifies review of tables. /in most cases just line by line comparision with spec/
> 
> Series replaces build_header() with acpi_init_table()/acpi_table_composed()
> API that hides pointer/offset arithmetic from user, to prevent
> errors caused by it [1].
> While doing above, it was necessary to split table header from
> packed structure that was describing the table, which is
> counter-productive since it still leaves packed structure drawbacks.
> So that sort of forced me to rewrite tables that were composed with
> help of packed structures to preferred build_append_int_noprefix() API.
> In cases where refactoring to build_append_int_noprefix() was small,
> it was squashed with acpi_init_table()/acpi_table_composed() patch.
> Conversion reduced code size quite a bit despite me adding doc comments
> for every table row.
> 
> 1) commits
>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> 
> Link to repo:
>    https://gitlab.com/imammedo/qemu/-/commits/acpi_build_header_refactoring_v2
> 
> CC: mst@redhat.com
> 
> 
> 
> Igor Mammedov (35):
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
>  hw/acpi/acpi-x86-stub.c              |   3 +-
>  hw/acpi/aml-build.c                  | 193 ++++++----
>  hw/acpi/cpu.c                        |  17 +-
>  hw/acpi/ghes.c                       |  10 +-
>  hw/acpi/hmat.c                       |  14 +-
>  hw/acpi/nvdimm.c                     |  64 ++--
>  hw/acpi/pci.c                        |  18 +-
>  hw/acpi/vmgenid.c                    |  16 +-
>  hw/arm/virt-acpi-build.c             | 550 +++++++++++++++------------
>  hw/i386/acpi-build.c                 | 284 ++++++++------
>  hw/i386/acpi-common.c                | 158 ++++----
>  hw/i386/acpi-microvm.c               |  13 +-
>  16 files changed, 750 insertions(+), 1149 deletions(-)
> 
> -- 
> 2.27.0


