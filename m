Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701713C80BF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 10:55:27 +0200 (CEST)
Received: from localhost ([::1]:56760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3afu-0001zD-8g
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 04:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m3aeg-0001BZ-DZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m3aee-00009X-Jq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626252847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yoTSlfSLJf49FILAUBD+M2Zxvmatpzo8JJZ2460tIIU=;
 b=ROiuCe5aOTuRm2t3InyHib1xpnJ0/FVHAZI2L4ptRZZsfD8VC9Q8eiLibblTDDvj/D21lu
 CG5UREZGSZ/J2UeET8QPOsLD7YxqoGVy3YU6E4ZzZ5UTS1heNKV1yI9BwU4iHbgwK9iWxD
 BYx9IUtA77AKThMTJSVkEyLJ7r1PJDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-3hQlx1Z3PSO9CT9N7kr8zw-1; Wed, 14 Jul 2021 04:54:05 -0400
X-MC-Unique: 3hQlx1Z3PSO9CT9N7kr8zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9DD59126D
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:54:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E71205C1D1;
 Wed, 14 Jul 2021 08:54:00 +0000 (UTC)
Date: Wed, 14 Jul 2021 10:53:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 00/35] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210714105359.0c6b0382@redhat.com>
In-Reply-To: <20210713114350-mutt-send-email-mst@kernel.org>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210713114350-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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

On Tue, 13 Jul 2021 11:45:46 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 08, 2021 at 11:45:42AM -0400, Igor Mammedov wrote:
> > v2:
> >   - drop test related patches, they will be sent as a separate series
> >   - fix bios_loader pointer initialization ordering when using TPM1.2
> >   - extend commit message of [1/35] and add extra comment about
> >     table length patching   
> 
> 
> So I think this is in good shape, and I really like the code size
> reduction. Given a rush to push things before the freeze, I'm inclined
> to just defer API rework to the next release. This kind of thing is
> better at the beginning of the cycle so we can iron out API kinks if any
> surface.

ok, I'll respin once another merge window is open.

As for tests part, that I dropped, should I repost it
for merging during soft-freeze or we postpone that as well?

> 
> > Highlights:
> >   * drop pointer arithmetic in ACPI tables code
> >   * use endian agnostic API
> >   * simplifies review of tables. /in most cases just line by line comparision with spec/
> > 
> > Series replaces build_header() with acpi_init_table()/acpi_table_composed()
> > API that hides pointer/offset arithmetic from user, to prevent
> > errors caused by it [1].
> > While doing above, it was necessary to split table header from
> > packed structure that was describing the table, which is
> > counter-productive since it still leaves packed structure drawbacks.
> > So that sort of forced me to rewrite tables that were composed with
> > help of packed structures to preferred build_append_int_noprefix() API.
> > In cases where refactoring to build_append_int_noprefix() was small,
> > it was squashed with acpi_init_table()/acpi_table_composed() patch.
> > Conversion reduced code size quite a bit despite me adding doc comments
> > for every table row.
> > 
> > 1) commits
> >    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
> >    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> > 
> > Link to repo:
> >    https://gitlab.com/imammedo/qemu/-/commits/acpi_build_header_refactoring_v2
> > 
> > CC: mst@redhat.com
> > 
> > 
> > 
> > Igor Mammedov (35):
> >   acpi: add helper routines to initialize ACPI tables
> >   acpi: build_rsdt: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_xsdt: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_slit: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_fadt: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_tpm2: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: acpi_build_hest: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: build_mcfg: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_hmat: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: nvdimm_build_nfit: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: nvdimm_build_ssdt: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: vmgenid_build_acpi: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: x86: build_dsdt: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: build_hpet: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_tpm_tcpa: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: arm/x86: build_srat: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: use build_append_int_noprefix() API to compose SRAT table
> >   acpi: build_dmar_q35: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: build_waet: use acpi_init_table()/acpi_table_composed() instead
> >     of build_header()
> >   acpi: build_amd_iommu: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: madt: arm/x86: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: x86: remove dead code
> >   acpi: x86: set enabled when composing _MAT entries
> >   acpi: x86: madt: use build_append_int_noprefix() API to compose MADT
> >     table
> >   acpi: arm/virt: madt: use build_append_int_noprefix() API to compose
> >     MADT table
> >   acpi: build_dsdt_microvm: use acpi_init_table()/acpi_table_composed()
> >     instead of build_header()
> >   acpi: arm: virt: build_dsdt: use
> >     acpi_init_table()/acpi_table_composed() instead of build_header()
> >   acpi: arm: virt: build_iort: use
> >     acpi_init_table()/acpi_table_composed() instead of build_header()
> >   acpi: arm/virt: convert build_iort() to endian agnostic
> >     build_append_FOO() API
> >   acpi: arm/virt: build_spcr: fix invalid cast
> >   acpi: arm/virt: build_spcr: use
> >     acpi_init_table()/acpi_table_composed() instead of build_header()
> >   acpi: arm/virt: build_gtdt: use
> >     acpi_init_table()/acpi_table_composed() instead of build_header()
> >   acpi: build_facs: use build_append_int_noprefix() API to compose table
> >   acpi: remove no longer used build_header()
> >   acpi: AcpiGenericAddress no longer used to map/access fields of MMIO,
> >     drop packed attribute
> > 
> >  include/hw/acpi/acpi-defs.h          | 528 +------------------------
> >  include/hw/acpi/acpi_dev_interface.h |   3 +-
> >  include/hw/acpi/aml-build.h          |  21 +-
> >  include/hw/i386/pc.h                 |   7 +-
> >  hw/acpi/acpi-x86-stub.c              |   3 +-
> >  hw/acpi/aml-build.c                  | 193 ++++++----
> >  hw/acpi/cpu.c                        |  17 +-
> >  hw/acpi/ghes.c                       |  10 +-
> >  hw/acpi/hmat.c                       |  14 +-
> >  hw/acpi/nvdimm.c                     |  64 ++--
> >  hw/acpi/pci.c                        |  18 +-
> >  hw/acpi/vmgenid.c                    |  16 +-
> >  hw/arm/virt-acpi-build.c             | 550 +++++++++++++++------------
> >  hw/i386/acpi-build.c                 | 284 ++++++++------
> >  hw/i386/acpi-common.c                | 158 ++++----
> >  hw/i386/acpi-microvm.c               |  13 +-
> >  16 files changed, 750 insertions(+), 1149 deletions(-)
> > 
> > -- 
> > 2.27.0  
> 


