Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2524232E8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 23:34:47 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXs5G-0004SV-7Y
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 17:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXs3J-0003gX-DO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXs3F-0003zp-DB
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633469560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RM6o2S4ANqWVYtvPCGVCAGoo1iMPQu1dHQTnJmsbs6g=;
 b=I/Ac67VRFfVSE0AMas6RAiQm4b0tOiWOipC2E8zpIDnqffc4+Gaau+qq2L2Rprsx1gayq9
 MkLztWbcghJjLOZ3r4FMKfoceBcQFW+P4PW2ETO5Lq5Qg+3OckOjh8cI6UFUyYaROZjvK9
 ZS0Fz68ESAOujaYdO7uLZbKVa/wQZeI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-BmWwyeHcNgWzjb7MzW-kbw-1; Tue, 05 Oct 2021 17:32:39 -0400
X-MC-Unique: BmWwyeHcNgWzjb7MzW-kbw-1
Received: by mail-wr1-f69.google.com with SMTP id
 n18-20020adff092000000b001609d9081d4so352244wro.18
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 14:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RM6o2S4ANqWVYtvPCGVCAGoo1iMPQu1dHQTnJmsbs6g=;
 b=hGU+Ptd7lhuc+4n8JLBbEfMJqFshB71pwI6IcvxYbBqkF77g4UCm5YcZCYxXunRcAj
 +JTwCTTHa8FL76wx3PB29QWxTyRWfcyPlyb9Cr6E8UbVih4xyMiN9iJaEUdauwVlyWnU
 zxFJSE/c0v1gnafgdw6C7rzvda9HGzQFAEXlrEtowLUwBVA3ZTl3ikzrHWV6EYBaddgW
 kJBA3s7/NoPK6ZykWiyFN3HT8Bghi61RC+6fBKkyndoa0/Pp8si/zZQge6GqIzCHMGeX
 qxwn+dYMSextLZtiWwnNwPPusu4LqPsz7JA6z+j/w6Qu3ZzjC7N7RlnQHwp9f7NTtN0L
 JPCg==
X-Gm-Message-State: AOAM5314dn0G9EUHP3Clsq8XYaSjEDicRy+PTmas4CU+8lVXs/QIlYH6
 lVqDTow5j2ts2osWb8FwgfhGPwdCb+nTtLFpDUj1fypbEr0W1nXwRbkuubkZ831MhPi5VeJlmY6
 XlF7orIDil1gaA1g=
X-Received: by 2002:adf:8b47:: with SMTP id v7mr24091995wra.321.1633469557893; 
 Tue, 05 Oct 2021 14:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnB5h52qvuujXqLncRrAvO+3fN1/pPZSpD394YxJnlvnhKXbuxNEkP7DCCB4afVYYfz/H4GA==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr24091978wra.321.1633469557626; 
 Tue, 05 Oct 2021 14:32:37 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id l11sm4125018wms.45.2021.10.05.14.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 14:32:37 -0700 (PDT)
Date: Tue, 5 Oct 2021 17:32:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 00/57] pc,pci,virtio: features, fixes
Message-ID: <20211005173128-mutt-send-email-mst@kernel.org>
References: <20211005155946.513818-1-mst@redhat.com>
 <20fc357d-586f-5178-6d2d-d44769f0a233@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20fc357d-586f-5178-6d2d-d44769f0a233@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:21:43AM -0700, Richard Henderson wrote:
> On 10/5/21 9:00 AM, Michael S. Tsirkin wrote:
> > The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:
> > 
> >    Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > 
> > for you to fetch changes up to c7d2f59cf940b8c8c52c29d5fa25613fe662f7b6:
> > 
> >    hw/i386/amd_iommu: Add description/category to TYPE_AMD_IOMMU_PCI (2021-10-05 11:46:45 -0400)
> > 
> > ----------------------------------------------------------------
> > pc,pci,virtio: features, fixes
> > 
> > VDPA multiqueue support.
> > A huge acpi refactoring.
> > Fixes, cleanups all over the place.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----------------------------------------------------------------
> > Ani Sinha (3):
> >        bios-tables-test: allow changes in DSDT ACPI tables for q35
> >        hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35
> >        bios-tables-test: Update ACPI DSDT table golden blobs for q35
> > 
> > Dr. David Alan Gilbert (1):
> >        virtio-balloon: Fix page-poison subsection name
> > 
> > Igor Mammedov (35):
> >        acpi: add helper routines to initialize ACPI tables
> >        acpi: build_rsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_xsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_slit: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_tpm2: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: acpi_build_hest: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_mcfg: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_hmat: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: nvdimm_build_nfit: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: nvdimm_build_ssdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: vmgenid_build_acpi: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: x86: build_dsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_hpet: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_tpm_tcpa: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: arm/x86: build_srat: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: use build_append_int_noprefix() API to compose SRAT table
> >        acpi: build_dmar_q35: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_waet: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_amd_iommu: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: madt: arm/x86: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: x86: remove dead code
> >        acpi: x86: set enabled when composing _MAT entries
> >        acpi: x86: madt: use build_append_int_noprefix() API to compose MADT table
> >        acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table
> >        acpi: build_dsdt_microvm: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: arm: virt: build_dsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: arm: virt: build_iort: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: arm/virt: convert build_iort() to endian agnostic build_append_FOO() API
> >        acpi: arm/virt: build_spcr: fix invalid cast
> >        acpi: arm/virt: build_spcr: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
> >        acpi: build_facs: use build_append_int_noprefix() API to compose table
> >        acpi: remove no longer used build_header()
> >        acpi: AcpiGenericAddress no longer used to map/access fields of MMIO, drop packed attribute
> > 
> > Jason Wang (10):
> >        vhost-vdpa: open device fd in net_init_vhost_vdpa()
> >        vhost-vdpa: classify one time request
> >        vhost-vdpa: prepare for the multiqueue support
> >        vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
> >        net: introduce control client
> >        vhost-net: control virtqueue support
> >        virtio-net: use "queue_pairs" instead of "queues" when possible
> >        vhost: record the last virtqueue index for the virtio device
> >        virtio-net: vhost control virtqueue support
> >        vhost-vdpa: multiqueue support
> > 
> > Li Zhijian (1):
> >        nvdimm: release the correct device list
> > 
> > Philippe Mathieu-Daudé (5):
> >        hw/virtio: Acquire RCU read lock in virtqueue_packed_drop_all()
> >        hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees
> >        hw/i386/amd_iommu: Rename amdviPCI TypeInfo
> >        hw/i386/amd_iommu: Rename SysBus specific functions as amdvi_sysbus_X()
> >        hw/i386/amd_iommu: Add description/category to TYPE_AMD_IOMMU_PCI
> > 
> > Stefano Garzarella (2):
> >        vhost-vsock: fix migration issue when seqpacket is supported
> >        vhost-vsock: handle common features in vhost-vsock-common
> > 
> >   include/hw/acpi/acpi-defs.h            | 528 +------------------------------
> >   include/hw/acpi/acpi_dev_interface.h   |   3 +-
> >   include/hw/acpi/aml-build.h            |  37 ++-
> >   include/hw/acpi/ich9.h                 |   2 +-
> >   include/hw/i386/pc.h                   |   6 +-
> >   include/hw/virtio/vhost-vdpa.h         |   1 +
> >   include/hw/virtio/vhost-vsock-common.h |   5 +
> >   include/hw/virtio/vhost.h              |   2 +
> >   include/hw/virtio/virtio-net.h         |   5 +-
> >   include/net/net.h                      |   5 +
> >   include/net/vhost_net.h                |   6 +-
> >   hw/acpi/acpi-x86-stub.c                |   3 +-
> >   hw/acpi/aml-build.c                    | 193 +++++++-----
> >   hw/acpi/cpu.c                          |  17 +-
> >   hw/acpi/ghes.c                         |  10 +-
> >   hw/acpi/hmat.c                         |  14 +-
> >   hw/acpi/nvdimm.c                       |  76 ++---
> >   hw/acpi/pci.c                          |  18 +-
> >   hw/acpi/vmgenid.c                      |  13 +-
> >   hw/arm/virt-acpi-build.c               | 553 +++++++++++++++++++--------------
> >   hw/core/machine.c                      |   5 +-
> >   hw/i386/acpi-build.c                   | 292 +++++++++--------
> >   hw/i386/acpi-common.c                  | 160 +++++-----
> >   hw/i386/acpi-microvm.c                 |  13 +-
> >   hw/i386/amd_iommu.c                    |  41 ++-
> >   hw/net/vhost_net.c                     |  55 +++-
> >   hw/net/virtio-net.c                    | 165 +++++-----
> >   hw/virtio/vhost-user-vsock.c           |   4 +-
> >   hw/virtio/vhost-vdpa.c                 |  56 +++-
> >   hw/virtio/vhost-vsock-common.c         |  31 ++
> >   hw/virtio/vhost-vsock.c                |  11 +-
> >   hw/virtio/virtio-balloon.c             |   2 +-
> >   hw/virtio/virtio.c                     |  31 +-
> >   net/net.c                              |  24 +-
> >   net/vhost-vdpa.c                       | 127 +++++++-
> >   tests/data/acpi/q35/DSDT               | Bin 8289 -> 8289 bytes
> >   tests/data/acpi/q35/DSDT.acpihmat      | Bin 9614 -> 9614 bytes
> >   tests/data/acpi/q35/DSDT.bridge        | Bin 11003 -> 11003 bytes
> >   tests/data/acpi/q35/DSDT.cphp          | Bin 8753 -> 8753 bytes
> >   tests/data/acpi/q35/DSDT.dimmpxm       | Bin 9943 -> 9943 bytes
> >   tests/data/acpi/q35/DSDT.ipmibt        | Bin 8364 -> 8364 bytes
> >   tests/data/acpi/q35/DSDT.memhp         | Bin 9648 -> 9648 bytes
> >   tests/data/acpi/q35/DSDT.mmio64        | Bin 9419 -> 9419 bytes
> >   tests/data/acpi/q35/DSDT.nohpet        | Bin 8147 -> 8147 bytes
> >   tests/data/acpi/q35/DSDT.numamem       | Bin 8295 -> 8295 bytes
> >   tests/data/acpi/q35/DSDT.tis.tpm12     | Bin 8894 -> 8894 bytes
> >   tests/data/acpi/q35/DSDT.tis.tpm2      | Bin 8894 -> 8894 bytes
> >   47 files changed, 1202 insertions(+), 1312 deletions(-)
> 
> You missed updating the stub version of these functions:
> 
> ../src/hw/net/vhost_net-stub.c:34:5: error: conflicting types for ‘vhost_net_start’
>    34 | int vhost_net_start(VirtIODevice *dev,
>       |     ^~~~~~~~~~~~~~~
> In file included from ../src/hw/net/vhost_net-stub.c:19:
> /home/rth/qemu-publish/src/include/net/vhost_net.h:24:5: note: previous
> declaration of ‘vhost_net_start’ was here
>    24 | int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>       |     ^~~~~~~~~~~~~~~
> ../src/hw/net/vhost_net-stub.c:40:6: error: conflicting types for ‘vhost_net_stop’
>    40 | void vhost_net_stop(VirtIODevice *dev,
>       |      ^~~~~~~~~~~~~~
> In file included from ../src/hw/net/vhost_net-stub.c:19:
> /home/rth/qemu-publish/src/include/net/vhost_net.h:26:6: note: previous
> declaration of ‘vhost_net_stop’ was here
>    26 | void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>       |      ^~~~~~~~~~~~~~
> 
> 

Indeed. I dropped these patches for now.
Could you refetch from same tag and confirm it's ok?
Jason, I think you want to respin.

-- 
MST


