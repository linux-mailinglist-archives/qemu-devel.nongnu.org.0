Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9984AAEAE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:51:52 +0100 (CET)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeD1-0008Vh-MQ
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:51:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzr-00008X-8m
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzi-0003d9-VR
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=3QXkctBIjWHJEIeJp09RberZiX1UN4oLnh8KlpS89T4=;
 b=Jcqg4Yz6rS0iTe0c9cU6ynuqwor5FNcJ+zb2KXd2ytKfZjm+0wbJQsaof6pRKAJ5Mxu57T
 Y3XV8zbXCMgotkLyFUKymEMdtVJDf4BKbgcIKsvJmgo+2+fffMZ3uWyFE+waXPxfUn1mQt
 NqwuV3QTmaapDubIML1a5XSXXZWagFc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-RZArM5_VOpCRZpouh3pSSg-1; Sun, 06 Feb 2022 04:37:48 -0500
X-MC-Unique: RZArM5_VOpCRZpouh3pSSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 130-20020a1c0288000000b0037bc5cbd027so65017wmc.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=3QXkctBIjWHJEIeJp09RberZiX1UN4oLnh8KlpS89T4=;
 b=H/iMdHUY/pe6RCVqVMmUTfjmQ+jExIVS6m9MZhZxA6YimLoNL7yi9KQsZNf/Wp5ERX
 /P1IRZgq7YGttc7pBYGsoUMFXihpUwdNvHPtCidYvuKHfq3SOA6YX9nZmh/cnIoQWGb2
 ZG9BtqrVzTn4b2rtOWDsq8wPZt/ywy4C1eERE/UY2wN6gXCLXxc0r3B1h35x0dpXLeFO
 UGIIrJEwow3p5wHUHjL+U9GXviGsMaDKFiIEev5kp5Kel4um3lSIkZA0MevvtzNl+zMD
 bULNncJw5szOrkT1yAs84ujeTlwZzpf+kh+EgOGXyglnu9M4OZDw6yno013NsWNZ1I4P
 aH/w==
X-Gm-Message-State: AOAM533OcVhF6XQgWcBA9j6fOkz8b19WcwYduBgtF3c/XqLcZnhO1kHD
 NWxJ9EvVpoUomVAQeMPCrdmpxV5d6qZkwMWZV2kGj0TCX1zKjrJ17miIkevWh1SFCQh721XwfAb
 Xx+d2pVSmI+URzEwcD8qGJrvE1UyqSirx+F2xvzWszuQAz6MF/0XHVMyxqXXK
X-Received: by 2002:a05:600c:1509:: with SMTP id
 b9mr6391460wmg.144.1644140267311; 
 Sun, 06 Feb 2022 01:37:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9NkDCVKZdQ0WVGpmqPrXDmJeAOM1HBUg5xJGzlwVM3o0SFFQ27uEtRnveQ5DxwogBMlkJ2w==
X-Received: by 2002:a05:600c:1509:: with SMTP id
 b9mr6391436wmg.144.1644140266999; 
 Sun, 06 Feb 2022 01:37:46 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id v18sm3732474wrm.105.2022.02.06.01.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:37:46 -0800 (PST)
Date: Sun, 6 Feb 2022 04:37:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/24] virtio,pc: features, cleanups, fixes
Message-ID: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Changes from v1:
erst patch fixups
virtio introspection patches dropped

The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:

  Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to dd4fc6058557cd2a9e23a37da44d054f724ca3e8:

  util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-06 04:33:50 -0500)

----------------------------------------------------------------
virtio,pc: features, cleanups, fixes

Part of ACPI ERST support
fixes, cleanups

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
David Hildenbrand (4):
      libvhost-user: Simplify VHOST_USER_REM_MEM_REG
      libvhost-user: fix VHOST_USER_REM_MEM_REG not closing the fd
      libvhost-user: Map shared RAM with MAP_NORESERVE to support virtio-mem with hugetlb
      util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc()

Eric DeVolder (9):
      ACPI ERST: bios-tables-test.c steps 1 and 2
      ACPI ERST: PCI device_id for ERST
      ACPI ERST: header file for ERST
      ACPI ERST: support for ACPI ERST feature
      ACPI ERST: build the ACPI ERST table
      ACPI ERST: create ACPI ERST table for pc/x86 machines
      ACPI ERST: qtest for ERST
      ACPI ERST: bios-tables-test testcase
      ACPI ERST: step 6 of bios-tables-test.c

Igor Mammedov (5):
      tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for test_oem_fields() test
      tests: acpi: whitelist nvdimm's SSDT and FACP.slic expected blobs
      acpi: fix OEM ID/OEM Table ID padding
      tests: acpi: update expected blobs
      tests: acpi: test short OEM_ID/OEM_TABLE_ID values in test_oem_fields()

Michael S. Tsirkin (1):
      cpuid: use unsigned for max cpuid

Raphael Norwitz (4):
      libvhost-user: Add vu_rem_mem_reg input validation
      libvhost-user: Add vu_add_mem_reg input validation
      libvhost-user: prevent over-running max RAM slots
      libvhost-user: handle removal of identical regions

Thomas Huth (1):
      hw/i386: Add the possibility to disable the 'isapc' machine

 configure                                 |    2 +-
 include/hw/acpi/erst.h                    |   24 +
 include/hw/pci/pci.h                      |    1 +
 subprojects/libvhost-user/libvhost-user.h |    2 +
 hw/acpi/aml-build.c                       |    4 +-
 hw/acpi/erst.c                            | 1051 +++++++++++++++++++++++++++++
 hw/i386/acpi-build.c                      |   15 +
 hw/i386/acpi-microvm.c                    |   15 +
 hw/i386/pc_piix.c                         |    5 +-
 subprojects/libvhost-user/libvhost-user.c |   86 ++-
 tests/qtest/bios-tables-test.c            |   65 +-
 tests/qtest/cdrom-test.c                  |    2 +-
 tests/qtest/erst-test.c                   |  164 +++++
 util/bufferiszero.c                       |    2 +-
 util/oslib-posix.c                        |    1 +
 hw/acpi/Kconfig                           |    6 +
 hw/acpi/meson.build                       |    1 +
 hw/acpi/trace-events                      |   15 +
 tcg/i386/tcg-target.c.inc                 |    2 +-
 tests/data/acpi/microvm/ERST.pcie         |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst          |  Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST.acpierst          |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/SSDT.dimmpxm           |  Bin 734 -> 734 bytes
 tests/data/acpi/q35/DSDT.acpierst         |  Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST.acpierst         |  Bin 0 -> 912 bytes
 tests/data/acpi/q35/FACP.slic             |  Bin 244 -> 244 bytes
 tests/data/acpi/q35/SSDT.dimmpxm          |  Bin 734 -> 734 bytes
 tests/data/acpi/virt/SSDT.memhp           |  Bin 736 -> 736 bytes
 tests/qtest/meson.build                   |    2 +
 29 files changed, 1429 insertions(+), 36 deletions(-)
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 hw/acpi/erst.c
 create mode 100644 tests/qtest/erst-test.c
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst


