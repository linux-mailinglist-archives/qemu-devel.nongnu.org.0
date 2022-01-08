Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4D487FF2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 01:35:36 +0100 (CET)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5zhm-0005Qy-Cf
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 19:35:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5zgX-0004hN-4T
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 19:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5zgU-0006Y6-0Q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 19:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641602052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9wAjpVjRmSD+vzXHjooxK5mrOWnogSeJ+uXRaXlFgM=;
 b=QKMq9STWq5veo+y6NaG6o3GJB5/yonC/mCUINKpb78RTIRMxeAOEBghZmKnVNE5HbZUji0
 q4Snr9Ijq98Q63z8NOVN4BgJAy5Vgt/Y6WHdDQH2KzI9h14GpPXSiuTmxbiK78lWQ2rbB5
 kttc54ba/nw6iKXg7D8ryf76PV3mAfE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-M6AtNRCMObKOl9iY7UNgVA-1; Fri, 07 Jan 2022 19:34:11 -0500
X-MC-Unique: M6AtNRCMObKOl9iY7UNgVA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh10-20020a05600c3d0a00b00347aa76728fso1841028wmb.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 16:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S9wAjpVjRmSD+vzXHjooxK5mrOWnogSeJ+uXRaXlFgM=;
 b=JgarNlJzpu/Z3O2tjvF23DuqN19yrt7ENnd+2c7HEpea+Y3vDmVcW8raRz6Yxk6TO/
 /EDOaNkm2LeDEaVtROfj7KQz5sZHam16rLuskw1rFsV4CnfMFhQ5YjrTLpdbx3IxnfNE
 rEfbh722n4qVxe4GC2MJSqhSg1K+9ynNtC5Eg5tcW7XlhrAJn4EJrDP+oYbwhK4RIu5i
 cIJvvlMZ26r6An6UwKVtmzgX8nzeisbJBrdWP7pfQGjWs2qw6IftWTiG90jpd+m7YIhQ
 wGhXnuoagZie4oqjKxV46JTQftCnhurtD4EVkY2NbGcnVQqfIwal1FZBTr8fDB4Ll+z9
 f28Q==
X-Gm-Message-State: AOAM531rI8GglcgT+yX9Acr4GFlRt+asAAnBPYpwIuuVL8lCLPvRLFZL
 v75AmAXK6b54szKQdh1CTrks/JO6QVGISxQe9s8uoRxEusUx+RxhCAxxhbsnlWFO7OG/XUuZmxy
 8URRcZ35nH3SLfzk=
X-Received: by 2002:a05:6000:1c04:: with SMTP id
 ba4mr11948642wrb.549.1641602050115; 
 Fri, 07 Jan 2022 16:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTOMGMrO6nUquGyb6YPx9sBhn8x2aO1ASetum2wB7GHKehAZsRLm0qkgar8wgPKAt0b4zsZw==
X-Received: by 2002:a05:6000:1c04:: with SMTP id
 ba4mr11948631wrb.549.1641602049887; 
 Fri, 07 Jan 2022 16:34:09 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id f16sm239631wmg.27.2022.01.07.16.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 16:34:09 -0800 (PST)
Date: Fri, 7 Jan 2022 19:34:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL v2 00/55] virtio,pci,pc: features,fixes,cleanups
Message-ID: <20220107193109-mutt-send-email-mst@kernel.org>
References: <20220107102526.39238-1-mst@redhat.com>
 <3f660c72-de9d-66e1-aed4-e9a5cda00f12@linaro.org>
MIME-Version: 1.0
In-Reply-To: <3f660c72-de9d-66e1-aed4-e9a5cda00f12@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 07, 2022 at 11:38:21AM -0800, Richard Henderson wrote:
> On 1/7/22 3:03 AM, Michael S. Tsirkin wrote:
> > Changes from v1:
> > - mingw build fixes
> > - added TPM patches which got acks meanwhile
> > 
> > Big changes that were tagged originally but did not make the cut:
> > - SRIOV/nvme (not sure they are my tree material anyway)
> > - ACPI ERST (some coding style violations)
> > 
> > The following changes since commit 7d4ae4d4978079d564d3b6354c90a949130409fe:
> > 
> >    Merge tag 'pull-request-2022-01-05' of https://gitlab.com/thuth/qemu into staging (2022-01-05 08:47:18 -0800)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > 
> > for you to fetch changes up to f1aaf12842f344237d0654352e324a5ab7c70196:
> > 
> >    tests: acpi: Add updated TPM related tables (2022-01-07 05:23:59 -0500)
> > 
> > ----------------------------------------------------------------
> > virtio,pci,pc: features,fixes,cleanups
> > 
> > New virtio mem options.
> > A vhost-user cleanup.
> > Control over smbios entry point type.
> > Config interrupt support for vdpa.
> > Fixes, cleanups all over the place.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----------------------------------------------------------------
> > Andy Pei (1):
> >        hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature for virtio blk device
> > 
> > Ani Sinha (2):
> >        MAINTAINERS: Add a separate entry for acpi/VIOT tables
> >        acpihp: simplify acpi_pcihp_disable_root_bus
> > 
> > Cindy Lu (10):
> >        virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
> >        virtio-pci: decouple notifier from interrupt process
> >        virtio-pci: decouple the single vector from the interrupt process
> >        vhost: introduce new VhostOps vhost_set_config_call
> >        vhost-vdpa: add support for config interrupt
> >        virtio: add support for configure interrupt
> >        vhost: add support for configure interrupt
> >        virtio-net: add support for configure interrupt
> >        virtio-mmio: add support for configure interrupt
> >        virtio-pci: add support for configure interrupt
> > 
> > Daniil Tatianin (3):
> >        hw/scsi/vhost-scsi: don't leak vqs on error
> >        hw/scsi/vhost-scsi: don't double close vhostfd on error
> >        virtio/vhost-vsock: don't double close vhostfd, remove redundant cleanup
> > 
> > David Hildenbrand (12):
> >        virtio-mem: Don't skip alignment checks when warning about block size
> >        util/oslib-posix: Let touch_all_pages() return an error
> >        util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
> >        util/oslib-posix: Introduce and use MemsetContext for touch_all_pages()
> >        util/oslib-posix: Don't create too many threads with small memory or little pages
> >        util/oslib-posix: Avoid creating a single thread with MADV_POPULATE_WRITE
> >        util/oslib-posix: Support concurrent os_mem_prealloc() invocation
> >        util/oslib-posix: Forward SIGBUS to MCE handler under Linux
> >        virtio-mem: Support "prealloc=on" option
> >        linux-headers: sync VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
> >        virtio-mem: Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
> >        virtio-mem: Set "unplugged-inaccessible=auto" for the 7.0 machine on x86
> > 
> > Eduardo Habkost (3):
> >        smbios: Rename SMBIOS_ENTRY_POINT_* enums
> >        hw/smbios: Use qapi for SmbiosEntryPointType
> >        hw/i386: expose a "smbios-entry-point-type" PC machine property
> > 
> > Frederic Barrat (2):
> >        pci: Export the pci_intx() function
> >        pcie_aer: Don't trigger a LSI if none are defined
> > 
> > Igor Mammedov (4):
> >        acpi: fix QEMU crash when started with SLIC table
> >        tests: acpi: whitelist expected blobs before changing them
> >        tests: acpi: add SLIC table test
> >        tests: acpi: SLIC: update expected blobs
> > 
> > Jason Wang (1):
> >        intel-iommu: correctly check passthrough during translation
> > 
> > Laurent Vivier (1):
> >        trace-events,pci: unify trace events format
> > 
> > Michael S. Tsirkin (1):
> >        acpi: validate hotplug selector on access
> > 
> > Roman Kagan (9):
> >        vhost-user-blk: reconnect on any error during realize
> >        chardev/char-socket: tcp_chr_recv: don't clobber errno
> >        chardev/char-socket: tcp_chr_sync_read: don't clobber errno
> >        vhost-backend: avoid overflow on memslots_limit
> >        vhost-backend: stick to -errno error return convention
> >        vhost-vdpa: stick to -errno error return convention
> >        vhost-user: stick to -errno error return convention
> >        vhost: stick to -errno error return convention
> >        vhost-user-blk: propagate error return from generic vhost
> > 
> > Stefan Berger (3):
> >        tests: acpi: prepare for updated TPM related tables
> >        acpi: tpm: Add missing device identification objects
> >        tests: acpi: Add updated TPM related tables
> > 
> > Stefan Hajnoczi (1):
> >        virtio: signal after wrapping packed used_idx
> > 
> > Thomas Huth (2):
> >        hw/i386/pc: Add missing property descriptions
> >        docs: reSTify virtio-balloon-stats documentation and move to docs/interop
> > 
> >   qapi/machine.json                                  |  12 +
> >   hw/virtio/virtio-pci.h                             |   4 +-
> >   include/hw/firmware/smbios.h                       |  10 +-
> >   include/hw/i386/pc.h                               |   4 +
> >   include/hw/pci/pci.h                               |   5 +
> >   include/hw/virtio/vhost-backend.h                  |   3 +
> >   include/hw/virtio/vhost.h                          |   4 +
> >   include/hw/virtio/virtio-mem.h                     |  12 +
> >   include/hw/virtio/virtio.h                         |   7 +
> >   include/net/vhost_net.h                            |   2 +
> >   include/qemu/osdep.h                               |   7 +
> >   include/standard-headers/linux/virtio_mem.h        |   9 +-
> >   chardev/char-socket.c                              |  17 +-
> >   hw/acpi/core.c                                     |   4 +-
> >   hw/acpi/pcihp.c                                    |  12 +-
> >   hw/arm/virt-acpi-build.c                           |   1 +
> >   hw/arm/virt.c                                      |   2 +-
> >   hw/block/vhost-user-blk.c                          |   5 +-
> >   hw/display/vhost-user-gpu.c                        |   6 +
> >   hw/i386/acpi-build.c                               |   9 +
> >   hw/i386/intel_iommu.c                              |  38 +-
> >   hw/i386/pc.c                                       |  38 +-
> >   hw/i386/pc_piix.c                                  |   2 +-
> >   hw/i386/pc_q35.c                                   |   2 +-
> >   hw/net/vhost_net-stub.c                            |   9 +
> >   hw/net/vhost_net.c                                 |   9 +
> >   hw/net/virtio-net.c                                |  10 +-
> >   hw/pci/pci.c                                       |   9 +-
> >   hw/pci/pci_host.c                                  |   6 +-
> >   hw/pci/pcie_aer.c                                  |   4 +-
> >   hw/scsi/vhost-scsi.c                               |  15 +-
> >   hw/smbios/smbios.c                                 |   8 +-
> >   hw/virtio/vhost-backend.c                          |   4 +-
> >   hw/virtio/vhost-user-fs.c                          |   6 +
> >   hw/virtio/vhost-user.c                             | 401 ++++++++++++---------
> >   hw/virtio/vhost-vdpa.c                             |  44 ++-
> >   hw/virtio/vhost-vsock-common.c                     |   6 +
> >   hw/virtio/vhost-vsock.c                            |  11 +-
> >   hw/virtio/vhost.c                                  | 174 ++++++---
> >   hw/virtio/virtio-crypto.c                          |   6 +
> >   hw/virtio/virtio-mem.c                             | 105 +++++-
> >   hw/virtio/virtio-mmio.c                            |  27 ++
> >   hw/virtio/virtio-pci.c                             | 281 ++++++++++-----
> >   hw/virtio/virtio.c                                 |  30 ++
> >   softmmu/cpus.c                                     |   4 +
> >   tests/qtest/bios-tables-test.c                     |  15 +
> >   util/oslib-posix.c                                 | 234 +++++++++---
> >   MAINTAINERS                                        |   8 +
> >   docs/interop/index.rst                             |   1 +
> >   .../virtio-balloon-stats.rst}                      |  58 +--
> >   hw/pci/trace-events                                |   8 +-
> >   hw/virtio/trace-events                             |   1 +
> >   tests/data/acpi/q35/DSDT.tis.tpm12                 | Bin 8894 -> 8900 bytes
> >   tests/data/acpi/q35/DSDT.tis.tpm2                  | Bin 8894 -> 8921 bytes
> >   tests/data/acpi/q35/FACP.slic                      | Bin 0 -> 244 bytes
> >   tests/data/acpi/q35/SLIC.slic                      | Bin 0 -> 36 bytes
> >   56 files changed, 1209 insertions(+), 500 deletions(-)
> >   rename docs/{virtio-balloon-stats.txt => interop/virtio-balloon-stats.rst} (66%)
> >   create mode 100644 tests/data/acpi/q35/FACP.slic
> >   create mode 100644 tests/data/acpi/q35/SLIC.slic
> 
> This fails everywhere.
> 
> https://gitlab.com/qemu-project/qemu/-/pipelines/443660857
> 
> 
> r~

Oops. It's weird, I was sure I tested it. Trying for the last time
before I start dropping the offending patches and let confributors
figure it out.

-- 
MST


