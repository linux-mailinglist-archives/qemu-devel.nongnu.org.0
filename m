Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6A435229
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:58:40 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFrL-00074t-Kj
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdFp7-000510-HG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:56:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdFp5-0002zn-8z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:56:20 -0400
Received: by mail-pf1-x42b.google.com with SMTP id v8so3580774pfu.11
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wfNkl84FZRD9A7HgTJg+9puJJBL+L9voJzSfRcHPDX4=;
 b=xXC3kDgGvkrvv46+J4pgfcn47JVGPnejcWIZXqDJQVsWY9Ehdrlcnl6xW6jB7kkNaV
 PNiCH4+jaMIEZhLER+VZcUI8N8t59sanHDOTkAhQV/JkcIiptuJt4cEkRv8hSJVPrcfj
 U+3FuihkBA+jsq68UDwMuLKouoWd0ZRQ5wfeohl1joF3SoIO4jZsEdCDVCXTM0+9HSKT
 FNUO6dTELFDAx8M8pCQQTA8IdprALQAEKDqytMqha5hdpEnb18JtQOsKqUPL1ey0kjKD
 HgZn5r8s3bu2ZloG0ckdS3+4gH8iwjZ+B4QiqKc/sET5AIBW91Mmi4lTXZD8v/86oSC9
 hxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfNkl84FZRD9A7HgTJg+9puJJBL+L9voJzSfRcHPDX4=;
 b=neVZa7UyjBqFa9A94aBxrDUb8OGCadj8ibh6lQypDvKJHYU6KEmJq72VWmHZOeQB5U
 IO9ywRSY8qf+q5OVNynMdBDe8d6pohkNNWer4srfjvw8wlrZuYG1AYgWqod6Igq9BIAC
 1nhF/yDwOnCqDomLwmNLJ1rrrTXKOsd7rWYiKk0DOD8BAmV+TcdMOwJtTmrenX1vGCh/
 8hw9pWN+wxZm6q6M4E2WUCxuqKhw1+30Oyt/TyFq2iey+0RTQt2fhSCUIJqgxu2AIJ0G
 Loj9qMK7/q/voGrD2779yI+Jgyku/x/GzIIq0RHx0xTjcAJWuvQD+587RQWC3HM3gv5S
 A5xQ==
X-Gm-Message-State: AOAM532+y72sMy8VHJ2gvg30dq77/pqGwVepmOUJa8m5DIUdOP3ZolhN
 C/cvO9jowuohgcDTxq5OIZRwyA==
X-Google-Smtp-Source: ABdhPJz2fs95cGlrbSozBYpzTD2dlM/0/V2JLa5S9iqdCjPgIsSiNQQNixKZO3q87uKVQEdNS3fYRQ==
X-Received: by 2002:a62:6411:0:b0:44c:bf9f:f584 with SMTP id
 y17-20020a626411000000b0044cbf9ff584mr735602pfb.29.1634752577371; 
 Wed, 20 Oct 2021 10:56:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h12sm4653169pja.1.2021.10.20.10.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:56:16 -0700 (PDT)
Subject: Re: [PULL v2 00/44] pc,pci,virtio: features, fixes, tests
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211020101844.988480-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c76bddd-b090-3953-5876-3d969196db49@linaro.org>
Date: Wed, 20 Oct 2021 10:56:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/20/21 3:19 AM, Michael S. Tsirkin wrote:
> The following changes since commit 50352cce138ef3b30c1cda28a4df68fff5da3202:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration.next-pull-request' into staging (2021-10-19 07:41:04 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to a8339e07f94a47f99560baef59d65a9e039aaf45:
> 
>    tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test (2021-10-20 06:18:17 -0400)
> 
> ----------------------------------------------------------------
> pc,pci,virtio: features, fixes, tests
> 
> vhost user rng
> vdpa multiqueue
> Fixes, cleanups, new tests all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Ani Sinha (3):
>        tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
>        tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
>        tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test
> 
> David Hildenbrand (1):
>        libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
> 
> Eric Auger (2):
>        virtio-iommu: Remove the non transitional name
>        virtio-iommu: Drop base_name and change generic_name
> 
> Eugenio Pérez (3):
>        vdpa: Skip protected ram IOMMU mappings
>        vdpa: Add vhost_vdpa_section_end
>        vdpa: Check for iova range at mappings changes
> 
> Igor Mammedov (15):
>        tests: acpi: dump table with failed checksum
>        tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
>        tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
>        tests: acpi: q35: test for x2APIC entries in SRAT
>        tests: acpi: update expected tables blobs
>        tests: acpi: whitelist new expected table tests/data/acpi/q35/DMAR.dmar
>        tests: acpi: add testcase for intel_iommu (DMAR table)
>        tests: acpi: add expected blob for DMAR table
>        tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
>        tests: acpi: add testcase for amd-iommu (IVRS table)
>        tests: acpi: update expected blobs
>        tests: acpi: arm/virt: drop redundant test_acpi_one() in test_acpi_virt_tcg()
>        tests: arm-cpu-features: use qtest_has_kvm() API
>        tests: migration-test: use qtest_has_accel() API
>        tests: bios-tables-test: use qtest_has_accel() API to register TCG only tests
> 
> Jason Wang (10):
>        vhost-vdpa: open device fd in net_init_vhost_vdpa()
>        vhost-vdpa: classify one time request
>        vhost-vdpa: prepare for the multiqueue support
>        vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>        net: introduce control client
>        vhost-net: control virtqueue support
>        virtio-net: use "queue_pairs" instead of "queues" when possible
>        vhost: record the last virtqueue index for the virtio device
>        virtio-net: vhost control virtqueue support
>        vhost-vdpa: multiqueue support
> 
> Laurent Vivier (2):
>        failover: fix a regression introduced by JSON'ification of -device
>        qdev/qbus: remove failover specific code
> 
> Mathieu Poirier (3):
>        vhost-user-rng: Add vhost-user-rng implementation
>        vhost-user-rng-pci: Add vhost-user-rng-pci implementation
>        docs: Add documentation for vhost based RNG implementation
> 
> Michael S. Tsirkin (3):
>        rebuild-expected-aml.sh: allow partial target list
>        bios-tables-test: don't disassemble empty files
>        pci: fix PCI resource reserve capability on BE
> 
> Stefan Hajnoczi (1):
>        vhost-user-blk-test: pass vhost-user socket fds to QSD
> 
> Xueming Li (1):
>        vhost-user: fix duplicated notifier MR init
> 
>   include/hw/virtio/vhost-user-rng.h        |  33 ++++
>   include/hw/virtio/vhost-vdpa.h            |   3 +
>   include/hw/virtio/vhost.h                 |   2 +
>   include/hw/virtio/virtio-iommu.h          |   2 +-
>   include/hw/virtio/virtio-net.h            |   5 +-
>   include/net/net.h                         |   5 +
>   include/net/vhost_net.h                   |   6 +-
>   tests/qtest/libqos/libqtest.h             |   8 +
>   hw/net/vhost_net-stub.c                   |   4 +-
>   hw/net/vhost_net.c                        |  55 ++++--
>   hw/net/virtio-net.c                       | 201 ++++++++++++---------
>   hw/pci/pci_bridge.c                       |  10 +-
>   hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
>   hw/virtio/vhost-user-rng.c                | 289 ++++++++++++++++++++++++++++++
>   hw/virtio/vhost-user.c                    |   5 +-
>   hw/virtio/vhost-vdpa.c                    | 140 ++++++++++++---
>   hw/virtio/virtio-iommu-pci.c              |   4 +-
>   net/net.c                                 |  24 ++-
>   net/vhost-vdpa.c                          | 127 +++++++++++--
>   softmmu/qdev-monitor.c                    |  18 +-
>   subprojects/libvhost-user/libvhost-user.c |   1 +
>   tests/qtest/acpi-utils.c                  |  14 ++
>   tests/qtest/arm-cpu-features.c            |  29 +--
>   tests/qtest/bios-tables-test.c            | 122 ++++++++++---
>   tests/qtest/libqtest.c                    |  27 +++
>   tests/qtest/migration-test.c              |  15 +-
>   tests/qtest/vhost-user-blk-test.c         |   4 +-
>   docs/system/device-emulation.rst          |   1 +
>   docs/system/devices/vhost-user-rng.rst    |  39 ++++
>   hw/virtio/Kconfig                         |   5 +
>   hw/virtio/meson.build                     |   2 +
>   hw/virtio/trace-events                    |   1 +
>   meson.build                               |   6 +
>   tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
>   tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
>   tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
>   tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
>   tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
>   tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
>   tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
>   tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
>   tests/data/acpi/rebuild-expected-aml.sh   |  22 ++-
>   42 files changed, 1075 insertions(+), 233 deletions(-)
>   create mode 100644 include/hw/virtio/vhost-user-rng.h
>   create mode 100644 hw/virtio/vhost-user-rng-pci.c
>   create mode 100644 hw/virtio/vhost-user-rng.c
>   create mode 100644 docs/system/devices/vhost-user-rng.rst
>   create mode 100644 tests/data/acpi/q35/APIC.xapic
>   create mode 100644 tests/data/acpi/q35/DMAR.dmar
>   create mode 100644 tests/data/acpi/q35/DSDT.ivrs
>   create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>   create mode 100644 tests/data/acpi/q35/DSDT.xapic
>   create mode 100644 tests/data/acpi/q35/FACP.xapic
>   create mode 100644 tests/data/acpi/q35/IVRS.ivrs
>   create mode 100644 tests/data/acpi/q35/SRAT.xapic

Applied, thanks.

r~

