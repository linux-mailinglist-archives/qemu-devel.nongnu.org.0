Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37D3C82FC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:34:07 +0200 (CEST)
Received: from localhost ([::1]:40848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cDO-0001cx-DY
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3cBH-0000sq-1f
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3cBF-0000Ix-20
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626258712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+tvXepsUezOXna13UznVAhXOTIqsAlOZ69CLAGo3RuM=;
 b=g4ODiFtvCNL/3DP4OQlsF6Uwv2AqRe2uw5bXp4VCin0VQJlyu5iUZR/Puen4DXhn80gub0
 V5vslnFaPbDvE6ZnZn1NP3Cltqa4frFZL/zohUOX9jRVUAFfTDdl0DRFre1ei81km9H48r
 O7xBw9CLud6Xt9YL9KmdJ7PF21eCpFE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-Tok1ncJyMoqWjL_Rk3qQvQ-1; Wed, 14 Jul 2021 06:31:51 -0400
X-MC-Unique: Tok1ncJyMoqWjL_Rk3qQvQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so1296934wru.6
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+tvXepsUezOXna13UznVAhXOTIqsAlOZ69CLAGo3RuM=;
 b=QyUeFJu3dcDcRkUbxEZ7MGDTw4A57iSTm+Y/8DKtlerLaXwiSwUdQKFb8wufkPKNV3
 g8dO3+aVI+Eo7viv6EYDER3H6JmBSJUr6zG1H5zlrPiimt1sH+qZ1PPOuh25Xh66q/Kf
 7GL80RZhu97ScFfsMwGJLvQl6jH1ekRfYdVQsHriHR/+JnzVknR8H1d11fdDV/Tjl6X8
 acix4Jzx0iB5DRIZbaHrotqGi2XD044O6AcbgCNoNSd/kUDiDkYtqLwWHIQnYlfuND2D
 zU9ItthhxrMf2D6EPOV6POR1qRh298BFsE2iTpo1EJXP7B7bpSVSR+mB5nkWrsCS97m/
 Ayow==
X-Gm-Message-State: AOAM530Dr88F2/NE3yIOJQv2H18edGMlZcg7o7mECsMzWdZNUjSxKCEa
 MSUuNwN/PIIZkVUUElNOYu4hjTgQQXPWtgjcrPJs7gN94qXLoV5596MeMmwnn1NQ4fG6YUulTGm
 m5bo5i1mm0mXYTZQ=
X-Received: by 2002:a5d:4048:: with SMTP id w8mr12105145wrp.82.1626258710227; 
 Wed, 14 Jul 2021 03:31:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOwrY7SZb42ojDSCKX1JFg3pyEieZXqE0i7L5xPvfZkw7tt1U9m4yQOL9k9EAjcdE77ICaxg==
X-Received: by 2002:a5d:4048:: with SMTP id w8mr12105130wrp.82.1626258710115; 
 Wed, 14 Jul 2021 03:31:50 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id y3sm2136690wrh.16.2021.07.14.03.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:31:49 -0700 (PDT)
Date: Wed, 14 Jul 2021 06:31:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 00/35] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210714063010-mutt-send-email-mst@kernel.org>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210713114350-mutt-send-email-mst@kernel.org>
 <20210714105359.0c6b0382@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714105359.0c6b0382@redhat.com>
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

On Wed, Jul 14, 2021 at 10:53:59AM +0200, Igor Mammedov wrote:
> On Tue, 13 Jul 2021 11:45:46 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Jul 08, 2021 at 11:45:42AM -0400, Igor Mammedov wrote:
> > > v2:
> > >   - drop test related patches, they will be sent as a separate series
> > >   - fix bios_loader pointer initialization ordering when using TPM1.2
> > >   - extend commit message of [1/35] and add extra comment about
> > >     table length patching   
> > 
> > 
> > So I think this is in good shape, and I really like the code size
> > reduction. Given a rush to push things before the freeze, I'm inclined
> > to just defer API rework to the next release. This kind of thing is
> > better at the beginning of the cycle so we can iron out API kinks if any
> > surface.
> 
> ok, I'll respin once another merge window is open.
> 
> As for tests part, that I dropped, should I repost it
> for merging during soft-freeze or we postpone that as well?

I'm inclined to say it's best to defer that too.
The point of the freeze is so we can focus on fixing errors,
mostly regressions.


> > 
> > > Highlights:
> > >   * drop pointer arithmetic in ACPI tables code
> > >   * use endian agnostic API
> > >   * simplifies review of tables. /in most cases just line by line comparision with spec/
> > > 
> > > Series replaces build_header() with acpi_init_table()/acpi_table_composed()
> > > API that hides pointer/offset arithmetic from user, to prevent
> > > errors caused by it [1].
> > > While doing above, it was necessary to split table header from
> > > packed structure that was describing the table, which is
> > > counter-productive since it still leaves packed structure drawbacks.
> > > So that sort of forced me to rewrite tables that were composed with
> > > help of packed structures to preferred build_append_int_noprefix() API.
> > > In cases where refactoring to build_append_int_noprefix() was small,
> > > it was squashed with acpi_init_table()/acpi_table_composed() patch.
> > > Conversion reduced code size quite a bit despite me adding doc comments
> > > for every table row.
> > > 
> > > 1) commits
> > >    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
> > >    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> > > 
> > > Link to repo:
> > >    https://gitlab.com/imammedo/qemu/-/commits/acpi_build_header_refactoring_v2
> > > 
> > > CC: mst@redhat.com
> > > 
> > > 
> > > 
> > > Igor Mammedov (35):
> > >   acpi: add helper routines to initialize ACPI tables
> > >   acpi: build_rsdt: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_xsdt: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_slit: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_fadt: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_tpm2: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: acpi_build_hest: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: build_mcfg: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_hmat: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: nvdimm_build_nfit: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: nvdimm_build_ssdt: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: vmgenid_build_acpi: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: x86: build_dsdt: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: build_hpet: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_tpm_tcpa: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: arm/x86: build_srat: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: use build_append_int_noprefix() API to compose SRAT table
> > >   acpi: build_dmar_q35: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: build_waet: use acpi_init_table()/acpi_table_composed() instead
> > >     of build_header()
> > >   acpi: build_amd_iommu: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: madt: arm/x86: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: x86: remove dead code
> > >   acpi: x86: set enabled when composing _MAT entries
> > >   acpi: x86: madt: use build_append_int_noprefix() API to compose MADT
> > >     table
> > >   acpi: arm/virt: madt: use build_append_int_noprefix() API to compose
> > >     MADT table
> > >   acpi: build_dsdt_microvm: use acpi_init_table()/acpi_table_composed()
> > >     instead of build_header()
> > >   acpi: arm: virt: build_dsdt: use
> > >     acpi_init_table()/acpi_table_composed() instead of build_header()
> > >   acpi: arm: virt: build_iort: use
> > >     acpi_init_table()/acpi_table_composed() instead of build_header()
> > >   acpi: arm/virt: convert build_iort() to endian agnostic
> > >     build_append_FOO() API
> > >   acpi: arm/virt: build_spcr: fix invalid cast
> > >   acpi: arm/virt: build_spcr: use
> > >     acpi_init_table()/acpi_table_composed() instead of build_header()
> > >   acpi: arm/virt: build_gtdt: use
> > >     acpi_init_table()/acpi_table_composed() instead of build_header()
> > >   acpi: build_facs: use build_append_int_noprefix() API to compose table
> > >   acpi: remove no longer used build_header()
> > >   acpi: AcpiGenericAddress no longer used to map/access fields of MMIO,
> > >     drop packed attribute
> > > 
> > >  include/hw/acpi/acpi-defs.h          | 528 +------------------------
> > >  include/hw/acpi/acpi_dev_interface.h |   3 +-
> > >  include/hw/acpi/aml-build.h          |  21 +-
> > >  include/hw/i386/pc.h                 |   7 +-
> > >  hw/acpi/acpi-x86-stub.c              |   3 +-
> > >  hw/acpi/aml-build.c                  | 193 ++++++----
> > >  hw/acpi/cpu.c                        |  17 +-
> > >  hw/acpi/ghes.c                       |  10 +-
> > >  hw/acpi/hmat.c                       |  14 +-
> > >  hw/acpi/nvdimm.c                     |  64 ++--
> > >  hw/acpi/pci.c                        |  18 +-
> > >  hw/acpi/vmgenid.c                    |  16 +-
> > >  hw/arm/virt-acpi-build.c             | 550 +++++++++++++++------------
> > >  hw/i386/acpi-build.c                 | 284 ++++++++------
> > >  hw/i386/acpi-common.c                | 158 ++++----
> > >  hw/i386/acpi-microvm.c               |  13 +-
> > >  16 files changed, 750 insertions(+), 1149 deletions(-)
> > > 
> > > -- 
> > > 2.27.0  
> > 


