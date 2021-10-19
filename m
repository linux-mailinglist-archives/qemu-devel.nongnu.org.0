Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C31433826
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:14:21 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcpsi-0005xW-Gf
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcpmk-0007wi-1U
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcpmg-0005ku-Kd
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634652481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VJX7fIokdEljL23nbTYAXd/vQu4PnDQ9An5cPWV69I=;
 b=g51h//QjXPmB9Np8jDbkMUhXlkVGIc36YgfHduYbNZcHPq9MEtxNwVkqqvtSJ6gLq/rle8
 tih6yvznh0SPEZl+3YktiAojn8zO1pz0DWDFlBg7TmoAwSMUnDYV9xT62UWmQtz+DcoVLA
 LwnSBn0qyn7WqncRpZtQm7L4TPNs2N0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-LwMSuQeXMCOK7VKc833n5g-1; Tue, 19 Oct 2021 10:07:58 -0400
X-MC-Unique: LwMSuQeXMCOK7VKc833n5g-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so10206271wrc.22
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9VJX7fIokdEljL23nbTYAXd/vQu4PnDQ9An5cPWV69I=;
 b=NfrAdxmdE0L2HKOQUF+16fIMq0OFv4pFp3wwlQFdVBSp8ukw9rKcRySDlT5b4QxdDv
 MNXJbHDXK2nXebXWTZUnemGKSnqmHeDtdnAt6g/fRAFA0tYBVmIkui2Oq5Rl04XJbkTB
 gMln/flDXNztIXgeVlkWNyJN8GngA7w9JLAZRRonmFl07UGXNv774h3KHNPUEaSFdIoh
 kGaHcAwvgEBXAPmFgrw671BFb+HtRQohaD08qu2LWU6QtrG0PNzKvvzQXaxiJ0xBCYHl
 Cy1SN0SxrBKrHENXoqeYoh8JSvziUNgFGzAR/ihnNyJRhcpBg8/f5bFYKOeh+dW0gV7d
 DgmA==
X-Gm-Message-State: AOAM533wgl7fEgiE6gdEKCXQvW8urlMRoqQHLupmAREWy0uyepoklrDO
 LvdBIfIDT0q/UvuHMhZD3JdMX//WWu0heZm72pf2ev5V+LLrrNiWaSjR1/5KCWAjWX700K8kTs1
 ludPNpnj19zLPaWM07gF1ZjTVJ5F3lZYdJlxLabd6xy0KKIIwmjgYNi2ztX1e
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr6207779wmj.103.1634652477319; 
 Tue, 19 Oct 2021 07:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK7Z61682FA7TXyxld18UqitumuiyTzZebvB26MRrJdJUrbXpbxDcZxUzmmFGaOft/u2ApDA==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr6207733wmj.103.1634652476947; 
 Tue, 19 Oct 2021 07:07:56 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id y26sm267766wma.15.2021.10.19.07.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:07:56 -0700 (PDT)
Date: Tue, 19 Oct 2021 10:07:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 00/29] pc,pci,virtio: features, fixes
Message-ID: <20211019100724-mutt-send-email-mst@kernel.org>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 07:19:40AM -0400, Michael S. Tsirkin wrote:
> The following changes since commit 9c050b661d3a43dfe2fd44106e559b39706d1296:
> 
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20211018' into staging (2021-10-18 09:16:51 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to bf2dd99b7d536cdba157fd6687810ce7b8340ccc:
> 
>   failover: fix a regression introduced by JSON'ification of -device (2021-10-19 07:15:34 -0400)


I tacked on one more patch since it fixes a test hang that has
annoyed people for a while.

> ----------------------------------------------------------------
> pc,pci,virtio: features, fixes
> 
> vhost user rng
> Fixes, cleanups all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Ani Sinha (3):
>       tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
>       tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
>       tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test
> 
> David Hildenbrand (1):
>       libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
> 
> Eric Auger (2):
>       virtio-iommu: Remove the non transitional name
>       virtio-iommu: Drop base_name and change generic_name
> 
> Eugenio Pérez (3):
>       vdpa: Skip protected ram IOMMU mappings
>       vdpa: Add vhost_vdpa_section_end
>       vdpa: Check for iova range at mappings changes
> 
> Igor Mammedov (15):
>       tests: acpi: dump table with failed checksum
>       tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
>       tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
>       tests: acpi: q35: test for x2APIC entries in SRAT
>       tests: acpi: update expected tables blobs
>       tests: acpi: whitelist new expected table tests/data/acpi/q35/DMAR.dmar
>       tests: acpi: add testcase for intel_iommu (DMAR table)
>       tests: acpi: add expected blob for DMAR table
>       tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
>       tests: acpi: add testcase for amd-iommu (IVRS table)
>       tests: acpi: update expected blobs
>       tests: acpi: arm/virt: drop redundant test_acpi_one() in test_acpi_virt_tcg()
>       tests: arm-cpu-features: use qtest_has_kvm() API
>       tests: migration-test: use qtest_has_accel() API
>       tests: bios-tables-test: use qtest_has_accel() API to register TCG only tests
> 
> Laurent Vivier (1):
>       failover: fix a regression introduced by JSON'ification of -device
> 
> Mathieu Poirier (3):
>       vhost-user-rng: Add vhost-user-rng implementation
>       vhost-user-rng-pci: Add vhost-user-rng-pci implementation
>       docs: Add documentation for vhost based RNG implementation
> 
> Xueming Li (1):
>       vhost-user: fix duplicated notifier MR init
> 
>  include/hw/virtio/vhost-user-rng.h        |  33 ++++
>  include/hw/virtio/vhost-vdpa.h            |   2 +
>  include/hw/virtio/virtio-iommu.h          |   2 +-
>  tests/qtest/libqos/libqtest.h             |   8 +
>  hw/net/virtio-net.c                       |  24 ++-
>  hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
>  hw/virtio/vhost-user-rng.c                | 289 ++++++++++++++++++++++++++++++
>  hw/virtio/vhost-user.c                    |   5 +-
>  hw/virtio/vhost-vdpa.c                    |  81 ++++++---
>  hw/virtio/virtio-iommu-pci.c              |   4 +-
>  subprojects/libvhost-user/libvhost-user.c |   1 +
>  tests/qtest/acpi-utils.c                  |  14 ++
>  tests/qtest/arm-cpu-features.c            |  29 +--
>  tests/qtest/bios-tables-test.c            |  90 ++++++++--
>  tests/qtest/libqtest.c                    |  27 +++
>  tests/qtest/migration-test.c              |  15 +-
>  docs/system/device-emulation.rst          |   1 +
>  docs/system/devices/vhost-user-rng.rst    |  39 ++++
>  hw/virtio/Kconfig                         |   5 +
>  hw/virtio/meson.build                     |   2 +
>  hw/virtio/trace-events                    |   1 +
>  meson.build                               |   6 +
>  tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
>  tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
>  tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
>  tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
>  tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
>  tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
>  tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
>  30 files changed, 672 insertions(+), 85 deletions(-)
>  create mode 100644 include/hw/virtio/vhost-user-rng.h
>  create mode 100644 hw/virtio/vhost-user-rng-pci.c
>  create mode 100644 hw/virtio/vhost-user-rng.c
>  create mode 100644 docs/system/devices/vhost-user-rng.rst
>  create mode 100644 tests/data/acpi/q35/APIC.xapic
>  create mode 100644 tests/data/acpi/q35/DMAR.dmar
>  create mode 100644 tests/data/acpi/q35/DSDT.ivrs
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>  create mode 100644 tests/data/acpi/q35/DSDT.xapic
>  create mode 100644 tests/data/acpi/q35/FACP.xapic
>  create mode 100644 tests/data/acpi/q35/IVRS.ivrs
>  create mode 100644 tests/data/acpi/q35/SRAT.xapic
> 


