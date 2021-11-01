Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55D442471
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:59:18 +0100 (CET)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhCu-0006B0-QE
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyg-0001z5-Ea
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyb-0004EB-9O
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MfAqzJ8Cwjtb/trVT40Vb20veQ+48E5tu21PtHNnX00=;
 b=QIuu0Fs/hKjBaag528rUd3JPsfRc1Y3NcIwxATU3r91GgJNq/aDhg3XC9XekNx5BFP4Uhr
 x0/LVxmL0EcF2vzvreKSzxwIUEVaTksP7EMWfaFk/xSh/JSO05M/DfjoQU3PsZ7MrXglgy
 tJS/kZuwhFNUNuCv1YuO0Di88nG4Edk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-3DLZJDJ8Mj-MFY9MurmYOw-1; Mon, 01 Nov 2021 19:44:24 -0400
X-MC-Unique: 3DLZJDJ8Mj-MFY9MurmYOw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y20-20020a056402359400b003e28c9bc02cso4090953edc.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MfAqzJ8Cwjtb/trVT40Vb20veQ+48E5tu21PtHNnX00=;
 b=UX+Jrv5Ruj6lvXbjVWNcyEokA/MovcFeAZYeWZoTHHtadfWoy/8QqT+ki++luXroVo
 D3aTFmv+BPLrAfgO5LuafifOq7gYRKfF1MjZuxsqjNvyZoqxFqRBPuSw6Xtlwj8SNPqy
 VFbs+SafEHpQyK1VCG0WxSPdEiTEEhYnvYLZ935+kpx+Me0NwJhlDli0qKOLdoENU9vQ
 EM9GrzfOJvAiJiul0njkOToA+gd9XhHfASHszFcjkypgK+3KH02gouMFkmfS3hnvCVsY
 LbLYO6PhWrBzCKRVV9UhmBgsd7wQwBwTUhNlJLZvmgsXs3plU6ER2dhyAA5xKVxRuwVi
 BvVg==
X-Gm-Message-State: AOAM5301Gc3SXJNJEGlrhOIAAkCUgzzdYq51oOZtmKtAR5hcAOynePk9
 lVWskjqdRRWbOrPQ/OP9FPhy08qX7f0YTG9ySysmwM1TOyyvdqYVLCEiIDYJ57bWnqfL/1+rY5S
 8ls6rHYDhKZX16H5rwEQtLr0242C7RJhVfBJZ9zRSmXlw8p8PRINlTixVaMpD
X-Received: by 2002:a05:6402:203:: with SMTP id
 t3mr47612007edv.69.1635810262370; 
 Mon, 01 Nov 2021 16:44:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYGcmufta0D85Scxl6g6+HZH2eSOsMYNncabwtdGQ3GV2t7PXW24UYbCRa1ljcxb6iTJkKZQ==
X-Received: by 2002:a05:6402:203:: with SMTP id
 t3mr47611972edv.69.1635810262159; 
 Mon, 01 Nov 2021 16:44:22 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id gt11sm256205ejc.13.2021.11.01.16.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:21 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] pc,pci,virtio: features, fixes
Message-ID: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:

  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to d99e8b5fcb138b19f751c027ed5599224f9b5036:

  hw/i386: fix vmmouse registration (2021-11-01 19:36:11 -0400)

----------------------------------------------------------------
pc,pci,virtio: features, fixes

virtio-iommu support for x86/ACPI.
Fixes, cleanups all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
David Hildenbrand (1):
      vhost-vdpa: Set discarding of RAM broken when initializing the backend

Igor Mammedov (1):
      qtest: fix 'expression is always false' build failure in qtest_has_accel()

Jean-Philippe Brucker (4):
      hw/acpi: Add VIOT table
      hw/i386/pc: Remove x86_iommu_get_type()
      hw/i386/pc: Move IOMMU singleton into PCMachineState
      hw/i386/pc: Allow instantiating a virtio-iommu device

Pavel Dovgalyuk (1):
      hw/i386: fix vmmouse registration

Peter Xu (2):
      pci: Define pci_bus_dev_fn/pci_bus_fn/pci_bus_ret_fn
      pci: Export pci_for_each_device_under_bus*()

 hw/acpi/viot.h              |  13 +++++
 include/hw/i386/pc.h        |   1 +
 include/hw/i386/x86-iommu.h |  12 -----
 include/hw/pci/pci.h        |  24 ++++++----
 hw/acpi/viot.c              | 114 ++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        |  33 +++++++------
 hw/i386/amd_iommu.c         |   2 -
 hw/i386/intel_iommu.c       |   3 --
 hw/i386/pc.c                |  26 +++++++++-
 hw/i386/vmmouse.c           |   1 +
 hw/i386/x86-iommu-stub.c    |   5 --
 hw/i386/x86-iommu.c         |  31 ++++--------
 hw/pci/pci.c                |  26 ++++------
 hw/pci/pcie.c               |   4 +-
 hw/ppc/spapr_pci.c          |  12 ++---
 hw/ppc/spapr_pci_nvlink2.c  |   7 ++-
 hw/ppc/spapr_pci_vfio.c     |   4 +-
 hw/s390x/s390-pci-bus.c     |   5 +-
 hw/virtio/vhost-vdpa.c      |  13 +++++
 hw/xen/xen_pt.c             |   4 +-
 hw/acpi/Kconfig             |   4 ++
 hw/acpi/meson.build         |   1 +
 hw/i386/Kconfig             |   1 +
 meson.build                 |   2 +-
 24 files changed, 239 insertions(+), 109 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c


